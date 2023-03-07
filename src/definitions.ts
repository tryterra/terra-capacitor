export interface TerraPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  initTerra(options: { devId: string; referenceId: string | null }): Promise<SuccessMessage>;
  initConnection(options: {
    connection: Connections;
    token: string;
    schedulerOn: boolean;
    customPermissions: CustomPermissions[];
    startIntent: string | null;
  }): Promise<any>;
  getUserId(options: { connection: Connections }): Promise<GetUserId>;

  getBody(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;

  getActivity(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;
  getDaily(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;

  getNutrition(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;

  getMenstruation(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;


  getSleep(options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
    toWebhook: boolean;
  }): Promise<DataMessage>;

  getAthlete(options: { connection: Connections; toWebhook: boolean;}): Promise<DataMessage>;

  activateSensor(): Promise<DataMessage>;
  readGlucoseData(): Promise<DataMessage>;
}

export enum CustomPermissions {
  'WORKOUT_TYPES' = 'WORKOUT_TYPES',
  'ACTIVITY_SUMMARY' = 'ACTIVITY_SUMMARY',
  'LOCATION' = 'LOCATION',
  'CALORIES' = 'CALORIES',
  'STEPS' = 'STEPS',
  'HEART_RATE' = 'HEART_RATE',
  'HEART_RATE_VARIABILITY' = 'HEART_RATE_VARIABILITY',
  'VO2MAX' = 'VO2MAX',
  'HEIGHT' = 'HEIGHT',
  'ACTIVE_DURATIONS' = 'ACTIVE_DURATIONS',
  'WEIGHT' = 'WEIGHT',
  'FLIGHTS_CLIMBED' = 'FLIGHTS_CLIMBED',
  'BMI' = 'BMI',
  'BODY_FAT' = 'BODY_FAT',
  'EXERCISE_DISTANCE' = 'EXERCISE_DISTANCE',
  'GENDER' = 'GENDER',
  'DATE_OF_BIRTH' = 'DATE_OF_BIRTH',
  'BASAL_ENERGY_BURNED' = 'BASAL_ENERGY_BURNED',
  'SWIMMING_SUMMARY' = 'SWIMMING_SUMMARY',
  'RESTING_HEART_RATE' = 'RESTING_HEART_RATE',
  'BLOOD_PRESSURE' = 'BLOOD_PRESSURE',
  'BLOOD_GLUCOSE' = 'BLOOD_GLUCOSE',
  'BODY_TEMPERATURE' = 'BODY_TEMPERATURE',
  'MINDFULNESS' = 'MINDFULNESS',
  'LEAN_BODY_MASS' = 'LEAN_BODY_MASS',
  'OXYGEN_SATURATION' = 'OXYGEN_SATURATION',
  'SLEEP_ANALYSIS' = 'SLEEP_ANALYSIS',
  'RESPIRATORY_RATE' = 'RESPIRATORY_RATE',
  'NUTRITION_SODIUM' = 'NUTRITION_SODIUM',
  'NUTRITION_PROTEIN' = 'NUTRITION_PROTEIN',
  'NUTRITION_CARBOHYDRATES' = 'NUTRITION_CARBOHYDRATES',
  'NUTRITION_FIBRE' = 'NUTRITION_FIBRE',
  'NUTRITION_FAT_TOTAL' = 'NUTRITION_FAT_TOTAL',
  'NUTRITION_SUGAR' = 'NUTRITION_SUGAR',
  'NUTRITION_VITAMIN_C' = 'NUTRITION_VITAMIN_C',
  'NUTRITION_VITAMIN_A' = 'NUTRITION_VITAMIN_A',
  'NUTRITION_CALORIES' = 'NUTRITION_CALORIES',
  'NUTRITION_WATER' = 'NUTRITION_WATER',
  'NUTRITION_CHOLESTEROL' = 'NUTRITION_CHOLESTEROL',
}

export enum Permissions {
  'ACTIVITY' = 'ACTIVITY',
  'BODY' = 'BODY',
  'DAILY' = 'DAILY',
  'NUTRITION' = 'NUTRITION',
  'SLEEP' = 'SLEEP',
}

export enum Connections {
  'APPLE_HEALTH' = 'APPLE_HEALTH',
  'FREESTYLE_LIBRE' = 'FREESTYLE_LIBRE',
  'GOOGLE' = 'GOOGLE',
  'SAMSUNG' = 'SAMSUNG',
}

export type GetUserId = {
  success: boolean;
  userId: string | null;
};

export type SuccessMessage = {
  success: boolean;
  error: string | null;
};

export type DataMessage = {
  success: boolean;
  data: Object;
  error: string | null;
};
