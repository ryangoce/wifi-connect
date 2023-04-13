import { WebPlugin } from '@capacitor/core';

import type { ConnectionState, WifiConnectPlugin } from './definitions';

export class WifiConnectWeb extends WebPlugin implements WifiConnectPlugin {
  getCurrentSSID(): Promise<string> {
    throw new Error('Method not implemented.');
  }
  
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async connect(): Promise<ConnectionState> {
      throw new Error('not implemented in web')
  }
}
