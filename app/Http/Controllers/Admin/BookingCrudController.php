<?php

namespace App\Http\Controllers\Admin;

use Backpack\CRUD\app\Http\Controllers\CrudController;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\BookingRequest as StoreRequest;
use App\Http\Requests\BookingRequest as UpdateRequest;
use Carbon\Carbon;

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
                'model' => "App\Models\BackpackUser", // foreign key model
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

        // Fields
        $this->crud->addFields([
            [
                'label' => 'User',
                'type' => 'select2',
                'name' => 'user_id', // the method that defines the relationship in your Model
                'entity' => 'user', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\BackpackUser", // foreign key model
            ],
            [
                'label' => 'Holiday',
                'type' => 'select2',
                'name' => 'holiday_id', // the method that defines the relationship in your Model
                'entity' => 'holiday', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\Holidays", // foreign key model
            ],
            [
                'name' => 'date', // a unique name for this field
                'start_name' => 'start_date', // the db column that holds the start_date
                'end_name' => 'end_date', // the db column that holds the end_date
                'label' => 'Date',
                'type' => 'date_range',
                'attributes' => [
                    // 'readonly' => 'readonly',
                    // 'disabled' => 'disabled',
                ],
                // OPTIONALS
                'start_default' => Carbon::now()->subWeek()->toDateString(), // default value for start_date
                'end_default' => Carbon::now()->toDateString(), // default value for end_date
                'date_range_options' => [ // options sent to daterangepicker.js
                    'timePicker' => false,
                    'locale' => ['format' => 'DD/MM/YYYY', 'firstDay' => 1],
                    'alwaysShowCalendars' => true,
                    'autoUpdateInput' => true,
                ]
            ],
        ]);


        // $this->crud->denyAccess('update');
        // $this->crud->denyAccess('create');
        // add asterisk for fields that are required in AppRequest
//        $this->crud->setRequiredFields(StoreRequest::class, 'create');
//        $this->crud->setRequiredFields(UpdateRequest::class, 'edit');
    }

    public function store(StoreRequest $request)
    {
        // your additional operations before save here
        $redirect_location = parent::storeCrud($request);
        // your additional operations after save here
        // use $this->data['entry'] or $this->crud->entry
        return $redirect_location;
    }

    public function update(UpdateRequest $request)
    {
        // your additional operations before save here
        $redirect_location = parent::updateCrud($request);
        // your additional operations after save here
        // use $this->data['entry'] or $this->crud->entry
        return $redirect_location;
    }
}
