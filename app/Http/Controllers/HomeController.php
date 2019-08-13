<?php

namespace App\Http\Controllers;

use App\Models\Holidays;
use App\Models\Locations;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $locations = Locations::all();
        return view('home', compact('locations'));
    }
}
