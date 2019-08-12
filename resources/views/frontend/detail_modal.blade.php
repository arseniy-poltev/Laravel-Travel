<div id="view_detail" class="modal fade " role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Holiday Detail</h4>
            </div>
            <div class="modal-body">
                <form class="form" id="detail_form">
                    @csrf
                    <input id="holiday_id" style="display: none" type="text" name="id">
                    <div class="row">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td><label>Name: </label> <span class="name"></span></td>
                                <td><label>Location: </label> <span class="location"></span></td>
                                <td><label>City: </label> <span class="city"></span></td>
                            </tr>
                            <tr>
                                <td><label>Wifi: </label> <span class="wifi"></span></td>
                                <td><label>Hotel: </label> <span class="hotel"></span></td>
                                <td><label>Car Rental: </label> <span class="car_rental"></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 row detail_row col-md-offset-3" style="margin-top: 30px">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>Holiday Days:</label>

                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" required class="form-control pull-right" id="holiday_date" name="holiday_date" style="border: 1px solid #c1c1c1;">
                                </div>
                                <!-- /.input group -->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success btn_save_booking">Save</button>
            </div>
        </div>

    </div>
</div>
