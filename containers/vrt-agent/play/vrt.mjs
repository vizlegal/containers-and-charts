import { PlaywrightVisualRegressionTracker } from "@visual-regression-tracker/agent-playwright";

const vrt = new PlaywrightVisualRegressionTracker();

import { test } from "@playwright/test";

test.beforeAll(async () => {
  await vrt.start();
});

test.afterAll(async () => {
  await vrt.stop();
});

export default {
  vrt, test
};