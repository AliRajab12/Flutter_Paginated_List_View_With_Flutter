<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Models\Store;
class StoreController extends Controller
{
    public function get_stores(Request $request)
    {

        $validatedData = $request->validate([
            'limit' => 'integer|min:1|max:100',  
            'offset' => 'integer|min:1',
         ]);

         $limit = (int) ($validatedData['limit'] ?? 10);
         $offset = (int) ($validatedData['offset'] ?? 1);

         $stores = Cache::remember("stores_page_{$offset}_limit_{$limit}", 60, function () use ($limit, $offset) {
                return Store::paginate($limit, ["id", "name"], 'page', $offset);
            });
    
        return response()->json([
            "total" => $stores->total(),
            "limit" => $limit,
            "offset" => $offset,
            "stores" => $stores->items(),
       ] );
    }
}
