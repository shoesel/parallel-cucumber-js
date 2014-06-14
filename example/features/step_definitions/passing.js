module.exports = function() {
  this.Given(/^a passing pre-condition$/, function(callback) {
    if (this.isDryRun()) { return callback(); }

    callback();
  });

  this.When(/^a passing action is executed$/, function(callback) {
    if (this.isDryRun()) { return callback(); }

    callback();
  });

  this.When(/^a failing action is executed$/, function(callback) {
    if (this.isDryRun()) { return callback(); }

    callback('Failed');
  });

  this.Then(/^a post-condition passes$/, function(callback) {
    if (this.isDryRun()) { return callback(); }

    callback();
  });
};
