package org.alexdev.http.controllers.housekeeping;

import java.util.Random;

import org.alexdev.duckhttpd.server.connection.WebConnection;
import org.alexdev.duckhttpd.template.Template;
import org.alexdev.havana.dao.mysql.VoucherDao;
import org.alexdev.havana.game.player.PlayerDetails;
import org.alexdev.http.Routes;
import org.alexdev.http.game.housekeeping.HousekeepingManager;
import org.alexdev.http.util.SessionUtil;

public class HousekeepingCreditsController {
   
    public static void credits(WebConnection client) {
        if (!client.session().getBoolean(SessionUtil.LOGGED_IN_HOUSKEEPING)) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        
        Template tpl = client.template("housekeeping/credits");
        tpl.set("housekeepingManager", HousekeepingManager.getInstance());
    
        PlayerDetails playerDetails = (PlayerDetails) tpl.get("playerDetails");
        if (!HousekeepingManager.getInstance().hasPermission(playerDetails.getRank(), "credits")) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        
        tpl.set("pageName", "Credits");
        tpl.render();

        // Delete alert after it's been rendered
        client.session().delete("alertMessage");
    }

    public static void vouchers(WebConnection client) {
        if (!client.session().getBoolean(SessionUtil.LOGGED_IN_HOUSKEEPING)) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        Template tpl = client.template("housekeeping/vouchers");
        tpl.set("housekeepingManager", HousekeepingManager.getInstance());

        PlayerDetails playerDetails = (PlayerDetails) tpl.get("playerDetails");

        if (!HousekeepingManager.getInstance().hasPermission(playerDetails.getRank(), "vouchers")) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }

        // Random voucher code generation for ease of use
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 8;
        Random random = new Random();

        String initialVoucher = random.ints(leftLimit, rightLimit + 1)
            .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
            .limit(targetStringLength)
            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
            .toString();

        tpl.set("pageName", "Voucher Management");
        tpl.set("initialVoucher", initialVoucher);

        if (client.post().queries().size() > 0) {
            String[] fieldCheck = new String[]{"amount", "voucherCode"};

            for (String field : fieldCheck) {
                if (client.post().contains(field) && client.post().getString(field).length() > 0) {
                    continue;
                }

                client.session().set("alertColour", "danger");
                client.session().set("alertMessage", "You need to enter all fields");
                tpl.render();

                // Delete alert after it's been rendered
                client.session().delete("alertMessage");
                return;
            }

            String voucherCode = client.post().getString("voucherCode");
            int amount = client.post().getInt("amount");

            VoucherDao.createVoucher(voucherCode, amount);
            client.session().set("alertColour", "success");
            client.session().set("alertMessage", "Voucher created successfully!");
            tpl.render();
        }
        
        tpl.render();

        // Delete alert after it's been rendered
        client.session().delete("alertMessage");
    }
}
