<?php

Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => ['web', config('backpack.base.middleware_key', 'admin'), 'role:admin'],
], function () { // custom admin routes
    Route::group([
        'namespace' => 'App\Http\Controllers\Admin',
        'middleware' => ['web', 'role:admin'],
    ], function () {
        CRUD::resource('holidays', 'HolidayCrudController');
        CRUD::resource('locations', 'LocationCrudController');
        CRUD::resource('bookings', 'BookingCrudController');
    });
});



Route::group([
    'middleware' => ['web', 'role:user'],
    'namespace' => 'App\Http\Controllers\User',
], function () {
    //CRUD::resource('holidays', 'Admin\HolidayCrudController');
    Route::get('holidays/search', 'HolidayController@search');
    Route::post('holidays/search/getLocation', 'HolidayController@getLocation');
    Route::get('holidays/book/{id}', 'HolidayController@show');
    Route::post('holidays/book', 'HolidayController@postBook');
    Route::get('booking', 'HolidayController@getMybooking');
    Route::get('booking/{id}', 'HolidayController@getMybookingDetail');
    Route::get('booking/cancel/{id}', 'HolidayController@cancelMybooking');
    Route::post('booking/{id}', 'HolidayController@updateMybooking');

});
