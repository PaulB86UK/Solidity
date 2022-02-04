 //SPDS-LIcense_Identifier: MIT
pragma solidity >=0.7.0;
import "./SimpleStorage.sol";

 contract StorageFactore {

     SimpleStorage[] public simpleStorageArray;

     function createSimpleStorageContract() public{
          SimpleStorage simpleStorage = new SimpleStorage();
          simpleStorageArray.push(simpleStorage);
     }
     
     function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
         //Address
         //AABI Aplication Binary Interface
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
         //simpleStorage.store(_simpleStorageNumber); }
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
     }
     function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        //return simpleStorage.retrieve();
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
     
 }
