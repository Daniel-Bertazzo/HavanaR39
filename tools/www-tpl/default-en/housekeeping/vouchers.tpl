{% include "housekeeping/base/header.tpl" %}
  <body>
    {% set creditsActive = " active " %}
    {% set creditsVouchersActive = " active " %}
	{% include "housekeeping/base/navigation.tpl" %}
     <h1 class="mt-4">Voucher management</h1>
		{% include "housekeeping/base/alert.tpl" %}
		<p>Here you can create new coin vouchers, as well as see and delete existing ones.</p>
		<h2>Create new voucher</h2>
		<form class="table-responsive col-md-4" method="post">
			<div class="form-group">
				<label for="searchFor">Amount</label>
				<input type="number" name="amount" class="form-control" id="amount" placeholder="How many coins you want to generate..." min="0" max="1000000">
			</div>
			<div class="form-group">
				<label for="searchFor">Voucher Code</label>
				<input type="text" name="voucherCode" class="form-control" id="voucherCode" value="{{initialVoucher}}" maxlength="100">
			</div>
			<button type="submit" class="btn btn-success">Create Voucher</button>
		</form>
		<br>
		<hr />
		<h2>Existing vouchers</h2>
		<div style="margin:10px">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Voucher code</th>
							<th>Amount</th>
						</tr>
					</thead>
					<tbody>
						{% set num = 1 %}
						{% for player in players %}
						<tr>
						<td>{{ player.id }}</td>
						<td><a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/users/edit?id={{ player.id }}">{{ player.name }}</a> - <a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/transaction/lookup?searchQuery={{ player.getName() }}">Transactions</a></td>
						<td>{{ player.email }}</td>
						<td><img src="{{ site.habboImagingPath }}/habbo-imaging/avatarimage?figure={{ player.figure }}&size=s"></td>
						<td>{{ player.motto }}</td>
						<td>{{ player.credits }}</td>
						<td>{{ player.pixels }}</td>
						<td>{{ player.formatLastOnline("dd-MM-yyyy HH:mm:ss") }}</td>
						<td>{{ player.formatJoinDate("dd-MM-yyyy HH:mm:ss") }}</td>
						<td><a href="{{ site.sitePath }}/{{ site.housekeepingPath }}/api/ban?username={{ player.name }}"><button type="button" class="btn btn-danger">Permanently Ban User</button></a></td>
						</tr>
						{% set num = num + 1 %}
						{% endfor %}
					</tbody>
				</table>
			</div>
		</div>

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

{% include "housekeeping/base/footer.tpl" %}