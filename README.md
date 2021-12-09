#  Check Changed Files Helper ✔️

##  📜 About 📜

Submitted for the GitHub Actions Hackathon on DEV. [View the DEV post submission]().

[GitHub Actions](https://github.com/features/actions) are a feature provided by GitHub as a way to automate workflows useful for managing repositories.

`Check Changed Files Helper` is a GitHub Action workflow that performs a check on changes made to source files pushed to a repository. Customise this workflow to suit your own repository needs.

This repo shows an example of how GitHub Action workflows can be used to automate checks on files changed in the repo.

This project relies on the [`Get Changed Files`](https://github.com/marketplace/actions/get-changed-files) Action available on the GitHub marketplace. The `Get Changed Files` Action will provide all added, renamed and modified files in a JSON file within the runner filesystem. When a file or multiple files are changed on the repo, it will identify each changed file.

`Check Changed Files Helper` takes each changed file and performs a check to execute any recognised source file types. A handy way to automate checks of files submitted to your repository!

The workflow content as it is may not suit every repository but it can act as a starting point to get you thinking about how to automate checks on files changed on your repositories.


## 💻 How to use 💻

The files needed to run this workflow are placed under the repo path `.github/workflows`. Fork this repo or copy these files to start customising for your own use.

`auto-check-changed-files.yml`: YAML file containing the GitHub Actions workflow. This will setup any necessary dependencies and use the [`Get Changed Files`](https://github.com/marketplace/actions/get-changed-files) Action to generate a JSON containing all files changed on the repository with every push to the `main` branch. Following this, the `auto-check-changed-files.sh` bash script is executed.

`auto-check-changed-files.sh`: Bash script containing custom check instructions. It scans through each changed file pushed to the repository and performs a basic execution check on each file. Edit this script to extend the recognised file types and checks to be performed.


## ⚙️ Configure to suit your needs ⚙️
- Play around by forking this repo and changing (e.g. adding, renaming or modifying) the source files on this repo.
- The GitHub Actions workflow will trigger and perform a check on each changed file.
- Sample checks are provided for file types:`.c .py .js .sh`. The sample check is to simply execute the file type acting as a very basic sanity on the file contents.
- Use this as a template to perform specific checks on files changed on the repository according to the file type.
- Get creative and modify the workflow and bash script to suit the needs of your repository!


## ❓ Questions ❓
Create an [ISSUE](../../issues) if you have any questions, suggestions or anything else.
