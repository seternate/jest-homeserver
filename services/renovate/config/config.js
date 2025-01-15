module.exports = function () {
  return {
    token: fs.readFileSync("/run/secrets/renovate_token"),
    repositories: ["seternate/jest-homeserver"],
    dryRun: "full",
  }
};
