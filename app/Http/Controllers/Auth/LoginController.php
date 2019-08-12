<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */
//    public function __construct()
//    {
//        $guard = backpack_guard_name();
//        $this->middleware("guest:$guard", ['except' => 'logout']);
//    }

    use AuthenticatesUsers {
        logout as defaultLogout;
    }

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $guard = backpack_guard_name();

        $this->middleware('guest')->except('logout');
    }

    protected function guard()
    {
        return backpack_auth();
    }

    public function username()
    {
        return backpack_authentication_column();
    }
}
