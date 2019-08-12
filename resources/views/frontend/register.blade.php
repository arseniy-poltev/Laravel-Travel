@extends('frontend.template.layout')
@section('content')
<section id="register-form" class="section gray-bg section-padded">
    <div class="container">
        <div class="row text-left title register-form-box">
            <form class="form-horizontal popup-form register_form" role="form" method="post" action="{{ url('register') }}">
                {{ csrf_field() }}
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="col-xs-12" id="erroresFormOk">

                            </div>
                            <div class="col-xs-12" id="erroresFormKo">
                                {{--@if ($errors->has('name'))--}}
                                    {{--<p>{{ $errors->first('name') }}</p>--}}
                                {{--@endif--}}
                                {{--@if ($errors->has(backpack_authentication_column()))--}}
                                    {{--<p>{{ $errors->first(backpack_authentication_column()) }}</p>--}}
                                {{--@endif--}}
                                {{--@if ($errors->has('password'))--}}
                                    {{--<p>{{ $errors->first('password') }}</p>--}}
                                {{--@endif--}}
                                {{--@if ($errors->has('password_confirmation'))--}}
                                    {{--<p>{{ $errors->first('password_confirmation') }}</p>--}}
                                {{--@endif--}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label class="control-label">{{ trans('backpack::base.name') }}</label>

                            <div>
                                <input type="text" class="form-control  form-white" name="name" value="{{ old('name') }}">

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group{{ $errors->has(backpack_authentication_column()) ? ' has-error' : '' }}">
                            <label class="control-label">{{ config('backpack.base.authentication_column_name') }}</label>

                            <div>
                                <input type="{{ backpack_authentication_column()=='email'?'email':'text'}}" class="form-control  form-white" name="{{ backpack_authentication_column() }}" value="{{ old(backpack_authentication_column()) }}">

                                @if ($errors->has(backpack_authentication_column()))
                                    <span class="help-block">
                                        <strong>{{ $errors->first(backpack_authentication_column()) }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label class="control-label">{{ trans('backpack::base.password') }}</label>

                            <div>
                                <input type="password" class="form-control  form-white" name="password">

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                            <label class="control-label">{{ trans('backpack::base.confirm_password') }}</label>

                            <div>
                                <input type="password" class="form-control form-white" name="password_confirmation">

                                @if ($errors->has('password_confirmation'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="">
                        <input class="btn btn-block btn-form btn-primary" id="submit_register" name="submit" type="submit" value="Enviar" >
                    </div>
                </div>
                <div class="form-group text-center">
                    <a href="{{ route('backpack.auth.password.reset') }}">{{ trans('backpack::base.forgot_your_password') }}</a>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection
