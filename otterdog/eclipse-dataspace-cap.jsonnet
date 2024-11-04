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
    orgs.newRepo('eclipse-dataspace-cap.github.io') {
      aliases: ['cap-website'],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      description: "Conformity Assessment Policy and Credential Profile website",
      web_commit_signoff_required: false,
      gh_pages_build_type: "workflow",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main",
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('cap-ontology') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Conformity Assessment Policy and Credential Profile - Ontology",
      web_commit_signoff_required: true,
      gh_pages_build_type: "workflow",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main",
          ],
          deployment_branch_policy: "selected",
        },
      ],
    }
  ],
}
