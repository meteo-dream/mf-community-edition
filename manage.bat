@echo off
setlocal EnableDelayedExpansion

goto init

:ask

echo(
:init
echo [95mChoose the action you want to run:[0m
echo(
echo [94m1.[0m Update project and engine with reset
echo [94m2.[0m Update project and engine
echo(
echo [94m3.[0m Update project with reset
echo [94m4.[0m Update project
echo(
echo [94m5.[0m Update engine with reset
echo [94m6.[0m Update engine
echo(
echo [94m7.[0m Project diff
echo [94m8.[0m Engine diff
echo(
echo [94m9.[0m Project commit
echo [94m10.[0m Engine commit (if you have permission to do so)
echo(
set /p userInput=Enter your choice: 
echo(

if /i "%userInput%"=="1" (
  echo [91mThis action will destroy all uncommited data. Press enter to proceed.[0m
  echo(
  set /p a=

  echo [95mPerforming resets...[0m
  echo(
  echo [95mProject:[0m
  git add .
  git reset --hard
  cd engine
  echo [95mEngine:[0m
  git add .
  git reset --hard
  cd ..

  echo(
  echo [95mPulling the project updates...[0m
  echo(

  git pull

  echo(
  echo [95mUpdating the engine submodule...[0m
  echo(

  git submodule update --remote

  goto end
) else if /i "%userInput%"=="2" (
  echo [95mPulling the project updates...[0m
  echo(

  git pull

  echo(
  echo [95mUpdating the engine submodule...[0m
  echo(

  git submodule update --remote

  goto end
) else if /i "%userInput%"=="3" (
  echo [91mThis action will destroy all uncommited data in the project. Press enter to proceed.[0m
  echo(
  set /p a=

  echo [95mPerforming resets...[0m
  echo(
  git add .
  git reset --hard

  echo(
  echo [95mPulling the project updates...[0m
  echo(

  git pull

  goto end
) else if /i "%userInput%"=="4" (
  echo [95mPulling the project updates...[0m
  echo(

  git pull

  goto end
) else if /i "%userInput%"=="5" (
  echo [91mThis action will destroy all uncommited data in the engine. Press enter to proceed.[0m
  echo(
  set /p a=

  echo [95mPerforming engine reset...[0m
  echo(
  cd engine
  git add .
  git reset --hard
  cd ..

  echo(
  echo [95mUpdating the engine submodule...[0m
  echo(

  git submodule update --remote

  goto end
) else if /i "%userInput%"=="6" (
  echo [95mUpdating the engine submodule...[0m
  echo(

  git submodule update --remote

  goto end
) else if /i "%userInput%"=="7" (
  git add .
  git diff --staged

  goto ask
) else if /i "%userInput%"=="8" (
  cd engine
  git add .
  git diff --staged
  cd ..

  goto ask
) else if /i "%userInput%"=="9" (
  set /p commitName=Enter the project commit name: 

  git add .
  git commit -m "!commitName!"
  git push

  goto ask
) else if /i "%userInput%"=="10" (
  set /p commitName=Enter the engine commit name: 

  cd engine
  git add .
  git commit -m "!commitName!"
  git push origin HEAD:main
  cd ..

  goto ask
) else (
  echo [91mInvalid input. Please enter a number.[0m
  goto ask
)

:end
echo(
echo [95mReview the changes and press enter to exit.[0m
echo(

set /p a=
