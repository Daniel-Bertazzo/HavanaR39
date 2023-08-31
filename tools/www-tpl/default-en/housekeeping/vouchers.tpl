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
			<button type="submit" class="btn btn-primary">Create Voucher</button>
		</form>
		<br>
		<hr />
		<h2>Existing vouchers</h2>
		<p>TODO</p>
		<!-- TODO - Show existing vouchers -->
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