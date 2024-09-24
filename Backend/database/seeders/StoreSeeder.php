<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class StoreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();
        foreach (range(1, 5000) as $index) {
            \DB::table('stores')->insert([
                'name' => $faker->company,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
