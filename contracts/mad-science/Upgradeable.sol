
/**
 * Base contract that all upgradeable contracts should use.
 *
 * Contracts implementing this interface are all called using delegatecall from
 * a dispatcher. As a result, the _sizes and _dest variables are shared with the
 * dispatcher contract, which allows the called contract to update these at will.
 *
 * _sizes is a map of function signatures to return value sizes. Due to EVM
 * limitations, these need to be populated by the target contract, so the
 * dispatcher knows how many bytes of data to return from called functions.
 * Unfortunately, this makes variable-length return values impossible.
 *
 * _dest is the address of the contract currently implementing all the
 * functionality of the composite contract. Contracts should update this by
 * calling the internal function `replace`, which updates _dest and calls
 * `initialize()` on the new contract.
 *
 * When upgrading a contract, restrictions on permissible changes to the set of
 * storage variables must be observed. New variables may be added, but existing
 * ones may not be deleted or replaced. Changing variable names is acceptable.
 * Structs in arrays may not be modified, but structs in maps can be, following
 * the same rules described above.
 */
contract Upgradeable {
    mapping(bytes4=>uint32) _sizes;
    address _dest;

    /**
     * This function is called using delegatecall from the dispatcher when the
     * target contract is first initialized. It should use this opportunity to
     * insert any return data sizes in _sizes, and perform any other upgrades
     * necessary to change over from the old contract implementation (if any).
     *
     * Implementers of this function should either perform strictly harmless,
     * idempotent operations like setting return sizes, or use some form of
     * access control, to prevent outside callers.
     */
    function initialize();

    /**
     * Performs a handover to a new implementing contract.
     */
    function replace(address target) internal {
        _dest = target;
        target.delegatecall(bytes4(sha3("initialize()")));
    }
}
