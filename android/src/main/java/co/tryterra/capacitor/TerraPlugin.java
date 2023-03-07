package co.tryterra.capacitor;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.google.gson.Gson;

import org.json.JSONException;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;

import co.tryterra.terra.TerraManager;
import co.tryterra.terra.enums.Connections;
import co.tryterra.terra.enums.CustomPermissions;
import kotlin.Unit;


@CapacitorPlugin(name = "TerraCapacitor")
public class TerraPlugin extends Plugin {

    private Terra implementation = new Terra();

    private Gson gson = new Gson();
    public TerraManager terra;

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
            default:
                return null;
        }
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
        String devId = call.getString("devId");
        JSObject res = new JSObject();
        if (devId == null){
            res.put("success", false);
            res.put("error", "Invalid devId passed");
            call.resolve(res);
            return;
        }

        co.tryterra.terra.Terra.Companion.instance(
                devId,
                call.getString("devId"),
                Objects.requireNonNull(this.getContext()),
                (terraManager, error) ->{
                    this.terra = terraManager;
                    res.put("success", true);
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void initConnection(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        String token = call.getString("token");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }

        if (token == null){
            res.put("success", false);
            res.put("error", "Invalid token provided");
            call.resolve(res);
            return;
        }

        boolean schedulerOn = Boolean.TRUE.equals(call.getBoolean("schedulerOn"));
        JSArray customPermissions = call.getArray("customPermission");

        HashSet<CustomPermissions> cPermissions = new HashSet<>();
        try {
            for (Object customPermission : customPermissions.toList()) {
                if (parseCustomPermission((String) customPermission)  == null) {
                    continue;
                }
                cPermissions.add(parseCustomPermission((String) customPermission));
            }
        }catch(JSONException e){
            e.printStackTrace();
            res.put("success", false);
            res.put("error", "Invalid customPermissions object. This must be a list");
        }

        String startIntent = call.getString("startIntent");

        this.terra.initConnection(Objects.requireNonNull(parseConnection(connection)), token, Objects.requireNonNull(this.getContext()), cPermissions, schedulerOn, startIntent,
                (success, error)-> {
                    res.put("success", success);
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

   @PluginMethod
   public void getUserId(PluginCall call){
        String connection = call.getString("connection");
        JSObject res = new JSObject();
        if (connection == null || parseConnection(connection) == null) {
            res.put("success", false);
            res.put("userId", null);
            call.resolve(res);
            return;
        }

        res.put("success", true);
        res.put("userId", this.terra.getUserId(Objects.requireNonNull(parseConnection(connection))));
        call.resolve(res);
   }

    @PluginMethod
    public void getAthlete(PluginCall call){
        call.unimplemented("Unimplemented function for Android");
    }

    @PluginMethod
    public void getBody(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }
        boolean toWebhook = Boolean.TRUE.equals(call.getBoolean("toWebhook"));

        Instant startDate = call.getString("startDate") == null ? null : Instant.parse(call.getString("startDate"));
        if (startDate == null){
            res.put("success", false);
            res.put("error", "Start date required");
            call.resolve(res);
            return;
        }

        Instant endDate = call.getString("endDate") == null ? startDate.plus(1, ChronoUnit.DAYS) : Instant.parse(call.getString("endDate"));

        this.terra.getBody(
                Objects.requireNonNull(parseConnection(connection)),
                Date.from(startDate),
                Date.from(endDate),
                toWebhook,
                (success, data, error) ->{
                    res.put("success", success);
                    if (data != null){
                        res.put("data", gson.toJson(data));
                    }
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void getActivity(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }
        boolean toWebhook = Boolean.TRUE.equals(call.getBoolean("toWebhook"));

        Instant startDate = call.getString("startDate") == null ? null : Instant.parse(call.getString("startDate"));
        if (startDate == null){
            res.put("success", false);
            res.put("error", "Start date required");
            call.resolve(res);
            return;
        }

        Instant endDate = call.getString("endDate") == null ? startDate.plus(1, ChronoUnit.DAYS) : Instant.parse(call.getString("endDate"));


        this.terra.getActivity(
                Objects.requireNonNull(parseConnection(connection)),
                Date.from(startDate),
                Date.from(endDate),
                toWebhook,
                (success, data, error) ->{
                    res.put("success", success);
                    if (data != null){
                        res.put("data", gson.toJson(data));
                    }
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void getDaily(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }
        boolean toWebhook = Boolean.TRUE.equals(call.getBoolean("toWebhook"));


        Instant startDate = call.getString("startDate") == null ? null : Instant.parse(call.getString("startDate"));
        if (startDate == null){
            res.put("success", false);
            res.put("error", "Start date required");
            call.resolve(res);
            return;
        }

        Instant endDate = call.getString("endDate") == null ? startDate.plus(1, ChronoUnit.DAYS) : Instant.parse(call.getString("endDate"));


        this.terra.getDaily(
                Objects.requireNonNull(parseConnection(connection)),
                Date.from(startDate),
                Date.from(endDate),
                toWebhook,
                (success, data, error) ->{
                    res.put("success", success);
                    if (data != null){
                        res.put("data", gson.toJson(data));
                    }
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void getNutrition(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }
        boolean toWebhook = Boolean.TRUE.equals(call.getBoolean("toWebhook"));


        Instant startDate = call.getString("startDate") == null ? null : Instant.parse(call.getString("startDate"));
        if (startDate == null){
            res.put("success", false);
            res.put("error", "Start date required");
            call.resolve(res);
            return;
        }

        Instant endDate = call.getString("endDate") == null ? startDate.plus(1, ChronoUnit.DAYS) : Instant.parse(call.getString("endDate"));


        this.terra.getNutrition(
                Objects.requireNonNull(parseConnection(connection)),
                Date.from(startDate),
                Date.from(endDate),
                toWebhook,
                (success, data, error) ->{
                    res.put("success", success);
                    if (data != null){
                        res.put("data", gson.toJson(data));
                    }
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void getSleep(PluginCall call){
        JSObject res = new JSObject();

        String connection = call.getString("connection");
        if (connection == null || parseConnection(connection) == null){
            res.put("success", false);
            res.put("error", "Invalid connection provided");
            call.resolve(res);
            return;
        }
        boolean toWebhook = Boolean.TRUE.equals(call.getBoolean("toWebhook"));


        Instant startDate = call.getString("startDate") == null ? null : Instant.parse(call.getString("startDate"));
        if (startDate == null){
            res.put("success", false);
            res.put("error", "Start date required");
            call.resolve(res);
            return;
        }

        Instant endDate = call.getString("endDate") == null ? startDate.plus(1, ChronoUnit.DAYS) : Instant.parse(call.getString("endDate"));


        this.terra.getSleep(
                Objects.requireNonNull(parseConnection(connection)),
                Date.from(startDate),
                Date.from(endDate),
                toWebhook,
                (success, data, error) ->{
                    res.put("success", success);
                    if (data != null){
                        res.put("data", gson.toJson(data));
                    }
                    if (error != null){
                        res.put("error", error.getMessage());
                    }
                    call.resolve(res);
                    return Unit.INSTANCE;
                });
    }

    @PluginMethod
    public void getMenstruation(PluginCall call){
        call.unimplemented("Unimplemented function for Android");
    }


    @PluginMethod
    public void readGlucoseData(PluginCall call){
        this.terra.readGlucoseData((details) -> {
            JSObject res = new JSObject();
            call.resolve(res.put("data", gson.toJson(details)));
            return Unit.INSTANCE;
        });
    }

    @PluginMethod
    public void activateSensor(PluginCall call){
        call.unimplemented("Unimplemented function for Android");
    }




}
