<div class="d-flex" id="wrapper">
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Havana Housekeeping </div>
      <div class="list-group list-group-flush">
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}" class="list-group-item list-group-item-action {{ dashboardActive }}">Dashboard</a>
		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'configuration') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/configurations" class="list-group-item list-group-item-action {{ configurationsActive }}">Configurations</a>
		{% endif %}
		
	    {% if housekeepingManager.hasPermission(playerDetails.getRank(), 'bans') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/bans" class="list-group-item list-group-item-action {{ bansActive }}">Ban Management</a>
		{% endif %}
		
		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'room_ads') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/room_ads" class="list-group-item list-group-item-action {{ roomAdsActive }}">Room Advertisements</a>
		    <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/room_ads/create" class="list-group-item list-group-item-action {{ roomCreateAdsActive }}">Create Room Advertisements</a>
		{% endif %}
		

		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'room_badges') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/room_badges" class="list-group-item list-group-item-action {{ roomBadgesActive }}">Room Badges</a>
		    <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/room_badges/create" class="list-group-item list-group-item-action {{ roomCreateBadgesActive }}">Create Room Entry Badge</a>
		{% endif %}

		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'badges') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/badges" class="list-group-item list-group-item-action {{ badgesActive }}">Badges</a>
		    <!-- <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/badges/create" class="list-group-item list-group-item-action {{ createBadgesActive }}">Create Badge</a> -->
		{% endif %}

		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'infobus') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/infobus_polls" class="list-group-item list-group-item-action {{ infobusPollsActive }}">Infobus Polls</a>
		    <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/infobus_polls/create" class="list-group-item list-group-item-action {{ infobusPollsCreateActive }}">Create Infobus Polls</a>
		{% endif %}
		
		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'articles/create') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/articles" class="list-group-item list-group-item-action {{ articlesActive }}">News Articles</a>
		    <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/articles/create" class="list-group-item list-group-item-action {{ createArticlesActive }}">Post News Article</a>
		{% endif %}
		
		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'user/create') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/users/search" class="list-group-item list-group-item-action {{ searchUsersActive }}">Search Users</a>
		    <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/users/create" class="list-group-item list-group-item-action {{ createUserActive }}">Create New User</a>
		{% endif %}

    {% if housekeepingManager.hasPermission(playerDetails.getRank(), 'credits') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/credits" class="list-group-item list-group-item-action {{ creditsActive }}">Credits</a>
		{% endif %}
		
		{% if housekeepingManager.hasPermission(playerDetails.getRank(), 'catalogue/edit_frontpage') %}
		<a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/catalogue/edit_frontpage" class="list-group-item list-group-item-action {{ editCatalogueFrontPage }}">Catalogue Frontpage</a>
		{% endif %}

    {% if housekeepingManager.hasPermission(playerDetails.getRank(), 'transaction/lookup') %}
        <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/transaction/lookup" class="list-group-item list-group-item-action {{ searchTransactionsActive }}">Transaction Lookup</a>
		{% endif %}

      </div>
    </div>
    <div id="page-content-wrapper">

      <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
      
        {% if creditsActive %}
            <ul class="nav nav-pills">
              <li class="nav-item">
                <a class="nav-link {{ creditsMainActive }}" aria-current="page" href="{{ site.sitePath }}/{{ site.housekeepingPath }}/credits">Credits</a>
              </li>
              <li class="nav-item">
                <a class="nav-link {{ creditsVouchersActive }}" href="{{ site.sitePath }}/{{ site.housekeepingPath }}/vouchers">Voucher management</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Give Credits / Pixels</a>
              </li>
            </ul>
        {% endif %}
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="{{ site.sitePath }}/{{ site.housekeepingPath }}">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{ site.sitePath }}/{{ site.housekeepingPath }}/logout">Logout</a>
            </li>
          </ul>
        </div>
      
      </nav>

      <div class="container-fluid">
