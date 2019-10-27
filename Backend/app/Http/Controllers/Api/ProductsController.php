<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Products;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function list() {
        return response()->json(Products::all());
    }
}
