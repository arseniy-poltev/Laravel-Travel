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


    </style>
@endsection
@section('script')
    <script src="{{ asset('plugin/select2/select2.full.js') }}"></script>
    <script src="{{ asset('plugin/icheck/icheck.js') }}"></script>
    <script>
        $(document).ready(function () {
            $('#select_location').select2({
                // theme: "classic",
            });


            $('#btn_search_holiday').on('click', function () {

                var location = $('#select_location').val();
                var hotel = $('#hotel').prop("checked");
                var wifi = $('#wifi').prop("checked");
                var car_rental = $('#car_rental').prop("checked");
                console.log(location);
                $.ajax({
                    url: '{{ url('holidays/search') }}',
                    type: 'post',
                    data: {
                      _token: $('input[name="_token"]').val(),
                        hotel: hotel,
                        wifi: wifi,
                        car_rental: car_rental,
                        location: location
                    },
                    success: function (res) {
                        console.log(res);
                    }
                })
            })
        })
    </script>
@endsection




