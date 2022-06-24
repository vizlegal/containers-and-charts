# Visual Regresion Tracker Agent

Ubuntu focal with playwright and VRT agent


## Build

```
podman build -t quay.io/vizlegalq/vrt-agent:1.0.0 .
```

Agent is built with the necessary tools to test with playwright and send results to a VRT server, it does not contain any configuration, it is provided by the app to be tested.

The required configuration files are:

- playwright.config.js: configuration file for playwright, browsers, etc..
- global-setup.js: (optional) this file is used for app setup, e.g. user login and storing the cookie in a file.
- vrt.json: vrt agent configuration file, secrets.

### playwright.config.js

```
const { devices } = require('@playwright/test');
const path = require("path");

const config = {
  testDir: "./test",
  timeout: 60000,
  retries: 2,
  workers: 10,
  use: {
    baseURL: process.env.EXT_HOST,
  },
  projects: [
    {
      name: 'Desktop Chromium',
      use: {
        browserName: 'chromium',
        viewport: { width: 1440, height: 900 },
        use: {...devices["Desktop Chrome"]}
      },
    },
    // define other browsers
  ]
};

module.exports = config;

```

### vrt.json

```
const config = {
  "apiUrl": process.env.VRT_API_URL,
  "apiKey": process.env.VRT_API_KEY,
  "project": process.env.VRT_API_PROJECT,
  "branchName": "process.env.VRT_BRANCHNAME",
  "ciBuildId": "commit_sha",
  "enableSoftAssert": false
};

module.exports = config;
```

