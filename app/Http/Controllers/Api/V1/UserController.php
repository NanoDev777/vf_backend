<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UserController extends ApiController
{
    public function index()
    {
        $users = User::all();

        return $this->respond($users);
    }

    public function uploadAvatar(Request $request)
    {
        $user = auth()->user();

        if ($request->hasFile('img')) {
            if ($user->avatar) {
                Storage::disk('public')->delete('users-avatar/' . $user->avatar);
            }

            $imagen = $request->file('img');
            $nombreImagen = time() . '.' . $imagen->getClientOriginalExtension();

            Storage::disk('public')->put('users-avatar/' . $nombreImagen, file_get_contents($imagen));

            $user->avatar = $nombreImagen;
            $user->save();

            $imagenBase64 = base64_encode(Storage::disk('public')->get('users-avatar/' . $nombreImagen));

            return $this->respondCreated(['img' => $imagenBase64]);
        } else {
            return $this->respondInternalError();
        }
    }
}
