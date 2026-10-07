import { WebPlugin } from '@capacitor/core';

import type { TerraPlugin } from './definitions';

export class TerraWeb extends WebPlugin implements TerraPlugin {
  async initTerra(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async initConnection(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getUserId(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getBody(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getActivity(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getDaily(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getNutrition(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }

  async getMenstruation(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }

  async getSleep(): Promise<any> {
    return Promise.reject('Web Plugin Not implemented');
  }
  async getAthlete(): Promise<any> {
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
