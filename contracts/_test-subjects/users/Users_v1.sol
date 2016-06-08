contract Users_v1 {
  address owner;
  struct User {
    string name;
    string lastName;
  }
  mapping address => User users;

  function Users_v1() {
    owner = msg.sender;
  }

  modifier ownerOnly() {
    if (msg.sender == owner) _
  }

  function addUser(address _address, string _name, string _lastName) ownerOnly {
    users[_address] = User(_name, _lastName);
  }

  function getFullName(address _userAddress) returns (string) {
    User memory user = users[_userAddress];
    return user.name + " " + user.lastName;
  }
}
