<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class AuthController extends ApiController
{
    public function login(LoginRequest $request)
    {
        try {
            $user = User::where('email', $request->username)
            ->orWhere('name', $request->username)
            ->first();

            if (!$user) {
                return response()->json([
                    'message' => message('MSG005'),
                ], 422);
            }

            if ($user->estado === 0) {
                return response()->json([
                    'message' => message('MSG005'),
                ], 422);
            }

            if (!Hash::check($request->password, $user->password)) {
                return response()->json([
                    'message' => message('MSG004'),
                ], 422);
            }

            $token  = $user->createToken('auth_token')->plainTextToken;
            $role = $user->roles->first();
            $permissions = $role ? $role->permissions->map(function ($permission) {
                $parts = explode('.', $permission->name);
                return [
                    'action' => $parts[1] ?? null,
                    'subject' => $parts[0] ?? null,
                ];
            }) : [];

            if ($user->avatar) {
                $imagenBase64 = base64_encode(Storage::disk('public')->get('users-avatar/' . $user->avatar));
            } else {
                $imagenBase64 = NULL;
            }
            if ($user->type == 1) {
                $phone = $user->people->phone;
                $address = $user->people->address;
                $names = $user->people->names;
                $surnames = $user->people->surnames;
            } else {
                $phone = $user->therapist->phone;
                $address = $user->therapist->address;
                $names = $user->therapist->names;
                $surnames = $user->therapist->surnames;
            }

            $auth = [
                'id' => $user->id,
                'fullName' => $names.' '.$surnames,
                'names' => $names,
                'surnames' => $surnames,
                'username' => $user->name,
                'status' => $user->status == 1 ? 'Activo' : 'Inactivo',
                'email' => $user->email,
                'address' => $address,
                'phone' => $phone,
                'type' => $user->type,
                'role' => $role ? $role->name : 'Invitado'
            ];

            $data = [
                'success' => true,
                'accessToken' => $token,
                'userData' => $auth,
                'avatar' => $imagenBase64,
                'userAbilityRules' => $role->name == 'Administrador' ? [['action' => 'manage', 'subject' => 'all']] : $permissions
            ];

            return $this->respond($data, 200);
        } catch (Exception $e) {
            return $this->respondInternalError();
        }
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $request->password
        ]);

        return $this->respond(['success' => true, 'data' => $user], 201);
    }

    public function logout()
    {
        Auth::user()->tokens()->delete();
        return $this->respond(['success' => true], 200);
    }
}
