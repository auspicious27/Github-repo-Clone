#!/bin/bash
USERNAME="LWindia"

echo "Do you want to make all repositories PUBLIC or PRIVATE?"
read -p "Type 'public' or 'private': " VISIBILITY

if [[ "$VISIBILITY" != "public" && "$VISIBILITY" != "private" ]]; then
  echo "❌ Invalid choice."
  exit 1
fi

echo "⚙️ Fetching repositories for $USERNAME..."
REPOS=$(gh repo list $USERNAME --limit 200 --json name -q '.[].name')

for REPO in $REPOS; do
  echo "➡️  Updating $REPO → $VISIBILITY ..."
  if gh repo edit "$USERNAME/$REPO" --visibility="$VISIBILITY" --accept-visibility-change-consequences; then
    echo "✅ Done: $REPO"
  else
    echo "❌ Failed: $REPO"
  fi
done

echo "🎉 All repositories updated to $VISIBILITY!"
