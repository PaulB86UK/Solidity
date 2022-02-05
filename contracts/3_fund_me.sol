// SPDX-License-Identifier: MIT
pragma solidity ^ 0.6.0;
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";
 //zeppelin
contract FundMe {
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded;

    //to let the owner be created inmediately
    address public owner;
    constructor() public {
        //this will be inmediately executed when the contract is deployed
        owner = msg.sender;
    }


    function fund() public payable  {
    // $50
    uint256 minimiumUSD = 50 * 10 ** 18;
    //1 gwei < 50
    require(getConversionRate(msg.value) >= minimiumUSD, "You need to spend more ETH!");  
    addressToAmountFunded[msg.sender] += msg.value;
    // ETH TO USD CONVERSION RATE
        
    }

    function getVersion() public view  returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAMountinUsd = (ethPrice * ethAmount);
        return ethAMountinUsd;
    }


    function withdraw() payable public {
        //require msg.sender = owner
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
} 
