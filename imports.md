# <a name="imports">World imports</a>


 - Imports:
    - interface `wasi:observe/observe`

## <a name="wasi:observe_observe">Import interface wasi:observe/observe</a>


----

### Types

#### <a name="metric_format">`enum metric-format`</a>


##### Enum Cases

- <a name="metric_format.statsd">`statsd`</a>
----

### Functions

#### <a name="metric">`metric: func`</a>


##### Params

- <a name="metric.format">`format`</a>: [`metric-format`](#metric_format)
- <a name="metric.name">`name`</a>: `string`

#### <a name="span_enter">`span-enter: func`</a>


##### Params

- <a name="span_enter.name">`name`</a>: `string`

#### <a name="span_tags">`span-tags: func`</a>


##### Params

- <a name="span_tags.tags">`tags`</a>: `string`

#### <a name="span_exit">`span-exit: func`</a>


