<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('name')  ;
            $table->text('desc')->nullable() ;
            $table->string('cover')->nullable();
            $table->json('images')->nullable() ;
            $table->json('tags')->nullable() ;
            $table->foreignId('category_id')->nullable()->constrained('categories')->cascadeOnDelete();
            $table->boolean('published')->nullable() ;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
