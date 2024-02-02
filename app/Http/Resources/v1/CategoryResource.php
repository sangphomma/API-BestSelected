<?php

namespace App\Http\Resources\v1;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    // public static $wrap ='category' ;

    public function toArray(Request $request): array
    {
        return [
            'type'=>'category',
            'id'=>$this->id,
            'attributes'=>[
                'name'=>$this->name,
                'published'=>$this->published,
                'parent'=>$this->parent()->get('name'),
                'created_at'=>$this->created_at,
            ],
            'relationship'=>[
                // 'parent'=>CategoryCollection::make($this->parent()) ,
            ],
            'links'=>[
                'self'=>route('category.show', $this->id)
            ]
        ];
    }

    public function with(Request $request)
    {
        return [
            'status'=>'success',
        ] ;
    }
    public function withResponse(Request $request, JsonResponse $response)
    {
        $response->header('Accept', 'application/json') ;
    }
}
