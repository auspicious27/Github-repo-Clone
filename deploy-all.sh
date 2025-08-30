#!/bin/bash

# GitHub username
GITHUB_USER="lwsummerinternship2024-creator"

# File to store deployed project URLs
OUTPUT_FILE="deployed_projects.txt"
echo "🌍 Vercel Deployment Links" > $OUTPUT_FILE
echo "==========================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Step 1: Get repo list
repos=$(gh repo list $GITHUB_USER --limit 100 --json name -q '.[].name')

# Step 2: Clone & deploy each repo
for repo in $repos; do
    echo "🚀 Deploying $repo ..."
    
    # If folder doesn't exist, clone
    if [ ! -d "$repo" ]; then
        gh repo clone $GITHUB_USER/$repo
    fi

    # Enter repo directory
    cd $repo || exit

    # Deploy to vercel (non-interactive, production)
    url=$(vercel --prod --yes --confirm | tail -n 1)

    # Save result
    echo "$repo  -->  $url" | tee -a ../$OUTPUT_FILE

    # Go back
    cd ..
    echo "✅ Done: $repo"
    echo ""
done

echo "🎉 All projects deployed!"
echo "📄 Deployment links saved in: $OUTPUT_FILE"
