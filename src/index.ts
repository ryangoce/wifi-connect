import { registerPlugin } from '@capacitor/core';

import type { WifiConnectPlugin } from './definitions';

const WifiConnect = registerPlugin<WifiConnectPlugin>('WifiConnect', {
  web: () => import('./web').then(m => new m.WifiConnectWeb()),
});

export * from './definitions';
export { WifiConnect };
