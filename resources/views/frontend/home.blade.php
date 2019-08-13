@extends('frontend.template.layout')

@section('content')
@include('frontend.search')
@endsection


@section('style')
<link rel="stylesheet" type="text/css" href="{{ asset('plugin/select2/css/select2.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('plugin/icheck/skins/all.css') }}">
<link href="{{ asset('plugin/checkbox/build.less.css') }}" rel="stylesheet">
<style>
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
</style>

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

    select,
    input {
        border: 1px solid #c1c1c1 !important;
    }
</style>
<link rel="stylesheet"
    href="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}">
@endsection
@section('script')
<script src="{{ asset('plugin/select2/select2.full.js') }}"></script>
<script src="{{ asset('plugin/icheck/icheck.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
<script>
    $(document).ready(function () {
            $('.search_result_tb').dataTable();
            $('#select_location').select2({
            });


            $('#btn_search_holiday').on('click', function () {

                var location = $('#select_location').val();
                var hotel = $('#hotel').prop("checked");
                var wifi = $('#wifi').prop("checked");
                var car_rental = $('#car_rental').prop("checked");
                var holiday_name = $('#holiday_name').val();
                $.ajax({
                    url: '{{ url('holidays/search') }}',
                    type: 'post',
                    data: {
                        _token: $('input[name="_token"]').val(),
                        hotel: hotel,
                        wifi: wifi,
                        car_rental: car_rental,
                        location: location,
                        name: holiday_name
                    },
                    success: function (res) {
                        if (res.length > 0) {
                            var tb_content = '';
                            res.forEach(function(item) {
                                tb_content += '<tr>';
                                tb_content += '<td>' + item.name + '</td>';
                                tb_content += '<td>' + item.location.name + '</td>';
                                tb_content += '<td>' + item.city + '</td>';
                                tb_content += '<td>' + (item.hotel === 1 ? "Yes" : "No") + '</td>';
                                tb_content += '<td>' + (item.wifi === 1 ? "Yes" : "No") + '</td>';
                                tb_content += '<td>' + (item.car_rental === 1 ? "Yes" : "No") + '</td>';
                                tb_content += "</tr>";
                            });

                            $('#search_tb_body').html(tb_content);
                        }
                    }
                })
            })
        })
</script>
@endsection