@extends('frontend.template.layout')

@section('content')
@include('frontend.search')
@include('frontend.detail_modal')
@endsection


@section('style')
<link rel="stylesheet" type="text/css" href="{{ asset('plugin/select2/css/select2.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('plugin/icheck/skins/all.css') }}">
<link href="{{ asset('plugin/checkbox/build.less.css') }}" rel="stylesheet">
<link rel="stylesheet"
    href="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css') }}">
<link rel="stylesheet"
    href="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css') }}">
<style>
    .modal-dialog {
        padding-top: 10%;
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

    /* .popup-form .form-control {
        margin: 0;
        padding: 6px 10px;
        color: #444;
        border-color: #c1c1c1;
        font-size: 16px;
    } */

    .btn_search_holiday {
        margin-top: 20px !important;
    }

    .modal-backdrop {
        background-color: #c1c1c1;
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

    .popup-form .form-control, input[type="text"] {
        margin: 0;
        padding: 6px 10px;
        color: #444;
        /* border-color: #c1c1c1; */
        font-size: 16px;
    }

    .btn_search_holiday {
        margin-top: 20px !important;
    }

    select,
    input {
        border: 1px solid #c1c1c1 !important;
    }

    #detail_form table,
    #detail_form tbody,
    #detail_form tr,
    #detail_form td {
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

    .daterangepicker {
        z-index: 9551 !important;
        /* has to be larger than 1050 */
    }

    .modal-header {
        padding: 9px 15px;
        border-bottom: 1px solid #eee;
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

    .form-horizontal .radio, .form-horizontal .checkbox {
        min-height: 27px;
        padding-left: 31px !important;
    }

    #holiday_name {
        background-color: #fff;
        border: 1px solid #aaa;
        border-top-color: rgb(170, 170, 170);
        border-top-style: solid;
        border-top-width: 1px;
        border-right-color: rgb(170, 170, 170);
        border-right-style: solid;
        border-right-width: 1px;
        border-bottom-color: rgb(170, 170, 170);
        border-bottom-style: solid;
        border-bottom-width: 1px;
        border-left-color: rgb(170, 170, 170);
        border-left-style: solid;
        border-left-width: 1px;
        border-image-source: initial;
        border-image-slice: initial;
        border-image-width: initial;
        border-image-outset: initial;
        border-image-repeat: initial;
        border-radius: 4px;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
        border-bottom-right-radius: 4px;
        border-bottom-left-radius: 4px;
    }
</style>

@endsection
@section('script')
<script src="{{ asset('plugin/select2/js/select2.js') }}"></script>
<script src="{{ asset('plugin/icheck/icheck.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/moment/min/moment.min.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
<script src="{{ asset('vendor/adminlte/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}">
</script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': '{{csrf_token()}}'
        }
    });

    $(document).ready(function () {
        $('.search_result_tb').dataTable();
    });

    var select2_option = {
        ajax: {
            // ajax search url
            url: "{{ url('holidays/search/getLocation') }}",
            dataType: 'json',
            type:"post",
            delay: 250,   //delay  time of ajax request submit
            data: function (params) {
                return {
                    //search keyword written in the input box
                    q: params.term || "",
                    page: params.page || 1
                };
            },
            cache: true
        },
        placeholder: '',

        escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
        minimumInputLength: 1,                              // minium number of the text of search box.
        templateResult: formatRepotn,                        // display type of the selectbox.  you can customize it.
        templateSelection: formatRepoSelectiontn              // when you select the item of the selectbox
    };

    $('#select_location').select2({});

    function formatRepotn(repo) {
        //if data is loading, display loading msg
        if (repo.loading) {
            return repo.text;
        } else {
            // after loading data display list item
            return  repo['name'];
        }
    }

    function formatRepoSelectiontn(repo) {

        if (repo.id) {
            return  repo['name'] || (repo.text);
        }
        else {
            return repo.text;
        }
    }

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

    $('.btn_book').on('click', function () {
        var id = $($(this).parent().parent().children()[0]).html();
        var name = $($(this).parent().parent().children()[1]).html();
        var location = $($(this).parent().parent().children()[2]).html();
        var city = $($(this).parent().parent().children()[3]).html();
        var hotel = $($(this).parent().parent().children()[4]).html();
        var wifi = $($(this).parent().parent().children()[5]).html();
        var car_rental = $($(this).parent().parent().children()[6]).html();

        var detail_form = $('#view_detail');

        detail_form.find('#holiday_id').val(id);
        detail_form.find('.name').html(name);
        detail_form.find('.location').html(location);
        detail_form.find('.city').html(city);
        detail_form.find('.hotel').html(hotel);
        detail_form.find('.wifi').html(wifi);
        detail_form.find('.car_rental').html(car_rental);

        detail_form.modal('show') ;
        $('#holiday_date').daterangepicker();
        $('#holiday_date').val('')

    });

    $('.btn_save_booking').click(function (e) {
        var holiday_date = $('#holiday_date').val();
        if (!holiday_date) {
            return;
        }
        $.ajax({
            url: '{{ url('holidays/book') }}',
            type: 'post',
            data: $('#detail_form').serializeArray(),
            success: function (res) {
                if (res === 'success') {
                    location.reload(true)
                }
            }
        })
    });


</script>
@endsection