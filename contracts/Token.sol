// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract Token is ERC20Votes {
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _initialSupply
    ) ERC20(_name, _symbol) ERC20Permit(_name) {
        _mint(msg.sender, _initialSupply);
    }
    address public owner = msg.sender;
    modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }


  address payable private pending_approvals;

  function membership() public {
    pending_approvals=payable(msg.sender);
  }

  function approval(uint256 amount) public restricted
  {
    if(pending_approvals!=payable(address(0)))
    {
      transfer(pending_approvals, amount);
      pending_approvals=payable(address(0));
      
    }
  }

    // The functions below are overrides required by Solidity.

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20Votes)
    {
        super._burn(account, amount);
    }
}
