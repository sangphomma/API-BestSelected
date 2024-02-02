<?php

use App\Http\Controllers\api\v1\CategoryController;
use App\Http\Controllers\api\v1\PostController;
use App\Http\Resources\v1\CategoryResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::apiResource('/category',CategoryController::class) ;
Route::apiResource('/post', PostController::class) ;
