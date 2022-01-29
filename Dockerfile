FROM rustdocker/rust:nightly as cargo-build 
RUN apt-get update 
RUN apt-get install musl-tools -y 
RUN /root/.cargo/bin/rustup target add x86_64-unknown-linux-musl 
RUN USER=root /root/.cargo/bin/cargo new --bin atheneum 
WORKDIR /atheneum 
COPY ./Cargo.toml ./Cargo.toml 
COPY ./Cargo.lock ./Cargo.lock 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-unknown-linux-musl --features vendored 
RUN rm -f target/x86_64-unknown-linux-musl/release/deps/atheneum* 
RUN rm src/*.rs 
COPY ./src ./src 
RUN RUSTFLAGS=-Clinker=musl-gcc /root/.cargo/bin/cargo build --release --target=x86_64-unknown-linux-musl --features vendored 
FROM alpine:latest 
COPY --from=cargo-build /auth/target/x86_64-unknown-linux-musl/release/atheneum . 
CMD ["./atheneum"]
