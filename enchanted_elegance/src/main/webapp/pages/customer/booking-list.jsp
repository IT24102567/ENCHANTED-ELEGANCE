<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="com.enchantedelegance.models.bookingmanagement.Booking" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }

    List<Booking> allBookings = (List<Booking>) request.getAttribute("bookings");
    int currentPage = 1;
    int recordsPerPage = 5; 
    
    // Get current page from request parameter
    if(request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    
    // Calculate pagination values
    int totalRecords = allBookings != null ? allBookings.size() : 0;
    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
    
    // If current page is greater than total pages and not page 1, redirect to previous page
    if (currentPage > totalPages && totalPages > 0) {
        response.sendRedirect("?page=" + (currentPage - 1));
        return;
    }
    
    // If no records and not on page 1, redirect to page 1
    if (totalRecords == 0 && currentPage != 1) {
        response.sendRedirect("?page=1");
        return;
    }
    
    int start = (currentPage - 1) * recordsPerPage;
    int end = Math.min(start + recordsPerPage, totalRecords);
    
    // Get sublist for current page
    List<Booking> bookings = allBookings != null ? allBookings.subList(start, end) : null;
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>My Bookings &mdash; Enchanted Elegance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700">
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
  
  <link rel="stylesheet" href="/enchanted_elegance/pages/customer/css/custom.css">
  
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
                <li><a id="haircutLink">Haircut</a></li>
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
                  <a href="#" class="authenticate-user-dropdown-trigger auth-active pl-3 pr-3">
                    <i class="fa fa-user authenticate-user-icon-mr"></i> <%= user.getName() %>
                  </a>
                  <ul class="authenticate-user-dropdown-menu">
                    <li><a href="/enchanted_elegance/profile?id=<%= user.getId() %>" class="authenticate-user-dropdown-item">Profile</a></li>
                    <li><a id="myBookinsLink" class="authenticate-user-dropdown-item auth-active">Bookings</a></li>
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

    <div class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mt-2 mb-2">
            <h2 class="mb-4 site-section-heading">All Bookings</h2>
            <div class="bl-table-container">
                <table class="bl-table">
                    <thead class="bl-thead">
                        <tr>
                            <th class="bl-th">Name</th>
                            <th class="bl-th">Mobile</th>
                            <th class="bl-th">Email</th>
                            <th class="bl-th">Treatment</th>
                            <th class="bl-th">Booking Date</th>
                            <th class="bl-th">Note</th>
                            <th class="bl-th">Action</th>
                        </tr>
                    </thead>
                    <tbody class="bl-tbody">
                        <%
                            if (bookings != null && !bookings.isEmpty()) {
                                for (Booking booking : bookings) {
                        %>        
                        <tr>
                            <td class="bl-td"><%= booking.getName() %></td>
                            <td class="bl-td"><%= booking.getMobile() %></td>
                            <td class="bl-td"><%= booking.getEmail() %></td>
                            <td class="bl-td"><%= booking.getTreatment() %></td>
                            <td class="bl-td"><%= booking.getDate() %></td>
                            <td class="bl-td"><%= booking.getNote() %></td>
                            <td class="bl-td-action">
                                <a href="pages/customer/edit-booking.jsp?id=<%= booking.getId() %>&page=<%= currentPage %>" class="bl-btn bl-edit"><i class="fa fa-pencil"></i></a>
                                
                                <form action="delete-booking" method="post" style="display:inline;">               
                                  <input type="hidden" name="id" value="<%= booking.getId() %>">
                                  <input type="hidden" name="from" value="user">
                                  <input type="hidden" name="page" value="<%= currentPage %>">
                                  <button type="submit" onclick="return confirm('Are you sure?')" class="bl-btn bl-delete"><i class="fa fa-trash"></i></button>
                                </form>
                            </td>                 
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                          <td class="bl-td" colspan="7">No bookings found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <%-- Pagination --%>
                <% if (totalPages > 1) { %>
                <nav aria-label="Page navigation" class="mt-3">
                    <ul class="pagination justify-content-center">
                        <%-- Previous button --%>
                        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= currentPage - 1 %>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        
                        <%-- Page numbers --%>
                        <% for (int i = 1; i <= totalPages; i++) { %>
                            <li class="page-item <%= i == currentPage ? "active" : "" %>">
                                <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                            </li>
                        <% } %>
                        
                        <%-- Next button --%>
                        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= currentPage + 1 %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <% } %>
            </div>          
          </div>
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
  <script src="/enchanted_elegance/pages/customer/js/components/alert.js"></script>

</body>
</html>