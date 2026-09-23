# RONALDO STUDY HUB - Generate all 9 Social Science chapter pages
# Run from the RonaldoStudyHub folder:
# powershell -NoProfile -ExecutionPolicy Bypass -File .\make-all-chapters.ps1

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$chapterFolder = Join-Path $root "chapters"
New-Item -ItemType Directory -Path $chapterFolder -Force | Out-Null

$chapters = @(
  @{
    N="01"; Title="Understanding Social Science"; Subject="Introduction to Social Science"; Pdf="iest101.pdf"
    Notes=@(
      @("Meaning of Social Science","Social Science is the systematic study of human society, relationships, institutions, cultures and the connections between people and their environment. It asks not only what happens, but why it happens and how society changes."),
      @("Four major disciplines","History studies the past and change over time. Geography studies places, environments and human-environment relationships. Political Science studies power, government, institutions, rights and citizenship. Economics studies choices, resources, production, distribution and consumption."),
      @("Interconnected society","Daily life depends on many connected systems: food production and trade, transport, public services, laws, education, culture and the natural environment. A social issue often needs more than one discipline to understand it."),
      @("Evidence and reasoning","Social scientists use observation, maps, records, statistics, surveys, oral accounts and other evidence. They compare sources, ask questions and use logical reasoning rather than relying only on assumptions.")
    )
    QA=@(
      @("What is Social Science?","Social Science is the systematic study of human society, its relationships, institutions, cultures and interactions with the environment."),
      @("Name four major branches of Social Science.","History, Geography, Political Science and Economics."),
      @("Why are the branches of Social Science interconnected?","Human life involves the past, places and environment, political institutions and economic activity together. Studying them together gives a fuller understanding of society.")
    )
    Extra=@("Explain how Social Science helps us understand an issue in everyday life.","Differentiate History and Geography with one example each.","Why should social scientists examine evidence and more than one viewpoint?")
    MCQQ="Which discipline primarily studies the production, distribution and consumption of goods and services?"
    MCQ=@("History","Economics","Geography","Political Science"); Correct=1
    Sample=@("Define Social Science.","Explain the focus of any three branches of Social Science.","Describe one everyday situation that shows how the branches of Social Science are interconnected.")
  },
  @{
    N="02"; Title="Shaping of the Earth's Surface"; Subject="Geography"; Pdf="iest102.pdf"
    Notes=@(
      @("Earth's dynamic surface","The Earth's surface changes through internal forces originating within the planet and external processes acting at or near the surface. These processes create and modify mountains, plateaus, plains, valleys and coastal features."),
      @("Structure and plate tectonics","The Earth has a crust, mantle and core. The crust and uppermost mantle form the lithosphere, which is divided into tectonic plates. These plates move slowly over the weaker asthenosphere. Their interactions help explain earthquakes, volcanoes, mountain building and ocean-basin formation."),
      @("Plate boundaries","At convergent boundaries plates move towards one another; at divergent boundaries they move apart; at transform boundaries they slide past one another. Different movements produce different landforms and hazards."),
      @("External processes","Weathering breaks rocks down in place. Erosion wears away and removes material. Transportation carries sediments. Deposition lays material down. Rivers, wind, glaciers and sea waves act as agents of these processes."),
      @("Landforms and people","Mountains, plateaus and plains influence settlement, transport, farming, livelihoods and biodiversity. Earthquakes, landslides and volcanic eruptions can threaten lives and infrastructure, so hazard awareness and preparedness matter.")
    )
    QA=@(
      @("What is plate tectonics?","It is the theory that Earth's lithosphere is divided into plates that move slowly and interact, shaping the surface."),
      @("Differentiate weathering and erosion.","Weathering breaks rocks down in place; erosion removes and carries away weathered material."),
      @("Name the three broad types of plate boundaries.","Convergent, divergent and transform boundaries.")
    )
    Extra=@("Explain how plate movement can form mountains or cause earthquakes.","Compare weathering, erosion, transportation and deposition.","How can landforms influence human settlement and economic activities?")
    MCQQ="Which process means the breakdown of rocks in place?"
    MCQ=@("Deposition","Transportation","Weathering","Condensation"); Correct=2
    Sample=@("Define a landform and give three examples.","Explain the role of plate movement in shaping Earth's surface.","Differentiate weathering, erosion and deposition with examples.")
  },
  @{
    N="03"; Title="Atmosphere and Climate"; Subject="Geography"; Pdf="iest103.pdf"
    Notes=@(
      @("Composition of the atmosphere","The atmosphere is a mixture of gases held around Earth by gravity. It is mainly nitrogen (about 78%) and oxygen (about 21%), with argon, carbon dioxide, other trace gases, water vapour and dust."),
      @("Layers of the atmosphere","The atmosphere is commonly divided into the troposphere, stratosphere, mesosphere, thermosphere and exosphere. Weather occurs mainly in the troposphere. The stratosphere contains the ozone layer, which absorbs much harmful ultraviolet radiation."),
      @("Weather and climate","Weather is the short-term condition of the atmosphere at a place. Climate is the long-term pattern of weather, usually described using observations over many years. Temperature, air pressure, wind, humidity, cloud cover and precipitation are key elements."),
      @("Monsoon and winds","Winds result from differences in air pressure. Seasonal heating of land and sea, pressure patterns, moisture and topography influence the Indian monsoon. Local breezes, such as sea and land breezes, arise from unequal heating of land and water."),
      @("Climate change and carbon footprint","Greenhouse gases trap some outgoing heat and keep Earth warm, but increasing greenhouse-gas concentrations intensify warming. Energy conservation, efficient transport, reducing waste and protecting ecosystems can help lower an individual's carbon footprint.")
    )
    QA=@(
      @("What is the atmosphere?","The atmosphere is the envelope of gases surrounding Earth, held in place by gravity."),
      @("How are weather and climate different?","Weather describes short-term atmospheric conditions; climate describes long-term patterns of weather in a region."),
      @("Why is the ozone layer important?","It absorbs much of the Sun's harmful ultraviolet radiation, helping protect life on Earth.")
    )
    Extra=@("Describe the major layers of the atmosphere and one feature of each.","Explain how unequal heating creates local winds.","Suggest four practical ways to reduce a household's carbon footprint.")
    MCQQ="Most day-to-day weather phenomena occur in which atmospheric layer?"
    MCQ=@("Stratosphere","Troposphere","Mesosphere","Exosphere"); Correct=1
    Sample=@("Differentiate weather and climate.","Explain the composition and importance of the atmosphere.","Describe factors that influence the Indian monsoon and suggest ways to reduce carbon footprint.")
  },
  @{
    N="04"; Title="Early Humans and Beginning of Civilisation"; Subject="History"; Pdf="iest104.pdf"
    Notes=@(
      @("Prehistory and evidence","Prehistory refers to periods before written records were available. Knowledge of early humans comes largely from archaeology: tools, bones, fossils, pottery, burials, structures and other material remains."),
      @("Human evolution and adaptation","Human evolution was a long process involving biological and cultural changes. Early humans adapted to different environments, developed tools, learned to use fire, cooperated in groups and migrated across regions."),
      @("Hunter-gatherer life","Many early communities obtained food by hunting animals, fishing and gathering plants. Mobility, knowledge of seasons and landscapes, and cooperation helped people survive."),
      @("Agriculture and settled life","The development of farming and animal domestication in some regions encouraged more settled communities. Food production supported population growth, specialised work, exchange and increasingly complex settlements."),
      @("Writing and civilisation","Writing systems, urban settlements, specialised occupations, trade and organised institutions are important features associated with early civilisations. Harappan writing remains undeciphered; other early scripts, such as Mesopotamian cuneiform and Egyptian hieroglyphs, have been deciphered.")
    )
    QA=@(
      @("What is archaeology?","Archaeology is the study of past human life through material remains such as tools, buildings, pottery, bones and other objects."),
      @("How do historians learn about periods before writing?","They study archaeological evidence, environmental clues, fossils, tools, settlements and comparisons with other evidence."),
      @("How did farming change human life?","Farming could support more settled communities and food surpluses, encouraging population growth, specialised work, exchange and complex societies.")
    )
    Extra=@("Compare hunter-gatherer life with settled farming communities.","Why is archaeological evidence important for reconstructing early history?","Explain how writing contributed to the development of historical records.")
    MCQQ="Which source is especially important for studying periods before written records?"
    MCQ=@("Modern newspapers","Archaeological remains","Election results","Stock prices"); Correct=1
    Sample=@("Define prehistory and archaeology.","Explain two changes associated with the beginning of farming.","How do archaeological sources help us understand early civilisations? Mention examples.")
  },
  @{
    N="05"; Title="State and Society up to 1000 CE"; Subject="History"; Pdf="iest105.pdf"
    Notes=@(
      @("Society and state","Society is a network of relationships among people and groups. A state is a political organisation that exercises authority over a territory and population through institutions, rules and administration."),
      @("Early Indian political organisation","Early Indian communities developed varied forms of political organisation. Vedic texts refer to assemblies such as the sabha and samiti. Over time, kingdoms and gana-sanghas (clan-based or oligarchic polities) emerged in different regions."),
      @("Kingdoms and administration","Rulers relied on officials, revenue, armies and local authorities to govern. Political power and administrative arrangements differed across regions and periods; historical evidence must be read in its context."),
      @("Social and cultural change","Social life was shaped by occupations, kinship, customs, religious traditions, learning and exchange. Cultural and religious developments interacted with political change and regional conditions."),
      @("Historical sources","Texts, inscriptions, coins, monuments, archaeological remains and foreign accounts provide evidence about early states and society. Each source has limits and should be compared with other evidence.")
    )
    QA=@(
      @("What is a state?","A state is a political organisation that governs a territory and population through authority, institutions and rules."),
      @("What were the sabha and samiti?","They were assemblies mentioned in Vedic literature that had roles in early social and political life."),
      @("Name three sources used to study early Indian states and society.","Examples include inscriptions, coins, texts, monuments and archaeological remains.")
    )
    Extra=@("Differentiate society and state.","How can inscriptions and coins help historians study political developments?","Explain why early Indian political organisation should not be assumed to have been identical in every region.")
    MCQQ="Which of the following is a material source for studying the past?"
    MCQ=@("A coin","A weather forecast","A modern advertisement","A fictional fantasy"); Correct=0
    Sample=@("Define state and society.","Describe the significance of assemblies mentioned in Vedic literature.","Discuss the usefulness and limitations of historical sources for studying early Indian society.")
  },
  @{
    N="06"; Title="Democracy"; Subject="Political Science"; Pdf="iest106.pdf"
    Notes=@(
      @("Meaning of democracy","Democracy is a system in which people participate in governing, directly or through elected representatives. It depends on meaningful participation, accountability, political equality and respect for rights."),
      @("Democratic traditions and institutions","Ideas and practices of collective deliberation have appeared in different historical settings. Modern democracy is supported by institutions, constitutional rules and citizens' participation."),
      @("Constitution and rule of law","A constitution establishes the framework of government and protects rights. Rule of law means that laws apply through established procedures and public authorities are also subject to law."),
      @("Rights and equality","Fundamental Rights protect key freedoms and equality. Democratic systems require safeguards against discrimination and protections for vulnerable groups, alongside access to legal remedies."),
      @("Political participation","Elections, public debate, civil society, community action and peaceful criticism allow citizens to participate and hold institutions accountable. A multi-party system offers voters different political choices.")
    )
    QA=@(
      @("What is democracy?","Democracy is a system of government in which people exercise power directly or through representatives chosen by them."),
      @("What is the rule of law?","It is the principle that everyone, including public authorities, is subject to the law and that laws are applied through fair, established procedures."),
      @("Why are Fundamental Rights important in a democracy?","They protect freedoms and equality, limit arbitrary power and provide safeguards for individuals and groups.")
    )
    Extra=@("Explain why elections alone may not be enough to ensure a healthy democracy.","How does a constitution limit and organise government power?","Why is protection of vulnerable groups important for democratic equality?")
    MCQQ="Which principle means that public authorities are also subject to law?"
    MCQ=@("Rule of law","Absolute power","Hereditary rule","Censorship"); Correct=0
    Sample=@("Define democracy and state two of its key features.","Explain the importance of a constitution and rule of law.","How do rights, participation and protection of vulnerable groups strengthen democracy?")
  },
  @{
    N="07"; Title="Elections"; Subject="Political Science"; Pdf="iest107.pdf"
    Notes=@(
      @("Why elections matter","Periodic elections let citizens choose representatives, renew the public mandate and hold leaders accountable. Elections contribute to representation, legitimacy and political equality."),
      @("Direct and indirect elections","In direct elections, voters choose their representatives themselves. In indirect elections, elected representatives or members of an electoral college choose the office-holder. India uses both forms for different offices."),
      @("Electoral systems","An electoral system converts votes into seats or offices. Under First-Past-The-Post (FPTP), the candidate with the most votes in a constituency wins, even without an absolute majority. Other systems use different methods of representation."),
      @("Election administration","Free and fair elections require clear laws, impartial administration, voter lists, accessible polling, secret ballots and transparent counting. India's Election Commission is a constitutional body responsible for superintendence, direction and control of elections within its remit."),
      @("Challenges and safeguards","Money power, misinformation, intimidation, exclusion and unfair practices can weaken elections. Legal safeguards, monitoring, voter awareness and citizen participation help protect electoral integrity.")
    )
    QA=@(
      @("Why are periodic elections important?","They allow citizens to choose representatives regularly, renew their mandate and hold elected leaders accountable."),
      @("Differentiate direct and indirect elections.","In direct elections citizens vote directly for candidates; in indirect elections an electoral college or elected representatives choose the office-holder."),
      @("What is the First-Past-The-Post system?","It is an electoral system in which the candidate receiving more votes than any other candidate in a constituency wins.")
    )
    Extra=@("Explain how elections support representation and accountability.","State two safeguards needed for free and fair elections.","Mention two challenges that can undermine electoral fairness and explain their effects.")
    MCQQ="Under the First-Past-The-Post system, who wins a constituency?"
    MCQ=@("Candidate with the most votes","Candidate with exactly 50% only","Candidate chosen by a judge","Candidate from the oldest party"); Correct=0
    Sample=@("Explain the importance of periodic elections.","Differentiate direct and indirect elections with examples.","Describe the FPTP system and discuss safeguards needed for free and fair elections.")
  },
  @{
    N="08"; Title="Building Blocks in Economics: The Problem of Choice"; Subject="Economics"; Pdf="iest108.pdf"
    Notes=@(
      @("Scarcity and choice","Human wants are many and changing, while resources such as time, money, labour, land and capital are limited. Scarcity makes choice necessary for individuals, businesses and governments."),
      @("Needs and wants","Needs are essentials for living and well-being; wants are things people desire but can often live without. The distinction may depend on circumstances and priorities."),
      @("Opportunity cost","Choosing one option means giving up the next-best alternative. The value of that forgone alternative is the opportunity cost. Good decisions compare benefits, costs and available resources."),
      @("Basic economic questions","Every economy must decide what to produce, how to produce it and for whom to produce it. Different economic systems and institutions answer these questions in different ways."),
      @("Resources and economic systems","Factors of production include land, labour, capital and entrepreneurship/organisation (with technology influencing production). Markets, governments and communities can each play roles in allocating resources.")
    )
    QA=@(
      @("Why does scarcity create the need for choice?","Because resources are limited while wants are numerous, people must decide how to use resources among competing alternatives."),
      @("What is opportunity cost?","It is the value of the next-best alternative given up when a choice is made."),
      @("What are the three basic economic questions?","What to produce, how to produce and for whom to produce.")
    )
    Extra=@("Give a personal example of opportunity cost and explain it.","Differentiate needs and wants with examples.","Compare how a market and a government might help answer the question 'what to produce?'")
    MCQQ="The value of the next-best alternative given up is called:"
    MCQ=@("Revenue","Opportunity cost","Inflation","Demand"); Correct=1
    Sample=@("Explain scarcity with an example.","Define opportunity cost and illustrate it with a daily-life decision.","Describe the three basic economic questions and explain why every economy faces them.")
  },
  @{
    N="09"; Title="The Price Puzzle: What Drives the Market"; Subject="Economics"; Pdf="iest109.pdf"
    Notes=@(
      @("Demand","Demand is the quantity of a good or service consumers are willing and able to buy at different prices during a given period. Other things remaining equal, quantity demanded usually rises when price falls and falls when price rises."),
      @("Supply","Supply is the quantity producers are willing and able to sell at different prices during a given period. Other things remaining equal, quantity supplied usually rises when price rises and falls when price falls."),
      @("Market price and equilibrium","Demand and supply interact in a market. The equilibrium price is where quantity demanded equals quantity supplied. A shortage can put upward pressure on price; a surplus can put downward pressure on price, though real markets may be affected by many other factors."),
      @("Factors affecting demand and supply","Demand may change with income, preferences, season, expectations and prices of related goods. Supply may change with input costs, technology, weather, taxes, number of sellers and expectations."),
      @("Government intervention","Governments may intervene through taxes, subsidies, regulations, public provision or price-related measures to address public goals or market problems. Effects depend on the policy and market conditions.")
    )
    QA=@(
      @("What is demand?","Demand is the quantity consumers are willing and able to buy at different prices during a given period."),
      @("State the law of demand, other things remaining equal.","When price rises, quantity demanded generally falls; when price falls, quantity demanded generally rises."),
      @("What is market equilibrium?","It is the situation where quantity demanded equals quantity supplied at a particular price.")
    )
    Extra=@("Differentiate demand and supply.","Explain how a shortage and a surplus can affect market price.","Describe three factors, other than a good's own price, that can change demand or supply.")
    MCQQ="At market equilibrium:"
    MCQ=@("Demand is always zero","Quantity demanded equals quantity supplied","Supply is always zero","Prices never change"); Correct=1
    Sample=@("Define demand and supply.","Explain the law of demand and the law of supply.","Describe how equilibrium price is determined and explain how a shortage or surplus may affect price.")
  }
)

function HtmlEncode([string]$text) {
  return [System.Net.WebUtility]::HtmlEncode($text)
}

foreach ($c in $chapters) {
  $notesHtml = ""
  foreach ($item in $c.Notes) {
    $notesHtml += "<article class='topic'><h3>$($item[0])</h3><p>$($item[1])</p></article>`n"
  }

  $qaHtml = ""
  $i = 1
  foreach ($item in $c.QA) {
    $qaHtml += "<details><summary>Q$i. $($item[0])</summary><p class='answer'>$($item[1])</p></details>`n"
    $i++
  }

  $extraHtml = "<ol>"
  foreach ($q in $c.Extra) { $extraHtml += "<li>$q</li>" }
  $extraHtml += "</ol>"

  $optionsHtml = ""
  for ($j=0; $j -lt $c.MCQ.Count; $j++) {
    $letter = [char](65 + $j)
    $optionsHtml += "<label class='option'><input type='radio' name='mcq' value='$j'> $letter. $($c.MCQ[$j])</label>"
  }

  $sampleHtml = "<ol>"
  foreach ($q in $c.Sample) { $sampleHtml += "<li>$q</li>" }
  $sampleHtml += "</ol>"

  $pdfPath = "../materials/iest1dd/$($c.Pdf)"
  $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chapter $($c.N) - $($c.Title) | Ronaldo Study Hub</title>
<style>
*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;background:#080e1b;color:#f4f7ff;font:16px/1.7 Arial,sans-serif}
header,footer{background:#0c1527;padding:20px 8%;border-bottom:1px solid #263650}header a,.link{color:#42d5ff;text-decoration:none}
main{max-width:1050px;margin:auto;padding:38px 20px}.hero,.card{background:#101b2e;border:1px solid #263650;border-radius:13px;padding:28px;margin-bottom:22px}
.hero{background:linear-gradient(135deg,#142c4a,#101b2e)}.label{color:#42d5ff;letter-spacing:2px;font-size:12px}.hero h1{font-size:clamp(28px,5vw,42px);line-height:1.25}.hero h1 span,h2{color:#42d5ff}
h2{margin-top:0;font-size:24px}.topic{padding:8px 0 15px;border-bottom:1px solid #263650}.topic:last-child{border:0}.topic h3{margin-bottom:5px}
details{background:#0a1425;padding:15px;border-radius:8px;margin:12px 0}summary{cursor:pointer;font-weight:bold}.answer{color:#c0cde0;margin-bottom:0}
li{margin:10px 0}.option{display:block;margin:9px 0}.btn{display:inline-block;padding:11px 17px;border-radius:6px;background:#42d5ff;color:#06111d;text-decoration:none;font-weight:bold;border:0;cursor:pointer;margin:7px 5px 7px 0}.secondary{background:#1a304d;color:#42d5ff;border:1px solid #345274}
.result{font-weight:bold;margin-top:12px}.pdf{width:100%;height:600px;border:0;border-radius:8px;background:#fff;margin-top:15px}
.note{color:#aab8ce;font-size:14px}footer{text-align:center;color:#aab8ce;border:0}
@media(max-width:600px){header{padding:16px 5%}main{padding:22px 12px}.hero,.card{padding:19px}.pdf{height:430px}}
</style>
</head>
<body>
<header><a href="../index.html">&larr; Back to Ronaldo Study Hub</a></header>
<main>
<section class="hero">
<p class="label">CBSE CLASS IX | SOCIAL SCIENCE | CHAPTER $($c.N)</p>
<h1>$($c.Title)</h1>
<p>Subject: $($c.Subject)</p>
<p class="note">Chapter-wise revision, question practice and your uploaded textbook PDF.</p>
<a class="btn" href="#notes">Start Learning</a>
</section>
<section class="card" id="notes"><h2>Chapter Notes & Key Concepts</h2>
$notesHtml
<p class="note">These are concise revision notes prepared to support your uploaded chapter. Read the original PDF for full explanations, activities, maps, diagrams and textbook-specific details.</p>
</section>
<section class="card"><h2>Important Questions & Answers</h2>
<p class="note">Open each question to reveal its answer.</p>
$qaHtml
</section>
<section class="card"><h2>Extra Practice Questions</h2><p class="note">Write complete answers in your notebook, then check them against the chapter text.</p>
$extraHtml
</section>
<section class="card"><h2>MCQ Practice</h2><p><b>$($c.MCQQ)</b></p>
$optionsHtml
<button class="btn" onclick="checkMCQ()">Check Answer</button><p class="result" id="result" aria-live="polite"></p>
</section>
<section class="card"><h2>Chapter Sample Practice Paper</h2>
<p><b>Class:</b> IX &nbsp; <b>Subject:</b> Social Science &nbsp; <b>Practice set:</b> Chapter $($c.N)</p>
<p class="note">Suggested practice: answer all questions in your notebook. This is a chapter practice set, not an official CBSE paper.</p>
$sampleHtml
</section>
<section class="card"><h2>Answer Key & Self-Assessment</h2>
<p>MCQ answer: <b>$([char](65 + $c.Correct))</b>. For written responses, award yourself marks for accurate concepts, relevant examples and clear explanation. Recheck answers using the chapter PDF.</p>
</section>
<section class="card"><h2>Original Uploaded Chapter PDF</h2>
<p class="note">Use the original PDF to verify details and complete textbook activities.</p>
<a class="btn" href="$pdfPath" target="_blank">Open PDF</a>
<a class="btn secondary" href="$pdfPath" download>Download PDF</a>
<iframe class="pdf" src="$pdfPath" title="Uploaded chapter PDF"></iframe>
</section>
<a class="btn secondary" href="../index.html">&larr; Return to Homepage</a>
</main>
<footer><b>RONALDO STUDY HUB</b><br>Learn | Practice | Achieve<br>CBSE Class IX Social Science</footer>
<script>
function checkMCQ(){
 const chosen=document.querySelector('input[name="mcq"]:checked');
 const result=document.getElementById('result');
 if(!chosen){result.textContent='Please select an option first.';return;}
 if(Number(chosen.value)===$($c.Correct)){result.textContent='Correct! Well done.';result.style.color='#68e0a0';}
 else{result.textContent='Not quite. Recheck the concept and try again.';result.style.color='#ffb0a8';}
}
</script>
</body>
</html>
"@

  $file = Join-Path $chapterFolder ("chapter-" + $c.N + ".html")
  Set-Content -LiteralPath $file -Value $html -Encoding UTF8
  Write-Host "Created and filled: chapters\chapter-$($c.N).html" -ForegroundColor Green
}

Write-Host ""
Write-Host "Finished: all 9 chapter pages now contain chapter-specific notes and practice." -ForegroundColor Cyan
Write-Host "Check that PDFs exist in materials\iest1dd\ and update index links if needed." -ForegroundColor Yellow
