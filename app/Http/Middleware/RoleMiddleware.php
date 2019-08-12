<?php

namespace App\Http\Middleware;

use Backpack\PermissionManager\app\Models\Role;
use Closure;
use Auth;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $role)
    {
        $roles = is_array($role)
            ? $role
            : explode('|', $role);


        if (!backpack_auth()->check()) {
            return redirect()->to('login');
        } else {
            foreach ($roles as $role_item) {
                if (!backpack_user()->hasRole($role_item)) {
                    abort(404);
                }
            }
        }

        return $next($request);
    }
}
