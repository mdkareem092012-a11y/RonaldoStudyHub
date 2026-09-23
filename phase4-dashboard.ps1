# ==============================================
# RONALDO STUDY HUB - PHASE 4 INSTALLER
# STUDENT DASHBOARD + PROGRESS TRACKER
# ==============================================
# Place this file in:
# Desktop\RonaldoStudyHub\phase4-dashboard.ps1
#
# Run from CMD:
# cd %USERPROFILE%\Desktop\RonaldoStudyHub
# powershell -NoProfile -ExecutionPolicy Bypass -File .\phase4-dashboard.ps1

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$jsFolder = Join-Path $root "js"
$chaptersFolder = Join-Path $root "chapters"

New-Item -ItemType Directory -Path $jsFolder -Force | Out-Null

# ---------------------------------------------
# 1. CREATE DASHBOARD PAGE
# ---------------------------------------------

$dashboardHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard | Ronaldo's Study Hub</title>

<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{position:sticky;top:0;z-index:20;background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1180px;margin:auto;padding:35px 18px 70px}
.hero,.panel,.stat,.subject-card,.recent-card{background:#101d31;border:1px solid #263b58;border-radius:14px}
.hero{padding:30px;margin-bottom:20px;background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(32px,5vw,52px);margin:9px 0;line-height:1.15}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:15px;margin-bottom:20px}
.stat{padding:22px}
.stat strong{display:block;color:#48d7ff;font-size:32px}
.stat span{color:#aab8ca;font-size:13px}
.grid2{display:grid;grid-template-columns:1fr 1fr;gap:20px;margin-bottom:20px}
.panel{padding:24px}
.progress-row{margin:16px 0}
.progress-label{display:flex;justify-content:space-between;margin-bottom:7px}
.progress-label span{color:#aab8ca}
.progress-label strong{color:#48d7ff}
.track{height:10px;background:#17314d;border-radius:20px;overflow:hidden}
.fill{height:100%;background:linear-gradient(90deg,#48d7ff,#e7ba63);border-radius:20px;transition:.4s}
.subject-row{padding:14px 0;border-bottom:1px solid #263b58}
.subject-row:last-child{border-bottom:0}
.recent{display:grid;grid-template-columns:repeat(3,1fr);gap:15px}
.recent-card{padding:18px}
.recent-card h3{margin:8px 0}
.recent-card a{color:#48d7ff;text-decoration:none;font-weight:800;font-size:13px}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:20px}
.btn{display:inline-block;padding:11px 17px;border-radius:7px;background:#48d7ff;color:#06111b;text-decoration:none;font-weight:800;border:0;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
.empty{padding:14px;background:#0b1628;border-radius:8px;color:#aab8ca}
footer{text-align:center;padding:35px 15px;background:#0c1728;border-top:1px solid #263b58;color:#9eacc1}
footer strong{color:#48d7ff}
@media(max-width:950px){.stats{grid-template-columns:repeat(2,1fr)}.recent{grid-template-columns:1fr 1fr}}
@media(max-width:700px){.grid2,.recent{grid-template-columns:1fr}.stats{grid-template-columns:1fr 1fr}}
@media(max-width:480px){.stats{grid-template-columns:1fr}}
</style>
</head>

<body>

<header>
<a href="index.html">&larr; Back to Ronaldo's Study Hub</a>
</header>

<main>

<section class="hero">
<p class="eyebrow">PHASE 4 | STUDENT DASHBOARD</p>
<h1>Your Learning Progress</h1>
<p class="muted">
Track completed chapters, test performance, study streaks,
subject progress and recently studied chapters. Your data
stays in this browser.
</p>

<div class="actions">
<a class="btn" href="test-center.html">Open Test Centre</a>
<a class="btn secondary" href="daily-challenge.html">Daily Challenge</a>
<a class="btn secondary" href="index.html#chapters">Study Chapters</a>
</div>
</section>


<section class="stats">

<div class="stat">
<strong id="overallPercent">0%</strong>
<span>Overall Completion</span>
</div>

<div class="stat">
<strong id="completedCount">0</strong>
<span>Completed Chapters</span>
</div>

<div class="stat">
<strong id="bestScore">0%</strong>
<span>Best Test Score</span>
</div>

<div class="stat">
<strong id="streak">0</strong>
<span>Study Streak</span>
</div>

</section>


<div class="grid2">

<section class="panel">
<h2>Overall Progress</h2>

<div class="progress-row">
<div class="progress-label">
<span>Chapters Completed</span>
<strong id="overallLabel">0%</strong>
</div>

<div class="track">
<div class="fill" id="overallBar" style="width:0%"></div>
</div>
</div>

<p class="muted" id="completionText">
0 of 9 chapters completed.
</p>
</section>


<section class="panel">
<h2>Study Summary</h2>

<div class="subject-row">
<strong>Daily Challenge</strong>
<div class="muted" id="dailyScore">
Not attempted
</div>
</div>

<div class="subject-row">
<strong>Last Studied</strong>
<div class="muted" id="lastStudied">
No chapter recorded yet
</div>
</div>

<div class="subject-row">
<strong>Tests Taken</strong>
<div class="muted" id="testsTaken">
0
</div>
</div>
</section>

</div>


<div class="grid2">

<section class="panel">
<h2>Subject Progress</h2>
<div id="subjectProgress"></div>
</section>


<section class="panel">
<h2>Performance Overview</h2>
<div id="performance"></div>
</section>

</div>


<section class="panel">
<h2>Recently Studied Chapters</h2>
<div class="recent" id="recentChapters"></div>
</section>

</main>


<footer>
<strong>RONALDO'S CLASS 9 SOCIAL SCIENCE STUDY HUB</strong><br>
Explore. Learn. Practise. Achieve.<br>
Made by Ronaldo
</footer>

<script src="js/dashboard.js"></script>

</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "dashboard.html") -Value $dashboardHtml -Encoding UTF8

# ---------------------------------------------
# 2. CREATE DASHBOARD JAVASCRIPT
# ---------------------------------------------

$dashboardJs = @'
const DASHBOARD_CHAPTERS = [
    {n:1,title:"Understanding Social Science",subject:"Introduction to Social Science",link:"chapters/chapter-01.html"},
    {n:2,title:"Shaping of the Earth's Surface",subject:"Geography",link:"chapters/chapter-02.html"},
    {n:3,title:"Atmosphere and Climate",subject:"Geography",link:"chapters/chapter-03.html"},
    {n:4,title:"Early Humans and Beginning of Civilisation",subject:"History",link:"chapters/chapter-04.html"},
    {n:5,title:"State and Society up to 1000 CE",subject:"History",link:"chapters/chapter-05.html"},
    {n:6,title:"Democracy",subject:"Political Science",link:"chapters/chapter-06.html"},
    {n:7,title:"Elections",subject:"Political Science",link:"chapters/chapter-07.html"},
    {n:8,title:"Building Blocks in Economics: The Problem of Choice",subject:"Economics",link:"chapters/chapter-08.html"},
    {n:9,title:"The Price Puzzle: What Drives the Market",subject:"Economics",link:"chapters/chapter-09.html"}
];

function getHistory(){
    try{
        return JSON.parse(localStorage.getItem("ronaldoTestHistory")) || [];
    }catch{
        return [];
    }
}

function getCompleted(){
    const completed = [];

    for(let i=1;i<=9;i++){
        const key = "chapter-" + String(i).padStart(2,"0") + "-checklist";

        try{
            const state = JSON.parse(localStorage.getItem(key));

            if(Array.isArray(state) && state.length > 0 && state.every(Boolean)){
                completed.push(i);
            }
        }catch{}
    }

    return completed;
}

function getSubjectProgress(completed){
    const result = {
        "Introduction to Social Science": {done:0,total:1},
        "History": {done:0,total:2},
        "Geography": {done:0,total:2},
        "Political Science": {done:0,total:2},
        "Economics": {done:0,total:2}
    };

    DASHBOARD_CHAPTERS.forEach(chapter=>{
        if(completed.includes(chapter.n)){
            result[chapter.subject].done++;
        }
    });

    return result;
}

function renderSubjectProgress(completed){
    const container = document.getElementById("subjectProgress");
    const data = getSubjectProgress(completed);

    container.innerHTML = Object.entries(data).map(([subject,value])=>{
        const percent = Math.round((value.done / value.total) * 100);

        return `
            <div class="progress-row">
                <div class="progress-label">
                    <span>${subject}</span>
                    <strong>${percent}%</strong>
                </div>
                <div class="track">
                    <div class="fill" style="width:${percent}%"></div>
                </div>
                <p class="muted">${value.done} of ${value.total} chapters completed.</p>
            </div>
        `;
    }).join("");
}

function renderPerformance(history){
    const container = document.getElementById("performance");

    if(!history.length){
        container.innerHTML =
            '<div class="empty">No tests completed yet. Take your first test in the Test Centre.</div>';
        return;
    }

    const scores = history.map(item=>Number(item.percentage)||0);
    const best = Math.max(...scores);
    const average = Math.round(
        scores.reduce((a,b)=>a+b,0) / scores.length
    );

    container.innerHTML = `
        <div class="subject-row">
            <strong>Tests Taken</strong>
            <div class="muted">${history.length}</div>
        </div>
        <div class="subject-row">
            <strong>Best Score</strong>
            <div class="muted">${best}%</div>
        </div>
        <div class="subject-row">
            <strong>Average Score</strong>
            <div class="muted">${average}%</div>
        </div>
    `;
}

function renderRecent(){
    const container = document.getElementById("recentChapters");
    const last = Number(localStorage.getItem("ronaldoLastChapter")) || 0;

    let ordered = [...DASHBOARD_CHAPTERS];

    if(last){
        ordered.sort((a,b)=>{
            if(a.n === last) return -1;
            if(b.n === last) return 1;
            return a.n - b.n;
        });
    }

    const selected = ordered.slice(0,3);

    container.innerHTML = selected.map(chapter=>`
        <article class="recent-card">
            <p class="eyebrow">CHAPTER ${String(chapter.n).padStart(2,"0")}</p>
            <h3>${chapter.title}</h3>
            <p class="muted">${chapter.subject}</p>
            <a href="${chapter.link}">Open Chapter &rarr;</a>
        </article>
    `).join("");

    if(last){
        const lastChapter = DASHBOARD_CHAPTERS.find(x=>x.n===last);
        document.getElementById("lastStudied").textContent =
            "Chapter " + last + ": " + lastChapter.title;
    }
}

function renderDashboard(){

    const completed = getCompleted();
    const history = getHistory();

    const total = DASHBOARD_CHAPTERS.length;
    const overall = Math.round((completed.length / total) * 100);

    document.getElementById("overallPercent").textContent = overall + "%";
    document.getElementById("overallLabel").textContent = overall + "%";
    document.getElementById("overallBar").style.width = overall + "%";
    document.getElementById("completedCount").textContent = completed.length;

    document.getElementById("completionText").textContent =
        completed.length + " of " + total + " chapters completed.";

    const best = history.length
        ? Math.max(...history.map(item=>Number(item.percentage)||0))
        : 0;

    document.getElementById("bestScore").textContent = best + "%";

    const streak = localStorage.getItem("ronaldoStudyStreak") || "0";
    document.getElementById("streak").textContent = streak;

    const daily = localStorage.getItem("ronaldoDailyChallengeScore");

    document.getElementById("dailyScore").textContent =
        daily === null ? "Not attempted" : daily + "%";

    document.getElementById("testsTaken").textContent = history.length;

    renderSubjectProgress(completed);
    renderPerformance(history);
    renderRecent();
}

document.addEventListener("DOMContentLoaded",renderDashboard);
'@

Set-Content -LiteralPath (Join-Path $jsFolder "dashboard.js") -Value $dashboardJs -Encoding UTF8

# ---------------------------------------------
# 3. UPDATE INDEX.HTML
# ---------------------------------------------

$indexPath = Join-Path $root "index.html"

if(Test-Path $indexPath){

    $index = Get-Content -LiteralPath $indexPath -Raw

    # Replace the old Progress navigation target.
    $index = $index.Replace(
        '<a href="#progress">Progress</a>',
        '<a href="dashboard.html">Dashboard</a>'
    )

    # If the replacement above was already done, make sure there is
    # still a dashboard link by adding one after the Tests link.
    if($index -notmatch 'href="dashboard.html"'){
        $index = $index.Replace(
            '<a href="test-center.html">Tests</a>',
            '<a href="test-center.html">Tests</a>' + [Environment]::NewLine + '        <a href="dashboard.html">Dashboard</a>'
        )
    }

    # Add a dashboard button next to the existing Test Centre button
    # only if it is not already present.
    if($index -notmatch 'href="dashboard.html".*Dashboard' -and $index -notmatch 'Open Dashboard'){
        $marker = '<a class="primary-button" href="test-center.html">'
        if($index.Contains($marker)){
            # Leave the Test Centre area intact; the top navigation is enough.
        }
    }

    Set-Content -LiteralPath $indexPath -Value $index -Encoding UTF8
}

# ---------------------------------------------
# 4. PATCH CHAPTER PAGES TO RECORD
#    THE LAST STUDIED CHAPTER
# ---------------------------------------------

if(Test-Path $chaptersFolder){

    for($i=1; $i -le 9; $i++){

        $file = Join-Path $chaptersFolder ("chapter-" + $i.ToString("00") + ".html")

        if(Test-Path $file){

            $html = Get-Content -LiteralPath $file -Raw

            $number = $i.ToString("00")

            $trackingScript = @"

<script>
localStorage.setItem("ronaldoLastChapter","$i");
</script>
"@

            if($html -notmatch 'ronaldoLastChapter'){
                $html = $html.Replace("</body>", $trackingScript + "`r`n</body>")
                Set-Content -LiteralPath $file -Value $html -Encoding UTF8
            }
        }
    }
}

Write-Host ""
Write-Host "PHASE 4 INSTALLED SUCCESSFULLY." -ForegroundColor Cyan
Write-Host ""
Write-Host "Created:" -ForegroundColor Yellow
Write-Host "dashboard.html"
Write-Host "js\dashboard.js"
Write-Host ""
Write-Host "Updated:" -ForegroundColor Yellow
Write-Host "index.html"
Write-Host "chapter pages now record last studied chapter"
Write-Host ""
Write-Host "Open the dashboard with:" -ForegroundColor Cyan
Write-Host "start dashboard.html"
