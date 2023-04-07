import { WebPlugin } from '@capacitor/core';

import type { WifiConnectPlugin } from './definitions';

export class WifiConnectWeb extends WebPlugin implements WifiConnectPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
