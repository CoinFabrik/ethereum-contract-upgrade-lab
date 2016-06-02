contract Registry {
  address public owner;
  address[] public versions;
  function Registry() {
    owner = msg.sender;
  }
  function currentVersion() returns(address version) {
    return versions[versions.length - 1];
  }
  modifier onlyOwner {
    if(msg.sender == owner) _
  }
  function changeVersion(address newVersion) onlyOwner {
    versions.push(newVersion);
  }
  function changeOwner(address newOwner) onlyOwner {
    owner = newOwner;
  }
}
