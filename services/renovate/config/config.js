module.exports = async function () {
  return {
    token: fs.readFileSync("/run/secrets/renovate_token").toString(),
    repositories: ["seternate/jest-homeserver"],
    dryRun: "full",
  }
};
