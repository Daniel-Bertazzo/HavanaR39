{% include "housekeeping/base/header.tpl" %}
  <body>
  	{% set creditsActive = " active " %}
    {% set creditsMainActive = " active " %}
    {% include "housekeeping/base/navigation.tpl" %}
    <h1 class="mt-4">Credit management</h1>
		  <p>This is the credits/currency tool for {{ site.siteName }} Hotel. Here you can manage coin vouchers, check transaction logs for each item or user, and provide currency directly to a given user.</p>
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