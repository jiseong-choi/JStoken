// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../KIP7.sol";
import "../../lifecycle/Pausable.sol";

/**
 * @title Pausable token
 * @dev KIP7 modified with pausable transfers.
 * See http://kips.klaytn.com/KIPs/kip-7-fungible_token
 */
abstract contract KIP7Pausable is KIP7, Pausable {
    /*
     *     bytes4(keccak256('paused()')) == 0x5c975abb
     *     bytes4(keccak256('pause()')) == 0x8456cb59
     *     bytes4(keccak256('unpause()')) == 0x3f4ba83a
     *     bytes4(keccak256('isPauser(address)')) == 0x46fbf68e
     *     bytes4(keccak256('addPauser(address)')) == 0x82dc1ec4
     *     bytes4(keccak256('renouncePauser()')) == 0x6ef8d66d
     *
     *     => 0x5c975abb ^ 0x8456cb59 ^ 0x3f4ba83a ^ 0x46fbf68e ^ 0x82dc1ec4 ^ 0x6ef8d66d == 0x4d5507ff
     */
    bytes4 private constant _INTERFACE_ID_KIP7PAUSABLE = 0x4d5507ff;

    constructor ()  {
        // register the supported interfaces to conform to KIP17 via KIP13
        _registerInterface(_INTERFACE_ID_KIP7PAUSABLE);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
        
        require(!paused(), "ERC20Pausable: token transfer while paused");
    }
}