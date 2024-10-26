local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-dataspace-cap') {
  settings+: {
    description: "",
    name: "Eclipse Conformity Assessment Policy and Credential Profile ",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('cap-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      description: "Conformity Assessment Policy and Credential Profile website",
      web_commit_signoff_required: false,

      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      environments: [
        orgs.newEnvironment('github-pages') {
        },
      ],
    },
  ],
}
