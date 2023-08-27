{% include "housekeeping/base/header.tpl" %}
  <body>
  	{% set dashboardActive = " active " %}
	{% set testOneActive = " active " %}
	{% include "housekeeping/base/navigation.tpl" %}
  <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
  <script src="https://blackrockdigital.github.io/startbootstrap-simple-sidebar/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>
</body>
</html>