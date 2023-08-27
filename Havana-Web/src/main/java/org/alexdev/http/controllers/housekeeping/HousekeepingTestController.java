package org.alexdev.http.controllers.housekeeping;

import org.alexdev.duckhttpd.server.connection.WebConnection;
import org.alexdev.duckhttpd.template.Template;
import org.alexdev.havana.game.player.PlayerDetails;
import org.alexdev.http.Routes;
import org.alexdev.http.game.housekeeping.HousekeepingManager;
import org.alexdev.http.util.SessionUtil;

public class HousekeepingTestController {
    
    public static void test_one(WebConnection client) {
    
        if (!client.session().getBoolean(SessionUtil.LOGGED_IN_HOUSKEEPING)) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        
        Template tpl = client.template("housekeeping/test_one");
        tpl.set("housekeepingManager", HousekeepingManager.getInstance());
    
        PlayerDetails playerDetails = (PlayerDetails) tpl.get("playerDetails");
        if (!HousekeepingManager.getInstance().hasPermission(playerDetails.getRank(), "test_one")) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }

        tpl.render();

        // Delete alert after it's been rendered
        client.session().delete("alertMessage");
    }
}
