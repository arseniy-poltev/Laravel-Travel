<?php

namespace App\Http\Controllers\Admin;

use Backpack\CRUD\app\Http\Controllers\CrudController;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\BookingRequest as StoreRequest;
use App\Http\Requests\BookingRequest as UpdateRequest;

class BookingCrudController extends CrudController
{
    public function setup()
    {
        /*
        |--------------------------------------------------------------------------
        | CrudPanel Basic Information
        |--------------------------------------------------------------------------
        */
        $this->crud->setModel('App\Models\Booking');
        $this->crud->setRoute(config('backpack.base.route_prefix') . '/bookings');
        $this->crud->setEntityNameStrings('Booking', 'Bookings');

        /*
        |--------------------------------------------------------------------------
        | CrudPanel Configuration
        |--------------------------------------------------------------------------
        */

        $this->crud->enableExportButtons();

        $this->crud->setColumns([
            [
                'label' => 'User',
                'type' => 'select',
                'name' => 'user_id', // the method that defines the relationship in your Model
                'entity' => 'user', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\Users", // foreign key model
            ],
            [
                'label' => 'Holiday',
                'type' => 'select',
                'name' => 'holiday_id', // the method that defines the relationship in your Model
                'entity' => 'holiday', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\Holidays", // foreign key model
            ],
            [
                'label' => 'Start Date',
                'type' => 'date',
                'name' => 'start_date'
            ],
            [
                'label' => 'End Date',
                'type' => 'date',
                'name' => 'end_date'
            ]
        ]);


        $this->crud->denyAccess('update');
        $this->crud->denyAccess('create');
        // add asterisk for fields that are required in AppRequest
//        $this->crud->setRequiredFields(StoreRequest::class, 'create');
//        $this->crud->setRequiredFields(UpdateRequest::class, 'edit');
    }
}
