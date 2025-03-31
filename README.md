# EspressoPlace

A decentralized, cross-chain pixel art canvas where users can place colored pixels across different blockchain networks.

## Overview

EspressoPlace is a smart contract system that enables users to create pixel art on a 100x200 canvas across different blockchain networks. The project uses the Hyperlane protocol for cross-chain messaging, allowing users to place pixels from any supported network.

### Features

- 100x200 pixel canvas
- Cross-chain pixel placement
- Real-time canvas updates
- Secure message passing between chains

## Contracts

### EspressoPlace

The main contract that maintains the canvas state and handles pixel placement. It receives messages from other chains through the Hyperlane mailbox contract.

### EspressoPlaceSender

A contract that enables users to send pixel placement messages across chains using the Hyperlane protocol.

## Deployed Addresses

The contracts are deployed on the following networks:

- **Arbitrum Sepolia (Chain ID: 421614)**

  - EspressoPlaceSender: `0x797d5e7341d89a94dAB62F63d58C8C9263D4DcE1`

- **EspressoPlace Chain (Chain ID: 4406)**
  - EspressoPlace: `0xC1a1EB934a1f24375c89E23A97caFdA5Fb402a95`

## Development

This project uses Foundry for development and testing. Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Solidity ^0.8.13

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Deploy

```shell
$ forge script script/Deploy.s.sol:DeployScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

## Usage

1. Deploy the `EspressoPlace` contract on your target chain with a Hyperlane mailbox address
2. Deploy the `EspressoPlaceSender` contract on source chains with the recipient address and mailbox address
3. Users can call `sendAndPayForMessage` on the sender contract to place pixels across chains

## License

UNLICENSED
