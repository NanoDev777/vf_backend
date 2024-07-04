<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('patients', function (Blueprint $table) {
            $table->id();
            $table->string('names', 128);
            $table->string('surnames', 128);
            $table->date('birthdate');
            $table->string('course', 64);
            $table->string('phone', 16);
            $table->string('email', 128)->unique();
            $table->tinyInteger('status')->default('1');
            $table->unsignedBigInteger('school_id')->unsigned()->nullable();
            $table->unsignedBigInteger('people_id')->unsigned()->nullable();
            $table->timestamps();
            
            $table->foreign('school_id')->references('id')->on('schools')
                ->onDelete('set null')
                ->onUpdate('cascade');
            
            $table->foreign('people_id')->references('id')->on('people')
                ->onDelete('set null')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('patients');
    }
};
