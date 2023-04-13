# wifi-connect

This is a plugin to connect to wifi natively

## Install

```bash
npm install wifi-connect
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`connect(...)`](#connect)
* [`getCurrentSSID()`](#getcurrentssid)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### connect(...)

```typescript
connect(options: { ssid: string; passphrase: string; saveNetwork: boolean; isWep: boolean; }) => Promise<ConnectionState>
```

| Param         | Type                                                                                     |
| ------------- | ---------------------------------------------------------------------------------------- |
| **`options`** | <code>{ ssid: string; passphrase: string; saveNetwork: boolean; isWep: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#connectionstate">ConnectionState</a>&gt;</code>

--------------------


### getCurrentSSID()

```typescript
getCurrentSSID() => Promise<string>
```

**Returns:** <code>Promise&lt;string&gt;</code>

--------------------


### Interfaces


#### ConnectionState

| Prop        | Type                                                                  |
| ----------- | --------------------------------------------------------------------- |
| **`value`** | <code><a href="#connectionstatevalue">ConnectionStateValue</a></code> |


### Enums


#### ConnectionStateValue

| Members             | Value           |
| ------------------- | --------------- |
| **`Success`**       | <code>0</code>  |
| **`Denied`**        | <code>-1</code> |
| **`NoConnection`**  | <code>-2</code> |
| **`UnknownSSID`**   | <code>-3</code> |
| **`CannotConnect`** | <code>-4</code> |

</docgen-api>
