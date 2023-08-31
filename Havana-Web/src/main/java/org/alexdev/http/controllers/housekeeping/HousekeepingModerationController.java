package org.alexdev.http.controllers.housekeeping;

import org.alexdev.duckhttpd.server.connection.WebConnection;
import org.alexdev.duckhttpd.template.Template;
import org.alexdev.havana.game.player.PlayerDetails;
import org.alexdev.http.Routes;
import org.alexdev.http.game.housekeeping.HousekeepingManager;
import org.alexdev.http.util.SessionUtil;

public class HousekeepingModerationController {
 
    public static void usersAndModeration(WebConnection client) {
        if (!client.session().getBoolean(SessionUtil.LOGGED_IN_HOUSKEEPING)) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        
        Template tpl = client.template("housekeeping/users_and_moderation");
        tpl.set("housekeepingManager", HousekeepingManager.getInstance());
    
        PlayerDetails playerDetails = (PlayerDetails) tpl.get("playerDetails");
        if (!HousekeepingManager.getInstance().hasPermission(playerDetails.getRank(), "users_and_moderation")) {
            client.redirect("/" + Routes.HOUSEKEEPING_PATH);
            return;
        }
        
        tpl.set("pageName", "Users and Moderation");
        tpl.render();

        // Delete alert after it's been rendered
        client.session().delete("alertMessage");
    }

}
