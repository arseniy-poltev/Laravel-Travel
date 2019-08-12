    <!-- Scripts -->
    <script src="{{ asset('frontend/js/jquery-1.11.1.min.js') }}"></script>
    <script src="{{ asset('frontend/js/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('frontend/js/wow.min.js') }}"></script>
    <script src="{{ asset('frontend/js/typewriter.js') }}"></script>
    <script src="{{ asset('frontend/js/jquery.onepagenav.js') }}"></script>
    {{--<script src="{{ asset('frontend/js/main.js') }}"></script>--}}
    <link rel="stylesheet" href="{{ asset('frontend/css/magnific-popup.css') }}">
    <script src="{{ asset('frontend/js/jquery.magnific-popup.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            $('.mobile-nav ul').html($('nav .navbar-nav').html());

            $('body').on('click', 'nav .navbar-toggle', function() {
                event.stopPropagation();
                $('.mobile-nav').addClass('active');
            });

            $('body').on('click', '.mobile-nav a', function(event) {
                $('.mobile-nav').removeClass('active');
                if(!this.hash) return;
                event.preventDefault();
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    event.stopPropagation();
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });

            $('body').on('click', '.mobile-nav a.close-link', function(event) {
                $('.mobile-nav').removeClass('active');
                event.preventDefault();
            });
        });


    </script>
