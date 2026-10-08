const ionic = require('@ionic/swiftlint-config');

// The shared config excludes the template's `example-app`; this repo's example lives in `example`.
module.exports = {
  ...ionic,
  excluded: [...ionic.excluded, '${PWD}/example'],
};
