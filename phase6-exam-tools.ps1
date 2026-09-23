# ============================================================
# RONALDO STUDY HUB - PHASE 6 INSTALLER
# STUDY PLANNER + PDF CENTRE + EXAM SIMULATOR
# ============================================================
# Put this file in:
# Desktop\RonaldoStudyHub\phase6-exam-tools.ps1
#
# Run from CMD:
# cd %USERPROFILE%\Desktop\RonaldoStudyHub
# powershell -NoProfile -ExecutionPolicy Bypass -File .\phase6-exam-tools.ps1

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$jsFolder = Join-Path $root "js"
New-Item -ItemType Directory -Path $jsFolder -Force | Out-Null

# ------------------------------------------------------------
# 1. STUDY PLANNER
# ------------------------------------------------------------

$plannerHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Study Planner | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1120px;margin:auto;padding:35px 18px 70px}
.hero,.panel{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:25px;margin-bottom:20px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(30px,5vw,50px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.form-grid{display:grid;grid-template-columns:1.3fr .7fr .7fr .8fr;gap:10px}
input,select{width:100%;padding:12px;border-radius:7px;border:1px solid #345b7d;background:#0b1628;color:#f4f7fb}
button{border:0;border-radius:7px;padding:11px 17px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
.task{display:grid;grid-template-columns:1fr auto;gap:15px;padding:14px 0;border-bottom:1px solid #263b58}
.task:last-child{border-bottom:0}
.task-title{font-weight:800}
.task.done .task-title{text-decoration:line-through;color:#7f91a7}
.task-meta{font-size:12px;color:#9eacc1}
.badge{display:inline-block;padding:4px 8px;border-radius:20px;background:#17314d;color:#48d7ff;font-size:11px}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:15px}
.countdown{font-size:28px;color:#e7ba63;font-weight:900}
@media(max-width:850px){.form-grid{grid-template-columns:1fr 1fr}.task{grid-template-columns:1fr}}
@media(max-width:600px){.form-grid{grid-template-columns:1fr}}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 6 | STUDY PLANNER</p>
<h1>Plan Your Study Time</h1>
<p class="muted">Create daily tasks, set a study time, mark work complete, and keep everything saved in this browser.</p>
</section>

<section class="panel">
<h2>Add a Study Task</h2>
<div class="form-grid">
<input id="taskInput" placeholder="Example: Revise Democracy">
<select id="subjectInput">
<option>History</option>
<option>Geography</option>
<option>Political Science</option>
<option>Economics</option>
<option>Social Science</option>
</select>
<select id="durationInput">
<option value="15">15 minutes</option>
<option value="30">30 minutes</option>
<option value="45">45 minutes</option>
<option value="60">60 minutes</option>
<option value="90">90 minutes</option>
</select>
<input id="dateInput" type="date">
</div>
<div class="actions">
<button onclick="addTask()">Add Task</button>
<button class="secondary" onclick="addStarterPlan()">Add Sample Daily Plan</button>
</div>
</section>

<section class="panel">
<h2>Exam Countdown</h2>
<p class="muted">Set a target exam date for your local planner.</p>
<div class="form-grid">
<input id="examDate" type="date">
<input id="examName" placeholder="Example: Social Science Exam">
<button onclick="saveExam()">Save Exam</button>
<button class="secondary" onclick="clearExam()">Clear</button>
</div>
<p id="countdown" class="countdown">No exam date set.</p>
</section>

<section class="panel">
<h2>Today's Tasks</h2>
<div id="todayTasks"></div>
</section>

<section class="panel">
<h2>All Planned Tasks</h2>
<div id="allTasks"></div>
</section>
</main>

<script>
let tasks = [];
try { tasks = JSON.parse(localStorage.getItem("ronaldoStudyTasks")) || []; } catch { tasks=[]; }

function saveTasks(){ localStorage.setItem("ronaldoStudyTasks",JSON.stringify(tasks)); render(); }

function addTask(){
    const title=document.getElementById("taskInput").value.trim();
    const subject=document.getElementById("subjectInput").value;
    const duration=Number(document.getElementById("durationInput").value);
    const date=document.getElementById("dateInput").value || new Date().toISOString().slice(0,10);

    if(!title){ alert("Enter a study task first."); return; }

    tasks.push({
        id:Date.now(),
        title,subject,duration,date,done:false
    });

    document.getElementById("taskInput").value="";
    saveTasks();
}

function addStarterPlan(){
    const today=new Date().toISOString().slice(0,10);
    tasks.push(
        {id:Date.now()+1,title:"History revision",subject:"History",duration:30,date:today,done:false},
        {id:Date.now()+2,title:"Geography revision",subject:"Geography",duration:30,date:today,done:false},
        {id:Date.now()+3,title:"Economics MCQs",subject:"Economics",duration:20,date:today,done:false},
        {id:Date.now()+4,title:"Review yesterday's mistakes",subject:"Social Science",duration:15,date:today,done:false}
    );
    saveTasks();
}

function toggleTask(id){
    const task=tasks.find(x=>x.id===id);
    if(task) task.done=!task.done;
    saveTasks();
}

function deleteTask(id){
    tasks=tasks.filter(x=>x.id!==id);
    saveTasks();
}

function taskHtml(task){
    return `
    <div class="task ${task.done?'done':''}">
        <div>
            <div class="task-title">${escapeHtml(task.title)}</div>
            <div class="task-meta">
                <span class="badge">${escapeHtml(task.subject)}</span>
                &nbsp; ${task.duration} minutes &nbsp; | &nbsp; ${task.date}
            </div>
        </div>
        <div>
            <button onclick="toggleTask(${task.id})">${task.done?'Undo':'Done'}</button>
            <button class="secondary" onclick="deleteTask(${task.id})">Delete</button>
        </div>
    </div>`;
}

function render(){
    const today=new Date().toISOString().slice(0,10);
    document.getElementById("todayTasks").innerHTML =
        tasks.filter(t=>t.date===today).length
        ? tasks.filter(t=>t.date===today).map(taskHtml).join("")
        : '<p class="muted">No tasks planned for today.</p>';

    document.getElementById("allTasks").innerHTML =
        tasks.length
        ? tasks.slice().sort((a,b)=>a.date.localeCompare(b.date)).map(taskHtml).join("")
        : '<p class="muted">No tasks yet.</p>';
}

function saveExam(){
    const date=document.getElementById("examDate").value;
    const name=document.getElementById("examName").value.trim() || "Social Science Exam";
    if(!date){alert("Choose an exam date.");return;}
    localStorage.setItem("ronaldoExamDate",date);
    localStorage.setItem("ronaldoExamName",name);
    updateCountdown();
}

function clearExam(){
    localStorage.removeItem("ronaldoExamDate");
    localStorage.removeItem("ronaldoExamName");
    updateCountdown();
}

function updateCountdown(){
    const date=localStorage.getItem("ronaldoExamDate");
    const name=localStorage.getItem("ronaldoExamName") || "Social Science Exam";
    const out=document.getElementById("countdown");

    if(!date){ out.textContent="No exam date set."; return; }

    const target=new Date(date+"T00:00:00");
    const now=new Date();
    const diff=target-now;
    const days=Math.ceil(diff/86400000);

    if(days<0) out.textContent=name+" has passed.";
    else if(days===0) out.textContent=name+" is today.";
    else out.textContent=name+" - "+days+" day(s) remaining.";
}

function escapeHtml(value){
    return String(value).replaceAll("&","&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll('"',"&quot;").replaceAll("'","&#039;");
}

const today=new Date().toISOString().slice(0,10);
document.getElementById("dateInput").value=today;
document.getElementById("examDate").value=localStorage.getItem("ronaldoExamDate") || "";
document.getElementById("examName").value=localStorage.getItem("ronaldoExamName") || "";

render();
updateCountdown();
setInterval(updateCountdown,60000);
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "study-planner.html") -Value $plannerHtml -Encoding UTF8

# ------------------------------------------------------------
# 2. PDF / DOWNLOAD CENTRE
# ------------------------------------------------------------

$pdfHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notes and Downloads | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1150px;margin:auto;padding:35px 18px 70px}
.hero,.panel,.resource{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:25px;margin-bottom:20px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(30px,5vw,50px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.filters{display:grid;grid-template-columns:1fr 220px 220px;gap:10px;margin-bottom:20px}
input,select{width:100%;padding:12px;border-radius:7px;border:1px solid #345b7d;background:#0b1628;color:#f4f7fb}
.grid{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
.resource{margin:0}
.resource h3{margin-bottom:7px}
.tag{display:inline-block;padding:4px 8px;border-radius:20px;background:#17314d;color:#48d7ff;font-size:11px;margin-bottom:12px}
.actions{display:flex;gap:8px;flex-wrap:wrap;margin-top:15px}
button,a.btn{border:0;border-radius:7px;padding:10px 14px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer;text-decoration:none}
.secondary{background:#17314d!important;color:#48d7ff!important;border:1px solid #345b7d!important}
@media(max-width:900px){.filters{grid-template-columns:1fr 1fr}.grid{grid-template-columns:1fr 1fr}}
@media(max-width:600px){.filters{grid-template-columns:1fr}.grid{grid-template-columns:1fr}}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 6 | NOTES AND DOWNLOADS</p>
<h1>Premium Resource Centre</h1>
<p class="muted">Browse your local chapter PDFs and resources. Everything here is stored inside your website folder.</p>
</section>

<section class="panel">
<div class="filters">
<input id="search" placeholder="Search resources..." oninput="render()">
<select id="subject" onchange="render()">
<option value="All">All Subjects</option>
<option value="Social Science">Social Science</option>
<option value="Geography">Geography</option>
<option value="History">History</option>
<option value="Political Science">Political Science</option>
<option value="Economics">Economics</option>
</select>
<select id="type" onchange="render()">
<option value="All">All Types</option>
<option value="PDF">PDF</option>
<option value="Image">Image</option>
</select>
</div>
<div class="grid" id="resources"></div>
</section>
</main>

<script>
const resources=[
{title:"Understanding Social Science",subject:"Social Science",type:"PDF",path:"materials/iest1dd/iest101.pdf",desc:"Original uploaded chapter PDF."},
{title:"Shaping of the Earth's Surface",subject:"Geography",type:"PDF",path:"materials/iest1dd/iest102.pdf",desc:"Original uploaded chapter PDF."},
{title:"Atmosphere and Climate",subject:"Geography",type:"PDF",path:"materials/iest1dd/iest103.pdf",desc:"Original uploaded chapter PDF."},
{title:"Early Humans and Beginning of Civilisation",subject:"History",type:"PDF",path:"materials/iest1dd/iest104.pdf",desc:"Original uploaded chapter PDF."},
{title:"State and Society up to 1000 CE",subject:"History",type:"PDF",path:"materials/iest1dd/iest105.pdf",desc:"Original uploaded chapter PDF."},
{title:"Democracy",subject:"Political Science",type:"PDF",path:"materials/iest1dd/iest106.pdf",desc:"Original uploaded chapter PDF."},
{title:"Elections",subject:"Political Science",type:"PDF",path:"materials/iest1dd/iest107.pdf",desc:"Original uploaded chapter PDF."},
{title:"Building Blocks in Economics",subject:"Economics",type:"PDF",path:"materials/iest1dd/iest108.pdf",desc:"Original uploaded chapter PDF."},
{title:"The Price Puzzle",subject:"Economics",type:"PDF",path:"materials/iest1dd/iest109.pdf",desc:"Original uploaded chapter PDF."},
{title:"Study Image Resource",subject:"Social Science",type:"Image",path:"materials/iest1dd/iest1cc.jpg",desc:"Original uploaded image resource."}
];

function render(){
    const q=document.getElementById("search").value.toLowerCase().trim();
    const subject=document.getElementById("subject").value;
    const type=document.getElementById("type").value;

    const list=resources.filter(r=>{
        return (subject==="All"||r.subject===subject)
            && (type==="All"||r.type===type)
            && r.title.toLowerCase().includes(q);
    });

    document.getElementById("resources").innerHTML=list.length
        ? list.map(r=>`
            <article class="resource">
                <span class="tag">${r.type}</span>
                <h3>${escapeHtml(r.title)}</h3>
                <p class="muted">${escapeHtml(r.desc)}</p>
                <p class="muted">${escapeHtml(r.subject)}</p>
                <div class="actions">
                    <a class="btn" href="${r.path}" target="_blank">Preview</a>
                    <a class="btn secondary" href="${r.path}" download>Download</a>
                </div>
            </article>
        `).join("")
        : '<p class="muted">No matching resources.</p>';
}

function escapeHtml(v){
    return String(v).replaceAll("&","&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll('"',"&quot;").replaceAll("'","&#039;");
}

render();
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "pdf-centre.html") -Value $pdfHtml -Encoding UTF8

# ------------------------------------------------------------
# 3. EXAM SIMULATOR
# ------------------------------------------------------------

$examHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exam Simulator | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1120px;margin:auto;padding:35px 18px 70px}
.hero,.panel{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:25px;margin-bottom:20px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(30px,5vw,50px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.setup{display:grid;grid-template-columns:1fr 1fr 1fr;gap:12px}
select,input{width:100%;padding:12px;border-radius:7px;border:1px solid #345b7d;background:#0b1628;color:#f4f7fb}
button{border:0;border-radius:7px;padding:11px 17px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
.top{display:flex;justify-content:space-between;align-items:center;gap:15px;flex-wrap:wrap}
.timer{color:#48d7ff;background:#17314d;border-radius:8px;padding:8px 13px;font-weight:900}
.question{background:#0b1628;border:1px solid #223753;border-radius:10px;padding:20px;margin:13px 0}
.option{display:block;padding:9px;background:#101d31;border-radius:7px;margin:7px 0}
.result{display:none;background:#0b1628;border:1px solid #263b58;border-radius:10px;padding:20px;margin-top:20px}
.score{font-size:44px;color:#48d7ff;font-weight:900}
.section-title{padding:10px 0;border-bottom:1px solid #263b58}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:18px}
textarea{width:100%;min-height:120px;resize:vertical;padding:12px;border-radius:7px;border:1px solid #345b7d;background:#0b1628;color:#f4f7fb}
.rubric{background:#101d31;border-radius:8px;padding:12px;margin-top:8px}
@media(max-width:850px){.setup{grid-template-columns:1fr}}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 6 | EXAM PREPARATION</p>
<h1>Exam Simulator</h1>
<p class="muted">Create an offline practice paper, use the timer, score the objective section automatically and self-check written responses.</p>
</section>

<section class="panel" id="setupPanel">
<h2>Configure Your Practice Paper</h2>
<div class="setup">
<div>
<label>Marks</label>
<select id="marks">
<option value="40">40 Marks</option>
<option value="80" selected>80 Marks</option>
</select>
</div>
<div>
<label>Timer</label>
<select id="minutes">
<option value="20">20 Minutes</option>
<option value="30">30 Minutes</option>
<option value="45" selected>45 Minutes</option>
<option value="60">60 Minutes</option>
</select>
</div>
<div>
<label>Focus</label>
<select id="focus">
<option value="mixed">Mixed Social Science</option>
<option value="history">History</option>
<option value="geography">Geography</option>
<option value="polity">Political Science</option>
<option value="economics">Economics</option>
</select>
</div>
</div>
<div class="actions">
<button onclick="startExam()">Start Exam</button>
<button class="secondary" onclick="location.href='test-center.html'">Test Centre</button>
</div>
</section>

<section class="panel" id="examPanel" style="display:none">
<div class="top">
<div>
<h2 id="examTitle">Practice Paper</h2>
<p id="examInfo" class="muted"></p>
</div>
<div class="timer" id="timer">00:00</div>
</div>

<h3 class="section-title">Section A - Objective Questions</h3>
<div id="mcqArea"></div>

<h3 class="section-title">Section B - Short Answer Self-Practice</h3>
<div id="shortArea"></div>

<h3 class="section-title">Section C - Long Answer Self-Practice</h3>
<div id="longArea"></div>

<div class="actions">
<button onclick="submitExam()">Submit Exam</button>
<button class="secondary" onclick="location.reload()">Create New Paper</button>
</div>

<div class="result" id="resultBox">
<div class="score" id="score">0%</div>
<p id="resultText"></p>
<div id="writtenRubric" class="rubric">
<strong>Self-evaluation for written answers:</strong>
Use the checklist below after writing your answers:
<ul>
<li>Did I answer every part of the question?</li>
<li>Did I use correct Social Science terms?</li>
<li>Did I include relevant facts or examples?</li>
<li>Is my explanation organised and clear?</li>
</ul>
</div>
</div>
</section>
</main>

<script>
const QUESTION_BANK=[
{subject:"geography",q:"Which process breaks rocks down in place?",o:["Weathering","Deposition","Supply","Representation"],a:0},
{subject:"geography",q:"Most weather occurs in which layer?",o:["Troposphere","Mesosphere","Exosphere","Core"],a:0},
{subject:"geography",q:"A divergent plate boundary is where plates:",o:["Move apart","Move toward each other","Stop permanently","Disappear"],a:0},
{subject:"geography",q:"Which is an external surface process?",o:["River erosion","Citizen voting","Opportunity cost","Representation"],a:0},
{subject:"geography",q:"Climate refers to:",o:["Long-term patterns of weather","Only today's weather","One cloud","One wind gust"],a:0},
{subject:"history",q:"Archaeology studies:",o:["Material remains of the past","Only future events","Only markets","Only elections"],a:0},
{subject:"history",q:"Which is a material historical source?",o:["A coin","A weather forecast","A modern advertisement","A guess"],a:0},
{subject:"history",q:"Writing became important because it:",o:["Created durable records","Ended speech","Stopped trade","Removed culture"],a:0},
{subject:"history",q:"A state is a political organisation with authority over:",o:["A territory and population","Only a family","Only a market","Only a school"],a:0},
{subject:"history",q:"Why compare different historical sources?",o:["To build a more reliable understanding","To avoid evidence","To remove chronology","To make all sources identical"],a:0},
{subject:"polity",q:"Democracy is based on:",o:["Citizen political power","Hereditary rule only","Military rule only","No participation"],a:0},
{subject:"polity",q:"A direct election means:",o:["Citizens vote directly for representatives","Only judges vote","Only officials vote","No one votes"],a:0},
{subject:"polity",q:"A citizen has:",o:["Rights and duties","Only duties","No public role","Only economic assets"],a:0},
{subject:"polity",q:"Which is a democratic value?",o:["Equality","Arbitrary power","Exclusion","Censorship"],a:0},
{subject:"polity",q:"Elections help citizens:",o:["Choose representatives","Stop all laws","End public debate","Remove institutions"],a:0},
{subject:"economics",q:"Scarcity means:",o:["Resources are limited relative to wants","Everything is unlimited","No one has wants","There are no choices"],a:0},
{subject:"economics",q:"Opportunity cost is:",o:["The next-best alternative given up","Total revenue","Supply","Market demand"],a:0},
{subject:"economics",q:"Demand requires:",o:["Willingness and ability to buy","Only a wish","A voting card","A map"],a:0},
{subject:"economics",q:"Market equilibrium occurs when:",o:["Quantity demanded equals quantity supplied","Demand is zero","Supply is zero","Every price is equal"],a:0},
{subject:"economics",q:"A substitute good can:",o:["Replace another good","Only be used together","Never be sold","Only be exported"],a:0}
];

const SHORTS=[
"Explain one major concept from the focus area in your own words.",
"Differentiate two important terms from the chapter.",
"Give one everyday example connected with the topic.",
"Explain why the topic is important for understanding society."
];

const LONGS=[
"Explain the major ideas of the selected Social Science area with suitable examples.",
"Discuss the relationship between people, institutions, resources and the environment using the selected topic.",
"Write a well-organised answer showing causes, effects and examples where relevant."
];

let selectedQuestions=[],timerId=null,secondsLeft=0,submitted=false;

function shuffle(array){
    return [...array].sort(()=>Math.random()-0.5);
}

function startExam(){

    const marks=Number(document.getElementById("marks").value);
    const minutes=Number(document.getElementById("minutes").value);
    const focus=document.getElementById("focus").value;

    let pool=focus==="mixed"
        ? QUESTION_BANK
        : QUESTION_BANK.filter(q=>q.subject===focus);

    pool=pool.length?pool:QUESTION_BANK;

    const count=marks===80?20:10;

    selectedQuestions=shuffle(pool);

    while(selectedQuestions.length<count){
        selectedQuestions=selectedQuestions.concat(shuffle(pool));
    }

    selectedQuestions=selectedQuestions.slice(0,count);

    document.getElementById("setupPanel").style.display="none";
    document.getElementById("examPanel").style.display="block";

    document.getElementById("examTitle").textContent=
        marks+"-Mark Offline Practice Exam";

    document.getElementById("examInfo").textContent=
        count+" objective questions + written self-practice. This is a study simulator, not an official examination paper.";

    document.getElementById("mcqArea").innerHTML=
        selectedQuestions.map((q,i)=>`
        <div class="question">
            <p><strong>${i+1}. ${q.q}</strong></p>
            ${q.o.map((o,j)=>`
                <label class="option">
                    <input type="radio" name="examq${i}" value="${j}">
                    ${String.fromCharCode(65+j)}. ${o}
                </label>
            `).join("")}
        </div>`).join("");

    document.getElementById("shortArea").innerHTML=
        SHORTS.map((q,i)=>`
        <div class="question">
            <p><strong>${i+1}. ${q}</strong></p>
            <textarea placeholder="Write your answer here..."></textarea>
        </div>`).join("");

    document.getElementById("longArea").innerHTML=
        LONGS.slice(0,marks===80?3:2).map((q,i)=>`
        <div class="question">
            <p><strong>${i+1}. ${q}</strong></p>
            <textarea placeholder="Write your answer here..."></textarea>
        </div>`).join("");

    secondsLeft=minutes*60;
    submitted=false;
    updateTimer();

    if(timerId)clearInterval(timerId);

    timerId=setInterval(()=>{
        secondsLeft--;
        updateTimer();

        if(secondsLeft<=0){
            clearInterval(timerId);
            submitExam(true);
        }
    },1000);
}

function updateTimer(){
    const m=Math.floor(secondsLeft/60);
    const s=secondsLeft%60;
    document.getElementById("timer").textContent=
        String(m).padStart(2,"0")+":"+String(s).padStart(2,"0");
}

function submitExam(autoSubmit=false){

    if(submitted)return;

    submitted=true;

    if(timerId)clearInterval(timerId);

    let score=0;

    selectedQuestions.forEach((q,i)=>{
        const selected=document.querySelector(
            'input[name="examq'+i+'"]:checked'
        );

        if(selected && Number(selected.value)===q.a){
            score++;
        }
    });

    const percent=Math.round(score/selectedQuestions.length*100);

    document.getElementById("score").textContent=percent+"%";

    document.getElementById("resultText").textContent=
        score+" of "+selectedQuestions.length+
        " objective questions correct. "+
        (autoSubmit
            ?"Time ended and the exam was submitted automatically."
            :"Exam submitted. Review the written answers using the self-evaluation checklist.");

    document.getElementById("resultBox").style.display="block";

    const best=Number(localStorage.getItem("ronaldoBestScore")||0);

    if(percent>best){
        localStorage.setItem("ronaldoBestScore",String(percent));
    }

    window.scrollTo({
        top:document.body.scrollHeight,
        behavior:"smooth"
    });
}
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "exam-simulator.html") -Value $examHtml -Encoding UTF8

# ------------------------------------------------------------
# 4. UPDATE INDEX NAVIGATION
# ------------------------------------------------------------

$indexPath = Join-Path $root "index.html"

if(Test-Path $indexPath){

    $index=Get-Content -LiteralPath $indexPath -Raw

    if($index -notmatch 'href="study-planner.html"'){
        $index=$index.Replace(
            '<a href="dashboard.html">Dashboard</a>',
            '<a href="dashboard.html">Dashboard</a>' + [Environment]::NewLine +
            '        <a href="study-planner.html">Planner</a>' + [Environment]::NewLine +
            '        <a href="pdf-centre.html">PDF Centre</a>' + [Environment]::NewLine +
            '        <a href="exam-simulator.html">Exam Simulator</a>'
        )
    }

    Set-Content -LiteralPath $indexPath -Value $index -Encoding UTF8
}

Write-Host ""
Write-Host "PHASE 6 INSTALLED SUCCESSFULLY." -ForegroundColor Cyan
Write-Host ""
Write-Host "Created:" -ForegroundColor Yellow
Write-Host "study-planner.html"
Write-Host "pdf-centre.html"
Write-Host "exam-simulator.html"
Write-Host ""
Write-Host "Updated:" -ForegroundColor Yellow
Write-Host "index.html"
Write-Host ""
Write-Host "Open the website with:" -ForegroundColor Cyan
Write-Host "start index.html"