pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1155/ERC1155.sol";

contract FractionalNFT is ERC1155 {
    uint256 public totalSupply;

    constructor() public {
        totalSupply = 10000;
    }

    function mint(address _to, uint256[] memory _ids, uint256[] memory _amounts) public {
        require(msg.sender == address(this), "Only contract owner can mint tokens");

        for (uint256 i = 0; i < _ids.length; i++) {
            require(_ids[i] > 0, "Invalid NFT ID");
            require(_amounts[i] > 0, "Invalid NFT amount");
            _mint(_to, _ids[i], _amounts[i]);
            totalSupply += _amounts[i];
        }
    }

    function transfer(address _to, uint256[] memory _ids, uint256[] memory _amounts) public {
        for (uint256 i = 0; i < _ids.length; i++) {
            require(_ids[i] > 0, "Invalid NFT ID");
            require(_amounts[i] > 0, "Invalid NFT amount");
            _transfer(msg.sender, _to, _ids[i], _amounts[i]);
        }
    }
}
