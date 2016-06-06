import "./Upgradeable.sol";

contract Example is Upgradeable {
    uint _value;

    function initialize() {
        _sizes[bytes4(sha3("getUint()"))] = 32;
    }

    function getUint() returns (uint) {
        return _value;
    }

    function setUint(uint value) {
        _value = value;
    }
}
