<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Haircut &mdash; Enchanted Elegance</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/magnific-popup.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/jquery-ui.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">

    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/aos.css">
    <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/style.css">
    
    <!-- new add styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
  <body>
  
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

     <header class="site-navbar py-1" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="/enchanted_elegance" class="text-black h2 mb-0 single-line">Enchanted Elegance</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a id="homeLink">Home</a></li>
                <li><a id="servicesLink">Services</a></li>
                <li class="active"><a id="haircutLink">Haircut</a></li>
                <li><a id="bookLink">Book Online</a></li>
                <li><a id="contactLink">Contact</a></li>
                <li><a id="aboutLink">About</a></li>
                <li><a id="feedbackLink">FeedBack</a></li>
              </ul>
            </nav>
          </div>

          <div class="col-6 col-xl-2 text-right" data-aos="fade-down">
            <div class="d-none d-xl-inline-block">
              <ul class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social">
                <% if (user == null) { // If user is not logged in %>
                <li>
                  <a id="loginLink" class="pl-0 pr-3 text-black">Login</a>
                </li>
                <li>
                  <a id="registerLink" class="pl-3 pr-3 text-black">Register</a>
                </li>
                <% } else { // If user is logged in %>
                <li class="authenticate-user-dropdown">
                  <a href="#" class="authenticate-user-dropdown-trigger pl-3 pr-3 text-black">
                    <i class="fa fa-user authenticate-user-icon-mr"></i> <%= user.getName() %>
                  </a>
                  <ul class="authenticate-user-dropdown-menu">
                    <li><a href="/enchanted_elegance/profile?id=<%= user.getId() %>" class="authenticate-user-dropdown-item">Profile</a></li>
                    <li><a id="myBookinsLink" class="authenticate-user-dropdown-item">Bookings</a></li>
                    <li><a id="logoutLink" class="authenticate-user-dropdown-item">Logout</a></li>
                  </ul>
                </li>
                <% } %>
              </ul>
            </div>

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#"
                class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>

    </header>

    <div class="slide-one-item home-slider owl-carousel">
   
      <div class="site-blocks-cover inner-page-cover" style="background-image: url(/enchanted_elegance/pages/customer/images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              <h2 class="text-white font-weight-light mb-4 display-1 line-height-1">Hair Style &amp; Prices</h2>

              <p><a href="/enchanted_elegance/pages/customer/booking.jsp" class="btn btn-black py-3 px-5">Book Now!</a></p>
            </div>
          </div>
        </div>
      </div>  

    </div>

    <div class="site-section">
      <div class="container">
        
        <div class="row">
          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_1.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_2.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_3.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_4.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_5.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 text-center mb-5 mb-lg-5">
            <div class="h-100 bg-light site-block-feature-7">
              <img src="/enchanted_elegance/pages/customer/images/img_1.jpg" alt="Image" class="img-fluid">
              <div class="p-4 p-lg-5">
                <h3 class="text-black h4">Hair Cut Style Title Here</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum exercitationem quae id dolorum debitis.</p>
                <p><strong class="font-weight-bold text-primary">$29</strong></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5">
            <img src="/enchanted_elegance/pages/customer/images/person_1.jpg" alt="Image" class="img-md-fluid">
          </div>
          <div class="col-lg-6 bg-white p-md-5 align-self-center">
            <h2 class="display-1 text-black line-height-1 site-section-heading mb-4 pb-3">New hairstyle!</h2>
            <p class="text-black lead"><em>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique dolorem quisquam laudantium, incidunt id laborum, tempora aliquid labore minus. Nemo maxime, veniam! Fugiat odio nam eveniet ipsam atque, corrupti porro&rdquo;</em></p>
            <p class="lead text-black">&mdash; <em>Stellla Martin</em></p>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row text-center">
          <div class="col-md-12">
            <h2 class="mb-4 text-black">We want your hair to look fabulous</h2>
            <p class="mb-0"><a href="#" class="btn btn-primary py-3 px-5 text-white">Visit Our Salon Now</a></p>
          </div>
        </div>
      </div>
    </div>

    <footer id="footer" class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="mb-5">
              <h3 class="footer-heading mb-4">About Enchanted Elegance</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe pariatur reprehenderit vero atque,
                consequatur id ratione, et non dignissimos culpa? Ut veritatis, quos illum totam quis blanditiis,
                minima minus odio!</p>
            </div>
          </div>
          
          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="row mb-5">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Quick Menu</h3>
              </div>
              <div class="col-md-6 col-lg-6">
                <ul class="list-unstyled">
                  <li><a href="/enchanted_elegance">Home</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/services.jsp">Services</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/haircut.jsp">Haircut</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/booking.jsp">Book Online</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-6">
                <ul class="list-unstyled">
                  <li><a href="/enchanted_elegance/pages/customer/contact.jsp">Contact</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/about.jsp">About Us</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/feedback.jsp">Feedback</a></li>
                  <li><a href="/enchanted_elegance/pages/customer/privacy-policy.jsp">Privacy Policy</a></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="mb-5">
              <h3 class="footer-heading mb-2">Subscribe Newsletter</h3>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit minima minus odio.</p>
              <form action="#" method="post">
                <div class="input-group mb-3">
                  <input type="text" class="form-control border-secondary text-white bg-transparent"
                    placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary text-white" type="button" id="button-addon2">Send</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="mb-5">
              <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </div>

            <p>
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
              with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="/enchanted_elegance"
                target="_blank">Enchanted Elegance</a>
            </p>
          </div>
        </div>
      </div>
    </footer>  
  </div>

  <script src="/enchanted_elegance/pages/customer/js/jquery-3.3.1.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery-ui.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/popper.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/bootstrap.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/owl.carousel.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.stellar.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.countdown.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/jquery.magnific-popup.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/bootstrap-datepicker.min.js"></script>
  <script src="/enchanted_elegance/pages/customer/js/aos.js"></script>

  <script src="/enchanted_elegance/pages/customer/js/main.js"></script>

   <!-- new add script  -->
  <script src="/enchanted_elegance/pages/customer/js/components/links.js"></script>

  </body>
</html>