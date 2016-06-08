contract Users_v2 {
  public address owner;
  struct User {
    string name;
    string middleInitial;
    string lastName;
  }
  public mapping address => User users;

  function Users_v1() {
    owner = msg.sender;
  }

  modifier ownerOnly {
    if (msg.sender == owner) _
  }

  function addUser(address _address, string _name, string _lastName) ownerOnly {
    if (users[_address] != 0) {
      //User exists, throw
      throw;
    }
    users[_address] = User(_name, _lastName);
  }

  function getFullName(address _userAddress) returns (string) {
    User user = users[_userAddress];
    return user.name + " " + user.middleInitial + ". " + user.lastName;
  }

  function changeName(address _userAddress, string newName) {
    User user = users[_userAddress];
    if (user == 0) {
      throw;
    }
    user.name = newName;
  }
}
