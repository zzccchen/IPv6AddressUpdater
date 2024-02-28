# Script Parameters
$repoUrl = "git@github.com:your_name/IPv6AddressUpdater.git" # Your Gitee repository URL
$localRepoPath = "C:\Users\your_name\IPv6AddressUpdater" # Local repository path
$ipv6FilePath = "ipv6_address.txt" # Filename to store the IPv6 address

# Function: Get the current IPv6 address
function Get-IPv6Address {
    ipconfig | Select-String -Pattern "(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4})" | ForEach-Object { $_.Matches.Groups[0].Value }
}

# Function: Push to Gitee
function Push-To-Gitee($localRepoPath, $ipv6FilePath, $repoUrl, $currentIPv6) {
    # Switch to the local repository path
    Push-Location $localRepoPath

    # Ensure the local repository is initialized and has the remote set
    if (-not (Test-Path ".git")) {
        git init
        git remote add origin $repoUrl
    }

    # Fetch the latest remote repository info
    git fetch origin master
    git reset --hard origin/master

    # Check if the IPv6 address has changed
    $lastIPv6 = Get-Content -Path $ipv6FilePath -ErrorAction SilentlyContinue
    if ($lastIPv6 -ne $currentIPv6) {
        # IPv6 address has changed, update the file and push
        $currentIPv6 | Out-File -FilePath $ipv6FilePath
        git add $ipv6FilePath
        git commit -m "Update IPv6 address"
        git push -u origin master
    } else {
        Write-Host "IPv6 address has not changed."
    }

    # Switch back to the previous path
    Pop-Location
}

# Main Logic
$currentIPv6 = Get-IPv6Address
if ($currentIPv6) {
    Push-To-Gitee $localRepoPath $ipv6FilePath $repoUrl $currentIPv6
} else {
    Write-Host "No IPv6 address found."
}
