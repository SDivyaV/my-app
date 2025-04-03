 #!/bin/sh

# Step 1: Create React App
npx create-react-app my-app
cd my-app

# Step 2: Initialize Git and Create a GitHub Repo
git init
gh repo create my-app --public --source=. --remote=origin

# Step 3: Create and Switch to a New Branch
git checkout -b update_logo

# Step 4: Replace Existing Logo
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg

# Step 5: Update the Link in App.js
sed -i 's|href="https://reactjs.org"|href="https://www.propelleraero.com/dirtmate/"|' src/App.js

# Step 6: Commit Changes
git add src/logo.svg src/App.js
git commit -m "Updated logo and link"

# Step 7: Push the Branch
git push origin update_logo

# Step 8: Create a Pull Request
gh pr create --base master --head update_logo --title "Update Logo and Link" --body "Replaced the existing logo and updated the link"

# Step 9: Merge the PR (Skipping Approval)
gh pr merge update_logo --merge

# Step 10: Add GitHub Repo Link to command.sh
echo "# REPO_URL <your_github_repo_url>" >> command.sh

