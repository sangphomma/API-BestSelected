<?php

namespace App\Http\Resources\v1;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class CategoryCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    // public static $wrap ='category' ;

    public function toArray(Request $request): array
    {
        return [
            'data'=>$this->collection ,
            'links'=>[
            ],
        ];
    }

    public function with($request){

        return [
            'status' =>'success',
        ];
    }
    public function withResponse(Request $request, JsonResponse $response)
    {

        $response->header('Accept','application/json') ;
        $response->header('Version','api/v1.0.0') ;
    }
}
