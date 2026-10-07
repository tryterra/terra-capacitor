# terra-capacitor

Wrap TerraiOS and TerraAndroid for capacitor projects

## Capacitor compatibility

| Plugin version | Capacitor version |
| -------------- | ----------------- |
| 2.x            | 8.x               |
| 0.1.x          | 5.x               |

## Install

```bash
npm install terra-capacitor
npx cap sync
```

### iOS

Version 2.x supports both dependency managers used by Capacitor 8 apps:

- CocoaPods: resolved through `TerraCapacitor.podspec`, which pulls in the
  `TerraiOS` pod automatically.
- Swift Package Manager: resolved through `Package.swift`, which pulls in
  `TerraiOS` from https://github.com/tryterra/TerraiOS.

No extra setup is needed beyond `npx cap sync` for either manager. The iOS
deployment target is 15.0, in line with Capacitor 8.

### Android

Requires `minSdkVersion` 28 or higher (needed by `terra-android`). Capacitor 8
projects default to compileSdk/targetSdk 36.

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`initTerra(...)`](#initterra)
* [`initConnection(...)`](#initconnection)
* [`getUserId(...)`](#getuserid)
* [`getBody(...)`](#getbody)
* [`getActivity(...)`](#getactivity)
* [`getDaily(...)`](#getdaily)
* [`getNutrition(...)`](#getnutrition)
* [`getMenstruation(...)`](#getmenstruation)
* [`getSleep(...)`](#getsleep)
* [`getAthlete(...)`](#getathlete)
* [`activateSensor()`](#activatesensor)
* [`readGlucoseData()`](#readglucosedata)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)
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


### initTerra(...)

```typescript
initTerra(options: { devId: string; referenceId: string | null; }) => Promise<SuccessMessage>
```

| Param         | Type                                                         |
| ------------- | ------------------------------------------------------------ |
| **`options`** | <code>{ devId: string; referenceId: string \| null; }</code> |

**Returns:** <code>Promise&lt;<a href="#successmessage">SuccessMessage</a>&gt;</code>

--------------------


### initConnection(...)

```typescript
initConnection(options: { connection: Connections; token: string; schedulerOn: boolean; customPermissions: CustomPermissions[]; startIntent: string | null; }) => Promise<any>
```

| Param         | Type                                                                                                                                                                           |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; token: string; schedulerOn: boolean; customPermissions: CustomPermissions[]; startIntent: string \| null; }</code> |

**Returns:** <code>Promise&lt;any&gt;</code>

--------------------


### getUserId(...)

```typescript
getUserId(options: { connection: Connections; }) => Promise<GetUserId>
```

| Param         | Type                                                                 |
| ------------- | -------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; }</code> |

**Returns:** <code>Promise&lt;<a href="#getuserid">GetUserId</a>&gt;</code>

--------------------


### getBody(...)

```typescript
getBody(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getActivity(...)

```typescript
getActivity(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getDaily(...)

```typescript
getDaily(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getNutrition(...)

```typescript
getNutrition(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getMenstruation(...)

```typescript
getMenstruation(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getSleep(...)

```typescript
getSleep(options: { connection: Connections; startDate: Date; endDate: Date; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                                                                                             |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; startDate: <a href="#date">Date</a>; endDate: <a href="#date">Date</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### getAthlete(...)

```typescript
getAthlete(options: { connection: Connections; toWebhook: boolean; }) => Promise<DataMessage>
```

| Param         | Type                                                                                     |
| ------------- | ---------------------------------------------------------------------------------------- |
| **`options`** | <code>{ connection: <a href="#connections">Connections</a>; toWebhook: boolean; }</code> |

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### activateSensor()

```typescript
activateSensor() => Promise<DataMessage>
```

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### readGlucoseData()

```typescript
readGlucoseData() => Promise<DataMessage>
```

**Returns:** <code>Promise&lt;<a href="#datamessage">DataMessage</a>&gt;</code>

--------------------


### Interfaces


#### Object

Provides functionality common to all JavaScript objects.

| Prop              | Type                                          | Description                                                                                                                                |
| ----------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **`constructor`** | <code><a href="#function">Function</a></code> | The initial value of <a href="#object">Object</a>.prototype.constructor is the standard built-in <a href="#object">Object</a> constructor. |

| Method                   | Signature                                                 | Description                                                              |
| ------------------------ | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| **toString**             | () =&gt; string                                           | Returns a string representation of an object.                            |
| **toLocaleString**       | () =&gt; string                                           | Returns a date converted to a string using the current locale.           |
| **valueOf**              | () =&gt; <a href="#object">Object</a>                     | Returns the primitive value of the specified object.                     |
| **hasOwnProperty**       | (v: <a href="#propertykey">PropertyKey</a>) =&gt; boolean | Determines whether an object has a property with the specified name.     |
| **isPrototypeOf**        | (v: <a href="#object">Object</a>) =&gt; boolean           | Determines whether an object exists in another object's prototype chain. |
| **propertyIsEnumerable** | (v: <a href="#propertykey">PropertyKey</a>) =&gt; boolean | Determines whether a specified property is enumerable.                   |


#### Function

Creates a new function.

| Prop            | Type                                          |
| --------------- | --------------------------------------------- |
| **`prototype`** | <code>any</code>                              |
| **`length`**    | <code>number</code>                           |
| **`arguments`** | <code>any</code>                              |
| **`caller`**    | <code><a href="#function">Function</a></code> |

| Method       | Signature                                                                            | Description                                                                                                                                                                                                              |
| ------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **apply**    | (this: <a href="#function">Function</a>, thisArg: any, argArray?: any) =&gt; any     | Calls the function, substituting the specified object for the this value of the function, and the specified array for the arguments of the function.                                                                     |
| **call**     | (this: <a href="#function">Function</a>, thisArg: any, ...argArray: any[]) =&gt; any | Calls a method of an object, substituting another object for the current object.                                                                                                                                         |
| **bind**     | (this: <a href="#function">Function</a>, thisArg: any, ...argArray: any[]) =&gt; any | For a given function, creates a bound function that has the same body as the original function. The this object of the bound function is associated with the specified object, and has the specified initial parameters. |
| **toString** | () =&gt; string                                                                      | Returns a string representation of a function.                                                                                                                                                                           |


#### FunctionDeclaration

| Prop     | Type                                              | Description                                                                                 |
| -------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| **`id`** | <code><a href="#identifier">Identifier</a></code> | It is null when a function declaration is a part of the `export default function` statement |


#### Identifier

| Prop       | Type                                                |
| ---------- | --------------------------------------------------- |
| **`type`** | <code>'<a href="#identifier">Identifier</a>'</code> |
| **`name`** | <code>string</code>                                 |


#### FunctionExpression

| Prop       | Type                                                                |
| ---------- | ------------------------------------------------------------------- |
| **`id`**   | <code><a href="#identifier">Identifier</a> \| null</code>           |
| **`type`** | <code>'<a href="#functionexpression">FunctionExpression</a>'</code> |
| **`body`** | <code><a href="#blockstatement">BlockStatement</a></code>           |


#### BlockStatement

| Prop                | Type                                                        |
| ------------------- | ----------------------------------------------------------- |
| **`type`**          | <code>'<a href="#blockstatement">BlockStatement</a>'</code> |
| **`body`**          | <code>Statement[]</code>                                    |
| **`innerComments`** | <code>Comment[]</code>                                      |


#### ExpressionStatement

| Prop             | Type                                                                  |
| ---------------- | --------------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#expressionstatement">ExpressionStatement</a>'</code> |
| **`expression`** | <code><a href="#expression">Expression</a></code>                     |


#### ExpressionMap

| Prop                           | Type                                                                          |
| ------------------------------ | ----------------------------------------------------------------------------- |
| **`ArrayExpression`**          | <code><a href="#arrayexpression">ArrayExpression</a></code>                   |
| **`ArrowFunctionExpression`**  | <code><a href="#arrowfunctionexpression">ArrowFunctionExpression</a></code>   |
| **`AssignmentExpression`**     | <code><a href="#assignmentexpression">AssignmentExpression</a></code>         |
| **`AwaitExpression`**          | <code><a href="#awaitexpression">AwaitExpression</a></code>                   |
| **`BinaryExpression`**         | <code><a href="#binaryexpression">BinaryExpression</a></code>                 |
| **`CallExpression`**           | <code><a href="#callexpression">CallExpression</a></code>                     |
| **`ChainExpression`**          | <code><a href="#chainexpression">ChainExpression</a></code>                   |
| **`ClassExpression`**          | <code><a href="#classexpression">ClassExpression</a></code>                   |
| **`ConditionalExpression`**    | <code><a href="#conditionalexpression">ConditionalExpression</a></code>       |
| **`FunctionExpression`**       | <code><a href="#functionexpression">FunctionExpression</a></code>             |
| **`Identifier`**               | <code><a href="#identifier">Identifier</a></code>                             |
| **`ImportExpression`**         | <code><a href="#importexpression">ImportExpression</a></code>                 |
| **`Literal`**                  | <code><a href="#literal">Literal</a></code>                                   |
| **`LogicalExpression`**        | <code><a href="#logicalexpression">LogicalExpression</a></code>               |
| **`MemberExpression`**         | <code><a href="#memberexpression">MemberExpression</a></code>                 |
| **`MetaProperty`**             | <code><a href="#metaproperty">MetaProperty</a></code>                         |
| **`NewExpression`**            | <code><a href="#newexpression">NewExpression</a></code>                       |
| **`ObjectExpression`**         | <code><a href="#objectexpression">ObjectExpression</a></code>                 |
| **`SequenceExpression`**       | <code><a href="#sequenceexpression">SequenceExpression</a></code>             |
| **`TaggedTemplateExpression`** | <code><a href="#taggedtemplateexpression">TaggedTemplateExpression</a></code> |
| **`TemplateLiteral`**          | <code><a href="#templateliteral">TemplateLiteral</a></code>                   |
| **`ThisExpression`**           | <code><a href="#thisexpression">ThisExpression</a></code>                     |
| **`UnaryExpression`**          | <code><a href="#unaryexpression">UnaryExpression</a></code>                   |
| **`UpdateExpression`**         | <code><a href="#updateexpression">UpdateExpression</a></code>                 |
| **`YieldExpression`**          | <code><a href="#yieldexpression">YieldExpression</a></code>                   |


#### ArrayExpression

| Prop           | Type                                                                                                                                      |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#arrayexpression">ArrayExpression</a>'</code>                                                                             |
| **`elements`** | <code><a href="#array">Array</a>&lt;<a href="#expression">Expression</a> \| <a href="#spreadelement">SpreadElement</a> \| null&gt;</code> |


#### Array

| Prop         | Type                | Description                                                                                            |
| ------------ | ------------------- | ------------------------------------------------------------------------------------------------------ |
| **`length`** | <code>number</code> | Gets or sets the length of the array. This is a number one higher than the highest index in the array. |

| Method             | Signature                                                                                                                     | Description                                                                                                                                                                                                                                 |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **toString**       | () =&gt; string                                                                                                               | Returns a string representation of an array.                                                                                                                                                                                                |
| **toLocaleString** | () =&gt; string                                                                                                               | Returns a string representation of an array. The elements are converted to string using their toLocalString methods.                                                                                                                        |
| **pop**            | () =&gt; T \| undefined                                                                                                       | Removes the last element from an array and returns it. If the array is empty, undefined is returned and the array is not modified.                                                                                                          |
| **push**           | (...items: T[]) =&gt; number                                                                                                  | Appends new elements to the end of an array, and returns the new length of the array.                                                                                                                                                       |
| **concat**         | (...items: <a href="#concatarray">ConcatArray</a>&lt;T&gt;[]) =&gt; T[]                                                       | Combines two or more arrays. This method returns a new array without modifying any existing arrays.                                                                                                                                         |
| **concat**         | (...items: (T \| <a href="#concatarray">ConcatArray</a>&lt;T&gt;)[]) =&gt; T[]                                                | Combines two or more arrays. This method returns a new array without modifying any existing arrays.                                                                                                                                         |
| **join**           | (separator?: string \| undefined) =&gt; string                                                                                | Adds all the elements of an array into a string, separated by the specified separator string.                                                                                                                                               |
| **reverse**        | () =&gt; T[]                                                                                                                  | Reverses the elements in an array in place. This method mutates the array and returns a reference to the same array.                                                                                                                        |
| **shift**          | () =&gt; T \| undefined                                                                                                       | Removes the first element from an array and returns it. If the array is empty, undefined is returned and the array is not modified.                                                                                                         |
| **slice**          | (start?: number \| undefined, end?: number \| undefined) =&gt; T[]                                                            | Returns a copy of a section of an array. For both start and end, a negative index can be used to indicate an offset from the end of the array. For example, -2 refers to the second to last element of the array.                           |
| **sort**           | (compareFn?: ((a: T, b: T) =&gt; number) \| undefined) =&gt; this                                                             | Sorts an array in place. This method mutates the array and returns a reference to the same array.                                                                                                                                           |
| **splice**         | (start: number, deleteCount?: number \| undefined) =&gt; T[]                                                                  | Removes elements from an array and, if necessary, inserts new elements in their place, returning the deleted elements.                                                                                                                      |
| **splice**         | (start: number, deleteCount: number, ...items: T[]) =&gt; T[]                                                                 | Removes elements from an array and, if necessary, inserts new elements in their place, returning the deleted elements.                                                                                                                      |
| **unshift**        | (...items: T[]) =&gt; number                                                                                                  | Inserts new elements at the start of an array, and returns the new length of the array.                                                                                                                                                     |
| **indexOf**        | (searchElement: T, fromIndex?: number \| undefined) =&gt; number                                                              | Returns the index of the first occurrence of a value in an array, or -1 if it is not present.                                                                                                                                               |
| **lastIndexOf**    | (searchElement: T, fromIndex?: number \| undefined) =&gt; number                                                              | Returns the index of the last occurrence of a specified value in an array, or -1 if it is not present.                                                                                                                                      |
| **every**          | &lt;S extends T&gt;(predicate: (value: T, index: number, array: T[]) =&gt; value is S, thisArg?: any) =&gt; this is S[]       | Determines whether all the members of an array satisfy the specified test.                                                                                                                                                                  |
| **every**          | (predicate: (value: T, index: number, array: T[]) =&gt; unknown, thisArg?: any) =&gt; boolean                                 | Determines whether all the members of an array satisfy the specified test.                                                                                                                                                                  |
| **some**           | (predicate: (value: T, index: number, array: T[]) =&gt; unknown, thisArg?: any) =&gt; boolean                                 | Determines whether the specified callback function returns true for any element of an array.                                                                                                                                                |
| **forEach**        | (callbackfn: (value: T, index: number, array: T[]) =&gt; void, thisArg?: any) =&gt; void                                      | Performs the specified action for each element in an array.                                                                                                                                                                                 |
| **map**            | &lt;U&gt;(callbackfn: (value: T, index: number, array: T[]) =&gt; U, thisArg?: any) =&gt; U[]                                 | Calls a defined callback function on each element of an array, and returns an array that contains the results.                                                                                                                              |
| **filter**         | &lt;S extends T&gt;(predicate: (value: T, index: number, array: T[]) =&gt; value is S, thisArg?: any) =&gt; S[]               | Returns the elements of an array that meet the condition specified in a callback function.                                                                                                                                                  |
| **filter**         | (predicate: (value: T, index: number, array: T[]) =&gt; unknown, thisArg?: any) =&gt; T[]                                     | Returns the elements of an array that meet the condition specified in a callback function.                                                                                                                                                  |
| **reduce**         | (callbackfn: (previousValue: T, currentValue: T, currentIndex: number, array: T[]) =&gt; T) =&gt; T                           | Calls the specified callback function for all the elements in an array. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.                      |
| **reduce**         | (callbackfn: (previousValue: T, currentValue: T, currentIndex: number, array: T[]) =&gt; T, initialValue: T) =&gt; T          |                                                                                                                                                                                                                                             |
| **reduce**         | &lt;U&gt;(callbackfn: (previousValue: U, currentValue: T, currentIndex: number, array: T[]) =&gt; U, initialValue: U) =&gt; U | Calls the specified callback function for all the elements in an array. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.                      |
| **reduceRight**    | (callbackfn: (previousValue: T, currentValue: T, currentIndex: number, array: T[]) =&gt; T) =&gt; T                           | Calls the specified callback function for all the elements in an array, in descending order. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function. |
| **reduceRight**    | (callbackfn: (previousValue: T, currentValue: T, currentIndex: number, array: T[]) =&gt; T, initialValue: T) =&gt; T          |                                                                                                                                                                                                                                             |
| **reduceRight**    | &lt;U&gt;(callbackfn: (previousValue: U, currentValue: T, currentIndex: number, array: T[]) =&gt; U, initialValue: U) =&gt; U | Calls the specified callback function for all the elements in an array, in descending order. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function. |


#### ConcatArray

| Prop         | Type                |
| ------------ | ------------------- |
| **`length`** | <code>number</code> |

| Method    | Signature                                                          |
| --------- | ------------------------------------------------------------------ |
| **join**  | (separator?: string \| undefined) =&gt; string                     |
| **slice** | (start?: number \| undefined, end?: number \| undefined) =&gt; T[] |


#### SpreadElement

| Prop           | Type                                                      |
| -------------- | --------------------------------------------------------- |
| **`type`**     | <code>'<a href="#spreadelement">SpreadElement</a>'</code> |
| **`argument`** | <code><a href="#expression">Expression</a></code>         |


#### ArrowFunctionExpression

| Prop             | Type                                                                                              |
| ---------------- | ------------------------------------------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#arrowfunctionexpression">ArrowFunctionExpression</a>'</code>                     |
| **`expression`** | <code>boolean</code>                                                                              |
| **`body`**       | <code><a href="#expression">Expression</a> \| <a href="#blockstatement">BlockStatement</a></code> |


#### AssignmentExpression

| Prop           | Type                                                                    |
| -------------- | ----------------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#assignmentexpression">AssignmentExpression</a>'</code> |
| **`operator`** | <code><a href="#assignmentoperator">AssignmentOperator</a></code>       |
| **`left`**     | <code><a href="#pattern">Pattern</a></code>                             |
| **`right`**    | <code><a href="#expression">Expression</a></code>                       |


#### ObjectPattern

| Prop             | Type                                                                                                                                          |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#objectpattern">ObjectPattern</a>'</code>                                                                                     |
| **`properties`** | <code><a href="#array">Array</a>&lt;<a href="#assignmentproperty">AssignmentProperty</a> \| <a href="#restelement">RestElement</a>&gt;</code> |


#### AssignmentProperty

| Prop         | Type                                        |
| ------------ | ------------------------------------------- |
| **`value`**  | <code><a href="#pattern">Pattern</a></code> |
| **`kind`**   | <code>'init'</code>                         |
| **`method`** | <code>boolean</code>                        |


#### RestElement

| Prop           | Type                                                  |
| -------------- | ----------------------------------------------------- |
| **`type`**     | <code>'<a href="#restelement">RestElement</a>'</code> |
| **`argument`** | <code><a href="#pattern">Pattern</a></code>           |


#### ArrayPattern

| Prop           | Type                                                                                  |
| -------------- | ------------------------------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#arraypattern">ArrayPattern</a>'</code>                               |
| **`elements`** | <code><a href="#array">Array</a>&lt;<a href="#pattern">Pattern</a> \| null&gt;</code> |


#### AssignmentPattern

| Prop        | Type                                                              |
| ----------- | ----------------------------------------------------------------- |
| **`type`**  | <code>'<a href="#assignmentpattern">AssignmentPattern</a>'</code> |
| **`left`**  | <code><a href="#pattern">Pattern</a></code>                       |
| **`right`** | <code><a href="#expression">Expression</a></code>                 |


#### MemberExpression

| Prop           | Type                                                                                                    |
| -------------- | ------------------------------------------------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#memberexpression">MemberExpression</a>'</code>                                         |
| **`object`**   | <code><a href="#expression">Expression</a> \| <a href="#super">Super</a></code>                         |
| **`property`** | <code><a href="#expression">Expression</a> \| <a href="#privateidentifier">PrivateIdentifier</a></code> |
| **`computed`** | <code>boolean</code>                                                                                    |
| **`optional`** | <code>boolean</code>                                                                                    |


#### Super

| Prop       | Type                                      |
| ---------- | ----------------------------------------- |
| **`type`** | <code>'<a href="#super">Super</a>'</code> |


#### PrivateIdentifier

| Prop       | Type                                                              |
| ---------- | ----------------------------------------------------------------- |
| **`type`** | <code>'<a href="#privateidentifier">PrivateIdentifier</a>'</code> |
| **`name`** | <code>string</code>                                               |


#### AwaitExpression

| Prop           | Type                                                          |
| -------------- | ------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#awaitexpression">AwaitExpression</a>'</code> |
| **`argument`** | <code><a href="#expression">Expression</a></code>             |


#### BinaryExpression

| Prop           | Type                                                                                                    |
| -------------- | ------------------------------------------------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#binaryexpression">BinaryExpression</a>'</code>                                         |
| **`operator`** | <code><a href="#binaryoperator">BinaryOperator</a></code>                                               |
| **`left`**     | <code><a href="#expression">Expression</a> \| <a href="#privateidentifier">PrivateIdentifier</a></code> |
| **`right`**    | <code><a href="#expression">Expression</a></code>                                                       |


#### SimpleCallExpression

| Prop           | Type                                                        |
| -------------- | ----------------------------------------------------------- |
| **`type`**     | <code>'<a href="#callexpression">CallExpression</a>'</code> |
| **`optional`** | <code>boolean</code>                                        |


#### NewExpression

| Prop       | Type                                                      |
| ---------- | --------------------------------------------------------- |
| **`type`** | <code>'<a href="#newexpression">NewExpression</a>'</code> |


#### ChainExpression

| Prop             | Type                                                          |
| ---------------- | ------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#chainexpression">ChainExpression</a>'</code> |
| **`expression`** | <code><a href="#chainelement">ChainElement</a></code>         |


#### ClassExpression

| Prop       | Type                                                          |
| ---------- | ------------------------------------------------------------- |
| **`type`** | <code>'<a href="#classexpression">ClassExpression</a>'</code> |
| **`id`**   | <code><a href="#identifier">Identifier</a> \| null</code>     |


#### ConditionalExpression

| Prop             | Type                                                                      |
| ---------------- | ------------------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#conditionalexpression">ConditionalExpression</a>'</code> |
| **`test`**       | <code><a href="#expression">Expression</a></code>                         |
| **`alternate`**  | <code><a href="#expression">Expression</a></code>                         |
| **`consequent`** | <code><a href="#expression">Expression</a></code>                         |


#### ImportExpression

| Prop          | Type                                                            |
| ------------- | --------------------------------------------------------------- |
| **`type`**    | <code>'<a href="#importexpression">ImportExpression</a>'</code> |
| **`source`**  | <code><a href="#expression">Expression</a></code>               |
| **`options`** | <code><a href="#expression">Expression</a> \| null</code>       |


#### SimpleLiteral

| Prop        | Type                                             |
| ----------- | ------------------------------------------------ |
| **`type`**  | <code>'<a href="#literal">Literal</a>'</code>    |
| **`value`** | <code>string \| number \| boolean \| null</code> |
| **`raw`**   | <code>string</code>                              |


#### RegExpLiteral

| Prop        | Type                                              |
| ----------- | ------------------------------------------------- |
| **`type`**  | <code>'<a href="#literal">Literal</a>'</code>     |
| **`value`** | <code><a href="#regexp">RegExp</a> \| null</code> |
| **`regex`** | <code>{ pattern: string; flags: string; }</code>  |
| **`raw`**   | <code>string</code>                               |


#### RegExp

| Prop             | Type                 | Description                                                                                                                                                          |
| ---------------- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`source`**     | <code>string</code>  | Returns a copy of the text of the regular expression pattern. Read-only. The regExp argument is a Regular expression object. It can be a variable name or a literal. |
| **`global`**     | <code>boolean</code> | Returns a Boolean value indicating the state of the global flag (g) used with a regular expression. Default is false. Read-only.                                     |
| **`ignoreCase`** | <code>boolean</code> | Returns a Boolean value indicating the state of the ignoreCase flag (i) used with a regular expression. Default is false. Read-only.                                 |
| **`multiline`**  | <code>boolean</code> | Returns a Boolean value indicating the state of the multiline flag (m) used with a regular expression. Default is false. Read-only.                                  |
| **`lastIndex`**  | <code>number</code>  |                                                                                                                                                                      |

| Method      | Signature                                                                     | Description                                                                                                                   |
| ----------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **exec**    | (string: string) =&gt; <a href="#regexpexecarray">RegExpExecArray</a> \| null | Executes a search on a string using a regular expression pattern, and returns an array containing the results of that search. |
| **test**    | (string: string) =&gt; boolean                                                | Returns a Boolean value that indicates whether or not a pattern exists in a searched string.                                  |
| **compile** | () =&gt; this                                                                 |                                                                                                                               |


#### RegExpExecArray

| Prop        | Type                |
| ----------- | ------------------- |
| **`index`** | <code>number</code> |
| **`input`** | <code>string</code> |


#### BigIntLiteral

| Prop         | Type                                          |
| ------------ | --------------------------------------------- |
| **`type`**   | <code>'<a href="#literal">Literal</a>'</code> |
| **`value`**  | <code>bigint \| null</code>                   |
| **`bigint`** | <code>string</code>                           |
| **`raw`**    | <code>string</code>                           |


#### LogicalExpression

| Prop           | Type                                                              |
| -------------- | ----------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#logicalexpression">LogicalExpression</a>'</code> |
| **`operator`** | <code><a href="#logicaloperator">LogicalOperator</a></code>       |
| **`left`**     | <code><a href="#expression">Expression</a></code>                 |
| **`right`**    | <code><a href="#expression">Expression</a></code>                 |


#### MetaProperty

| Prop           | Type                                                    |
| -------------- | ------------------------------------------------------- |
| **`type`**     | <code>'<a href="#metaproperty">MetaProperty</a>'</code> |
| **`meta`**     | <code><a href="#identifier">Identifier</a></code>       |
| **`property`** | <code><a href="#identifier">Identifier</a></code>       |


#### ObjectExpression

| Prop             | Type                                                                                                                          |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **`type`**       | <code>'<a href="#objectexpression">ObjectExpression</a>'</code>                                                               |
| **`properties`** | <code><a href="#array">Array</a>&lt;<a href="#property">Property</a> \| <a href="#spreadelement">SpreadElement</a>&gt;</code> |


#### Property

| Prop            | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`type`**      | <code>'<a href="#property">Property</a>'</code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **`key`**       | <code><a href="#expression">Expression</a></code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **`value`**     | <code><a href="#classexpression">ClassExpression</a> \| <a href="#arrayexpression">ArrayExpression</a> \| <a href="#arrowfunctionexpression">ArrowFunctionExpression</a> \| <a href="#assignmentexpression">AssignmentExpression</a> \| <a href="#awaitexpression">AwaitExpression</a> \| <a href="#binaryexpression">BinaryExpression</a> \| <a href="#simplecallexpression">SimpleCallExpression</a> \| <a href="#newexpression">NewExpression</a> \| <a href="#chainexpression">ChainExpression</a> \| <a href="#conditionalexpression">ConditionalExpression</a> \| <a href="#functionexpression">FunctionExpression</a> \| <a href="#identifier">Identifier</a> \| <a href="#importexpression">ImportExpression</a> \| <a href="#simpleliteral">SimpleLiteral</a> \| <a href="#regexpliteral">RegExpLiteral</a> \| <a href="#bigintliteral">BigIntLiteral</a> \| <a href="#logicalexpression">LogicalExpression</a> \| <a href="#memberexpression">MemberExpression</a> \| <a href="#metaproperty">MetaProperty</a> \| <a href="#objectexpression">ObjectExpression</a> \| <a href="#sequenceexpression">SequenceExpression</a> \| <a href="#taggedtemplateexpression">TaggedTemplateExpression</a> \| <a href="#templateliteral">TemplateLiteral</a> \| <a href="#thisexpression">ThisExpression</a> \| <a href="#unaryexpression">UnaryExpression</a> \| <a href="#updateexpression">UpdateExpression</a> \| <a href="#yieldexpression">YieldExpression</a> \| <a href="#objectpattern">ObjectPattern</a> \| <a href="#arraypattern">ArrayPattern</a> \| <a href="#restelement">RestElement</a> \| <a href="#assignmentpattern">AssignmentPattern</a></code> |
| **`kind`**      | <code>'init' \| 'get' \| 'set'</code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **`method`**    | <code>boolean</code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **`shorthand`** | <code>boolean</code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **`computed`**  | <code>boolean</code>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |


#### SequenceExpression

| Prop              | Type                                                                |
| ----------------- | ------------------------------------------------------------------- |
| **`type`**        | <code>'<a href="#sequenceexpression">SequenceExpression</a>'</code> |
| **`expressions`** | <code>Expression[]</code>                                           |


#### TaggedTemplateExpression

| Prop        | Type                                                                            |
| ----------- | ------------------------------------------------------------------------------- |
| **`type`**  | <code>'<a href="#taggedtemplateexpression">TaggedTemplateExpression</a>'</code> |
| **`tag`**   | <code><a href="#expression">Expression</a></code>                               |
| **`quasi`** | <code><a href="#templateliteral">TemplateLiteral</a></code>                     |


#### TemplateLiteral

| Prop              | Type                                                          |
| ----------------- | ------------------------------------------------------------- |
| **`type`**        | <code>'<a href="#templateliteral">TemplateLiteral</a>'</code> |
| **`quasis`**      | <code>TemplateElement[]</code>                                |
| **`expressions`** | <code>Expression[]</code>                                     |


#### TemplateElement

| Prop        | Type                                                          |
| ----------- | ------------------------------------------------------------- |
| **`type`**  | <code>'<a href="#templateelement">TemplateElement</a>'</code> |
| **`tail`**  | <code>boolean</code>                                          |
| **`value`** | <code>{ cooked?: string \| null; raw: string; }</code>        |


#### ThisExpression

| Prop       | Type                                                        |
| ---------- | ----------------------------------------------------------- |
| **`type`** | <code>'<a href="#thisexpression">ThisExpression</a>'</code> |


#### UnaryExpression

| Prop           | Type                                                          |
| -------------- | ------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#unaryexpression">UnaryExpression</a>'</code> |
| **`operator`** | <code><a href="#unaryoperator">UnaryOperator</a></code>       |
| **`prefix`**   | <code>true</code>                                             |
| **`argument`** | <code><a href="#expression">Expression</a></code>             |


#### UpdateExpression

| Prop           | Type                                                            |
| -------------- | --------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#updateexpression">UpdateExpression</a>'</code> |
| **`operator`** | <code><a href="#updateoperator">UpdateOperator</a></code>       |
| **`argument`** | <code><a href="#expression">Expression</a></code>               |
| **`prefix`**   | <code>boolean</code>                                            |


#### YieldExpression

| Prop           | Type                                                          |
| -------------- | ------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#yieldexpression">YieldExpression</a>'</code> |
| **`argument`** | <code><a href="#expression">Expression</a> \| null</code>     |
| **`delegate`** | <code>boolean</code>                                          |


#### StaticBlock

| Prop       | Type                                                  |
| ---------- | ----------------------------------------------------- |
| **`type`** | <code>'<a href="#staticblock">StaticBlock</a>'</code> |


#### EmptyStatement

| Prop       | Type                                                        |
| ---------- | ----------------------------------------------------------- |
| **`type`** | <code>'<a href="#emptystatement">EmptyStatement</a>'</code> |


#### DebuggerStatement

| Prop       | Type                                                              |
| ---------- | ----------------------------------------------------------------- |
| **`type`** | <code>'<a href="#debuggerstatement">DebuggerStatement</a>'</code> |


#### WithStatement

| Prop         | Type                                                      |
| ------------ | --------------------------------------------------------- |
| **`type`**   | <code>'<a href="#withstatement">WithStatement</a>'</code> |
| **`object`** | <code><a href="#expression">Expression</a></code>         |
| **`body`**   | <code><a href="#statement">Statement</a></code>           |


#### ReturnStatement

| Prop           | Type                                                          |
| -------------- | ------------------------------------------------------------- |
| **`type`**     | <code>'<a href="#returnstatement">ReturnStatement</a>'</code> |
| **`argument`** | <code><a href="#expression">Expression</a> \| null</code>     |


#### LabeledStatement

| Prop        | Type                                                            |
| ----------- | --------------------------------------------------------------- |
| **`type`**  | <code>'<a href="#labeledstatement">LabeledStatement</a>'</code> |
| **`label`** | <code><a href="#identifier">Identifier</a></code>               |
| **`body`**  | <code><a href="#statement">Statement</a></code>                 |


#### BreakStatement

| Prop        | Type                                                        |
| ----------- | ----------------------------------------------------------- |
| **`type`**  | <code>'<a href="#breakstatement">BreakStatement</a>'</code> |
| **`label`** | <code><a href="#identifier">Identifier</a> \| null</code>   |


#### ContinueStatement

| Prop        | Type                                                              |
| ----------- | ----------------------------------------------------------------- |
| **`type`**  | <code>'<a href="#continuestatement">ContinueStatement</a>'</code> |
| **`label`** | <code><a href="#identifier">Identifier</a> \| null</code>         |


#### IfStatement

| Prop             | Type                                                    |
| ---------------- | ------------------------------------------------------- |
| **`type`**       | <code>'<a href="#ifstatement">IfStatement</a>'</code>   |
| **`test`**       | <code><a href="#expression">Expression</a></code>       |
| **`consequent`** | <code><a href="#statement">Statement</a></code>         |
| **`alternate`**  | <code><a href="#statement">Statement</a> \| null</code> |


#### SwitchStatement

| Prop               | Type                                                          |
| ------------------ | ------------------------------------------------------------- |
| **`type`**         | <code>'<a href="#switchstatement">SwitchStatement</a>'</code> |
| **`discriminant`** | <code><a href="#expression">Expression</a></code>             |
| **`cases`**        | <code>SwitchCase[]</code>                                     |


#### SwitchCase

| Prop             | Type                                                      |
| ---------------- | --------------------------------------------------------- |
| **`type`**       | <code>'<a href="#switchcase">SwitchCase</a>'</code>       |
| **`test`**       | <code><a href="#expression">Expression</a> \| null</code> |
| **`consequent`** | <code>Statement[]</code>                                  |


#### ThrowStatement

| Prop           | Type                                                        |
| -------------- | ----------------------------------------------------------- |
| **`type`**     | <code>'<a href="#throwstatement">ThrowStatement</a>'</code> |
| **`argument`** | <code><a href="#expression">Expression</a></code>           |


#### TryStatement

| Prop            | Type                                                              |
| --------------- | ----------------------------------------------------------------- |
| **`type`**      | <code>'<a href="#trystatement">TryStatement</a>'</code>           |
| **`block`**     | <code><a href="#blockstatement">BlockStatement</a></code>         |
| **`handler`**   | <code><a href="#catchclause">CatchClause</a> \| null</code>       |
| **`finalizer`** | <code><a href="#blockstatement">BlockStatement</a> \| null</code> |


#### CatchClause

| Prop        | Type                                                      |
| ----------- | --------------------------------------------------------- |
| **`type`**  | <code>'<a href="#catchclause">CatchClause</a>'</code>     |
| **`param`** | <code><a href="#pattern">Pattern</a> \| null</code>       |
| **`body`**  | <code><a href="#blockstatement">BlockStatement</a></code> |


#### WhileStatement

| Prop       | Type                                                        |
| ---------- | ----------------------------------------------------------- |
| **`type`** | <code>'<a href="#whilestatement">WhileStatement</a>'</code> |
| **`test`** | <code><a href="#expression">Expression</a></code>           |
| **`body`** | <code><a href="#statement">Statement</a></code>             |


#### DoWhileStatement

| Prop       | Type                                                            |
| ---------- | --------------------------------------------------------------- |
| **`type`** | <code>'<a href="#dowhilestatement">DoWhileStatement</a>'</code> |
| **`body`** | <code><a href="#statement">Statement</a></code>                 |
| **`test`** | <code><a href="#expression">Expression</a></code>               |


#### ForStatement

| Prop         | Type                                                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------- |
| **`type`**   | <code>'<a href="#forstatement">ForStatement</a>'</code>                                                             |
| **`init`**   | <code><a href="#expression">Expression</a> \| <a href="#variabledeclaration">VariableDeclaration</a> \| null</code> |
| **`test`**   | <code><a href="#expression">Expression</a> \| null</code>                                                           |
| **`update`** | <code><a href="#expression">Expression</a> \| null</code>                                                           |
| **`body`**   | <code><a href="#statement">Statement</a></code>                                                                     |


#### VariableDeclaration

| Prop               | Type                                                                  |
| ------------------ | --------------------------------------------------------------------- |
| **`type`**         | <code>'<a href="#variabledeclaration">VariableDeclaration</a>'</code> |
| **`declarations`** | <code>VariableDeclarator[]</code>                                     |
| **`kind`**         | <code>'var' \| 'let' \| 'const' \| 'using' \| 'await using'</code>    |


#### VariableDeclarator

| Prop       | Type                                                                |
| ---------- | ------------------------------------------------------------------- |
| **`type`** | <code>'<a href="#variabledeclarator">VariableDeclarator</a>'</code> |
| **`id`**   | <code><a href="#pattern">Pattern</a></code>                         |
| **`init`** | <code><a href="#expression">Expression</a> \| null</code>           |


#### ForInStatement

| Prop       | Type                                                        |
| ---------- | ----------------------------------------------------------- |
| **`type`** | <code>'<a href="#forinstatement">ForInStatement</a>'</code> |


#### ForOfStatement

| Prop        | Type                                                        |
| ----------- | ----------------------------------------------------------- |
| **`type`**  | <code>'<a href="#forofstatement">ForOfStatement</a>'</code> |
| **`await`** | <code>boolean</code>                                        |


#### ClassDeclaration

| Prop     | Type                                              | Description                                                                           |
| -------- | ------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **`id`** | <code><a href="#identifier">Identifier</a></code> | It is null when a class declaration is a part of the `export default class` statement |


#### Comment

| Prop        | Type                           |
| ----------- | ------------------------------ |
| **`type`**  | <code>'Line' \| 'Block'</code> |
| **`value`** | <code>string</code>            |


#### Date

Enables basic storage and retrieval of dates and times.

| Method                 | Signature                                                                                                    | Description                                                                                                                                                   |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **toString**           | () =&gt; string                                                                                              | Returns a string representation of a date. The format of the string depends on the locale.                                                                    |
| **toDateString**       | () =&gt; string                                                                                              | Returns a date as a string value.                                                                                                                             |
| **toTimeString**       | () =&gt; string                                                                                              | Returns a time as a string value.                                                                                                                             |
| **toLocaleString**     | () =&gt; string                                                                                              | Returns a value as a string value appropriate to the host environment's current locale.                                                                       |
| **toLocaleDateString** | () =&gt; string                                                                                              | Returns a date as a string value appropriate to the host environment's current locale.                                                                        |
| **toLocaleTimeString** | () =&gt; string                                                                                              | Returns a time as a string value appropriate to the host environment's current locale.                                                                        |
| **valueOf**            | () =&gt; number                                                                                              | Returns the stored time value in milliseconds since midnight, January 1, 1970 UTC.                                                                            |
| **getTime**            | () =&gt; number                                                                                              | Gets the time value in milliseconds.                                                                                                                          |
| **getFullYear**        | () =&gt; number                                                                                              | Gets the year, using local time.                                                                                                                              |
| **getUTCFullYear**     | () =&gt; number                                                                                              | Gets the year using Universal Coordinated Time (UTC).                                                                                                         |
| **getMonth**           | () =&gt; number                                                                                              | Gets the month, using local time.                                                                                                                             |
| **getUTCMonth**        | () =&gt; number                                                                                              | Gets the month of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                                   |
| **getDate**            | () =&gt; number                                                                                              | Gets the day-of-the-month, using local time.                                                                                                                  |
| **getUTCDate**         | () =&gt; number                                                                                              | Gets the day-of-the-month, using Universal Coordinated Time (UTC).                                                                                            |
| **getDay**             | () =&gt; number                                                                                              | Gets the day of the week, using local time.                                                                                                                   |
| **getUTCDay**          | () =&gt; number                                                                                              | Gets the day of the week using Universal Coordinated Time (UTC).                                                                                              |
| **getHours**           | () =&gt; number                                                                                              | Gets the hours in a date, using local time.                                                                                                                   |
| **getUTCHours**        | () =&gt; number                                                                                              | Gets the hours value in a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                             |
| **getMinutes**         | () =&gt; number                                                                                              | Gets the minutes of a <a href="#date">Date</a> object, using local time.                                                                                      |
| **getUTCMinutes**      | () =&gt; number                                                                                              | Gets the minutes of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                                 |
| **getSeconds**         | () =&gt; number                                                                                              | Gets the seconds of a <a href="#date">Date</a> object, using local time.                                                                                      |
| **getUTCSeconds**      | () =&gt; number                                                                                              | Gets the seconds of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                                 |
| **getMilliseconds**    | () =&gt; number                                                                                              | Gets the milliseconds of a <a href="#date">Date</a>, using local time.                                                                                        |
| **getUTCMilliseconds** | () =&gt; number                                                                                              | Gets the milliseconds of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                            |
| **getTimezoneOffset**  | () =&gt; number                                                                                              | Gets the difference in minutes between the time on the local computer and Universal Coordinated Time (UTC).                                                   |
| **setTime**            | (time: number) =&gt; number                                                                                  | Sets the date and time value in the <a href="#date">Date</a> object.                                                                                          |
| **setMilliseconds**    | (ms: number) =&gt; number                                                                                    | Sets the milliseconds value in the <a href="#date">Date</a> object using local time.                                                                          |
| **setUTCMilliseconds** | (ms: number) =&gt; number                                                                                    | Sets the milliseconds value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                    |
| **setSeconds**         | (sec: number, ms?: number \| undefined) =&gt; number                                                         | Sets the seconds value in the <a href="#date">Date</a> object using local time.                                                                               |
| **setUTCSeconds**      | (sec: number, ms?: number \| undefined) =&gt; number                                                         | Sets the seconds value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                         |
| **setMinutes**         | (min: number, sec?: number \| undefined, ms?: number \| undefined) =&gt; number                              | Sets the minutes value in the <a href="#date">Date</a> object using local time.                                                                               |
| **setUTCMinutes**      | (min: number, sec?: number \| undefined, ms?: number \| undefined) =&gt; number                              | Sets the minutes value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                         |
| **setHours**           | (hours: number, min?: number \| undefined, sec?: number \| undefined, ms?: number \| undefined) =&gt; number | Sets the hour value in the <a href="#date">Date</a> object using local time.                                                                                  |
| **setUTCHours**        | (hours: number, min?: number \| undefined, sec?: number \| undefined, ms?: number \| undefined) =&gt; number | Sets the hours value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                           |
| **setDate**            | (date: number) =&gt; number                                                                                  | Sets the numeric day-of-the-month value of the <a href="#date">Date</a> object using local time.                                                              |
| **setUTCDate**         | (date: number) =&gt; number                                                                                  | Sets the numeric day of the month in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                              |
| **setMonth**           | (month: number, date?: number \| undefined) =&gt; number                                                     | Sets the month value in the <a href="#date">Date</a> object using local time.                                                                                 |
| **setUTCMonth**        | (month: number, date?: number \| undefined) =&gt; number                                                     | Sets the month value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                           |
| **setFullYear**        | (year: number, month?: number \| undefined, date?: number \| undefined) =&gt; number                         | Sets the year of the <a href="#date">Date</a> object using local time.                                                                                        |
| **setUTCFullYear**     | (year: number, month?: number \| undefined, date?: number \| undefined) =&gt; number                         | Sets the year value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                                            |
| **toUTCString**        | () =&gt; string                                                                                              | Returns a date converted to a string using Universal Coordinated Time (UTC).                                                                                  |
| **toISOString**        | () =&gt; string                                                                                              | Returns a date as a string value in ISO format.                                                                                                               |
| **toJSON**             | (key?: any) =&gt; string                                                                                     | Used by the JSON.stringify method to enable the transformation of an object's data for JavaScript <a href="#object">Object</a> Notation (JSON) serialization. |


### Type Aliases


#### SuccessMessage

<code>{ success: boolean; error: string | null; }</code>


#### GetUserId

<code>{ success: boolean; userId: string | null; }</code>


#### DataMessage

<code>{ success: boolean; // Kept as <a href="#object">`Object`</a> to preserve the published 0.1.x type surface. // eslint-disable-next-line @typescript-eslint/ban-types data: <a href="#object">Object</a>; error: string | null; }</code>


#### PropertyKey

<code>string | number | symbol</code>


#### Function

<code><a href="#functiondeclaration">FunctionDeclaration</a> | <a href="#functionexpression">FunctionExpression</a> | <a href="#arrowfunctionexpression">ArrowFunctionExpression</a></code>


#### Statement

<code><a href="#expressionstatement">ExpressionStatement</a> | <a href="#blockstatement">BlockStatement</a> | <a href="#staticblock">StaticBlock</a> | <a href="#emptystatement">EmptyStatement</a> | <a href="#debuggerstatement">DebuggerStatement</a> | <a href="#withstatement">WithStatement</a> | <a href="#returnstatement">ReturnStatement</a> | <a href="#labeledstatement">LabeledStatement</a> | <a href="#breakstatement">BreakStatement</a> | <a href="#continuestatement">ContinueStatement</a> | <a href="#ifstatement">IfStatement</a> | <a href="#switchstatement">SwitchStatement</a> | <a href="#throwstatement">ThrowStatement</a> | <a href="#trystatement">TryStatement</a> | <a href="#whilestatement">WhileStatement</a> | <a href="#dowhilestatement">DoWhileStatement</a> | <a href="#forstatement">ForStatement</a> | <a href="#forinstatement">ForInStatement</a> | <a href="#forofstatement">ForOfStatement</a> | <a href="#declaration">Declaration</a></code>


#### Expression

<code>ExpressionMap[keyof ExpressionMap]</code>


#### AssignmentOperator

<code>"=" | "+=" | "-=" | "*=" | "/=" | "%=" | "**=" | "&lt;&lt;=" | "&gt;&gt;=" | "&gt;&gt;&gt;=" | "|=" | "^=" | "&=" | "||=" | "&&=" | "??="</code>


#### Pattern

<code><a href="#identifier">Identifier</a> | <a href="#objectpattern">ObjectPattern</a> | <a href="#arraypattern">ArrayPattern</a> | <a href="#restelement">RestElement</a> | <a href="#assignmentpattern">AssignmentPattern</a> | <a href="#memberexpression">MemberExpression</a></code>


#### BinaryOperator

<code>"==" | "!=" | "===" | "!==" | "&lt;" | "&lt;=" | "&gt;" | "&gt;=" | "&lt;&lt;" | "&gt;&gt;" | "&gt;&gt;&gt;" | "+" | "-" | "*" | "/" | "%" | "**" | "|" | "^" | "&" | "in" | "instanceof"</code>


#### CallExpression

<code><a href="#simplecallexpression">SimpleCallExpression</a> | <a href="#newexpression">NewExpression</a></code>


#### ChainElement

<code><a href="#simplecallexpression">SimpleCallExpression</a> | <a href="#memberexpression">MemberExpression</a></code>


#### Literal

<code><a href="#simpleliteral">SimpleLiteral</a> | <a href="#regexpliteral">RegExpLiteral</a> | <a href="#bigintliteral">BigIntLiteral</a></code>


#### LogicalOperator

<code>"||" | "&&" | "??"</code>


#### UnaryOperator

<code>"-" | "+" | "!" | "~" | "typeof" | "void" | "delete"</code>


#### UpdateOperator

<code>"++" | "--"</code>


#### Declaration

<code><a href="#functiondeclaration">FunctionDeclaration</a> | <a href="#variabledeclaration">VariableDeclaration</a> | <a href="#classdeclaration">ClassDeclaration</a></code>


### Enums


#### Connections

| Members               | Value                          |
| --------------------- | ------------------------------ |
| **`APPLE_HEALTH`**    | <code>'APPLE_HEALTH'</code>    |
| **`FREESTYLE_LIBRE`** | <code>'FREESTYLE_LIBRE'</code> |
| **`GOOGLE`**          | <code>'GOOGLE'</code>          |
| **`SAMSUNG`**         | <code>'SAMSUNG'</code>         |


#### CustomPermissions

| Members                       | Value                                  |
| ----------------------------- | -------------------------------------- |
| **`WORKOUT_TYPES`**           | <code>'WORKOUT_TYPES'</code>           |
| **`ACTIVITY_SUMMARY`**        | <code>'ACTIVITY_SUMMARY'</code>        |
| **`LOCATION`**                | <code>'LOCATION'</code>                |
| **`CALORIES`**                | <code>'CALORIES'</code>                |
| **`STEPS`**                   | <code>'STEPS'</code>                   |
| **`HEART_RATE`**              | <code>'HEART_RATE'</code>              |
| **`HEART_RATE_VARIABILITY`**  | <code>'HEART_RATE_VARIABILITY'</code>  |
| **`VO2MAX`**                  | <code>'VO2MAX'</code>                  |
| **`HEIGHT`**                  | <code>'HEIGHT'</code>                  |
| **`ACTIVE_DURATIONS`**        | <code>'ACTIVE_DURATIONS'</code>        |
| **`WEIGHT`**                  | <code>'WEIGHT'</code>                  |
| **`FLIGHTS_CLIMBED`**         | <code>'FLIGHTS_CLIMBED'</code>         |
| **`BMI`**                     | <code>'BMI'</code>                     |
| **`BODY_FAT`**                | <code>'BODY_FAT'</code>                |
| **`EXERCISE_DISTANCE`**       | <code>'EXERCISE_DISTANCE'</code>       |
| **`GENDER`**                  | <code>'GENDER'</code>                  |
| **`DATE_OF_BIRTH`**           | <code>'DATE_OF_BIRTH'</code>           |
| **`BASAL_ENERGY_BURNED`**     | <code>'BASAL_ENERGY_BURNED'</code>     |
| **`SWIMMING_SUMMARY`**        | <code>'SWIMMING_SUMMARY'</code>        |
| **`RESTING_HEART_RATE`**      | <code>'RESTING_HEART_RATE'</code>      |
| **`BLOOD_PRESSURE`**          | <code>'BLOOD_PRESSURE'</code>          |
| **`BLOOD_GLUCOSE`**           | <code>'BLOOD_GLUCOSE'</code>           |
| **`BODY_TEMPERATURE`**        | <code>'BODY_TEMPERATURE'</code>        |
| **`MINDFULNESS`**             | <code>'MINDFULNESS'</code>             |
| **`LEAN_BODY_MASS`**          | <code>'LEAN_BODY_MASS'</code>          |
| **`OXYGEN_SATURATION`**       | <code>'OXYGEN_SATURATION'</code>       |
| **`SLEEP_ANALYSIS`**          | <code>'SLEEP_ANALYSIS'</code>          |
| **`RESPIRATORY_RATE`**        | <code>'RESPIRATORY_RATE'</code>        |
| **`NUTRITION_SODIUM`**        | <code>'NUTRITION_SODIUM'</code>        |
| **`NUTRITION_PROTEIN`**       | <code>'NUTRITION_PROTEIN'</code>       |
| **`NUTRITION_CARBOHYDRATES`** | <code>'NUTRITION_CARBOHYDRATES'</code> |
| **`NUTRITION_FIBRE`**         | <code>'NUTRITION_FIBRE'</code>         |
| **`NUTRITION_FAT_TOTAL`**     | <code>'NUTRITION_FAT_TOTAL'</code>     |
| **`NUTRITION_SUGAR`**         | <code>'NUTRITION_SUGAR'</code>         |
| **`NUTRITION_VITAMIN_C`**     | <code>'NUTRITION_VITAMIN_C'</code>     |
| **`NUTRITION_VITAMIN_A`**     | <code>'NUTRITION_VITAMIN_A'</code>     |
| **`NUTRITION_CALORIES`**      | <code>'NUTRITION_CALORIES'</code>      |
| **`NUTRITION_WATER`**         | <code>'NUTRITION_WATER'</code>         |
| **`NUTRITION_CHOLESTEROL`**   | <code>'NUTRITION_CHOLESTEROL'</code>   |

</docgen-api>
