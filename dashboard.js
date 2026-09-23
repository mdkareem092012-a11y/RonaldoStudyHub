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
