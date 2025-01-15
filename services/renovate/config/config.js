module.exports = {
  token: fs.readFileSync("/run/secrets/renovate_token").toString(),
  repositories: ["seternate/jest-homeserver"],
};
