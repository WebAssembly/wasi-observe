<h1><a id="imports"></a>World imports</h1>
<ul>
<li>Imports:
<ul>
<li>interface <a href="#wasi_logging_logging"><code>wasi:logging/logging</code></a></li>
<li>interface <a href="#wasi_clocks_wall_clock_0_2_1"><code>wasi:clocks/wall-clock@0.2.1</code></a></li>
<li>interface <a href="#wasi_observe_traces"><code>wasi:observe/traces</code></a></li>
</ul>
</li>
</ul>
<h2><a id="wasi_logging_logging"></a>Import interface wasi:logging/logging</h2>
<p>WASI Logging is a logging API intended to let users emit log messages with
simple priority levels and context values.</p>
<hr />
<h3>Types</h3>
<h4><a id="level"></a><code>enum level</code></h4>
<p>A log level, describing a kind of message.</p>
<h5>Enum Cases</h5>
<ul>
<li>
<p><a id="level.trace"></a><code>trace</code></p>
<p>Describes messages about the values of variables and the flow of
control within a program.
</li>
<li>
<p><a id="level.debug"></a><code>debug</code></p>
<p>Describes messages likely to be of interest to someone debugging a
program.
</li>
<li>
<p><a id="level.info"></a><code>info</code></p>
<p>Describes messages likely to be of interest to someone monitoring a
program.
</li>
<li>
<p><a id="level.warn"></a><code>warn</code></p>
<p>Describes messages indicating hazardous situations.
</li>
<li>
<p><a id="level.error"></a><code>error</code></p>
<p>Describes messages indicating serious errors.
</li>
<li>
<p><a id="level.critical"></a><code>critical</code></p>
<p>Describes messages indicating fatal errors.
</li>
</ul>
<hr />
<h3>Functions</h3>
<h4><a id="log"></a><code>log: func</code></h4>
<p>Emit a log message.</p>
<p>A log message has a <a href="#level"><code>level</code></a> describing what kind of message is being
sent, a context, which is an uninterpreted string meant to help
consumers group similar messages, and a string containing the message
text.</p>
<h5>Params</h5>
<ul>
<li><a id="log.level"></a><a href="#level"><code>level</code></a>: <a href="#level"><a href="#level"><code>level</code></a></a></li>
<li><a id="log.context"></a><code>context</code>: <code>string</code></li>
<li><a id="log.message"></a><code>message</code>: <code>string</code></li>
</ul>
<h2><a id="wasi_clocks_wall_clock_0_2_1"></a>Import interface wasi:clocks/wall-clock@0.2.1</h2>
<p>WASI Wall Clock is a clock API intended to let users query the current
time. The name &quot;wall&quot; makes an analogy to a &quot;clock on the wall&quot;, which
is not necessarily monotonic as it may be reset.</p>
<p>It is intended to be portable at least between Unix-family platforms and
Windows.</p>
<p>A wall clock is a clock which measures the date and time according to
some external reference.</p>
<p>External references may be reset, so this clock is not necessarily
monotonic, making it unsuitable for measuring elapsed time.</p>
<p>It is intended for reporting the current date and time for humans.</p>
<hr />
<h3>Types</h3>
<h4><a id="datetime"></a><code>record datetime</code></h4>
<p>A time and date in seconds plus nanoseconds.</p>
<h5>Record Fields</h5>
<ul>
<li><a id="datetime.seconds"></a><code>seconds</code>: <code>u64</code></li>
<li><a id="datetime.nanoseconds"></a><code>nanoseconds</code>: <code>u32</code></li>
</ul>
<hr />
<h3>Functions</h3>
<h4><a id="now"></a><code>now: func</code></h4>
<p>Read the current value of the clock.</p>
<p>This clock is not monotonic, therefore calling this function repeatedly
will not necessarily produce a sequence of non-decreasing values.</p>
<p>The returned timestamps represent the number of seconds since
1970-01-01T00:00:00Z, also known as <a href="https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xbd_chap04.html#tag_21_04_16">POSIX's Seconds Since the Epoch</a>,
also known as <a href="https://en.wikipedia.org/wiki/Unix_time">Unix Time</a>.</p>
<p>The nanoseconds field of the output is always less than 1000000000.</p>
<h5>Return values</h5>
<ul>
<li><a id="now.0"></a> <a href="#datetime"><a href="#datetime"><code>datetime</code></a></a></li>
</ul>
<h4><a id="resolution"></a><code>resolution: func</code></h4>
<p>Query the resolution of the clock.</p>
<p>The nanoseconds field of the output is always less than 1000000000.</p>
<h5>Return values</h5>
<ul>
<li><a id="resolution.0"></a> <a href="#datetime"><a href="#datetime"><code>datetime</code></a></a></li>
</ul>
<h2><a id="wasi_observe_traces"></a>Import interface wasi:observe/traces</h2>
<hr />
<h3>Types</h3>
<h4><a id="datetime"></a><code>type datetime</code></h4>
<p><a href="#datetime"><a href="#datetime"><code>datetime</code></a></a></p>
<p>
#### <a id="span"></a>`resource span`
<p>Represents a unit of work or operation.</p>
<h4><a id="span_kind"></a><code>enum span-kind</code></h4>
<p>Describes the relationship between the Span, its parents, and its children in a trace.</p>
<h5>Enum Cases</h5>
<ul>
<li>
<p><a id="span_kind.client"></a><code>client</code></p>
<p>Indicates that the span describes a request to some remote service. This span is usually the parent of a remote server span and does not end until the response is received.
</li>
<li>
<p><a id="span_kind.server"></a><code>server</code></p>
<p>Indicates that the span covers server-side handling of a synchronous RPC or other remote request. This span is often the child of a remote client span that was expected to wait for a response.
</li>
<li>
<p><a id="span_kind.producer"></a><code>producer</code></p>
<p>Indicates that the span describes the initiators of an asynchronous request. This parent span will often end before the corresponding child consumer span, possibly even before the child span starts. In messaging scenarios with batching, tracing individual messages requires a new producer span per message to be created.
</li>
<li>
<p><a id="span_kind.consumer"></a><code>consumer</code></p>
<p>Indicates that the span describes a child of an asynchronous consumer request.
</li>
<li>
<p><a id="span_kind.internal"></a><code>internal</code></p>
<p>Default value. Indicates that the span represents an internal operation within an application, as opposed to an operations with remote parents or children.
</li>
</ul>
<h4><a id="status"></a><code>variant status</code></h4>
<p>The <a href="#status"><code>status</code></a> of a <a href="#span"><code>span</code></a>.</p>
<h5>Variant Cases</h5>
<ul>
<li>
<p><a id="status.unset"></a><code>unset</code></p>
<p>The default status.
</li>
<li>
<p><a id="status.ok"></a><code>ok</code></p>
<p>The operation has been validated by an Application developer or Operator to have completed successfully.
</li>
<li>
<p><a id="status.error"></a><code>error</code>: <code>string</code></p>
<p>The operation contains an error with a description.
</li>
</ul>
<h4><a id="key"></a><code>type key</code></h4>
<p><code>string</code></p>
<p>The key part of attribute `key-value` pairs.
<h4><a id="value"></a><code>variant value</code></h4>
<p>The value part of attribute <a href="#key_value"><code>key-value</code></a> pairs.</p>
<h5>Variant Cases</h5>
<ul>
<li>
<p><a id="value.string"></a><code>string</code>: <code>string</code></p>
<p>A string value.
</li>
<li>
<p><a id="value.bool"></a><code>bool</code>: <code>bool</code></p>
<p>A boolean value.
</li>
<li>
<p><a id="value.float64"></a><code>float64</code>: <code>f64</code></p>
<p>A double precision floating point value.
</li>
<li>
<p><a id="value.s64"></a><code>s64</code>: <code>s64</code></p>
<p>A signed 64 bit integer value.
</li>
<li>
<p><a id="value.string_array"></a><code>string-array</code>: list&lt;<code>string</code>&gt;</p>
<p>A homogeneous array of string values.
</li>
<li>
<p><a id="value.bool_array"></a><code>bool-array</code>: list&lt;<code>bool</code>&gt;</p>
<p>A homogeneous array of boolean values.
</li>
<li>
<p><a id="value.float64_array"></a><code>float64-array</code>: list&lt;<code>f64</code>&gt;</p>
<p>A homogeneous array of double precision floating point values.
</li>
<li>
<p><a id="value.s64_array"></a><code>s64-array</code>: list&lt;<code>s64</code>&gt;</p>
<p>A homogeneous array of 64 bit integer values.
</li>
</ul>
<h4><a id="key_value"></a><code>record key-value</code></h4>
<p>A key-value pair describing an attribute.</p>
<h5>Record Fields</h5>
<ul>
<li>
<p><a id="key_value.key"></a><a href="#key"><code>key</code></a>: <a href="#key"><a href="#key"><code>key</code></a></a></p>
<p>The attribute name.
</li>
<li>
<p><a id="key_value.value"></a><a href="#value"><code>value</code></a>: <a href="#value"><a href="#value"><code>value</code></a></a></p>
<p>The attribute value.
</li>
</ul>
<h4><a id="trace_id"></a><code>tuple trace-id</code></h4>
<p>The trace that this <a href="#span_context"><code>span-context</code></a> belongs to.</p>
<h5>Tuple Fields</h5>
<ul>
<li><a id="trace_id.0"></a><code>0</code>: <code>u64</code></li>
<li><a id="trace_id.1"></a><code>1</code>: <code>u64</code></li>
</ul>
<h4><a id="span_id"></a><code>type span-id</code></h4>
<p><code>u64</code></p>
<p>The id of this `span-context`.
<h4><a id="trace_flags"></a><code>flags trace-flags</code></h4>
<p>Flags that can be set on a <a href="#span_context"><code>span-context</code></a>.</p>
<h5>Flags members</h5>
<ul>
<li><a id="trace_flags.sampled"></a><code>sampled</code>: <p>Whether the `span` should be sampled or not.
</li>
</ul>
<h4><a id="span_context"></a><code>record span-context</code></h4>
<p>Identifying trace information about a span that can be serialized and propagated.</p>
<h5>Record Fields</h5>
<ul>
<li>
<p><a id="span_context.trace_id"></a><a href="#trace_id"><code>trace-id</code></a>: <a href="#trace_id"><a href="#trace_id"><code>trace-id</code></a></a></p>
<p>The `trace-id` for this `span-context`.
</li>
<li>
<p><a id="span_context.span_id"></a><a href="#span_id"><code>span-id</code></a>: <a href="#span_id"><a href="#span_id"><code>span-id</code></a></a></p>
<p>The `span-id` for this `span-context`.
</li>
<li>
<p><a id="span_context.trace_flags"></a><a href="#trace_flags"><code>trace-flags</code></a>: <a href="#trace_flags"><a href="#trace_flags"><code>trace-flags</code></a></a></p>
<p>The `trace-flags` for this `span-context`.
</li>
<li>
<p><a id="span_context.is_remote"></a><code>is-remote</code>: <code>bool</code></p>
<p>Whether this `span-context` was propagated from a remote parent.
</li>
<li>
<p><a id="span_context.trace_state"></a><a href="#trace_state"><code>trace-state</code></a>: <code>string</code></p>
<p>The `trace-state` for this `span-context`.
</li>
</ul>
<h4><a id="link"></a><code>record link</code></h4>
<p>Describes a relationship to another <a href="#span"><code>span</code></a>.</p>
<h5>Record Fields</h5>
<ul>
<li>
<p><a id="link.span_context"></a><a href="#span_context"><code>span-context</code></a>: <a href="#span_context"><a href="#span_context"><code>span-context</code></a></a></p>
<p>Denotes which `span` to link to.
</li>
<li>
<p><a id="link.attributes"></a><code>attributes</code>: list&lt;<a href="#key_value"><a href="#key_value"><code>key-value</code></a></a>&gt;</p>
<p>Attributes describing the link.
</li>
</ul>
<h4><a id="start_options"></a><code>record start-options</code></h4>
<p>Configuration for starting a <a href="#span"><code>span</code></a>.</p>
<h5>Record Fields</h5>
<ul>
<li>
<p><a id="start_options.span_kind"></a><a href="#span_kind"><code>span-kind</code></a>: option&lt;<a href="#span_kind"><a href="#span_kind"><code>span-kind</code></a></a>&gt;</p>
<p>`span-kind` for the new `span`.
</li>
<li>
<p><a id="start_options.attributes"></a><code>attributes</code>: option&lt;list&lt;<a href="#key_value"><a href="#key_value"><code>key-value</code></a></a>&gt;&gt;</p>
<p>Attributes for the new `span`.
</li>
<li>
<p><a id="start_options.links"></a><code>links</code>: option&lt;list&lt;<a href="#link"><a href="#link"><code>link</code></a></a>&gt;&gt;</p>
<p>`link`'s for the new `span`.
</li>
<li>
<p><a id="start_options.timestamp"></a><code>timestamp</code>: option&lt;<a href="#datetime"><a href="#datetime"><code>datetime</code></a></a>&gt;</p>
<p>When the `span` should begin. If this is not provided it defaults to the current time.
</li>
</ul>
<h4><a id="span_parent"></a><code>variant span-parent</code></h4>
<p>Determines how the parent of a <a href="#span"><code>span</code></a> should be set.</p>
<h5>Variant Cases</h5>
<ul>
<li>
<p><a id="span_parent.implicit"></a><code>implicit</code></p>
<p>The `span`'s parent is the current active span. The current active span is the most recently created and non-closed span. If no spans have been started in the guest this may be a span in the host.
</li>
<li>
<p><a id="span_parent.is_root"></a><code>is-root</code></p>
<p>The `span` is a root span and should have no parent.
</li>
<li>
<p><a id="span_parent.span_context"></a><a href="#span_context"><code>span-context</code></a>: <a href="#span_context"><a href="#span_context"><code>span-context</code></a></a></p>
<p>The `span`'s parent is identified by the given `span-context`.
</li>
</ul>
<h4><a id="trace_state"></a><code>type trace-state</code></h4>
<h2>option&lt;list&lt;(<code>string</code>, <code>string</code>)&gt;&gt;
Carries system-specific configuration data, represented as a list of key-value pairs. <a href="#trace_state"><code>trace-state</code></a> allows multiple tracing systems to participate in the same trace.</h2>
<h3>Functions</h3>
<h4><a id="static_span_start"></a><code>[static]span.start: func</code></h4>
<p>Starts a new span with the given name, parent, and options.</p>
<h5>Params</h5>
<ul>
<li><a id="static_span_start.name"></a><code>name</code>: <code>string</code></li>
<li><a id="static_span_start.parent"></a><code>parent</code>: <a href="#span_parent"><a href="#span_parent"><code>span-parent</code></a></a></li>
<li><a id="static_span_start.options"></a><code>options</code>: option&lt;<a href="#start_options"><a href="#start_options"><code>start-options</code></a></a>&gt;</li>
</ul>
<h5>Return values</h5>
<ul>
<li><a id="static_span_start.0"></a> own&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
</ul>
<h4><a id="method_span_span_context"></a><code>[method]span.span-context: func</code></h4>
<p>Get the <a href="#span_context"><code>span-context</code></a> for this <a href="#span"><code>span</code></a>.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_span_context.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
</ul>
<h5>Return values</h5>
<ul>
<li><a id="method_span_span_context.0"></a> <a href="#span_context"><a href="#span_context"><code>span-context</code></a></a></li>
</ul>
<h4><a id="method_span_is_recording"></a><code>[method]span.is-recording: func</code></h4>
<p>Returns true when the data provided to this <a href="#span"><code>span</code></a> is captured in some form. If it returns false then any data provided is discarded.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_is_recording.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
</ul>
<h5>Return values</h5>
<ul>
<li><a id="method_span_is_recording.0"></a> <code>bool</code></li>
</ul>
<h4><a id="method_span_set_attributes"></a><code>[method]span.set-attributes: func</code></h4>
<p>Set attributes of this span.</p>
<p>If a key already exists for an attribute of the Span it will be overwritten with the corresponding new value.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_set_attributes.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_set_attributes.attributes"></a><code>attributes</code>: list&lt;<a href="#key_value"><a href="#key_value"><code>key-value</code></a></a>&gt;</li>
</ul>
<h4><a id="method_span_add_event"></a><code>[method]span.add-event: func</code></h4>
<p>Adds an event with the provided name at the curent timestamp.</p>
<p>Optionally an alternative timestamp may be provided. You may also provide attributes of this event.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_add_event.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_add_event.name"></a><code>name</code>: <code>string</code></li>
<li><a id="method_span_add_event.timestamp"></a><code>timestamp</code>: option&lt;<a href="#datetime"><a href="#datetime"><code>datetime</code></a></a>&gt;</li>
<li><a id="method_span_add_event.attributes"></a><code>attributes</code>: option&lt;list&lt;<a href="#key_value"><a href="#key_value"><code>key-value</code></a></a>&gt;&gt;</li>
</ul>
<h4><a id="method_span_add_link"></a><code>[method]span.add-link: func</code></h4>
<p>Associates this <a href="#span"><code>span</code></a> with another.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_add_link.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_add_link.link"></a><a href="#link"><code>link</code></a>: <a href="#link"><a href="#link"><code>link</code></a></a></li>
</ul>
<h4><a id="method_span_set_status"></a><code>[method]span.set-status: func</code></h4>
<p>Override the default <a href="#span"><code>span</code></a> status, which is unset.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_set_status.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_set_status.status"></a><a href="#status"><code>status</code></a>: <a href="#status"><a href="#status"><code>status</code></a></a></li>
</ul>
<h4><a id="method_span_update_name"></a><code>[method]span.update-name: func</code></h4>
<p>Updates the <a href="#span"><code>span</code></a> name.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_update_name.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_update_name.name"></a><code>name</code>: <code>string</code></li>
</ul>
<h4><a id="method_span_end"></a><code>[method]span.end: func</code></h4>
<p>Signals that the operation described by this span has now ended.</p>
<p>If a timestamp is not provided then it is treated equivalent to passing the current time.</p>
<h5>Params</h5>
<ul>
<li><a id="method_span_end.self"></a><code>self</code>: borrow&lt;<a href="#span"><a href="#span"><code>span</code></a></a>&gt;</li>
<li><a id="method_span_end.timestamp"></a><code>timestamp</code>: option&lt;<a href="#datetime"><a href="#datetime"><code>datetime</code></a></a>&gt;</li>
</ul>
