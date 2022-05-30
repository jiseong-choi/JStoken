// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./KIP7/KIP7.sol";
import "./KIP7/extensions/KIP7Metadata.sol";
import "./KIP7/extensions/KIP7Mintable.sol";
import "./KIP7/extensions/KIP7Burnable.sol";
import "./KIP7/extensions/KIP7Pausable.sol";

contract JStoken is KIP7, KIP7Metadata, KIP7Mintable, KIP7Burnable,  KIP7Pausable {
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 initialSupply
    ) KIP7Metadata(name, symbol, decimals) {
        _mint(msg.sender, initialSupply);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(KIP7, KIP7Pausable) {
        super._beforeTokenTransfer(from, to, amount);
    }
}
