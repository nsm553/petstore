pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing adoption of a Pet
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of past ID 8 should be recorded.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of pet Id 8 asserted");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;
        
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Adopter for pet Id - 8");
    }
}