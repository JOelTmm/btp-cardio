@echo off
echo Creating and pushing all branches...

for %%i in (0 1 2 3) do (
    echo Processing groupe-%%i...
    git checkout main
    git checkout -b groupe-%%i
    git add groupe-%%i/
    git commit -m "feat: complete groupe-%%i with all job files"
    git push -u origin groupe-%%i
)

echo Merging all branches into main...
git checkout main
for %%i in (0 1 2 3) do (
    git merge --no-ff groupe-%%i -m "merge: integrate groupe-%%i into main"
)

git push origin main
echo Done!