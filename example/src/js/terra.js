import { Connections, Terra } from 'terra-capacitor';

export function useTerra() {
  Terra.echo({ value: 'Echo function test' });
  const connection = Connections.APPLE_HEALTH;

  // terra functions example
  Terra.initTerra({ devId: 'dev id', referenceId: 'referenceid' })
    .then(res => {
      console.log('initTerra', res);
      Terra.initConnection({
        connection: connection,
        token: 'token',
        schedulerOn: false,
        customPermissions: [],
        startIntent: null,
      });
    })
    .then(a => {
      console.log('initConnection', a);
      Terra.getActivity({
        connection: connection,
        startDate: new Date(),
      }).then(r => console.log('getActivity', r));
      Terra.getBody({
        connection: connection,
        startDate: new Date(),
      }).then(r => console.log('getBody', r));
      Terra.getDaily({
        connection: connection,
        startDate: new Date(),
      }).then(r => console.log('getDaily', r));
      Terra.getNutrition({
        connection: connection,
        startDate: new Date(),
      }).then(r => console.log('getNutrition', r));
      Terra.getSleep({
        connection: connection,
        startDate: new Date(),
      }).then(r => console.log('getSleep', r));
      Terra.getAthlete({
        connection: connection,
      }).then(r => console.log('getAthlete', r));
      // Terra.activateSensor().then(r => console.log('activateSensor', r));
      // Terra.readGlucoseData().then(r => console.log('readGlucoseData', r));
    })
    .catch(e => console.log('error', e));
}
