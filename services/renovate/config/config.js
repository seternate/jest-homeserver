modules.export = {
    token: fs.readFileSync("/run/secrets/renovate_token"),
    repositories: ["seternate/jest-homeserver"],
}
