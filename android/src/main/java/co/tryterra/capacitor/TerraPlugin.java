package co.tryterra.capacitor;

import com.getcapacitor.JSObject;
import com.getcapacitor.JSArray;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import com.google.gson.Gson;

import org.json.JSONException;

import java.util.Date;
import java.util.Objects;
import java.time.Instant;
import java.util.HashSet;

import co.tryterra.terra.Terra;
import co.tryterra.terra.enums.Connections;
import co.tryterra.terra.enums.CustomPermissions;
import kotlin.Unit;

@CapacitorPlugin(name = "TerraCapacitor")
public class TerraPlugin extends Plugin {

    private TerraCapacitor implementation = new TerraCapacitor();

    private Gson gson = new Gson();
    public Terra terra;

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    private Connections parseConnection(String connection){
        switch (connection){
            case "SAMSUNG":
                return Connections.SAMSUNG;
            case "GOOGLE":
                return Connections.GOOGLE_FIT;
            case "FREESTYLE_LIBRE":
                return Connections.FREESTYLE_LIBRE;
        }
      return null;
    }

    private CustomPermissions parseCustomPermission(String customPermission){
        switch (customPermission){
            case "WORKOUT_TYPES":
                return CustomPermissions.WORKOUT_TYPE;
            case "ACTIVITY_SUMMARY":
                return CustomPermissions.ACTIVITY_SUMMARY;
            case "LOCATION":
                return CustomPermissions.LOCATION;
            case "CALORIES":
                return CustomPermissions.CALORIES;
            case "STEPS":
                return CustomPermissions.STEPS;
            case "HEART_RATE":
                return CustomPermissions.HEART_RATE;
            case "HEART_RATE_VARIABILITY":
                return CustomPermissions.HEART_RATE_VARIABILITY;
            case "VO2MAX":
                return CustomPermissions.VO2MAX;
            case "HEIGHT":
                return CustomPermissions.HEIGHT;
            case "ACTIVE_DURATIONS":
                return CustomPermissions.ACTIVE_DURATIONS;
            case "WEIGHT":
                return CustomPermissions.WEIGHT;
            case "FLIGHTS_CLIMBED":
                return CustomPermissions.FLIGHTS_CLIMBED;
            case "BMI":
                return CustomPermissions.BMI;
            case "BODY_FAT":
                return CustomPermissions.BODY_FAT;
            case "EXERCISE_DISTANCE":
                return CustomPermissions.EXERCISE_DISTANCE;
            case "GENDER":
                return CustomPermissions.GENDER;
            case "DATE_OF_BIRTH":
                return CustomPermissions.DATE_OF_BIRTH;
            case "BASAL_ENERGY_BURNED":
                return CustomPermissions.BASAL_ENERGY_BURNED;
            case "SWIMMING_SUMMARY":
                return CustomPermissions.SWIMMING_SUMMARY;
            case "RESTING_HEART_RATE":
                return CustomPermissions.RESTING_HEART_RATE;
            case "BLOOD_PRESSURE":
                return CustomPermissions.BLOOD_PRESSURE;
            case "BLOOD_GLUCOSE":
                return CustomPermissions.BLOOD_GLUCOSE;
            case "BODY_TEMPERATURE":
                return CustomPermissions.BODY_TEMPERATURE;
            case "MINDFULNESS":
                return CustomPermissions.MINDFULNESS;
            case "LEAN_BODY_MASS":
                return CustomPermissions.LEAN_BODY_MASS;
            case "OXYGEN_SATURATION":
                return CustomPermissions.OXYGEN_SATURATION;
            case "SLEEP_ANALYSIS":
                return CustomPermissions.SLEEP_ANALYSIS;
            case "RESPIRATORY_RATE":
                return CustomPermissions.RESPIRATORY_RATE;
            case "NUTRITION_SODIUM":
                return CustomPermissions.NUTRITION_SODIUM;
            case "NUTRITION_PROTEIN":
                return CustomPermissions.NUTRITION_PROTEIN;
            case "NUTRITION_CARBOHYDRATES":
                return CustomPermissions.NUTRITION_CARBOHYDRATES;
            case "NUTRITION_FIBRE":
                return CustomPermissions.NUTRITION_FIBRE;
            case "NUTRITION_FAT_TOTAL":
                return CustomPermissions.NUTRITION_FAT_TOTAL;
            case "NUTRITION_SUGAR":
                return CustomPermissions.NUTRITION_SUGAR;
            case "NUTRITION_VITAMIN_C":
                return CustomPermissions.NUTRITION_VITAMIN_C;
            case "NUTRITION_VITAMIN_A":
                return CustomPermissions.NUTRITION_VITAMIN_A;
            case "NUTRITION_CALORIES":
                return CustomPermissions.NUTRITION_CALORIES;
            case "NUTRITION_WATER":
                return CustomPermissions.NUTRITION_WATER;
            case "NUTRITION_CHOLESTEROL":
                return CustomPermissions.NUTRITION_CHOLESTEROL;
            default:
                return null;
        }
    }

    @PluginMethod
    public void initTerra(PluginCall call) {
        String devId = call.getString("devId", "");
        String referenceId = call.getString("referenceId", "");
        try{
            this.terra = new Terra(
                devId,
                this.getActivity(),
                referenceId,
                (success) -> {
                    JSObject ret = new JSObject();
                    ret.put("success", success);
                    call.resolve(ret);
                    return Unit.INSTANCE;
                });
        }
        catch(Exception e){
            JSObject ret = new JSObject();
            ret.put("success", false);
            call.resolve(ret);
        }
    }

    @PluginMethod
    public void initConnection(PluginCall call){
        String connection = call.getString("connection");
        String token = call.getString("token");
        Boolean schedulerOn = call.getBoolean("schedulerOn");
        JSArray customPermissions = call.getArray("customPermissions");
        String startIntent = call.getString("startIntent");
        if (parseConnection(connection) == null){
            JSObject ret = new JSObject();
            ret.put("success", false);
            call.resolve(ret);
            return;
        }

        HashSet<CustomPermissions> cPermissions = new HashSet<>();
        try {
            for (Object customPermission: customPermissions.toList()){
                cPermissions.add(parseCustomPermission((String) customPermission));
            }
        } catch (JSONException e) {
            call.reject("Got an error during the for loop");
            // e.printStackTrace();
        }

        this.terra.initConnection(
            Objects.requireNonNull(parseConnection(connection)),
            token,
            this.getActivity(),
            cPermissions,
            schedulerOn,
            startIntent,
            (success)-> {
                JSObject ret = new JSObject();
                ret.put("success", success);
                call.resolve(ret);
                return Unit.INSTANCE;
            });
    }

    @PluginMethod
    public void getUserId(PluginCall call){
        String connection = call.getString("connection");
        JSObject ret = new JSObject();
        ret.put("user_id", this.terra.getUserId(Objects.requireNonNull(parseConnection(connection))));
        call.resolve(ret);
    }

    @PluginMethod
    public void getAthlete(PluginCall call){
        String connection = call.getString("connection");
        this.terra.getAthlete(Objects.requireNonNull(parseConnection(connection)), (success) ->{
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void getBody(PluginCall call){
        String connection = call.getString("connection");
        Date startDate = null;
        try {
            startDate = (Date) call.getData().get("startDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Date endDate = null;
        try {
            endDate = (Date) call.getData().get("endDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.terra.getBody(
          Objects.requireNonNull(parseConnection(connection)),
          startDate,
          endDate,
          (success) -> {
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void getActivity(PluginCall call){
        String connection = call.getString("connection");
        Date startDate = null;
        try {
            startDate = (Date) call.getData().get("startDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Date endDate = null;
        try {
            endDate = (Date) call.getData().get("endDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.terra.getActivity(
          Objects.requireNonNull(parseConnection(connection)),
          startDate,
          endDate,
          (success) ->{
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void getDaily(PluginCall call){
        String connection = call.getString("connection");
        Date startDate = null;
        try {
            startDate = (Date) call.getData().get("startDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Date endDate = null;
        try {
            endDate = (Date) call.getData().get("endDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.terra.getDaily(
          Objects.requireNonNull(parseConnection(connection)),
          startDate,
          endDate,
          (success) ->{
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void getNutrition(PluginCall call){
        String connection = call.getString("connection");
        Date startDate = null;
        try {
            startDate = (Date) call.getData().get("startDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Date endDate = null;
        try {
            endDate = (Date) call.getData().get("endDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.terra.getNutrition(
          Objects.requireNonNull(parseConnection(connection)),
          startDate,
          endDate,
          (success) ->{
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void getSleep(PluginCall call){
        String connection = call.getString("connection");
        Date startDate = null;
        try {
            startDate = (Date) call.getData().get("startDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Date endDate = null;
        try {
            endDate = (Date) call.getData().get("endDate");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.terra.getSleep(
          Objects.requireNonNull(parseConnection(connection)),
          startDate,
          endDate,
          (success) ->{
            JSObject ret = new JSObject();
            ret.put("success", success);
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void readGlucoseData(PluginCall call){
        this.terra.readGlucoseData((details) -> {
            JSObject ret = new JSObject();
            ret.put("data", gson.toJson(details));
            call.resolve(ret);
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void activateSensor(PluginCall call){
        JSObject ret = new JSObject();
        ret.put("success", true);
        call.resolve(ret);
    }

    @PluginMethod
    public void setUpBackgroundDelivery(){
        return;
    }
}
