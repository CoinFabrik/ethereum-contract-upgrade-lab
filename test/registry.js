contract('Registry', function(accounts) {
  it('should set the owner correctly', function(done) {
    var reg = Registry.deployed();
    reg.owner.call().then(o => {
      assert.equal(o, accounts[0]);
    }).then(done).catch(done);
  });
});
