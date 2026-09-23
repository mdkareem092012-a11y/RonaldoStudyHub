# ============================================================
# RONALDO STUDY HUB - PHASE 7
# FINAL POLISH + DARK MODE + OFFLINE SUPPORT
# ============================================================
#
# Put this file in:
# Desktop\RonaldoStudyHub\phase7-final-polish.ps1
#
# Run:
# powershell -NoProfile -ExecutionPolicy Bypass -File .\phase7-final-polish.ps1
#
# ============================================================

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot

$cssFolder = Join-Path $root "css"
$jsFolder  = Join-Path $root "js"

New-Item -ItemType Directory -Path $cssFolder -Force | Out-Null
New-Item -ItemType Directory -Path $jsFolder -Force | Out-Null


# ============================================================
# 1. FINAL POLISH CSS
# ============================================================

$finalCss = @'
:root {
    --navy: #07111f;
    --navy-2: #0c1728;
    --card: #101d31;
    --card-2: #13243b;
    --border: #263b58;
    --text: #f4f7fb;
    --muted: #aab8ca;
    --blue: #48d7ff;
    --blue-dark: #17314d;
    --gold: #e7ba63;
    --success: #68dca1;
    --danger: #ff9c91;
    --shadow: 0 20px 60px rgba(0,0,0,.22);
}

* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    transition:
        background .25s ease,
        color .25s ease;
}

body.light-mode {
    --navy: #f2f6fa;
    --navy-2: #ffffff;
    --card: #ffffff;
    --card-2: #eef5fa;
    --border: #d3dfe9;
    --text: #102033;
    --muted: #607287;
    --blue: #087fa7;
    --blue-dark: #dff4fa;
    --gold: #9a6500;
    --shadow: 0 16px 45px rgba(22,44,66,.12);

    background: var(--navy);
    color: var(--text);
}

body.light-mode .navbar,
body.light-mode header,
body.light-mode footer {
    background: var(--navy-2);
}

body.light-mode .hero,
body.light-mode .subject-card,
body.light-mode .chapter-card,
body.light-mode .tool-card,
body.light-mode .test-card,
body.light-mode .progress-card,
body.light-mode .panel,
body.light-mode .recent-card,
body.light-mode .stat-card,
body.light-mode .hero-panel,
body.light-mode .feature-box {
    background: var(--card);
}

body.light-mode .muted {
    color: var(--muted);
}

a,
button,
input,
select,
textarea {
    transition:
        transform .2s ease,
        box-shadow .2s ease,
        border-color .2s ease,
        background .2s ease,
        color .2s ease;
}

button:hover,
.primary-button:hover,
.secondary-button:hover,
.btn:hover {
    transform: translateY(-2px);
}

.subject-card,
.chapter-card,
.tool-card,
.test-card,
.progress-card,
.panel,
.hero-panel,
.feature-box,
.recent-card,
.stat-card {
    box-shadow: var(--shadow);
}

.subject-card:hover,
.chapter-card:hover,
.tool-card:hover {
    transform: translateY(-6px);
    border-color: var(--blue);
    box-shadow: 0 18px 45px rgba(0,0,0,.24);
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(14px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@keyframes softGlow {
    0%, 100% {
        box-shadow: 0 0 0 rgba(72,215,255,0);
    }

    50% {
        box-shadow: 0 0 28px rgba(72,215,255,.15);
    }
}

.hero,
.subject-card,
.chapter-card,
.tool-card,
.test-card,
.progress-card,
.panel,
.hero-panel,
.feature-box,
.recent-card {
    animation: fadeUp .55s ease both;
}

.primary-button {
    animation: softGlow 3s ease-in-out infinite;
}

.progress-fill {
    transition:
        width .7s cubic-bezier(.2,.8,.2,1);
}

input:focus,
select:focus,
textarea:focus {
    outline: none;
    border-color: var(--blue) !important;
    box-shadow: 0 0 0 3px rgba(72,215,255,.10);
}

::selection {
    background: var(--blue);
    color: #06111b;
}

.page-loading {
    animation: fadeIn .35s ease both;
}

@media (max-width: 700px) {

    .nav-links {
        gap: 10px;
    }

    .navbar {
        padding: 15px 5%;
    }

    .section {
        padding-left: 6%;
        padding-right: 6%;
    }
}

@media (prefers-reduced-motion: reduce) {

    *,
    *::before,
    *::after {
        animation: none !important;
        transition: none !important;
        scroll-behavior: auto !important;
    }
}
'@

Set-Content `
    -LiteralPath (Join-Path $cssFolder "final-polish.css") `
    -Value $finalCss `
    -Encoding UTF8


# ============================================================
# 2. GLOBAL JAVASCRIPT
# ============================================================

$globalJs = @'
(function () {

    function loadTheme() {

        const savedTheme =
            localStorage.getItem("ronaldoTheme");

        if (savedTheme === "light") {

            document.body.classList.add(
                "light-mode"
            );

        }

    }


    window.toggleTheme = function () {

        document.body.classList.toggle(
            "light-mode"
        );

        const isLight =
            document.body.classList.contains(
                "light-mode"
            );

        localStorage.setItem(
            "ronaldoTheme",
            isLight ? "light" : "dark"
        );

    };


    window.exportStudyData = function () {

        const data = {};

        for (
            let i = 0;
            i < localStorage.length;
            i++
        ) {

            const key =
                localStorage.key(i);

            if (!key) {
                continue;
            }

            if (
                key.startsWith("ronaldo") ||
                key.startsWith("chapter-")
            ) {

                data[key] =
                    localStorage.getItem(key);

            }

        }


        const blob = new Blob(
            [
                JSON.stringify(
                    data,
                    null,
                    2
                )
            ],
            {
                type: "application/json"
            }
        );


        const url =
            URL.createObjectURL(blob);

        const link =
            document.createElement("a");

        link.href = url;

        link.download =
            "ronaldo-study-hub-backup.json";

        document.body.appendChild(link);

        link.click();

        link.remove();

        URL.revokeObjectURL(url);

    };


    window.importStudyData = function (file) {

        if (!file) {
            return;
        }


        const reader =
            new FileReader();


        reader.onload = function () {

            try {

                const data =
                    JSON.parse(
                        reader.result
                    );


                Object.keys(data).forEach(
                    function (key) {

                        if (
                            key.startsWith("ronaldo") ||
                            key.startsWith("chapter-")
                        ) {

                            localStorage.setItem(
                                key,
                                data[key]
                            );

                        }

                    }
                );


                alert(
                    "Study Hub data imported successfully."
                );


                location.reload();

            }
            catch (error) {

                alert(
                    "The backup file could not be imported."
                );

            }

        };


        reader.readAsText(file);

    };


    window.resetStudyData = function () {

        const confirmed =
            confirm(
                "Reset all Ronaldo Study Hub progress, test history, planner tasks, flashcards and saved settings from this browser?"
            );


        if (!confirmed) {
            return;
        }


        const keys = [];


        for (
            let i = 0;
            i < localStorage.length;
            i++
        ) {

            const key =
                localStorage.key(i);

            if (!key) {
                continue;
            }


            if (
                key.startsWith("ronaldo") ||
                key.startsWith("chapter-")
            ) {

                keys.push(key);

            }

        }


        keys.forEach(
            function (key) {

                localStorage.removeItem(
                    key
                );

            }
        );


        alert(
            "Study Hub data has been reset."
        );


        location.reload();

    };


    function registerServiceWorker() {

        if (
            !("serviceWorker" in navigator)
        ) {
            return;
        }


        /*
         Service Workers do not run on file:// pages.
         When the website is hosted using http/https,
         this registration enables offline caching.
        */

        if (
            location.protocol !== "http:" &&
            location.protocol !== "https:"
        ) {

            return;

        }


        const inChapter =
            location.pathname.includes(
                "/chapters/"
            );


        const serviceWorkerPath =
            inChapter
                ? "../sw.js"
                : "./sw.js";


        window.addEventListener(
            "load",
            function () {

                navigator.serviceWorker
                    .register(serviceWorkerPath)
                    .catch(
                        function (error) {

                            console.log(
                                "Service Worker registration failed:",
                                error
                            );

                        }
                    );

            }
        );

    }


    loadTheme();

    registerServiceWorker();


})();
'@

Set-Content `
    -LiteralPath (Join-Path $jsFolder "global.js") `
    -Value $globalJs `
    -Encoding UTF8


# ============================================================
# 3. SERVICE WORKER
# ============================================================

$serviceWorker = @'
const CACHE_NAME =
    "ronaldo-study-hub-v1";


const CORE_FILES = [

    "./",
    "./index.html",

    "./dashboard.html",
    "./test-center.html",
    "./daily-challenge.html",

    "./flashcards.html",
    "./quiz-arena.html",
    "./map-lab.html",

    "./study-planner.html",
    "./pdf-centre.html",
    "./exam-simulator.html",

    "./settings.html",

    "./css/style.css",
    "./css/final-polish.css",

    "./js/app.js",
    "./js/global.js",
    "./js/dashboard.js",
    "./js/test-center.js"

];


self.addEventListener(
    "install",
    function (event) {

        event.waitUntil(

            caches.open(
                CACHE_NAME
            )
            .then(
                function (cache) {

                    return cache.addAll(
                        CORE_FILES
                    );

                }
            )
            .then(
                function () {

                    return self.skipWaiting();

                }
            )

        );

    }
);


self.addEventListener(
    "activate",
    function (event) {

        event.waitUntil(

            caches.keys()
                .then(
                    function (keys) {

                        return Promise.all(

                            keys
                                .filter(
                                    function (key) {

                                        return (
                                            key !==
                                            CACHE_NAME
                                        );

                                    }
                                )
                                .map(
                                    function (key) {

                                        return caches.delete(
                                            key
                                        );

                                    }
                                )

                        );

                    }
                )
                .then(
                    function () {

                        return self.clients.claim();

                    }
                )

        );

    }
);


self.addEventListener(
    "fetch",
    function (event) {

        if (
            event.request.method !== "GET"
        ) {
            return;
        }


        event.respondWith(

            caches.match(
                event.request
            )
            .then(
                function (cached) {

                    if (cached) {
                        return cached;
                    }


                    return fetch(
                        event.request
                    )
                    .then(
                        function (response) {

                            const copy =
                                response.clone();


                            caches.open(
                                CACHE_NAME
                            )
                            .then(
                                function (cache) {

                                    cache.put(
                                        event.request,
                                        copy
                                    );

                                }
                            );


                            return response;

                        }
                    )
                    .catch(
                        function () {

                            return caches.match(
                                "./index.html"
                            );

                        }
                    );

                }
            )

        );

    }
);
'@

Set-Content `
    -LiteralPath (Join-Path $root "sw.js") `
    -Value $serviceWorker `
    -Encoding UTF8


# ============================================================
# 4. WEB APP MANIFEST
# ============================================================

$manifest = @'
{
    "name": "Ronaldo's Class 9 Social Science Study Hub",
    "short_name": "Ronaldo Study Hub",
    "start_url": "./index.html",
    "scope": "./",
    "display": "standalone",
    "background_color": "#07111f",
    "theme_color": "#07111f",
    "orientation": "portrait-primary",
    "description": "Class 9 Social Science Study Hub with study material, tests, quizzes and progress tracking."
}
'@

Set-Content `
    -LiteralPath (Join-Path $root "manifest.webmanifest") `
    -Value $manifest `
    -Encoding UTF8


# ============================================================
# 5. SETTINGS PAGE
# ============================================================

$settingsHtml = @'
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
Settings | Ronaldo's Study Hub
</title>

<link
    rel="stylesheet"
    href="css/style.css">

<link
    rel="stylesheet"
    href="css/final-polish.css">

</head>


<body>


<header class="navbar">

<a
    href="index.html"
    class="brand">

RONALDO'S
<span>STUDY HUB</span>

</a>


<a href="index.html">

Back to Home

</a>

</header>


<main class="section">


<div class="section-heading">

<p class="eyebrow">
PHASE 7 | SETTINGS
</p>

<h2>
Study Hub Settings
</h2>

<p>
Manage appearance and your local study data.
</p>

</div>


<div
    class="progress-card"
    style="
        max-width:850px;
        margin:auto;
    ">


<h3>
Appearance
</h3>


<button
    class="primary-button"
    onclick="toggleTheme()">

Toggle Dark / Light Mode

</button>


<h3
    style="margin-top:35px;">

Data Management

</h3>


<p class="muted">

Your study progress, test history,
planner tasks, flashcard data and
preferences are saved locally in
this browser.

</p>


<div
    style="
        display:flex;
        gap:10px;
        flex-wrap:wrap;
        margin-top:15px;
    ">


<button
    class="primary-button"
    onclick="exportStudyData()">

Export Backup

</button>


<label
    class="secondary-button"
    style="cursor:pointer;">

Import Backup

<input
    type="file"
    accept=".json"
    onchange="importStudyData(this.files[0])"
    style="display:none;">

</label>


<button
    class="secondary-button"
    onclick="resetStudyData()">

Reset Local Data

</button>


</div>


<h3
    style="margin-top:35px;">

Offline Support

</h3>


<p class="muted">

The Study Hub includes a Service Worker
and web app manifest for offline-friendly
use when served from a compatible
HTTP or HTTPS environment.

Opening HTML files directly with
file:// still works, but Chrome does
not enable Service Worker installation
from file:// pages.

</p>


</div>

</main>


<script src="js/global.js"></script>

</body>

</html>
'@

Set-Content `
    -LiteralPath (Join-Path $root "settings.html") `
    -Value $settingsHtml `
    -Encoding UTF8


# ============================================================
# 6. PATCH MAIN INDEX
# ============================================================

$indexPath =
    Join-Path $root "index.html"


if (Test-Path $indexPath) {

    $index =
        Get-Content `
            -LiteralPath $indexPath `
            -Raw


    # Add final CSS

    if (
        $index -notmatch
        "css/final-polish.css"
    ) {

        $index =
            $index.Replace(
                '<link rel="stylesheet" href="css/style.css">',
                '<link rel="stylesheet" href="css/style.css">' +
                [Environment]::NewLine +
                '    <link rel="stylesheet" href="css/final-polish.css">'
            );

    }


    # Add manifest

    if (
        $index -notmatch
        "manifest.webmanifest"
    ) {

        $index =
            $index.Replace(
                "</head>",
                '    <link rel="manifest" href="manifest.webmanifest">' +
                [Environment]::NewLine +
                "</head>"
            );

    }


    # Add Settings navigation

    if (
        $index -notmatch
        'href="settings.html"'
    ) {

        $index =
            $index.Replace(
                "</nav>",
                '        <a href="settings.html">Settings</a>' +
                [Environment]::NewLine +
                "    </nav>"
            );

    }


    # Add global JavaScript

    if (
        $index -notmatch
        "js/global.js"
    ) {

        $index =
            $index.Replace(
                '<script src="js/app.js"></script>',
                '<script src="js/global.js"></script>' +
                [Environment]::NewLine +
                '<script src="js/app.js"></script>'
            );

    }


    Set-Content `
        -LiteralPath $indexPath `
        -Value $index `
        -Encoding UTF8

}


# ============================================================
# 7. PATCH ROOT HTML PAGES
# ============================================================

$rootPages =
    Get-ChildItem `
        -LiteralPath $root `
        -Filter "*.html" `
        -File


foreach ($page in $rootPages) {

    $html =
        Get-Content `
            -LiteralPath $page.FullName `
            -Raw


    if (
        $html -notmatch
        "css/final-polish.css"
    ) {

        $html =
            $html.Replace(
                "</head>",
                '    <link rel="stylesheet" href="css/final-polish.css">' +
                [Environment]::NewLine +
                "</head>"
            );

    }


    if (
        $html -notmatch
        "js/global.js"
    ) {

        $html =
            $html.Replace(
                "</body>",
                '<script src="js/global.js"></script>' +
                [Environment]::NewLine +
                "</body>"
            );

    }


    if (
        $html -notmatch
        "manifest.webmanifest"
    ) {

        $html =
            $html.Replace(
                "</head>",
                '    <link rel="manifest" href="manifest.webmanifest">' +
                [Environment]::NewLine +
                "</head>"
            );

    }


    Set-Content `
        -LiteralPath $page.FullName `
        -Value $html `
        -Encoding UTF8

}


# ============================================================
# 8. PATCH CHAPTER PAGES
# ============================================================

$chapterFolder =
    Join-Path $root "chapters"


if (Test-Path $chapterFolder) {

    $chapterPages =
        Get-ChildItem `
            -LiteralPath $chapterFolder `
            -Filter "*.html" `
            -File


    foreach ($page in $chapterPages) {

        $html =
            Get-Content `
                -LiteralPath $page.FullName `
                -Raw


        if (
            $html -notmatch
            "../css/final-polish.css"
        ) {

            $html =
                $html.Replace(
                    "</head>",
                    '    <link rel="stylesheet" href="../css/final-polish.css">' +
                    [Environment]::NewLine +
                    "</head>"
                );

        }


        if (
            $html -notmatch
            "../js/global.js"
        ) {

            $html =
                $html.Replace(
                    "</body>",
                    '<script src="../js/global.js"></script>' +
                    [Environment]::NewLine +
                    "</body>"
                );

        }


        Set-Content `
            -LiteralPath $page.FullName `
            -Value $html `
            -Encoding UTF8

    }

}


# ============================================================
# 9. FINISHED
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "PHASE 7 INSTALLED SUCCESSFULLY" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Created:" -ForegroundColor Yellow

Write-Host "sw.js"
Write-Host "manifest.webmanifest"
Write-Host "settings.html"
Write-Host "css\final-polish.css"
Write-Host "js\global.js"

Write-Host ""

Write-Host "Added:" -ForegroundColor Yellow

Write-Host "Smooth animations"
Write-Host "Dark / Light mode"
Write-Host "Settings"
Write-Host "Backup export"
Write-Host "Backup import"
Write-Host "Local data reset"
Write-Host "PWA manifest"
Write-Host "Service Worker"
Write-Host "Mobile polish"

Write-Host ""

Write-Host "Open the website with:" -ForegroundColor Cyan
Write-Host "start index.html"

Write-Host ""