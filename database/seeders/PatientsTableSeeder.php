<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class PatientsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        // Asumiendo que tienes al menos un registro en las tablas schools y people
        $schoolIds = DB::table('schools')->pluck('id')->toArray();
        $peopleIds = DB::table('people')->pluck('id')->toArray();

        foreach(range(1, 50) as $index) {
            DB::table('patients')->insert([
                'names' => $faker->firstName,
                'surnames' => $faker->lastName,
                'birthdate' => $faker->date($format = 'Y-m-d', $max = 'now'),
                'course' => $faker->word,
                'phone' => $faker->phoneNumber,
                'email' => $faker->unique()->safeEmail,
                'status' => 1,
                'school_id' => $faker->randomElement($schoolIds),
                'people_id' => $faker->randomElement($peopleIds),
                'created_at' => now(),
                'updated_at' => now()
            ]);
        }
    }
}
