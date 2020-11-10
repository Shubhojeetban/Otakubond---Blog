
<nav class="navbar navbar-expand-lg navbar-dark primary-background text-white">

  <a class="navbar-brand mt-0 pd-0 mr-0" href="index.jsp"> 
 <img alt="logo_otakubond" src="img/logo/logo1.png" class="img-fluid">
 </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active px-2">
        <a class="nav-link" href="profile.jsp"> <span class="fa fa-cubes"></span> Anime Blog <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown px-2">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-gamepad"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Thriller</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Romantic</a>
        </div>
      </li>
      <li class="nav-item px-2">
        <a class="nav-link" href="#"> <span class="fa fa-address-book"></span> Contact</a>
      </li>
      <li class="nav-item px-2">
        <a class="nav-link login" href="login_page.jsp"> <span class="fa fa-user-circle-o"></span> Login</a>
      </li>
      <li class="nav-item px-2">
        <a class="nav-link login" href="Register.jsp"> <span class="fa fa-user-plus"></span> Signup</a>
      </li>
      <li class="nav-item dropdown px-2 profile1">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-gamepad"></span> Your Profile
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a id="yourname" class="dropdown-item" href="#"> Your name</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="LogoutServlet">Logout</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>