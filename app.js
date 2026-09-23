const TOTAL_CHAPTERS = 9;

const chapterLinks = {
    1: "chapters/chapter-01.html",
    2: "chapters/chapter-02.html",
    3: "chapters/chapter-03.html",
    4: "chapters/chapter-04.html",
    5: "chapters/chapter-05.html",
    6: "chapters/chapter-06.html",
    7: "chapters/chapter-07.html",
    8: "chapters/chapter-08.html",
    9: "chapters/chapter-09.html"
};

let selectedSubject = "All";


function getCompletedChapters() {

    const saved = localStorage.getItem("ronaldoCompletedChapters");

    if (!saved) {
        return [];
    }

    try {
        return JSON.parse(saved);
    } catch {
        return [];
    }
}


function getBestScore() {

    const saved = localStorage.getItem("ronaldoBestScore");

    if (!saved) {
        return 0;
    }

    return Number(saved) || 0;
}


function updateDashboard() {

    const completed = getCompletedChapters();

    const percentage = Math.round(
        (completed.length / TOTAL_CHAPTERS) * 100
    );

    document.getElementById("heroProgress").textContent =
        percentage + "%";

    document.getElementById("heroProgressBar").style.width =
        percentage + "%";

    document.getElementById("progressPercent").textContent =
        percentage + "%";

    document.getElementById("mainProgressBar").style.width =
        percentage + "%";

    document.getElementById("completedCount").textContent =
        completed.length;

    document.getElementById("statsCompleted").textContent =
        completed.length;

    document.getElementById("progressText").textContent =
        completed.length +
        " of " +
        TOTAL_CHAPTERS +
        " chapters completed.";

    const score = getBestScore();

    document.getElementById("bestScore").textContent =
        score + "%";

    document.getElementById("statsScore").textContent =
        score + "%";

    const streak =
        localStorage.getItem("ronaldoStudyStreak") || "0";

    document.getElementById("studyStreak").textContent =
        streak + (streak === "1" ? " day" : " days");
}


function continueLearning() {

    const completed = getCompletedChapters();

    let chapterNumber = 1;

    for (let i = 1; i <= TOTAL_CHAPTERS; i++) {

        if (!completed.includes(i)) {
            chapterNumber = i;
            break;
        }
    }

    localStorage.setItem(
        "ronaldoLastChapter",
        String(chapterNumber)
    );

    window.location.href = chapterLinks[chapterNumber];
}


function openFeaturedChapter() {

    const saved =
        Number(localStorage.getItem("ronaldoLastChapter")) || 1;

    window.location.href =
        chapterLinks[saved] || chapterLinks[1];
}


function selectSubject(subject) {

    selectedSubject = subject;

    const select =
        document.getElementById("subjectFilter");

    if (select) {
        select.value = subject;
    }

    filterChapters();
}


function filterChapters() {

    const searchInput =
        document.getElementById("chapterSearch");

    const searchTerm =
        searchInput.value.toLowerCase().trim();

    const cards =
        document.querySelectorAll(".chapter-card");

    let visible = 0;

    cards.forEach(card => {

        const title =
            card.dataset.title.toLowerCase();

        const subject =
            card.dataset.subject;

        const matchesSearch =
            title.includes(searchTerm);

        const matchesSubject =
            selectedSubject === "All" ||
            subject === selectedSubject;

        if (matchesSearch && matchesSubject) {

            card.style.display = "";

            visible++;

        } else {

            card.style.display = "none";
        }

    });

    document.getElementById("noResults").style.display =
        visible === 0 ? "block" : "none";
}


function toggleTheme() {

    document.body.classList.toggle("light-mode");

    const lightMode =
        document.body.classList.contains("light-mode");

    localStorage.setItem(
        "ronaldoTheme",
        lightMode ? "light" : "dark"
    );
}


function loadTheme() {

    const theme =
        localStorage.getItem("ronaldoTheme");

    if (theme === "light") {

        document.body.classList.add("light-mode");

    }
}


function comingSoon(feature) {

    alert(
        feature +
        " is planned for the next development phase."
    );
}


function updateFeaturedChapter() {

    const lastChapter =
        Number(localStorage.getItem("ronaldoLastChapter")) || 1;

    const titles = {

        1: "Understanding Social Science",

        2: "Shaping of the Earth's Surface",

        3: "Atmosphere and Climate",

        4: "Early Humans and Beginning of Civilisation",

        5: "State and Society up to 1000 CE",

        6: "Democracy",

        7: "Elections",

        8: "The Problem of Choice",

        9: "The Price Puzzle"

    };

    const subjects = {

        1: "Social Science",

        2: "Geography",

        3: "Geography",

        4: "History",

        5: "History",

        6: "Political Science",

        7: "Political Science",

        8: "Economics",

        9: "Economics"

    };

    document.getElementById("featuredTitle").textContent =
        titles[lastChapter] || titles[1];

    document.getElementById("featuredNumber").textContent =
        "CHAPTER " +
        String(lastChapter).padStart(2, "0");

    document.getElementById("featuredSubject").textContent =
        subjects[lastChapter] || subjects[1];

    document.getElementById("featuredDescription").textContent =
        "Continue your preparation with " +
        titles[lastChapter] +
        ".";
}


document.addEventListener("DOMContentLoaded", function () {

    loadTheme();

    updateDashboard();

    updateFeaturedChapter();

});
function startDailyChallenge() {
    window.location.href = "daily-challenge.html";
}

