<section id="register-form" class="section gray-bg section-padded">
    <div class="container">
        <div class="row text-left title register-form-box">
            <form class="form-horizontal popup-form register_form" role="form" method="get" action="{{ url('holidays/search') }}">
                {{--{{ csrf_field() }}--}}
                <div class="row">
                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label class="control-label">Location</label>
                            <div class="search_location">
                                <select class="form-control"  id="select_location" name="location">
                                    <option></option>
                                    @foreach($locations as $location)
                                        <option value="{{ $location->id }}" @if(isset($search_param) && $search_param['location'] && $search_param['location'] == $location->id) selected @endif>{{ $location->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label class="control-label">Name</label>
                            <div class="search_location">
                                <input class="form-control form-white" name="name" id="holiday_name" placeholder="" value=" @if(isset($search_param) && $search_param['name']){{ $search_param['name'] }}@endif">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2 col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Hotel</label>
                            <div class="checkbox checkbox-success">
                                <input type="checkbox" id="hotel" name="hotel" @if(isset($search_param) && $search_param['hotel'] && $search_param['hotel'] == 1) checked @endif>
                                <label for="hotel"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="form-group">
                            <label class="control-label">Wifi</label>
                            <div class="checkbox checkbox-success">
                                <input type="checkbox"  name="wifi" id="wifi" @if(isset($search_param) && $search_param['wifi'] && $search_param['wifi'] == 1) checked @endif>
                                <label for="wifi"></label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="form-group">
                            <label class="control-label text-center">Rental</label>
                            <div class="checkbox checkbox-success">
                                <input type="checkbox" id="car_rental" name="car_rental" @if(isset($search_param) && $search_param['car_rental'] && $search_param['car_rental'] == 1) checked @endif>
                                <label for="car_rental"></label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2 col-sm-12">
                        <div class="form-group search_btn_group">
                            <label class="control-label">&nbsp;</label>
                            <div>
                                <input type="submit" id="btn_search_holiday" class="btn_search_holiday form-control btn btn-block btn-form btn-primary" value="Search">
                            </div>
                        </div>
                    </div>
                </div>

                @if(isset($holidays))
                <div class="row">
                    <div class="col-md-12">
                        <hr>
                        <h3 style="margin-top: 50px; margin-bottom: 20px">Search Result</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped search_result_tb">
                            <thead>
                            <tr>
                                <th style="display: none">id</th>
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
                                    <td style="display: none" class="id">{{ $holiday->id }}</td>
                                    <td class="name">{{ $holiday->name }}</td>
                                    <td class="location">{{ $holiday->location->name }}</td>
                                    <td class="city">{{ $holiday->city }}</td>
                                    <td class="hotel">{{ $holiday->hotel == 1 ? 'Yes' : 'No' }}</td>
                                    <td class="wifi">{{ $holiday->wifi == 1 ? 'Yes' : 'No' }}</td>
                                    <td class="car_rental">{{ $holiday->car_rental == 1 ? 'Yes' : 'No' }}</td>
                                    <td>
                                        @if($holiday->users()->where('user_id', Auth::user()->id)->exists())
                                            <span class="badge bg-primary">Yes</span>
                                        @else
                                            <span class="badge bg-info">No</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if(!$holiday->users()->where('user_id', Auth::user()->id)->exists())
                                        <a class="btn btn-sm btn-success btn_book">Book</a>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                @endif
            </form>
        </div>
    </div>
</section>
