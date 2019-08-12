<?php

namespace App\Http\Controllers\Admin;

use Backpack\CRUD\app\Http\Controllers\CrudController;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\HolidayRequest as StoreRequest;
use App\Http\Requests\HolidayRequest as UpdateRequest;

class HolidayCrudController extends CrudController
{
    public function setup()
    {
        /*
        |--------------------------------------------------------------------------
        | CrudPanel Basic Information
        |--------------------------------------------------------------------------
        */
        $this->crud->setModel('App\Models\Holidays');
        $this->crud->setRoute(config('backpack.base.route_prefix') . '/holidays');
        $this->crud->setEntityNameStrings('Holiday', 'Holidays');

        /*
        |--------------------------------------------------------------------------
        | CrudPanel Configuration
        |--------------------------------------------------------------------------
        */

        $this->crud->enableExportButtons();

        $this->crud->setColumns([
            [
                'name'  => 'name',
                'label' => 'Name',
                'type'  => 'text',
            ],
            [
                'label' => 'Location',
                'type' => 'select',
                'name' => 'location_id', // the method that defines the relationship in your Model
                'entity' => 'location', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\Locations", // foreign key model
            ],
            [
                'label' => 'City', // Table column heading
                'type' => "text",
                'name' => 'city', // the column that contains the ID of that connected entity;
            ],
            [
                'label' => 'Hotel',
                'name' => 'hotel',
                'type' => 'boolean',
                 'options' => [0 => 'No', 1 => 'Yes']
            ],
            [
                'label' => 'Wifi',
                'name' => 'wifi',
                'type' => 'boolean',
                'options' => [0 => 'No', 1 => 'Yes']
            ],
            [
                'label' => 'Car Rental',
                'name' => 'car_rental',
                'type' => 'boolean',
                'options' => [0 => 'No', 1 => 'Yes']
            ],
        ]);



        // Fields
        $this->crud->addFields([
            [
                'name'  => 'name',
                'label' => 'Name',
                'type'  => 'text',
            ],
            [
                'label' => 'Location',
                'type' => 'select2',
                'name' => 'location_id', // the method that defines the relationship in your Model
                'entity' => 'location', // the method that defines the relationship in your Model
                'attribute' => 'name', // foreign key attribute that is shown to user
                'model' => "App\Models\Locations", // foreign key model
            ],
            [
                'label' => 'City', // Table column heading
                'type' => "text",
                'name' => 'city', // the column that contains the ID of that connected entity;
            ],
            [
                'label' => 'Hotel',
                'name' => 'hotel',
                'type' => 'select_from_array',
                'options' => [0 => 'No', 1 => 'Yes']
            ],
            [
                'label' => 'Wifi',
                'name' => 'wifi',
                'type' => 'select_from_array',
                'options' => [0 => 'No', 1 => 'Yes']
            ],
            [
                'label' => 'Car Rental',
                'name' => 'car_rental',
                'type' => 'select_from_array',
                'options' => [0 => 'No', 1 => 'Yes']
            ],
        ]);

        // add asterisk for fields that are required in AppRequest
        $this->crud->setRequiredFields(StoreRequest::class, 'create');
        $this->crud->setRequiredFields(UpdateRequest::class, 'edit');
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
