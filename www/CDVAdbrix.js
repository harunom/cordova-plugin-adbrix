var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'CDVAdbrix', 'coolMethod', [arg0]);
};

exports.retention = function (arg0, arg1) {
    exec(null, null, 'CDVAdbrix', 'retention', [arg0, arg1]);
};
