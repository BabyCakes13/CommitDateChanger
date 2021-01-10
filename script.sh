git checkout master
git branch -D change_dates
git checkout -b change_dates master
export FILTER_BRANCH_SQUELCH_WARNING=1
git filter-branch -f --env-filter \
'
echo commit: $GIT_COMMIT commiter_date: $GIT_COMMITTER_DATE author_date:$GIT_AUTHOR_DATE
DATE=$(git show -s --format=%ci $GIT_COMMIT)
NEW_DATE=$(date +"%Y-%m-%d %H:%M:%S %z" -d "$DATE + 7 month + 1 hour")
GIT_COMMITTER_DATE=$NEW_DATE
GIT_AUTHOR_DATE=$NEW_DATE
'
