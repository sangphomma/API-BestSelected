<?php

namespace App\Http\Resources\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'type'=>'post',
            'id'=>$this->id,
            'attributes'=>[
                'name'=>$this->name,
                'published'=>$this->published,
                'category'=>$this->category()->get('name'),
                'cover'=>$this->cover,
                'images'=>$this->images,
                'tags'=>$this->tags,
                'updated_at'=>$this->updated_at,
                'created_at'=>$this->created_at,
            ],
            'relationship'=>[
                // 'parent'=>CategoryCollection::make($this->parent()) ,
            ],
            'links'=>[
                'self'=>route('post.show', $this->id)
            ]
        ];
    }
}
