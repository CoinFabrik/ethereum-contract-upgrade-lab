import "./Upgradeable.sol";

contract Example2 is Upgradeable {
    uint _value;
    uint _value2;

    function initialize() {
        _sizes[bytes4(sha3("getUint()"))] = 32;
        _sizes[bytes4(sha3("getUint2()"))] = 32;
    }

    function getUint() returns (uint) {
        return _value;
    }

    function setUint(uint value) {
        _value = value;
    }

    function getUint2() returns (uint) {
        return _value2;
    }

    function setUint2(uint value) {
        _value2 = value;
    }
}
