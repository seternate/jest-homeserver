module.exports = async function () {  
  
  const token = fs.readFileSync("/run/secrets/renovate_token").toString()

  return {
    token: token,
    repositories: ["seternate/jest-homeserver"],
    dryRun: "full",
  }
};
