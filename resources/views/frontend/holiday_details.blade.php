@extends('frontend.template.layout')

@section('style')
<link rel="stylesheet"
    href="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css') }}">
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

    .detail_row {
        padding-top: 15px !important;
    }
</style>
@endsection
@section('content')
<section id="plan" class="section section-padded">
    {{--<div class="cut cut-top-left"></div>--}}
    <div class="container">
        <div class="row text-left title register-form-box">
            <form class="form-horizontal popup-form register_form" method="post"
                action="{{ url('holidays/book/' . $holiday->id) }}">
                @csrf
                <div class="col-md-12">
                    <h3 style="margin-bottom: 50px">Holiday Details</h3>
                </div>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td><label>Name: </label> {{ $holiday->name }}</td>
                            <td><label>Location: </label> {{ $holiday->location->name }}</td>
                            <td><label>City: </label> {{ $holiday->city }}</td>
                        </tr>
                        <tr>
                            <td><label>Wifi: </label> {{ $holiday->wifi == 1 ? 'Yes' : 'No' }}</td>
                            <td><label>Hotel: </label> {{ $holiday->hotel == 1 ? 'Yes' : 'No'}}</td>
                            <td><label>Car Rental: </label> {{ $holiday->car_rental == 1 ? 'Yes' : 'No'}}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="col-md-12 row detail_row col-md-offset-3">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label>Holiday Days:</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" required class="form-control pull-right" id="holiday_date"
                                    name="holiday_date" style="border: 1px solid #c1c1c1;">
                            </div>
                            <!-- /.input group -->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-danger btn-lg btn_back">Back</button>
                        <button type="submit" class="btn btn-success btn-lg">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection

@section('script')
@php
@endphp
<script src="{{ asset('vendor/adminlte/bower_components/moment/min/moment.min.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}">
</script>
<script>
    $(document).ready(function () {
            var option = {
                @if($holiday->users()->where('user_id', Auth::user()->id)->exists())
                startDate:'{!! $holiday->books()->where('user_id', Auth::user()->id)->first()->start_date !!}',
                endDate:'{!! $holiday->books()->where('user_id', Auth::user()->id)->first()->end_date !!}',
                @endif
                locale: {
                    format: 'Y-M-D'
                }
            };
            $('#holiday_date').daterangepicker(option);
            @if(!$holiday->users()->where('user_id', Auth::user()->id)->exists())
            $('#holiday_date').val('');
            @endif
        });

        $('.btn_back').on('click', function () {
            history.back();
        })
</script>
@endsection