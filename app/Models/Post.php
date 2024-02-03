<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $fillable=['name','slug', 'cover','images','tags','category_id','desc','note','published'] ;
    protected $casts =['tags'=>'array','cover'=>'array', 'images'=>'array'] ;

    public function category(){
        return $this->belongsTo(Category::class) ;
    }
}
