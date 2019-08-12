<?php

Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => ['web', config('backpack.base.middleware_key', 'admin')],
], function () { // custom admin routes
    Route::group([
//        'middleware' => ['role:admin'],
        'namespace' => 'App\Http\Controllers\Admin',
    ], function () {
//        CRUD::resource('holidays', 'HolidayCrudController');
    });
});




Route::group([
    'middleware' => ['web', 'auth', 'role:user'],
    'namespace' => 'App\Http\Controllers\User',
], function () {
    //CRUD::resource('holidays', 'Admin\HolidayCrudController');
    Route::get('holidays/search', 'HolidayController@search');
    Route::get('holidays/book/{id}', 'HolidayController@show');
    Route::post('holidays/book', 'HolidayController@postBook');
    Route::get('booking', 'HolidayController@getMybooking');
    Route::get('booking/{id}', 'HolidayController@getMybookingDetail');
    Route::get('booking/cancel/{id}', 'HolidayController@cancelMybooking');
    Route::post('booking/{id}', 'HolidayController@updateMybooking');

});
