package cordova.plugin.adbrix;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.util.*;

import com.igaworks.adbrix.IgawAdbrix;

/**
 * This class echoes a string called from JavaScript.
 */
public class CDVAdbrix extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        } else if (action.equals("retention")) {
            String activityName = args.getString(0);
            String subName = args.getString(1);
            
            //            Log.v("Adbrix Plugin", "Activity Name: " + activityName + ", Sub Name: " + subName);
            
            if (subName.equals("null"))
            {
                //                Log.v("Adbrix Plugin", "하나짜리");
                IgawAdbrix.retention(activityName);
            }
            else
            {
                //                Log.v("Adbrix Plugin", "두개짜리");
                IgawAdbrix.retention(activityName, subName);
            }
        }
        return false;
    }
    
    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }
}
