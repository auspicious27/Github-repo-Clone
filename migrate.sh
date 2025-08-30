#!/bin/bash

SOURCE_USER="LWindia"
TARGET_USER="lwsummerinternship2024-creator"

# Make sure target account is active
gh auth switch -u $TARGET_USER

repos=$(gh repo list $SOURCE_USER --limit 1000 --json name -q '.[].name')

mkdir -p logs

for repo in $repos; do
  echo "🚀 Migrating $repo ..."
  
  rm -rf $repo.git

  if ! git clone --mirror https://github.com/$SOURCE_USER/$repo.git; then
    echo "❌ Clone failed: $repo" | tee -a logs/failed.log
    continue
  fi

  cd $repo.git

  if ! gh repo view $TARGET_USER/$repo &>/dev/null; then
    gh repo create $TARGET_USER/$repo --private
    echo "✅ Created repo: $TARGET_USER/$repo"
  else
    echo "ℹ️ Repo already exists: $TARGET_USER/$repo (will push updates)"
  fi

  if git push --mirror https://github.com/$TARGET_USER/$repo.git; then
    echo "✅ Migrated successfully: $repo" | tee -a ../logs/success.log
  else
    echo "❌ Push failed: $repo" | tee -a ../logs/failed.log
  fi

  cd ..
  rm -rf $repo.git
done
