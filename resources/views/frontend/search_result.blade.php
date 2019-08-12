@extends('frontend.template.layout')

@section('style')
    <style>
        .bg-primary {
            background: #00c0ef;
        }

        .bg-success {
            background: #00a65a;
        }

        .bg-danger {
            background: #d9534f;
        }

        .checkbox label::after {
            font-size: 15px;
        }

        .checkbox label::before {
            width: 23px;
            height: 23px;
        }

        .checkbox {
            padding-top: 23px !important;
        }

        .search_location {
            padding-top: 23px !important;
        }

        .select2-container .select2-selection--single {
            height: 38px !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 38px !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {
            top: 4px !important;
        }

        .popup-form .form-control {
            margin: 0;
            padding: 6px 10px;
            color: #444;
            border-color: #c1c1c1;
            font-size: 16px;
        }

        .btn_search_holiday {
            margin-top: 20px !important;
        }

        select, input {
            border: 1px solid #c1c1c1 !important;
        }

    </style>
    <link rel="stylesheet"
          href="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}">
    {{--<link rel="stylesheet" href="{{ asset('vendor/adminlte/bower_components/font-awesome/css/font-awesome.min.css') }}">--}}
@endsection
@section('content')
    <section id="plan" class="section section-padded">
        {{--<div class="cut cut-top-left"></div>--}}
        <div class="container">
            <div class="row text-left title register-form-box">
                <form class="form-horizontal popup-form register_form">
                    <div class="col-md-12">
                        <h3 style="margin-bottom: 50px">Search Result</h3>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped search_result_tb">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Location</th>
                                <th>City</th>
                                <th>Hotel</th>
                                <th>Wifi</th>
                                <th>Car Rental</th>
                                <th>Booking Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody id="search_tb_body">
                            @foreach($holidays as $holiday)
                                <tr>
                                    <td>{{ $holiday->name }}</td>
                                    <td>{{ $holiday->location->name }}</td>
                                    <td>{{ $holiday->city }}</td>
                                    <td>{{ $holiday->hotel == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $holiday->wifi == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $holiday->car_rental == 1 ? 'Yes' : 'No' }}</td>
                                    <td>@if($holiday->users()->where('user_id', Auth::user()->id)->exists())
                                            <span class="badge bg-primary">Yes</span>
                                        @else
                                            <span class="badge bg-success">No</span>
                                        @endif</td>
                                    <td><a class="btn btn-sm btn-success"
                                           href="{{ url('holidays/book/' . $holiday->id ) }}">Book</a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection

@section('script')
    <script src="{{ asset('vendor/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script
        src="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            $('.search_result_tb').dataTable()
        })
    </script>
@endsection
