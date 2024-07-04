<?php

namespace App\Filters\TherapistSearch;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;
use App\Filters\Search;

class TherapistSearch extends Search
{
	public static function checkSortFilter(Request $request, Builder $query)
    {
        if ($request->filled('sort')) {
            $sort = json_decode($request->input('sort'), true);
            return $query->orderBy($sort[0]['field'], $sort[0]['dir']);

        } else {
            return $query->orderBy('id', 'DESC');
        }
    }

    protected static function createFilterDecorator($name)
    {
        return __NAMESPACE__ . '\\Filters\\' . Str::studly($name);
    }

    protected static function getResults(Builder $query, Request $request)
    {
        return $query->paginate($request->per_page);
    }
}
