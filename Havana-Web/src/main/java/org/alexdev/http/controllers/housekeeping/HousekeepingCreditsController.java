package org.alexdev.http.controllers.housekeeping;

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

        if (client.post().queries().size() > 0) {
            String[] fieldCheck = new String[]{"numberOfCoins", "voucherCode"};

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
            int numberOfCoins = client.post().getInt("numberOfCoins");

            VoucherDao.createVoucher(voucherCode, numberOfCoins);
        }

        int daniel = 24;

        tpl.set("pageName", "Voucher Management");
        tpl.set("initialVoucher", daniel);
        tpl.render();

        // Delete alert after it's been rendered
        client.session().delete("alertMessage");
    }
}
