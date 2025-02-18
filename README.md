# My Git Config

## Getting started

```bash
cd my-git-config
```

```bash
sh install.sh
```

## Aliases

| Alias       | Command                                                                                                                | Example                             |
|-------------|------------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| st          | Displays the state of the working directory and the staging area                                                       | `git st`                            |
| save        | Add file contents to the index and record changes to the repository (the branch name will be prepended to the message) | `git save "First commit"`           |
| undo        | Reset latest commit                                                                                                    | `git undo`                          |
| wip         | Stash changes with message                                                                                             | `git wip "Will make it done later"` |
| unwip       | Unstash changes                                                                                                        | `git unwip <index number>`          |
| main        | Switch to main branche                                                                                                 | `git main`                          |
| mainp       | Switch to main branche and pull                                                                                        | `git mainp`                         |
| co          | Switch branch                                                                                                          | `git co <branch>`                   |
| cob         | create and switch branch                                                                                               | `git cob <branch>`                  |
| cobtag      | create and switch branch from tag                                                                                      | `git cobtag <tag> <new branch>`     |
| getalltags  | Fetch all remote tags                                                                                                  | `git getalltags`                    |
| ll          | Git log latests commit                                                                                                 | `git ll`                            |
| lastcm      | Log latest commit                                                                                                      | `git lastcm`                        |
| current     | Print current branch                                                                                                   | `git current`                       |
| pushu       | Push to upstream                                                                                                       | `git pushu`                         |
| resetorigin | Reset local branch from origin                                                                                         | `git resetorigin`                   |
| branches    | List latests local branches                                                                                            | `git branches`                      |
| prs         | Print links Azure DevOps                                                                                               | `git prs`                           |
| list        | List git configurations/aliases                                                                                        | `git list`                          |

```bash
git st
```