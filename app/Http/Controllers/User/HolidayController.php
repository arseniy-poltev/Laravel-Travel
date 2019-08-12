<?php

namespace App\Http\Controllers\User;

use App\Models\Booking;
use App\Models\Holidays;
use App\Models\Locations;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use function PHPSTORM_META\type;
use Auth;
class HolidayController extends Controller
{
    public function search(Request $request)
    {

        $s_location = $request->location;
        $s_name = $request->name;

        $s_wifi = (int)($request->wifi === 'on');
        $s_hotel = (int)($request->hotel === 'on');
        $s_car_rental = (int)($request->car_rental === 'on');

        if ($s_location && $s_name) {
            $holidays = Holidays::where('location_id', $s_location)->where('name', 'like', '%'.$s_name.'%')->get();
        } elseif ($s_location) {
            $holidays = Holidays::where('location_id', $s_location)->get();
        } elseif ($s_name) {
            $holidays = Holidays::where('name', 'like','%'.$s_name.'%')->get();
        } else {
            $holidays = Holidays::all();
        }

        $holidays = $holidays->filter(function ($item) use ($request, $s_wifi, $s_hotel, $s_car_rental) {

            $res = true;
            if (isset($request->wifi)) {
                $res = $res && ($s_wifi == $item['wifi']);
            }

            if (isset($request->hotel)) {
                $res = $res && ($s_hotel == $item['hotel']);
            }

            if (isset($request->car_rental)) {
                $res = $res && ($s_car_rental == $item['car_rental']);
            }

            return $res;
        })->values();

        $locations = Locations::all();
        $search_param = array(
            'location' => $s_location,
            'name' => $s_name,
            'wifi' => $s_wifi,
            'hotel' => $s_hotel,
            'car_rental' => $s_car_rental
        );

        return view('home', compact('holidays', 'locations', 'search_param'));
    }

    public function show(Request $request)
    {
        $id = $request->id;
        $holiday = Holidays::find($id);
        return view('frontend.holiday_details', compact('holiday'));
    }

    public function postBook(Request $request)
    {
        $start_date = trim(explode(' - ', $request->holiday_date)[0]);
        $end_date = trim(explode(' - ', $request->holiday_date)[1]);
        $id = $request->id;

        $book = new Booking;
        $book->user_id = Auth::user()->id;
        $book->holiday_id = $id;
        $book->start_date = Carbon::parse($start_date)->format('Y-m-d');;
        $book->end_date = Carbon::parse($end_date)->format('Y-m-d');
        $book->save();
        return 'success';
    }

    public function getMybooking(Request $request)
    {
        $booking_list = Auth::user()->booking;

        return view('frontend.my_booking', compact('booking_list'));
    }

    public function cancelMybooking($id)
    {
        Booking::find($id)->delete();
        return redirect()->back();
    }

    public function getMybookingDetail($id)
    {
        return Booking::with('holiday')->with('holiday.location')->find($id);
    }

    public function updateMybooking(Request $request, $id)
    {
        $start_date = trim(explode(' - ', $request->holiday_date)[0]);
        $end_date = trim(explode(' - ', $request->holiday_date)[1]);

        $book = Booking::find($id);
        $book->user_id = Auth::user()->id;
        $book->holiday_id = $id;
        $book->start_date = Carbon::parse($start_date)->format('Y-m-d');;
        $book->end_date = Carbon::parse($end_date)->format('Y-m-d');
        $book->save();
        return 'success';
    }
}
