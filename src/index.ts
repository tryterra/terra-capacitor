import { registerPlugin } from '@capacitor/core';

import type { TerraPlugin } from './definitions';

const Terra = registerPlugin<TerraPlugin>('TerraCapacitor', {
  web: () => import('./web').then(m => new m.TerraWeb()),
});

export * from './definitions';
export { Terra };
