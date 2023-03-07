import { WebPlugin } from '@capacitor/core';

import type {
  Connections,
  CustomPermissions,
  TerraPlugin,
} from './definitions';

export class TerraWeb extends WebPlugin implements TerraPlugin {
  async initTerra(_options: {
    devId: string;
    referenceId: string;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async initConnection(_options: {
    connection: Connections;
    token: string;
    schedulerOn: boolean;
    customPermissions: CustomPermissions[];
    startIntent: string | null;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getUserId(_options: { connection: Connections }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getBody(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getActivity(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getDaily(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getNutrition(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }

  async getMenstruation(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }

  async getSleep(_options: {
    connection: Connections;
    startDate: Date;
    endDate: Date;
  }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getAthlete(_options: { connection: Connections }): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async activateSensor(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async setUpBackgroundDelivery(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async readGlucoseData(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async echo(options: { value: string }): Promise<{ value: string }> {
    return options;
  }
}
