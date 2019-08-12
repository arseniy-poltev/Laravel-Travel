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

        dd($request->user());
        $roles = is_array($role)
            ? $role
            : explode('|', $role);

        if (!backpack_auth()->check() || !in_array(backpack_user()->hasAllRoles(Role::all()), $roles)) {
            abort(404);
        }

        return $next($request);
    }
}
