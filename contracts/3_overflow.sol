pragma solidity ^0.6.0;

contract Overflow {

    function overflow() public view returns(uint8){
        uint8 big = 255 + uint8(100);
        return big;
    }
}

//when this is done the uint8 when it reachs its limit 
//255 then in wraps arounda nd start fromn zero, thats 
//why adding 100 to the max number 255 will return 99, thats the overflow
