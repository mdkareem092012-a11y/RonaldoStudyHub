# ==========================================
# RONALDO STUDY HUB
# AUTOMATIC 9-CHAPTER PAGE GENERATOR
# ==========================================

$root = $PSScriptRoot
$chapterFolder = Join-Path $root "chapters"

New-Item -ItemType Directory -Path $chapterFolder -Force | Out-Null

# CHAPTER DATABASE

$chapters = @(

    [PSCustomObject]@{
        Number="01"
        Title="Understanding Social Science"
        Subject="Social Science"
        Pdf="iest101.pdf"
    }

    [PSCustomObject]@{
        Number="02"
        Title="Shaping of the Earth's Surface"
        Subject="Geography"
        Pdf="iest102.pdf"
    }

    [PSCustomObject]@{
        Number="03"
        Title="Atmosphere and Climate"
        Subject="Geography"
        Pdf="iest103.pdf"
    }

    [PSCustomObject]@{
        Number="04"
        Title="Early Humans and Beginning of Civilisation"
        Subject="History"
        Pdf="iest104.pdf"
    }

    [PSCustomObject]@{
        Number="05"
        Title="State and Society up to 1000 CE"
        Subject="History"
        Pdf="iest105.pdf"
    }

    [PSCustomObject]@{
        Number="06"
        Title="Democracy"
        Subject="Political Science"
        Pdf="iest106.pdf"
    }

    [PSCustomObject]@{
        Number="07"
        Title="Elections"
        Subject="Political Science"
        Pdf="iest107.pdf"
    }

    [PSCustomObject]@{
        Number="08"
        Title="Building Blocks in Economics: The Problem of Choice"
        Subject="Economics"
        Pdf="iest108.pdf"
    }

    [PSCustomObject]@{
        Number="09"
        Title="The Price Puzzle: What Drives the Market"
        Subject="Economics"
        Pdf="iest109.pdf"
    }
)

# CHAPTER PAGE DESIGN

$template = @'
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Chapter __NUM__ | Ronaldo Study Hub</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    scroll-behavior: smooth;
}

body {
    background: #080e1b;
    color: #f5f7ff;
    font-family: Arial, sans-serif;
    line-height: 1.7;
}

header {
    padding: 22px 8%;
    background: #0c1527;
    border-bottom: 1px solid #263650;
}

header a {
    color: #42d5ff;
    text-decoration: none;
}

.container {
    max-width: 1050px;
    margin: auto;
    padding: 45px 20px;
}

.hero {
    padding: 35px;
    background: linear-gradient(135deg, #132b49, #101a2c);
    border: 1px solid #263c59;
    border-radius: 15px;
    margin-bottom: 30px;
}

.label {
    color: #42d5ff;
    font-size: 12px;
    letter-spacing: 2px;
}

h1 {
    font-size: clamp(28px, 5vw, 42px);
    line-height: 1.3;
    margin: 15px 0;
}

h1 span {
    color: #42d5ff;
}

.hero p {
    color: #afbdd2;
}

.card {
    background: #101b2e;
    border: 1px solid #263650;
    border-radius: 12px;
    padding: 28px;
    margin-bottom: 22px;
}

h2 {
    color: #42d5ff;
    margin-bottom: 15px;
    font-size: 23px;
}

h3 {
    margin: 12px 0;
}

p {
    margin-bottom: 12px;
}

.note {
    color: #afbdd2;
    font-size: 14px;
}

details {
    background: #0b1526;
    padding: 15px;
    border-radius: 7px;
    margin-top: 12px;
}

summary {
    cursor: pointer;
    font-weight: bold;
}

.answer {
    color: #b8c7dd;
    margin-top: 12px;
}

.btn {
    display: inline-block;
    background: #42d5ff;
    color: #07111e;
    padding: 11px 18px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    margin: 8px 5px 8px 0;
}

.btn:hover {
    opacity: 0.85;
}

.secondary {
    background: #1a304d;
    color: #42d5ff;
    border: 1px solid #345274;
}

.pdf-viewer {
    width: 100%;
    height: 600px;
    border: 1px solid #2a3c57;
    border-radius: 8px;
    margin-top: 20px;
    background: white;
}

footer {
    text-align: center;
    padding: 30px;
    background: #0c1527;
    color: #9baac1;
}

@media(max-width:600px) {

    .container {
        padding: 25px 14px;
    }

    .hero, .card {
        padding: 20px;
    }

    .pdf-viewer {
        height: 420px;
    }
}

</style>

</head>

<body>

<header>
    <a href="../index.html">
        ← Back to Ronaldo Study Hub
    </a>
</header>

<main class="container">

    <section class="hero">

        <p class="label">
            CBSE CLASS IX | SOCIAL SCIENCE
        </p>

        <h1>
            Chapter __NUM__:<br>
            <span>__TITLE__</span>
        </h1>

        <p>
            Subject: __SUBJECT__
        </p>

        <p>
            Study, practice, revise, and prepare for your exams.
        </p>

        <a href="#study" class="btn">
            Start Learning ↓
        </a>

    </section>

    <!-- CHAPTER NOTES -->

    <section class="card" id="study">

        <h2>📖 Chapter Notes</h2>

        <p class="note">
            Add chapter-specific revision notes here after
            reviewing your uploaded PDF and NCERT material.
        </p>

        <details>
            <summary>Important Concepts</summary>

            <div class="answer">
                Add key concepts and definitions from this chapter.
            </div>
        </details>

        <details>
            <summary>Quick Revision</summary>

            <div class="answer">
                Add a short chapter summary for revision.
            </div>
        </details>

    </section>

    <!-- IMPORTANT QUESTIONS -->

    <section class="card">

        <h2>❓ Important Questions & Answers</h2>

        <p class="note">
            Add verified textbook questions and their answers here.
        </p>

        <details>
            <summary>Question 1 — Add your question</summary>

            <div class="answer">
                Add the correct answer here.
            </div>
        </details>

        <details>
            <summary>Question 2 — Add your question</summary>

            <div class="answer">
                Add the correct answer here.
            </div>
        </details>

        <details>
            <summary>Question 3 — Add your question</summary>

            <div class="answer">
                Add the correct answer here.
            </div>
        </details>

    </section>

    <!-- EXTRA QUESTIONS -->

    <section class="card">

        <h2>⭐ Extra Practice Questions</h2>

        <p class="note">
            Add chapter-specific short-answer, long-answer,
            and application-based practice questions here.
        </p>

        <details>
            <summary>Short Answer Questions</summary>

            <div class="answer">
                Add extra short-answer questions here.
            </div>
        </details>

        <details>
            <summary>Long Answer Questions</summary>

            <div class="answer">
                Add extra long-answer questions here.
            </div>
        </details>

        <details>
            <summary>Higher Order Thinking Questions</summary>

            <div class="answer">
                Add HOTS questions here.
            </div>
        </details>

    </section>

    <!-- MCQ -->

    <section class="card">

        <h2>🧠 MCQ Practice</h2>

        <p class="note">
            Add chapter-based MCQs, options, correct answers,
            and explanations here.
        </p>

        <details>
            <summary>MCQ 1 — Add your question</summary>

            <div class="answer">
                Add options and the correct answer here.
            </div>
        </details>

        <details>
            <summary>MCQ 2 — Add your question</summary>

            <div class="answer">
                Add options and the correct answer here.
            </div>
        </details>

    </section>

    <!-- SAMPLE PAPER -->

    <section class="card">

        <h2>📝 Chapter Sample Paper</h2>

        <p><b>Class:</b> IX</p>
        <p><b>Subject:</b> Social Science</p>
        <p><b>Chapter:</b> __TITLE__</p>

        <p class="note">
            Add a chapter-specific sample paper with marks,
            instructions, and exam-style questions here.
        </p>

        <details>
            <summary>Section A — MCQs</summary>

            <div class="answer">
                Add MCQs with marks here.
            </div>
        </details>

        <details>
            <summary>Section B — Short Answer</summary>

            <div class="answer">
                Add short-answer questions with marks here.
            </div>
        </details>

        <details>
            <summary>Section C — Long Answer</summary>

            <div class="answer">
                Add long-answer questions with marks here.
            </div>
        </details>

    </section>

    <!-- ANSWER KEY -->

    <section class="card">

        <h2>🔑 Answer Key & Solutions</h2>

        <p class="note">
            Add verified answers and explanations for the
            chapter sample paper and practice exercises.
        </p>

    </section>

    <!-- ORIGINAL PDF -->

    <section class="card">

        <h2>📄 Original Chapter PDF</h2>

        <p class="note">
            Read your uploaded study material directly below,
            or open it separately and download it.
        </p>

        <a class="btn"
           href="../materials/iest1dd/__PDF__"
           target="_blank">
            Open PDF ↗
        </a>

        <a class="btn secondary"
           href="../materials/iest1dd/__PDF__"
           download>
            Download PDF ↓
        </a>

        <iframe
            class="pdf-viewer"
            src="../materials/iest1dd/__PDF__"
            title="Chapter PDF">
        </iframe>

    </section>

    <a class="btn secondary" href="../index.html">
        ← Return to Homepage
    </a>

</main>

<footer>

    <h3>RONALDO STUDY HUB</h3>

    <p>Learn · Practice · Achieve</p>

    <p>CBSE Class IX | Social Science</p>

</footer>

</body>
</html>
'@

# GENERATE ALL CHAPTER PAGES

foreach ($chapter in $chapters) {

    $html = $template

    $html = $html.Replace("__NUM__", $chapter.Number)
    $html = $html.Replace("__TITLE__", $chapter.Title)
    $html = $html.Replace("__SUBJECT__", $chapter.Subject)
    $html = $html.Replace("__PDF__", $chapter.Pdf)

    $fileName = "chapter-" + $chapter.Number + ".html"

    $filePath = Join-Path $chapterFolder $fileName

    Set-Content -LiteralPath $filePath `
        -Value $html -Encoding UTF8

    Write-Host "Created: $fileName" -ForegroundColor Green
}

Write-Host ""
Write-Host "ALL 9 CHAPTER PAGES CREATED!" -ForegroundColor Cyan
Write-Host "Your Ronaldo Study Hub is ready." -ForegroundColor Yellow