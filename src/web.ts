import { WebPlugin } from '@capacitor/core';

import type { TerraPlugin } from './definitions';

export class TerraWeb extends WebPlugin implements TerraPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
