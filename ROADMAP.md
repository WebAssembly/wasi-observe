# Phase 1 Roadmap

We intend to work in a "demo-oriented" fashion to build a corpus of working
code. Changes to the spec should be reflected in the demos. We should have a
demo that proves we support each user story listed in the
[README](./README.md#user-stories).

## Demo 1

A component (implemented in any language) uses high-level span functions to
send basic telemetry information to a host (implemented in any language.) The
host sends the telemetry information (spans and basic logs) to a Jaegar stack.
The component is activated by an external request; for example, an incoming
http request. The demo should run in Docker containers, possibly orchestrated
via `docker-compose` or similar.

Once completed, find the demo in the `./demos/00-basic` directory of this
repository.

**Stretch Goals:**

- Run two components in order to test distributed tracing.

**Scope:**

- Add a `context` parameter to the WIT and use it in this demo. It doesn't have
  to be fully designed yet.
    - (See discussion [here](https://github.com/WebAssembly/wasi-observe/issues/4).)
- Use the high-level `wasi-observe` interface (`span-{enter,exit}` functions,
  `log`.)
    - We're currently evaluating a more complete representation of Otel in WIT.
      Backporting that representation existing demos will help prove it out.
    - We may wish to make an early decision about our use of `wasi-logging`.
        - (See discussion [here](https://github.com/WebAssembly/wasi-observe/issues/7).)

**Timeline:**

- Open-ended, but ideally before mid-March.
