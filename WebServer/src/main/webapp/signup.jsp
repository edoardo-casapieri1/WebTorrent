<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login/Sign up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="container">
    <div class="row">
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100 p-t-50 p-b-90">
                        <form class="login100-form validate-form flex-sb flex-w" method="post" action="SignupServlet">
					<span class="login100-form-title p-b-51">
						Sign up
					</span>
                            <div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
                                <input class="input100" type="text" name="username_s" placeholder="Username">
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                                <input class="input100" type="password" name="pass_s" placeholder="Password">
                                <span class="focus-input100"></span>
                            </div>
                            <div class="wrap-input100 validate-input m-b-16" data-validate = "Confirm Password is required">
                                <input class="input100" type="password" name="pass_confirm_s" placeholder="Confirm Password">
                                <span class="focus-input100"></span>
                            </div>
                            <div class="container-login100-form-btn m-t-17">
                                <button class="login100-form-btn" type="submit">
                                    Sign up
                                </button>
                            </div>
                        </form>
                        <div class="container-login100-form-btn m-t-17">
                            <a class="login100-form-btn" href="index.jsp">Login</a>
                        </div>
                        <!-- Qui di seguito si invalida la sessione nel caso ci sia stato un errore nella login -->
                        <%
                            String ErrorMessage = (String) session.getAttribute("ErrorMessage");
                            if (null != ErrorMessage) { %>
                                <div class="alert m-t-17">
                                    <span class="closebtn">&times;</span>
                                    <strong> <%=ErrorMessage %></strong>
                                </div>
                                <% session.removeAttribute("ErrorMessage"); %>
                            <%}
                            String SuccessMessage = (String) session.getAttribute("SuccessMessage");
                            if (null != SuccessMessage) { %>
                                <div class="alert success m-t-17">
                                    <span class="closebtn">&times;</span>
                                    <strong> <%=SuccessMessage %></strong>
                                </div>
                                <% session.removeAttribute("SuccessMessage"); %>
                            <%}
                        %>
                        <script>
                            const close = document.getElementsByClassName("closebtn");
                            let i;

                            for (i = 0; i < close.length; i++) {
                                close[i].onclick = function(){
                                    const div = this.parentElement;
                                    div.style.opacity = "0";
                                    setTimeout(function(){ div.style.display = "none"; }, 600);
                                }
                            }
                        </script>
                    </div>
                </div>
            </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>
