/**
 * The dispatcher is a minimal 'shim' that dispatches calls to a targeted
 * contract. Calls are made using 'delegatecall', meaning all storage and value
 * is kept on the dispatcher. As a result, when the target is updated, the new
 * contract inherits all the stored data and value from the old contract.
 */
contract Dispatcher is Upgradeable {
    function Dispatcher(address target) {
        replace(target);
    }

    function initialize() {
        // Should only be called by on target contracts, not on the dispatcher
        throw;
    }

    function() {
        bytes4 sig;
        assembly { sig := calldataload(0) }
        var len = _sizes[sig];
        var target = _dest;

        assembly {
            // return _dest.delegatecall(msg.data)
            calldatacopy(0x0, 0x0, calldatasize)
            delegatecall(sub(gas, 10000), target, 0x0, calldatasize, 0, len)
            return(0, len)
        }
    }
}
