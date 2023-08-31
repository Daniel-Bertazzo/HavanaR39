{% include "housekeeping/base/header.tpl" %}
  <body>
	{% set usersAndModerationActive = " active " %}
    {% set usersAndModerationMainActive = " active " %}
	{% include "housekeeping/base/navigation.tpl" %}
     <h1 class="mt-4">Users and Moderation</h1>
		  <p>Welcome to the Users and Moderation pages for {{ site.siteName }} Hotel. Here you can manage users, see info on players and transactions, manage bans, warnings, alerts and moderation activities alike.</p>
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