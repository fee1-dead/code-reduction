#!/usr/bin/env bash

# set -o pipefail

rustc --crate-name hello --edition=2021 lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --diagnostic-width=212 --crate-type lib --emit=dep-info,metadata -C embed-bitcode=no -C debuginfo=2 -C metadata=32c628afc33e6569 -C extra-filename=-32c628afc33e6569 --out-dir /home/beef/develop/mcve_testing/hello/target/debug/deps -C incremental=/home/beef/develop/mcve_testing/hello/target/debug/incremental -L dependency=/home/beef/develop/mcve_testing/hello/target/debug/deps --extern async_trait=/home/beef/develop/mcve_testing/hello/target/debug/deps/libasync_trait-5118fc31edeb94fa.so --extern futures=/home/beef/develop/mcve_testing/hello/target/debug/deps/libfutures-a7313e30324a162d.rmeta --extern sqlx=/home/beef/develop/mcve_testing/hello/target/debug/deps/libsqlx-b392084fac8de4d7.rmeta -L native=/home/beef/develop/mcve_testing/hello/target/debug/build/ring-3afb2a0612730d3e/out 2>&1 | grep -q "\`impl Executor\` does not live long enough" || exit 1

