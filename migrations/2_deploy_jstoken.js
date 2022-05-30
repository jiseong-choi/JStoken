const JStoken = artifacts.require("JStoken");

module.exports = function(deployer) {
  deployer.deploy(JStoken, "JStoken", "KPOINT", 100, 100000000);
};
