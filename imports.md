<h1><a name="imports">World imports</a></h1>
<ul>
<li>Imports:
<ul>
<li>interface <a href="#wasi:logging_logging"><code>wasi:logging/logging</code></a></li>
<li>interface <a href="#wasi:observe_observe"><code>wasi:observe/observe</code></a></li>
</ul>
</li>
</ul>
<h2><a name="wasi:logging_logging">Import interface wasi:logging/logging</a></h2>
<p>WASI Logging is a logging API intended to let users emit log messages with
simple priority levels and context values.</p>
<hr />
<h3>Types</h3>
<h4><a name="level"><code>enum level</code></a></h4>
<p>A log level, describing a kind of message.</p>
<h5>Enum Cases</h5>
<ul>
<li>
<p><a name="level.trace"><code>trace</code></a></p>
<p>Describes messages about the values of variables and the flow of
control within a program.
</li>
<li>
<p><a name="level.debug"><code>debug</code></a></p>
<p>Describes messages likely to be of interest to someone debugging a
program.
</li>
<li>
<p><a name="level.info"><code>info</code></a></p>
<p>Describes messages likely to be of interest to someone monitoring a
program.
</li>
<li>
<p><a name="level.warn"><code>warn</code></a></p>
<p>Describes messages indicating hazardous situations.
</li>
<li>
<p><a name="level.error"><code>error</code></a></p>
<p>Describes messages indicating serious errors.
</li>
<li>
<p><a name="level.critical"><code>critical</code></a></p>
<p>Describes messages indicating fatal errors.
</li>
</ul>
<hr />
<h3>Functions</h3>
<h4><a name="log"><code>log: func</code></a></h4>
<p>Emit a log message.</p>
<p>A log message has a <a href="#level"><code>level</code></a> describing what kind of message is being
sent, a context, which is an uninterpreted string meant to help
consumers group similar messages, and a string containing the message
text.</p>
<h5>Params</h5>
<ul>
<li><a name="log.level"><a href="#level"><code>level</code></a></a>: <a href="#level"><a href="#level"><code>level</code></a></a></li>
<li><a name="log.context"><code>context</code></a>: <code>string</code></li>
<li><a name="log.message"><code>message</code></a>: <code>string</code></li>
</ul>
<h2><a name="wasi:observe_observe">Import interface wasi:observe/observe</a></h2>
<hr />
<h3>Types</h3>
<h4><a name="metric_format"><code>enum metric-format</code></a></h4>
<h5>Enum Cases</h5>
<ul>
<li><a name="metric_format.statsd"><code>statsd</code></a></li>
</ul>
<hr />
<h3>Functions</h3>
<h4><a name="metric"><code>metric: func</code></a></h4>
<p>Emit a metric.</p>
<p>A metric has a <code>format</code> describing the format of the <code>name</code> parameter.</p>
<h5>Params</h5>
<ul>
<li><a name="metric.format"><code>format</code></a>: <a href="#metric_format"><a href="#metric_format"><code>metric-format</code></a></a></li>
<li><a name="metric.name"><code>name</code></a>: <code>string</code></li>
</ul>
<h4><a name="span_enter"><code>span-enter: func</code></a></h4>
<p>Enter a named span.</p>
<p>Communicate to the o11y host that the guest is moving into a new span.</p>
<h5>Params</h5>
<ul>
<li><a name="span_enter.name"><code>name</code></a>: <code>string</code></li>
</ul>
<h4><a name="span_tags"><code>span-tags: func</code></a></h4>
<p>Add tags to the current span.</p>
<p>Add a comma-delimited list of tags to the active span.</p>
<h5>Params</h5>
<ul>
<li><a name="span_tags.tags"><code>tags</code></a>: <code>string</code></li>
</ul>
<h4><a name="span_exit"><code>span-exit: func</code></a></h4>
<p>Exit the current span.</p>
<p>Communicate to the o11y host that the span is complete.</p>
