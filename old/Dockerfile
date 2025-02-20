FROM rustdocker/rust:nightly as cargo-build 
RUN apt-get update 
RUN apt-get install musl-tools -y 
RUN /root/.cargo/bin/rustup target add x86_64-pc-windows-gnu 
RUN /root/.cargo/bin/rustup target add x86_64-apple-darwin
RUN /root/.cargo/bin/rustup target add x86_64-unknown-linux-musl  
RUN USER=root /root/.cargo/bin/cargo new --bin atheneum 
WORKDIR /atheneum 
COPY ./Cargo.toml ./Cargo.toml 
COPY ./Cargo.lock ./Cargo.lock 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-pc-windows-gnu --features vendored 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-apple-darwin --features vendored 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-unknown-linux-musl --features vendored 
RUN rm -f target/x86_64-pc-windows-gnu/release/deps/atheneum* 
RUN rm -f target/x86_64-apple-darwin/release/deps/atheneum* 
RUN rm -f target/x86_64-unknown-linux-musl/release/deps/atheneum* 
RUN rm src/*.rs 
COPY ./src ./src 
RUN echo 'Environment set up, beginning build process... -- Docker'
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-pc-windows-gnu --features vendored 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-apple-darwin --features vendored 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-unknown-linux-musl --features vendored 
FROM alpine:latest 
COPY --from=cargo-build /auth/target/x86_64-unknown-linux-musl/release/atheneum . 
CMD ["./atheneum"]
