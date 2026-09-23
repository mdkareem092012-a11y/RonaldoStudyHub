# ============================================================
# RONALDO STUDY HUB - PHASE 5 INSTALLER
# MAP LAB + FLASHCARDS + QUIZ ARENA
# ============================================================
# Put this file in:
# Desktop\RonaldoStudyHub\phase5-learning-tools.ps1
#
# Run from CMD:
# cd %USERPROFILE%\Desktop\RonaldoStudyHub
# powershell -NoProfile -ExecutionPolicy Bypass -File .\phase5-learning-tools.ps1

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$jsFolder = Join-Path $root "js"
New-Item -ItemType Directory -Path $jsFolder -Force | Out-Null

# ------------------------------------------------------------
# 1. FLASHCARDS
# ------------------------------------------------------------

$flashcardsHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flashcards | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1050px;margin:auto;padding:35px 18px 70px}
.hero,.panel,.flashcard{background:#101d31;border:1px solid #263b58;border-radius:14px}
.hero{padding:30px;margin-bottom:22px;background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(30px,5vw,50px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.controls{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:20px}
select,button{font:inherit}
select{background:#101d31;color:#f4f7fb;border:1px solid #345b7d;border-radius:7px;padding:10px 13px}
button{border:0;border-radius:7px;padding:11px 17px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
.flashcard{min-height:330px;padding:35px;display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center}
.card-label{color:#e7ba63;font-size:11px;font-weight:800;letter-spacing:2px}
.term{font-size:36px;color:#48d7ff;margin:20px 0}
.definition{max-width:760px;font-size:18px;color:#d3deec}
.card-stats{text-align:center;color:#aab8ca;margin:14px 0}
.actions{display:flex;justify-content:center;gap:10px;flex-wrap:wrap;margin-top:20px}
.progress{height:8px;background:#17314d;border-radius:99px;overflow:hidden;margin-top:20px}
.fill{height:100%;background:linear-gradient(90deg,#48d7ff,#e7ba63)}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 5 | LEARNING TOOLS</p>
<h1>Flashcards</h1>
<p class="muted">Flip through definitions, concepts, facts and important terms.</p>
</section>

<section class="controls">
<select id="subjectFilter" onchange="resetDeck()">
<option value="All">All Subjects</option>
<option value="History">History</option>
<option value="Geography">Geography</option>
<option value="Political Science">Political Science</option>
<option value="Economics">Economics</option>
<option value="Social Science">Social Science</option>
</select>
<button class="secondary" onclick="shuffleCards()">Shuffle</button>
</section>

<section class="flashcard" id="flashcard">
<p class="card-label" id="cardSubject">SUBJECT</p>
<div class="term" id="cardTerm">Loading...</div>
<div class="definition" id="cardDefinition">Loading...</div>
<div class="actions">
<button onclick="prevCard()">Previous</button>
<button onclick="nextCard()">Next</button>
<button class="secondary" onclick="markKnown()">I Know This</button>
</div>
</section>

<div class="card-stats" id="cardStats"></div>
<div class="progress"><div class="fill" id="progressFill" style="width:0%"></div></div>
</main>

<script>
const ALL_CARDS = [
{subject:"Social Science",term:"Social Science",definition:"The systematic study of human society, relationships, institutions, cultures and human interaction with the environment."},
{subject:"Social Science",term:"Evidence",definition:"Information or material used to support an explanation or conclusion."},
{subject:"Geography",term:"Landform",definition:"A natural feature on the Earth's surface formed by processes such as weathering, erosion, deposition and crustal movement."},
{subject:"Geography",term:"Plate Tectonics",definition:"The theory that Earth's lithosphere is divided into plates that move slowly and interact."},
{subject:"Geography",term:"Lithosphere",definition:"The rigid outer part of Earth made up of the crust and uppermost mantle."},
{subject:"Geography",term:"Weathering",definition:"The breakdown of rocks in place."},
{subject:"Geography",term:"Erosion",definition:"The wearing away and removal of material by agents such as running water, wind, glaciers or waves."},
{subject:"Geography",term:"Troposphere",definition:"The lowest major atmospheric layer where most weather phenomena occur."},
{subject:"Geography",term:"Climate",definition:"The long-term pattern of weather in a region."},
{subject:"History",term:"Archaeology",definition:"The study of the past through material remains such as tools, structures, pottery, bones and other evidence."},
{subject:"History",term:"Civilisation",definition:"A complex human society with organised settlements, institutions, specialised activities and cultural developments."},
{subject:"History",term:"State",definition:"A political organisation with authority over a territory and population."},
{subject:"History",term:"Dharma",definition:"A historical concept discussed in relation to duty, ethical order and social responsibilities."},
{subject:"Political Science",term:"Democracy",definition:"A form of government in which political power and authority ultimately rests with citizens."},
{subject:"Political Science",term:"Citizen",definition:"A member of a political community with rights and duties."},
{subject:"Political Science",term:"Representation",definition:"A system in which people choose others to act or make decisions on their behalf."},
{subject:"Political Science",term:"Direct Election",definition:"An election in which citizens vote directly to choose representatives or leaders."},
{subject:"Economics",term:"Scarcity",definition:"A situation in which available resources are limited relative to wants."},
{subject:"Economics",term:"Opportunity Cost",definition:"The value of the next-best alternative given up when a choice is made."},
{subject:"Economics",term:"Demand",definition:"The quantity of a product people are willing and able to buy at a particular price."},
{subject:"Economics",term:"Supply",definition:"The quantity of a product producers are willing and able to offer for sale."},
{subject:"Economics",term:"Market Equilibrium",definition:"A situation in which quantity demanded equals quantity supplied."}
];

let cards = [...ALL_CARDS];
let index = 0;
let known = JSON.parse(localStorage.getItem("ronaldoFlashcardsKnown") || "[]");

function filteredCards(){
    const subject = document.getElementById("subjectFilter").value;
    return subject === "All" ? cards : cards.filter(c => c.subject === subject);
}

function render(){
    const deck = filteredCards();
    if(index >= deck.length) index = 0;
    if(index < 0) index = deck.length - 1;

    if(!deck.length){
        document.getElementById("cardTerm").textContent = "No cards";
        document.getElementById("cardDefinition").textContent = "No cards available for this subject.";
        return;
    }

    const card = deck[index];
    document.getElementById("cardSubject").textContent = card.subject.toUpperCase();
    document.getElementById("cardTerm").textContent = card.term;
    document.getElementById("cardDefinition").textContent = card.definition;
    document.getElementById("cardStats").textContent = `Card ${index+1} of ${deck.length} | Known: ${known.length}`;
    document.getElementById("progressFill").style.width = `${((index+1)/deck.length)*100}%`;
}

function nextCard(){ index++; render(); }
function prevCard(){ index--; render(); }

function resetDeck(){ index = 0; render(); }

function shuffleCards(){
    cards.sort(() => Math.random() - 0.5);
    index = 0;
    render();
}

function markKnown(){
    const deck = filteredCards();
    if(!deck.length) return;
    const key = deck[index].term;
    if(!known.includes(key)){
        known.push(key);
        localStorage.setItem("ronaldoFlashcardsKnown", JSON.stringify(known));
    }
    nextCard();
}

render();
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "flashcards.html") -Value $flashcardsHtml -Encoding UTF8

# ------------------------------------------------------------
# 2. QUIZ ARENA
# ------------------------------------------------------------

$quizArenaHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Arena | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1100px;margin:auto;padding:35px 18px 70px}
.hero,.panel{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:25px;margin-bottom:20px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(32px,5vw,52px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.modes{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
.mode{background:#0b1628;border:1px solid #263b58;border-radius:10px;padding:18px;color:#f4f7fb;cursor:pointer;text-align:left}
.mode strong{color:#48d7ff;display:block;margin-bottom:7px}
.mode:hover{border-color:#48d7ff}
.quiz-top{display:flex;justify-content:space-between;gap:15px;align-items:center;flex-wrap:wrap}
.timer{padding:8px 13px;background:#17314d;border-radius:7px;color:#48d7ff;font-weight:800}
.question{background:#0b1628;border:1px solid #223753;border-radius:10px;padding:20px;margin:14px 0}
.option{display:block;padding:9px;margin:7px 0;background:#101d31;border-radius:7px}
button{border:0;border-radius:7px;padding:11px 17px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d;margin-left:8px}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:18px}
.result{display:none;padding:20px;background:#0b1628;border-radius:10px;margin-top:20px}
.score{font-size:44px;color:#48d7ff;font-weight:900}
@media(max-width:900px){.modes{grid-template-columns:repeat(2,1fr)}}
@media(max-width:600px){.modes{grid-template-columns:1fr}}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 5 | GAME ZONE</p>
<h1>Social Science Quiz Arena</h1>
<p class="muted">Choose a game mode, answer quickly and review your score.</p>
</section>

<section class="panel">
<h2>Game Modes</h2>
<div class="modes">
<button class="mode" onclick="startMode('daily')"><strong>Daily Challenge</strong><span>10 mixed questions</span></button>
<button class="mode" onclick="startMode('speed')"><strong>Speed Quiz</strong><span>Fast questions</span></button>
<button class="mode" onclick="startMode('truefalse')"><strong>True or False</strong><span>Concept check</span></button>
<button class="mode" onclick="startMode('history')"><strong>History Timeline</strong><span>Put events in order</span></button>
</div>
</section>

<section class="panel">
<div class="quiz-top">
<div>
<h2 id="modeTitle">Select a Mode</h2>
<p class="muted" id="modeInfo">Choose a game mode above.</p>
</div>
<div class="timer" id="timer">00:00</div>
</div>

<div id="quizArea"></div>

<div class="actions">
<button onclick="submitQuiz()" id="submitBtn" style="display:none">Submit</button>
<button class="secondary" onclick="resetQuiz()">Reset</button>
</div>

<div class="result" id="result">
<div class="score" id="score">0%</div>
<p id="resultText"></p>
<div id="review"></div>
</div>
</section>
</main>

<script>
const questionBank = [
{q:"Which discipline studies the past?",o:["History","Geography","Economics","Political Science"],a:0,e:"History studies the past and change over time."},
{q:"Which process breaks rocks down in place?",o:["Erosion","Weathering","Deposition","Trade"],a:1,e:"Weathering is the breakdown of rocks in place."},
{q:"Most weather occurs in the:",o:["Troposphere","Mesosphere","Exosphere","Core"],a:0,e:"Most weather occurs in the troposphere."},
{q:"Democracy places political power with:",o:["Citizens","Only judges","Only the military","No one"],a:0,e:"Democracy is based on citizen political power."},
{q:"The next-best alternative given up is called:",o:["Revenue","Opportunity cost","Supply","Demand"],a:1,e:"Opportunity cost is the value of the next-best alternative."},
{q:"Market equilibrium occurs when:",o:["Quantity demanded equals quantity supplied","Demand is zero","Supply is zero","Prices are all equal"],a:0,e:"Equilibrium occurs where quantity demanded equals quantity supplied."},
{q:"Archaeology studies:",o:["Material remains of the past","Only future events","Only weather","Only elections"],a:0,e:"Archaeology uses material remains to understand the past."},
{q:"A direct election means:",o:["Citizens vote directly for representatives","Judges choose all leaders","No one votes","Only officials vote"],a:0,e:"Citizens directly vote for representatives."}
];

const trueFalseBank = [
{q:"History is the study of the past and change over time.",a:true,e:"This is correct."},
{q:"Weathering means the laying down of transported sediment.",a:false,e:"Deposition means laying down transported material; weathering breaks rocks down in place."},
{q:"Democracy is based on citizen political power.",a:true,e:"This is a core principle of democracy."},
{q:"Opportunity cost is the value of every alternative available.",a:false,e:"It is the value of the next-best alternative given up."},
{q:"Demand requires willingness and ability to buy.",a:true,e:"Both willingness and ability are important for demand."},
{q:"Climate describes only today's atmospheric conditions.",a:false,e:"Climate describes long-term patterns of weather."}
];

const timeline = [
{event:"Early human communities",order:1},
{event:"Development of agriculture",order:2},
{event:"Growth of settled communities",order:3},
{event:"Development of early writing systems",order:4}
];

let mode="",questions=[],index=0,answers=[],timerId=null,timeLeft=0;

function startMode(selected){
    mode=selected;
    index=0;
    answers=[];

    if(timerId)clearInterval(timerId);

    if(mode==="daily"){
        questions=[...questionBank].sort(()=>Math.random()-0.5).slice(0,5);
        timeLeft=180;
        document.getElementById("modeTitle").textContent="Daily Challenge";
        document.getElementById("modeInfo").textContent="5 mixed questions | 3 minutes";
    }

    if(mode==="speed"){
        questions=[...questionBank].sort(()=>Math.random()-0.5).slice(0,5);
        timeLeft=90;
        document.getElementById("modeTitle").textContent="Speed Quiz";
        document.getElementById("modeInfo").textContent="5 questions | 90 seconds";
    }

    if(mode==="truefalse"){
        questions=trueFalseBank.map(x=>({
            q:x.q,o:["True","False"],a:x.a?0:1,e:x.e
        }));
        timeLeft=180;
        document.getElementById("modeTitle").textContent="True or False";
        document.getElementById("modeInfo").textContent="Concept check | 3 minutes";
    }

    if(mode==="history"){
        questions=[{
            q:"Choose the correct order from earliest to later development:",
            o:[
                "Early humans -> agriculture -> settled communities -> early writing",
                "Early writing -> agriculture -> early humans -> settled communities",
                "Agriculture -> early writing -> early humans -> settled communities",
                "Settled communities -> early humans -> agriculture -> writing"
            ],
            a:0,
            e:"This is the simplified order used in this game."
        }];
        timeLeft=120;
        document.getElementById("modeTitle").textContent="History Timeline";
        document.getElementById("modeInfo").textContent="Order the sequence correctly | 2 minutes";
    }

    document.getElementById("result").style.display="none";
    document.getElementById("submitBtn").style.display="";
    renderQuestion();
    updateTimer();

    timerId=setInterval(()=>{
        timeLeft--;
        updateTimer();
        if(timeLeft<=0){
            clearInterval(timerId);
            submitQuiz();
        }
    },1000);
}

function renderQuestion(){
    if(index>=questions.length){
        submitQuiz();
        return;
    }

    const item=questions[index];

    document.getElementById("quizArea").innerHTML=`
    <div class="question">
        <p><strong>Question ${index+1} of ${questions.length}</strong></p>
        <p>${item.q}</p>
        ${item.o.map((option,i)=>`
            <label class="option">
                <input type="radio" name="arena" value="${i}">
                ${String.fromCharCode(65+i)}. ${option}
            </label>
        `).join("")}
    </div>
    <div class="actions">
        <button onclick="nextQuestion()">${index===questions.length-1?"Finish":"Next"}</button>
    </div>`;
}

function nextQuestion(){
    const selected=document.querySelector('input[name="arena"]:checked');

    if(!selected){
        alert("Please select an answer.");
        return;
    }

    answers[index]=Number(selected.value);
    index++;
    renderQuestion();
}

function submitQuiz(){
    if(timerId)clearInterval(timerId);

    while(answers.length<questions.length)answers.push(null);

    let correct=0;
    let review="";

    questions.forEach((item,i)=>{
        const isCorrect=answers[i]===item.a;
        if(isCorrect)correct++;

        review+=`
        <div style="padding:12px 0;border-bottom:1px solid #263b58">
            <strong>Q${i+1}. ${item.q}</strong>
            <p style="color:${isCorrect?'#68dca1':'#ff9c91'}">
                ${isCorrect?'Correct':'Needs Review'}
            </p>
            <p class="muted">Correct answer: ${item.o[item.a]}</p>
            <p class="muted">${item.e}</p>
        </div>`;
    });

    const percent=Math.round(correct/questions.length*100);

    document.getElementById("score").textContent=percent+"%";
    document.getElementById("resultText").textContent=
        `${correct} of ${questions.length} correct.`;

    document.getElementById("review").innerHTML=review;
    document.getElementById("result").style.display="block";
    document.getElementById("submitBtn").style.display="none";

    const best=Number(localStorage.getItem("ronaldoBestScore")||0);
    if(percent>best)localStorage.setItem("ronaldoBestScore",String(percent));
}

function resetQuiz(){
    if(mode)startMode(mode);
}

function updateTimer(){
    const m=Math.floor(timeLeft/60),s=timeLeft%60;
    document.getElementById("timer").textContent=
        String(m).padStart(2,"0")+":"+String(s).padStart(2,"0");
}
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "quiz-arena.html") -Value $quizArenaHtml -Encoding UTF8

# ------------------------------------------------------------
# 3. MAP LEARNING LAB
# ------------------------------------------------------------

$mapLabHtml = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Map Learning Lab | Ronaldo's Study Hub</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#07111f;color:#f4f7fb;font-family:Arial,Helvetica,sans-serif}
header{background:#0c1728;border-bottom:1px solid #263b58;padding:18px 7%}
header a{color:#48d7ff;text-decoration:none;font-weight:800}
main{max-width:1100px;margin:auto;padding:35px 18px 70px}
.hero,.panel{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:25px;margin-bottom:20px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(32px,5vw,52px);margin:10px 0}
h2{color:#48d7ff}
.muted{color:#aab8ca}
.tabs{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:18px}
button{border:0;border-radius:7px;padding:11px 17px;background:#48d7ff;color:#06111b;font-weight:800;cursor:pointer}
.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
#learnArea{display:grid;grid-template-columns:repeat(2,1fr);gap:12px}
.location{padding:18px;background:#0b1628;border:1px solid #263b58;border-radius:10px}
.location strong{color:#48d7ff}
.quiz-area{margin-top:22px;padding:20px;background:#0b1628;border:1px solid #263b58;border-radius:10px}
.option{display:block;padding:10px;background:#101d31;border-radius:7px;margin:7px 0}
.result{margin-top:15px;font-weight:800}
@media(max-width:700px){#learnArea{grid-template-columns:1fr}}
</style>
</head>
<body>
<header><a href="index.html">&larr; Back to Ronaldo's Study Hub</a></header>
<main>
<section class="hero">
<p class="eyebrow">PHASE 5 | GEOGRAPHY LEARNING</p>
<h1>Map Learning Lab</h1>
<p class="muted">
Study important locations, then test yourself. This first offline version
uses a structured location library and quiz so it works without a map API.
A custom India map image can be added later as a local file.
</p>
</section>

<section class="panel">
<div class="tabs">
<button onclick="showRegion('All')">All</button>
<button class="secondary" onclick="showRegion('North')">North</button>
<button class="secondary" onclick="showRegion('West')">West</button>
<button class="secondary" onclick="showRegion('South')">South</button>
<button class="secondary" onclick="showRegion('East')">East</button>
<button class="secondary" onclick="showRegion('Central')">Central</button>
<button class="secondary" onclick="showRegion('Northeast')">Northeast</button>
</div>

<div id="learnArea"></div>
</section>

<section class="panel">
<h2>Map Practice Quiz</h2>
<p class="muted">Identify the broad region associated with the location.</p>
<div class="quiz-area" id="quizArea"></div>
</section>
</main>

<script>
const locations=[
{name:"Aravalli Range",region:"West",fact:"A major ancient mountain range extending through north-western India."},
{name:"Himalayas",region:"North",fact:"A major mountain system along the northern edge of the Indian subcontinent."},
{name:"Western Ghats",region:"West",fact:"A mountain chain running along the western side of peninsular India."},
{name:"Eastern Ghats",region:"East",fact:"Discontinuous hills and ranges along the eastern side of peninsular India."},
{name:"Narmada River",region:"Central",fact:"A major west-flowing river of central India."},
{name:"Godavari River",region:"South",fact:"A major peninsular river flowing eastward to the Bay of Bengal."},
{name:"Ganga River",region:"North",fact:"A major river system of northern India."},
{name:"Brahmaputra River",region:"Northeast",fact:"A major river associated with the north-eastern region."},
{name:"Thar Desert",region:"West",fact:"A large arid region in north-western India."},
{name:"Deccan Plateau",region:"South",fact:"A large plateau region in peninsular India."}
];

function showRegion(region){
    const area=document.getElementById("learnArea");
    const data=region==="All"?locations:locations.filter(x=>x.region===region);

    area.innerHTML=data.map(x=>`
        <article class="location">
            <strong>${x.name}</strong>
            <p class="muted">Region: ${x.region}</p>
            <p>${x.fact}</p>
        </article>
    `).join("");
}

function makeQuiz(){
    const item=locations[Math.floor(Math.random()*locations.length)];
    const regions=["North","West","South","East","Central","Northeast"].sort(()=>Math.random()-0.5).slice(0,4);

    if(!regions.includes(item.region)){
        regions[0]=item.region;
    }

    document.getElementById("quizArea").innerHTML=`
        <p><strong>Where would you place the ${item.name} in this practice model?</strong></p>
        ${regions.map((r,i)=>`
            <label class="option">
                <input type="radio" name="region" value="${r}">
                ${r}
            </label>
        `).join("")}
        <button onclick="checkMapQuiz('${item.region}','${item.name.replace(/'/g,"\\'")}')">Check</button>
        <p class="result" id="mapResult"></p>
    `;
}

function checkMapQuiz(correct,name){
    const selected=document.querySelector('input[name="region"]:checked');
    const result=document.getElementById("mapResult");

    if(!selected){
        result.textContent="Select a region first.";
        result.style.color="#e7ba63";
        return;
    }

    if(selected.value===correct){
        result.textContent="Correct! "+name+" is in the "+correct+" region in this practice model.";
        result.style.color="#68dca1";
    }else{
        result.textContent="Review the location and try again.";
        result.style.color="#ff9c91";
    }
}

showRegion("All");
makeQuiz();
</script>
</body>
</html>
'@

Set-Content -LiteralPath (Join-Path $root "map-lab.html") -Value $mapLabHtml -Encoding UTF8

# ------------------------------------------------------------
# 4. ADD NAVIGATION LINKS TO INDEX.HTML
# ------------------------------------------------------------

$indexPath = Join-Path $root "index.html"

if(Test-Path $indexPath){

    $index = Get-Content -LiteralPath $indexPath -Raw

    if($index -notmatch 'href="flashcards.html"'){
        $index = $index.Replace(
            '<a href="test-center.html">Tests</a>',
            '<a href="test-center.html">Tests</a>' + [Environment]::NewLine +
            '        <a href="flashcards.html">Flashcards</a>' + [Environment]::NewLine +
            '        <a href="quiz-arena.html">Quiz Arena</a>' + [Environment]::NewLine +
            '        <a href="map-lab.html">Map Lab</a>'
        )
    }

    Set-Content -LiteralPath $indexPath -Value $index -Encoding UTF8
}

# ------------------------------------------------------------
# 5. PRINT RESULTS
# ------------------------------------------------------------

Write-Host ""
Write-Host "PHASE 5 INSTALLED SUCCESSFULLY." -ForegroundColor Cyan
Write-Host ""
Write-Host "Created:" -ForegroundColor Yellow
Write-Host "flashcards.html"
Write-Host "quiz-arena.html"
Write-Host "map-lab.html"
Write-Host ""
Write-Host "Updated:" -ForegroundColor Yellow
Write-Host "index.html"
Write-Host ""
Write-Host "Open the tools with:" -ForegroundColor Cyan
Write-Host "start flashcards.html"
Write-Host "start quiz-arena.html"
Write-Host "start map-lab.html"
