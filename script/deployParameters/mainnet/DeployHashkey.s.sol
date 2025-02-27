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
    return keccak256('HUK-V4-UNIVERSAL-ROUTER/UniversalRouter/0227-001');
  }

  // ref from v3 universal router: https://sepolia.etherscan.io/tx/0xb4610521d3fc61f4837edbd899acb6c33a5fe0f3bb32ab84745ac0a8b1859906
  // and from catalist-frontend config
  function setUp() public override {
    params = RouterParameters({
      permit2: 0x000000000022D473030F116dDEE9F6B43aC78BA3,
      weth9: 0xB210D2120d57b758EE163cFfb43e73728c471Cf1,
      v2Factory: 0xd1899eA08Ba0cF5a199706590BCD3FbA3Eb1243E,
      v3Factory: 0x48517c889cF9De316711077835c33243E2F021ee,
      v3Deployer: 0xbF4528D3c4c0922029B828b1A878aE78951f65a3,
      v2InitCodeHash: 0x31d4d4735f7b385a73bf8f4f40ce20074534e8112c1ff3324a1c032a2a17f021,
      v3InitCodeHash: 0xd7c5db874db43b545c83278f3e2ecdfc489424cfc50ce277a2f7e8d4e7f2ffb9,
      stableFactory: UNSUPPORTED_PROTOCOL,
      stableInfo: UNSUPPORTED_PROTOCOL,
      v4Vault: UNSUPPORTED_PROTOCOL,
      v4ClPoolManager: UNSUPPORTED_PROTOCOL,
      v4BinPoolManager: UNSUPPORTED_PROTOCOL,
      v3NFTPositionManager: 0x6E8bdD9D4C70f84003e5474ecA4832C2822e1072,
      v4ClPositionManager: UNSUPPORTED_PROTOCOL,
      v4BinPositionManager: UNSUPPORTED_PROTOCOL
    });

    unsupported = 0xa13f99E212ed0b4425999924A8902C369d37dfa1;
  }
}
