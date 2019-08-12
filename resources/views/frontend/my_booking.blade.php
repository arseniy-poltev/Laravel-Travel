@extends('frontend.template.layout')

@section('style')
    <link rel="stylesheet" href="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css') }}">
    <link rel="stylesheet"
          href="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css') }}">
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

        select, input {
            border: 1px solid #c1c1c1 !important;
        }

        #detail_form table, #detail_form tbody, #detail_form tr, #detail_form td {
            border: none !important;
        }

        #detail_form td {
            padding: 10px 30px;
        }

        .form-control {
            margin: 0;
            padding: 6px 10px;
            color: #444;
            border-color: #c1c1c1;
            font-size: 16px;
        }

        .daterangepicker  {
            z-index: 9551 !important; /* has to be larger than 1050 */
        }

        .modal-header {
            padding:9px 15px;
            border-bottom:1px solid #eee;
            background-color: #5cb85c;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .modal-content {
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border: none;
        }
    </style>
@endsection
@section('content')
    <section id="plan" class="section section-padded">
        {{--<div class="cut cut-top-left"></div>--}}
        <div class="container">
            <div class="row text-left title register-form-box">
                <form class="form-horizontal popup-form register_form" method="post" action="{{ url('holidays/book/') }}">
                    @csrf
                    <div class="col-md-12">
                        <h3 style="margin-bottom: 50px">My Booking List</h3>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped booking_list_tb">
                                <thead>
                                <tr>
                                    <th style="display: none">id</th>
                                    <th>Holiday Name</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Booking Date</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody id="search_tb_body">
                                @foreach($booking_list as $item)
                                    <tr>
                                        <td style="display: none" class="id">{{ $item->id }}</td>
                                        <td class="name">{{ $item->holiday->name }}</td>
                                        <td class="start_date">{{ \Carbon\Carbon::parse($item->start_date)->format('d M Y') }}</td>
                                        <td class="end_date">{{ \Carbon\Carbon::parse($item->end_date)->format('d M Y') }}</td>
                                        <td class="booking_date">{{ \Carbon\Carbon::parse($item->created_at)->format('d M Y') }}</td>
                                        <td>
                                            <a class="btn btn-sm btn-danger btn_book" href="{{ url('booking/cancel/' . $item->id) }}"><i class="fa fa-remove"></i> Cancel</a>
                                            <a class="btn btn-sm btn-success btn_edit"><i class="fa fa-pencil"></i> Edit</a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    @include('frontend.detail_modal')
@endsection

@section('script')
    @php
        @endphp
    <script src="{{ asset('vendor/adminlte/bower_components/moment/min/moment.min.js') }}"></script>
    <script src="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
    <script src="{{ asset('vendor/adminlte/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('vendor/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            $('.booking_list_tb').dataTable();
        });

        $('.btn_edit').on('click', function () {

            var id = $(this).parent().parent().find('.id').html();
            $.ajax({
                url: '{{ url('booking') }}' + '/' + id,
                type: 'get',
                success: function (res) {
                    var id = res.id;
                    var name = res.holiday.name;
                    var city = res.holiday.city;
                    var location = res.holiday.location.name;
                    var wifi = res.holiday.wifi === 1 ? 'Yes' : 'No';
                    var hotel = res.holiday.hotel === 1 ? 'Yes' : 'No';
                    var car_rental = res.holiday.car_rental === 1 ? 'Yes' : 'No';
                    var start_date = res.start_date;
                    var end_date = res.end_date;

                    var update_form = $('#view_detail');
                    update_form.find('#holiday_id').val(id);
                    update_form.find('.name').html(name);
                    update_form.find('.location').html(location);
                    update_form.find('.city').html(city);
                    update_form.find('.wifi').html(wifi);
                    update_form.find('.hotel').html(hotel);
                    update_form.find('.car_rental').html(car_rental);

                    option = {
                        startDate: (new Date(start_date)).toLocaleDateString(),
                        endDate: (new Date(end_date)).toLocaleDateString(),
                    };

                    $('#holiday_date').daterangepicker(option);

                    $('.btn_save_booking').html('Update');
                    $('#view_detail').modal('show');
                }
            });
        })

        $('.btn_save_booking').on('click', function () {
            var  id = $('#holiday_id').val();
            $.ajax({
                url: '{{ url('booking') }}' + '/' + id,
                type: 'post',
                data: $('#detail_form').serializeArray(),
                success: function (res) {
                    if (res === 'success') {
                        location.reload(true)
                    }
                }
            })
        })
    </script>
@endsection
