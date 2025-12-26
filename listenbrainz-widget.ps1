$ProgressPreference = 'SilentlyContinue'

# Configuration
$user = "<CHANGE_USERNAME_HERE>"  # Replace with your ListenBrainz username
$limit = 10         # Number of recent listens to fetch

# Fetch total listen count
$listenCountResponse = Invoke-RestMethod -Uri "https://api.listenbrainz.org/1/user/$user/listen-count" -MaximumRedirection 5
$totalPlayCount = $listenCountResponse.payload.count

# Fetch recent listens
$recentListensResponse = Invoke-RestMethod -Uri "https://api.listenbrainz.org/1/user/$user/listens?count=$limit" -MaximumRedirection 5
$recentListensString = ""
foreach ($listen in $recentListensResponse.payload.listens) {
    $trackName = $listen.track_metadata.track_name
    $artistName = $listen.track_metadata.artist_name
    $albumName = $listen.track_metadata.release_name
    $albumDate = $listen.track_metadata.additional_info.date
    $recentListensString += "-  $artistName - $trackName ($albumName - $albumDate)<br>"
}
$recentListensString = $recentListensString.TrimEnd("<br>")

# Format numbers with spaces
$totalPlayCountFormatted = '{0:N0}' -f $totalPlayCount -replace ',', " "

# Create output object
$output = @{
    playcount = $totalPlayCountFormatted
    username = $user
    recent_listens = $recentListensString
}

# Output as JSON
$output | ConvertTo-Json -Compress
