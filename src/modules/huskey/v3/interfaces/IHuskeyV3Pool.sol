// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./pool/IHuskeyV3PoolImmutables.sol";
import "./pool/IHuskeyV3PoolState.sol";
import "./pool/IHuskeyV3PoolDerivedState.sol";
import "./pool/IHuskeyV3PoolActions.sol";
import "./pool/IHuskeyV3PoolOwnerActions.sol";
import "./pool/IHuskeyV3PoolEvents.sol";

/// @title The interface for a HuskeySwap V3 Pool
/// @notice A HuskeySwap pool facilitates swapping and automated market making between any two assets that strictly conform
/// to the ERC20 specification
/// @dev The pool interface is broken up into many smaller pieces
interface IHuskeyV3Pool is
    IHuskeyV3PoolImmutables,
    IHuskeyV3PoolState,
    IHuskeyV3PoolDerivedState,
    IHuskeyV3PoolActions,
    IHuskeyV3PoolOwnerActions,
    IHuskeyV3PoolEvents
{}
