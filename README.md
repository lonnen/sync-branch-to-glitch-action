# Sync Branch to Glitch

GitHub action to unidirectionally synchronize changes from a GitHub repository to a [Glitch.com](https://glitch.com/) project.

This should be used when you want to repeatedly, automatically synchronize from GitHub to Glitch. If you only want to make a one-time import of a Github repo to Glitch, use the built-in `tools -> Import and Export -> Import from GitHub` button.

Glitch [gets weird](https://help.glitch.com/hc/en-us/articles/16287591605517-Can-I-export-GitHub-Actions-from-my-Glitch-project-) about Github Actions code. Once this is set up is inadvisable to make any changes via Glitch.

## Usage

First, retrieve your Glitch project Git URL by opening your project editor, clicking *Tools*, then *Import/Export*, and copying the project's git URL.

![a Gif showing the above steps](https://hf-files-oregon.s3.amazonaws.com/hdpglitch_kb_attachments/2022/01-07/b5b3e99f-b0f2-40f4-94a2-5dbbd08631f6/copy-git-url.gif)

*Treat this URL like a secret. Do not check it in or paste it anywhere public.*

Then, go to the GitHub repo where you want to use this action. As described [in the GitHub Documentation](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository), create a new repository secret called `GlitchGitURL`, and set the value to be the Glitch project git URL you retrieved above.

Then you'll want to set up a workflow file. 

```yml
name: Publish to Glitch

jobs:
  on:
    push:
      branches:
        - 'main'
  sync:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - uses: lonnen/sync-branch-to-glitch-action@v1.0.0
        env:
          glitch_git_URL: ${{ secrets.GlitchGitURL }}
```

You control when the job runs by using standard [workflow events trigger filters](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#push).  

Practically you may prefer less-continuous delivery, and instead filter on [tags](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#running-your-workflow-only-when-a-push-of-specific-tags-occurs) or [releases](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#release).

## inputs
- `Glitch_Git_URL` The Glitch project Git URL retrieved from the Glitch project editor

## License

This project is released under the MIT License as described in the LICENSE file