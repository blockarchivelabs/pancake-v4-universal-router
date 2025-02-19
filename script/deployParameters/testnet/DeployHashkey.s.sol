// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import { DeployUniversalRouter } from '../../DeployUniversalRouter.s.sol';
import { RouterParameters } from '../../../src/base/RouterImmutables.sol';

/**
 * Step 1: Deploy
 * forge script script/deployParameters/testnet/DeployHashkey.s.sol:DeployHashkey -vvv \
 *     --rpc-url $RPC_URL \
 *     --broadcast \
 *     --slow
 *
 * Step 2: Verify - example_args.txt is the constructor arguments in the form of (args1, args2, args)
 * forge verify-contract <address> UniversalRouter --watch --chain 11155111 --constructor-args-path ./script/deployParameters/testnet/args/eth_sepolia.txt
 */
contract DeployHashkey is DeployUniversalRouter {
  /// @notice contract address will be based on deployment salt
  function getDeploymentSalt() public pure override returns (bytes32) {
    return keccak256('HUK-V4-UNIVERSAL-ROUTER/UniversalRouter/testnet-0108-001');
  }

  // ref from v3 universal router: https://sepolia.etherscan.io/tx/0xb4610521d3fc61f4837edbd899acb6c33a5fe0f3bb32ab84745ac0a8b1859906
  // and from catalist-frontend config
  function setUp() public override {
    params = RouterParameters({
      permit2: 0xB633FDB3b17e9f59d993d1E9F7B51D54bcbcCc45,
      weth9: 0xA0F15E49C19648D49769920cFD58d47b18F52be8,
      v2Factory: 0xf0145B3B775c6081a0517b9c91fC6D62843B3f4d,
      v3Factory: 0xA7B9b35325FEa1Dac3c1B00d97Ea8e14feB0DcD0,
      v3Deployer: 0x32f3b724AF1646f8aAc808b272474B8F046aeAB8,
      v2InitCodeHash: 0x31d4d4735f7b385a73bf8f4f40ce20074534e8112c1ff3324a1c032a2a17f021,
      v3InitCodeHash: 0xd7c5db874db43b545c83278f3e2ecdfc489424cfc50ce277a2f7e8d4e7f2ffb9,
      stableFactory: UNSUPPORTED_PROTOCOL,
      stableInfo: UNSUPPORTED_PROTOCOL,
      v4Vault: UNSUPPORTED_PROTOCOL,
      v4ClPoolManager: UNSUPPORTED_PROTOCOL,
      v4BinPoolManager: UNSUPPORTED_PROTOCOL,
      v3NFTPositionManager: 0x64458A3481b9888A4E51dE28003348589FFb7289,
      v4ClPositionManager: UNSUPPORTED_PROTOCOL,
      v4BinPositionManager: UNSUPPORTED_PROTOCOL
    });

    unsupported = 0xd0D5b19Fe56F9BC8B877FEa5F64F4ceBa5fbe27B;
  }
}
