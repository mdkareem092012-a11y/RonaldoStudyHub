# ==============================================
# RONALDO STUDY HUB - PHASE 2
# COMPLETE CHAPTER-WISE STUDY SYSTEM
# ==============================================
# Paste this file into:
# Desktop\RonaldoStudyHub\phase2-chapters.ps1
#
# Then run:
# powershell -NoProfile -ExecutionPolicy Bypass -File .\phase2-chapters.ps1
#
# This version intentionally uses plain ASCII in PowerShell
# to avoid the encoding/parser problems seen earlier.

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$chapterFolder = Join-Path $root "chapters"
New-Item -ItemType Directory -Path $chapterFolder -Force | Out-Null

# ------------------------------------------------
# CHAPTER DATA
# The chapter names and key questions below follow
# the uploaded Grade 9 Social Science material.
# ------------------------------------------------

$chapters = @(
    @{
        N = "01"
        Title = "Understanding Social Science"
        Subject = "Social Science"
        Pdf = "iest101.pdf"
        Objectives = @(
            "Understand what Social Science means and why it matters.",
            "Recognise how society, environment, institutions and the economy are connected.",
            "Identify evidence and reasoning as important tools for studying society."
        )
        BigQuestions = @(
            "What does Social Science study?",
            "How is Social Science connected to everyday life?",
            "How do people, places, institutions and systems influence one another?"
        )
        Topics = @(
            @("Meaning of Social Science","Social Science is the systematic study of human society. It examines how people live together, how institutions function, how environments influence life, how economies operate, and how the past and present shape the world."),
            @("Social Science in everyday life","Daily activities depend on many connected systems. Food is produced, processed, transported, bought and sold. Roads depend on public authorities. Schools are shaped by education policies. Electricity is produced and distributed through large networks."),
            @("Major areas of study","History helps us understand change over time. Geography helps us understand places and environments. Political Science examines government, institutions, power, rights and citizenship. Economics studies choices, resources and economic activity."),
            @("Evidence and reasoning","Social Science asks questions and seeks answers through observation, evidence and logical reasoning. Local changes, maps, records, statistics, surveys and other sources can be used to understand society.")
        )
        Definitions = @(
            @("Social Science","The systematic study of human society."),
            @("Society","A network of relationships, interactions and institutions among people."),
            @("Institution","An organised system or structure that performs an important role in society."),
            @("Evidence","Information or material used to support an explanation or conclusion.")
        )
        QA = @(
            @("What is Social Science?","Social Science is the systematic study of human society and the relationships, institutions, cultures, environments and economic activities that shape human life."),
            @("Why is Social Science connected to everyday life?","Everyday activities depend on systems of governance, economic production, social cooperation, public services and the natural environment."),
            @("Why is evidence important in Social Science?","Evidence helps us investigate questions carefully, compare explanations and reach conclusions using observation and reasoning.")
        )
        Extra = @(
            "Explain with an example how a daily activity can involve more than one area of Social Science.",
            "Describe one change in a locality and suggest two possible causes.",
            "Why should a Social Science explanation be based on evidence rather than assumption?"
        )
        MCQQuestion = "Social Science is mainly concerned with the systematic study of:"
        MCQOptions = @("The human body","Human society","Only rocks and minerals","Only chemical reactions")
        MCQCorrect = 1
        Summary = "Social Science studies human society and the connections among people, places, institutions, resources and ideas. Everyday life shows these connections clearly. Careful observation, evidence and logical reasoning help us understand social questions."
        MindMap = @("Human society","Institutions","Environment","Economy","History","Human choices")
        Checklist = @("I can define Social Science.","I can explain its connection with everyday life.","I can identify evidence used in Social Science.","I can explain why different areas of Social Science are interconnected.")
    },
    @{
        N = "02"
        Title = "Shaping of the Earth's Surface"
        Subject = "Geography"
        Pdf = "iest102.pdf"
        Objectives = @(
            "Explain what shapes the Earth's surface.",
            "Understand plate tectonics and plate movement.",
            "Describe the formation and classification of landforms.",
            "Recognise links between landforms, living beings and human life."
        )
        BigQuestions = @(
            "What shapes the Earth's surface?",
            "What is plate tectonics and what are its effects?",
            "How are landforms formed and classified?",
            "How are humans connected to landforms?"
        )
        Topics = @(
            @("A changing Earth","The Earth's surface is constantly transformed by powerful forces acting from within the planet and on its surface. Mountains, volcanoes, plains and valleys are examples of landforms."),
            @("Plate tectonics","The Earth's outer solid layer is divided into large and small tectonic plates. These plates move slowly over the semi-molten layer below. Their movement helps explain major physical features and natural phenomena."),
            @("Layers of the Earth","The Earth has three main layers: crust, mantle and core. The crust and upper part of the mantle form the lithosphere. The asthenosphere below the lithosphere is softer and allows plates to move."),
            @("Landforms and surface processes","Landforms are natural features on Earth's surface. Weathering, erosion and deposition modify the surface. Mountains, valleys, plateaus, plains, deserts and coastal features develop through different processes.")
        )
        Definitions = @(
            @("Landform","A natural feature on the Earth's surface formed by processes such as weathering, erosion, deposition and movement of the Earth's crust."),
            @("Plate tectonics","The theory that Earth's lithosphere is divided into plates that move slowly and interact."),
            @("Lithosphere","The rigid outer part of Earth made up of the crust and uppermost mantle."),
            @("Asthenosphere","A softer layer below the lithosphere that allows tectonic plates to move.")
        )
        QA = @(
            @("What is plate tectonics?","Plate tectonics is the theory that the Earth's lithosphere is broken into tectonic plates that move slowly and interact."),
            @("Name the main layers of the Earth.","The main layers are the crust, mantle and core."),
            @("What is a landform?","A landform is a natural feature on Earth's surface formed by processes such as weathering, erosion, deposition and crustal movement.")
        )
        Extra = @(
            "Explain how movement of tectonic plates can affect the Earth's surface.",
            "Differentiate weathering, erosion and deposition.",
            "Explain two ways in which landforms influence human life."
        )
        MCQQuestion = "Which layer together with the crust forms the lithosphere?"
        MCQOptions = @("The core","The upper part of the mantle","The outer core","The atmosphere")
        MCQCorrect = 1
        Summary = "Earth's surface is dynamic. Internal forces and surface processes create and modify landforms. Plate tectonics explains the slow movement of tectonic plates, while weathering, erosion and deposition reshape the surface."
        MindMap = @("Earth's layers","Plate tectonics","Plate movement","Landforms","Weathering","Erosion","Deposition")
        Checklist = @("I can name Earth's main layers.","I can define plate tectonics.","I can explain what a landform is.","I can distinguish weathering, erosion and deposition.")
    },
    @{
        N = "03"
        Title = "Atmosphere and Climate"
        Subject = "Geography"
        Pdf = "iest103.pdf"
        Objectives = @(
            "Describe the composition and layered structure of the atmosphere.",
            "Explain how the atmosphere affects weather and climate.",
            "Understand the mechanism of the monsoon.",
            "Identify practical ways to reduce a carbon footprint."
        )
        BigQuestions = @(
            "What is the composition of the atmosphere?",
            "How do the layers of the atmosphere affect Earth?",
            "What is the mechanism of monsoon?",
            "How can we reduce our carbon footprint?"
        )
        Topics = @(
            @("Composition of the atmosphere","The atmosphere is a mixture of gases surrounding Earth. Nitrogen and oxygen are the most abundant gases. Smaller quantities of other gases, water vapour and dust are also present."),
            @("Layers of the atmosphere","The atmosphere has layers based mainly on changes in temperature and density with altitude. The troposphere contains most water vapour and clouds and is where nearly all weather occurs. Above it are the stratosphere, mesosphere, thermosphere and exosphere."),
            @("Weather and climate","The atmosphere is central to weather and climate. Temperature, humidity and air pressure influence atmospheric conditions. The atmosphere also helps regulate Earth's temperature and protects life from harmful radiation."),
            @("Monsoon and carbon footprint","Seasonal differences in heating and pressure, together with winds and moisture, help create monsoon patterns. Reducing unnecessary energy use, choosing efficient transport and reducing waste can help reduce a person's carbon footprint.")
        )
        Definitions = @(
            @("Atmosphere","The blanket of gases surrounding the Earth."),
            @("Altitude","The height of a location above mean sea level."),
            @("Troposphere","The lowest major layer of the atmosphere where most weather phenomena occur."),
            @("Carbon footprint","The total greenhouse-gas emissions associated with an activity, person, product or organisation.")
        )
        QA = @(
            @("What is the atmosphere?","The atmosphere is a mixture of gases surrounding Earth and is essential for life, weather and climate."),
            @("Which atmospheric layer contains most weather phenomena?","The troposphere contains most of the water vapour and clouds, and nearly all weather phenomena occur there."),
            @("Why is the atmosphere important?","It supports life, shields Earth from harmful radiation, helps regulate temperature and drives weather and climate processes.")
        )
        Extra = @(
            "Explain why the density of air changes with altitude.",
            "Describe the role of water vapour in the atmosphere.",
            "Suggest four practical ways to reduce a carbon footprint."
        )
        MCQQuestion = "Most weather phenomena occur in the:"
        MCQOptions = @("Troposphere","Mesosphere","Thermosphere","Exosphere")
        MCQCorrect = 0
        Summary = "The atmosphere is essential for life and climate. It has a layered structure. The troposphere is the main weather layer. Atmospheric processes, seasonal heating and pressure differences help shape monsoon patterns. Human actions can influence greenhouse-gas emissions."
        MindMap = @("Atmosphere","Composition","Layers","Weather","Climate","Monsoon","Carbon footprint")
        Checklist = @("I can name the main atmospheric layers.","I can explain the importance of the troposphere.","I can describe why the atmosphere matters.","I can list ways to reduce a carbon footprint.")
    },
    @{
        N = "04"
        Title = "Early Humans and Beginning of Civilisation"
        Subject = "History"
        Pdf = "iest104.pdf"
        Objectives = @(
            "Understand how humans lived before the beginning of civilisation.",
            "Explain how archaeology helps reconstruct the past.",
            "Understand communication before the development of writing.",
            "Recognise interaction among early civilisations."
        )
        BigQuestions = @(
            "How did humans live before the beginning of civilisation?",
            "How did humans communicate before writing was invented?",
            "How is archaeology helpful in understanding the past?",
            "How did early civilisations interact with each other?"
        )
        Topics = @(
            @("Early human life","Human history goes back much further than the earliest kingdoms and empires. Early humans adapted to different environments, obtained food in different ways and developed tools and social cooperation."),
            @("Archaeology","The period before writing is understood mainly through archaeological evidence. Tools, pottery, structures, burials, seals, bones and other material remains provide clues about past life."),
            @("Communication before writing","Before formal writing systems, humans communicated through speech, gestures, marks, art and other forms. The development of writing created more durable records of information."),
            @("Early writing and civilisation","The uploaded chapter introduces writing systems and early civilisations, including the Sindhu-Sarasvati/Harappan civilisation. Archaeological and inscriptional evidence helps historians study these societies and their contacts.")
        )
        Definitions = @(
            @("Archaeology","The study of the past through material remains and archaeological evidence."),
            @("Civilisation","A complex human society with organised settlements, institutions, specialised activities and cultural developments."),
            @("Writing system","An organised method of representing language or information using written signs."),
            @("Material evidence","Physical remains from the past used to reconstruct human activities and societies.")
        )
        QA = @(
            @("Why is archaeology important for early history?","Much of early human history predates written records, so archaeological evidence provides important clues about tools, settlements, food, crafts and other aspects of life."),
            @("What was life like before writing?","People lived in communities, adapted to environments, developed tools and communicated through forms that did not depend on formal writing systems."),
            @("Why was the invention of writing important?","Writing created more durable ways of recording and transmitting information and provides direct written evidence for later historical study.")
        )
        Extra = @(
            "Explain two kinds of archaeological evidence that can reveal information about early humans.",
            "How did communication change when writing systems developed?",
            "Why should historians compare different kinds of evidence?"
        )
        MCQQuestion = "Which source is especially important for studying periods before widespread writing?"
        MCQOptions = @("Archaeological evidence","Modern social media","Newspaper editorials","Election results")
        MCQCorrect = 0
        Summary = "The chapter traces the long human journey before and during the beginnings of civilisation. Archaeology is central to reconstructing early life. Communication existed before writing, while writing later provided durable historical records."
        MindMap = @("Early humans","Adaptation","Tools","Archaeology","Communication","Writing","Civilisation")
        Checklist = @("I can explain why archaeology matters.","I can describe early human adaptation.","I can explain communication before writing.","I can state why writing was historically important.")
    },
    @{
        N = "05"
        Title = "State and Society up to 1000 CE"
        Subject = "History"
        Pdf = "iest105.pdf"
        Objectives = @(
            "Understand how state and society organised themselves before 1000 CE.",
            "Trace the emergence and spread of states and societies in the Indian subcontinent.",
            "Understand the ideas of dharma and chakravarti samrat in the historical context presented.",
            "Recognise how administrative, social and occupational groups developed."
        )
        BigQuestions = @(
            "How did society and state organise themselves prior to 1000 CE?",
            "How did states and societies emerge and spread across the Indian subcontinent?",
            "How did ideas of dharma and chakravarti samrat relate to unity in values and governance?",
            "How did social, administrative and occupational groups develop over time?"
        )
        Topics = @(
            @("State and society","The chapter studies historical developments in the Indian subcontinent up to the end of the first millennium CE. State organisation and social organisation changed over time and differed across regions."),
            @("Sources and chronology","Texts, inscriptions, coins, archaeological remains and other evidence help reconstruct early Indian history. Chronology is built by comparing different kinds of sources."),
            @("Political and cultural development","Different states and communities developed across the subcontinent. Political authority, social relationships, occupations and cultural practices interacted and changed over time."),
            @("Dharma and chakravarti samrat","The chapter examines these ideas in their historical context and discusses how political ideas, values and concepts of unity could be expressed in early Indian society and governance.")
        )
        Definitions = @(
            @("State","A political organisation with authority, institutions and control over a territory and population."),
            @("Society","A network of relationships, groups, institutions and cultural practices among people."),
            @("Dharma","A concept discussed in the chapter in relation to duty, ethical order and social responsibilities."),
            @("Chakravarti samrat","An ideal of a universal or paramount ruler discussed in the historical traditions covered by the chapter.")
        )
        QA = @(
            @("What is the focus of Chapter 5?","It examines state and society in the Indian subcontinent up to the end of the first millennium CE."),
            @("Why are different sources needed to study early Indian history?","No single source gives a complete picture. Comparing texts, inscriptions, coins, archaeology and other evidence helps build a more reliable historical understanding."),
            @("How are state and society related?","Political institutions and social relationships influence one another. Changes in administration, occupations, communities and cultural practices can shape state and society together.")
        )
        Extra = @(
            "Explain why historical developments can differ from one region to another.",
            "Describe two kinds of evidence that help historians study the period up to 1000 CE.",
            "Explain the historical importance of studying ideas of governance and social organisation together."
        )
        MCQQuestion = "Which of the following is a historical source?"
        MCQOptions = @("A coin","A weather forecast","A modern advertisement","A fictional story")
        MCQCorrect = 0
        Summary = "Chapter 5 studies state and society in the Indian subcontinent up to 1000 CE. It emphasises change over time, regional variation, the use of multiple sources and the relationship between political organisation and social life."
        MindMap = @("State","Society","Sources","Political authority","Occupations","Dharma","Chakravarti samrat")
        Checklist = @("I can explain the chapter's time period.","I can name different historical sources.","I can relate state and society.","I can explain the chapter's treatment of dharma and chakravarti samrat.")
    },
    @{
        N = "06"
        Title = "Democracy"
        Subject = "Political Science"
        Pdf = "iest106.pdf"
        Objectives = @(
            "Understand how the idea of democracy has evolved.",
            "Identify different forms and practices of democracy.",
            "Explain essential features of democracy beyond institutions.",
            "Recognise challenges faced by Indian democracy."
        )
        BigQuestions = @(
            "How has the idea of democracy evolved?",
            "What are different forms of democracy?",
            "What are the essential features of democracy?",
            "What challenges does Indian democracy face?"
        )
        Topics = @(
            @("Meaning of democracy","The chapter recalls democracy as a form of government in which the source of power and authority lies with citizens, who choose representatives through free and fair elections."),
            @("Values of democracy","Democracy is associated with freedom, equality, justice, rights and duties. It also involves participation and the ability of citizens to express opinions and take part in decision-making."),
            @("Forms and practice","Democratic ideas can be expressed through representative and other forms of participation. Democratic principles can extend beyond formal government institutions into social and civic life."),
            @("Challenges","The chapter asks students to consider challenges faced by Indian democracy. Understanding institutions, participation, rights and responsibilities helps students evaluate democratic practice.")
        )
        Definitions = @(
            @("Democracy","A form of government in which political power and authority ultimately rests with citizens."),
            @("Citizen","A member of a political community with rights and duties."),
            @("Representation","A system in which people choose others to act or make decisions on their behalf."),
            @("Participation","Taking part in decision-making and public or civic life.")
        )
        QA = @(
            @("What is democracy?","Democracy is a form of government in which the source of political power and authority lies with citizens."),
            @("Name important democratic values mentioned in the chapter.","Freedom, equality, justice, rights and duties are among the values associated with democracy."),
            @("Why does democracy extend beyond elections?","Democracy also depends on participation, rights, equality, public discussion, institutions and responsibilities in civic life.")
        )
        Extra = @(
            "Explain why free and fair elections are important in a democracy.",
            "How are freedom and equality connected to democratic life?",
            "Give two examples of democratic participation beyond voting."
        )
        MCQQuestion = "In a democracy, the source of political power and authority lies with:"
        MCQOptions = @("Citizens","Only the military","Only judges","A hereditary monarch")
        MCQCorrect = 0
        Summary = "Democracy is based on citizen power, representation, participation and democratic values such as freedom, equality, justice, rights and duties. The chapter also asks students to examine different forms and challenges of democracy."
        MindMap = @("Citizens","Power","Elections","Freedom","Equality","Justice","Rights","Duties","Participation")
        Checklist = @("I can define democracy.","I can explain key democratic values.","I can explain why citizen participation matters.","I can identify challenges that can affect democratic practice.")
    },
    @{
        N = "07"
        Title = "Elections"
        Subject = "Political Science"
        Pdf = "iest107.pdf"
        Objectives = @(
            "Explain why elections are essential to a democratic system.",
            "Understand direct and indirect elections.",
            "Understand electoral systems and representation.",
            "Recognise institutions, laws and challenges connected with elections."
        )
        BigQuestions = @(
            "Why are elections essential to democracy?",
            "How do electoral systems shape representation and fairness?",
            "What role do institutions and laws play in free and fair elections?",
            "What challenges do elections face in practice?"
        )
        Topics = @(
            @("Why elections matter","Regular and periodic elections are central to democracy. They allow citizens to choose representatives and exercise democratic rights."),
            @("Direct and indirect elections","In direct elections citizens vote directly to choose representatives. In indirect elections an electoral college or representatives choose the office-holder. The chapter gives examples of both forms in India."),
            @("Electoral systems","Rules for converting votes into representation influence political outcomes. Different systems can shape fairness, representation and the relationship between votes and seats."),
            @("Institutions and challenges","Election laws and institutions help organise elections. Challenges such as unfair practices, unequal influence, misinformation or barriers to participation can affect electoral fairness.")
        )
        Definitions = @(
            @("Election","A process through which people choose representatives or office-holders."),
            @("Direct election","An election in which citizens vote directly to choose their representatives or leaders."),
            @("Indirect election","An election in which an electoral college or elected representatives choose the office-holder."),
            @("Representation","The relationship in which elected persons act on behalf of voters.")
        )
        QA = @(
            @("Why are elections important in democracy?","They allow citizens to choose representatives and exercise political rights at regular intervals."),
            @("What is a direct election?","It is an election in which citizens vote directly to choose their representatives or leaders."),
            @("What is an indirect election?","It is an election in which an electoral college or elected representatives choose the office-holder.")
        )
        Extra = @(
            "Explain how electoral rules can affect political representation.",
            "Why are periodic elections necessary for democratic accountability?",
            "Describe two challenges that may affect free and fair elections."
        )
        MCQQuestion = "In a direct election:"
        MCQOptions = @("Citizens vote directly for representatives","Only judges vote","Only political parties vote","An appointed official chooses all candidates")
        MCQCorrect = 0
        Summary = "Elections allow citizens to exercise democratic rights and choose representatives. The chapter distinguishes direct and indirect elections and examines electoral systems, laws, institutions and practical challenges."
        MindMap = @("Democracy","Elections","Direct","Indirect","Electoral system","Representation","Institutions","Fairness")
        Checklist = @("I can explain why elections matter.","I can distinguish direct and indirect elections.","I can explain representation.","I can identify challenges to electoral fairness.")
    },
    @{
        N = "08"
        Title = "Building Blocks in Economics: The Problem of Choice"
        Subject = "Economics"
        Pdf = "iest108.pdf"
        Objectives = @(
            "Understand what economics deals with.",
            "Identify the key questions in economics.",
            "Understand why scarcity creates the need for choice.",
            "Compare how different economic systems address basic economic questions."
        )
        BigQuestions = @(
            "What does economics deal with?",
            "What are the key questions in economics?",
            "How do different economic systems address these questions?"
        )
        Topics = @(
            @("Economics and choice","Economics deals with decisions about scarce resources and the satisfaction of human wants. Everyday examples include spending pocket money, distributing limited books, choosing crops and deciding public expenditure."),
            @("Scarcity and resources","Resources are limited relative to the many wants they can be used to satisfy. Resources can include land, labour, capital, time, knowledge and other inputs used to produce goods and services."),
            @("Basic economic questions","Economic decisions involve questions such as what to produce, how to produce and for whom to produce. Different systems and institutions can answer these questions differently."),
            @("Opportunity cost and trade-offs","Choosing one option means giving up alternatives. The value of the next-best alternative is the opportunity cost. Thinking about trade-offs helps people, firms and governments make choices.")
        )
        Definitions = @(
            @("Economics","The study of choices about the use of scarce resources to satisfy human wants."),
            @("Scarcity","A situation in which available resources are limited relative to wants."),
            @("Opportunity cost","The value of the next-best alternative given up when a choice is made."),
            @("Market","A place or system where buying and selling of products and services takes place.")
        )
        QA = @(
            @("What does economics deal with?","Economics deals with choices about scarce resources and how they are used to satisfy wants."),
            @("Why does scarcity create a problem of choice?","Because resources are limited while wants are numerous, people and institutions must choose among alternatives."),
            @("What are the basic questions in economics?","What to produce, how to produce and for whom to produce are key questions.")
        )
        Extra = @(
            "Give a daily-life example of scarcity.",
            "Explain opportunity cost using a choice about pocket money.",
            "Why must governments make choices about public spending?"
        )
        MCQQuestion = "The value of the next-best alternative given up is called:"
        MCQOptions = @("Revenue","Opportunity cost","Profit","Supply")
        MCQCorrect = 1
        Summary = "Economics begins with the problem of choice. Since resources are scarce relative to wants, people and institutions must make decisions. Opportunity cost captures the value of the next-best alternative, while economies must decide what, how and for whom to produce."
        MindMap = @("Wants","Scarcity","Resources","Choice","Trade-off","Opportunity cost","What to produce","How to produce","For whom")
        Checklist = @("I can define scarcity.","I can explain why choice is necessary.","I can define opportunity cost.","I can state the three basic economic questions.")
    },
    @{
        N = "09"
        Title = "The Price Puzzle: What Drives the Market"
        Subject = "Economics"
        Pdf = "iest109.pdf"
        Objectives = @(
            "Understand factors that influence demand and supply.",
            "Explain how demand and supply interact to influence prices.",
            "Understand market equilibrium as a useful concept.",
            "Recognise why governments may intervene in markets."
        )
        BigQuestions = @(
            "What influences demand and supply?",
            "How are prices determined through demand and supply?",
            "What is market equilibrium?",
            "How and why does government intervene in markets?"
        )
        Topics = @(
            @("Demand","Demand is the quantity of a product that people are willing and able to buy at a particular price. It is more than desire because purchasing power also matters."),
            @("Law of demand","Other things remaining constant, when the price of a product rises, the quantity demanded generally decreases; when price falls, quantity demanded generally increases."),
            @("Market demand and related goods","Market demand is the total demand of all potential buyers. Demand can also be influenced by income, preferences, seasons and the prices of related goods such as substitutes and complementary goods."),
            @("Supply and price determination","Supply concerns the quantity sellers are willing and able to offer. Demand and supply interact in markets and influence prices. A market equilibrium is a situation where quantity demanded equals quantity supplied."),
            @("Government intervention","Governments may intervene in markets for different public purposes. The nature and effects of intervention depend on the policy and the market conditions involved.")
        )
        Definitions = @(
            @("Demand","The quantity of a good or service that consumers are willing and able to buy at a particular price."),
            @("Supply","The quantity of a good or service that producers are willing and able to offer for sale."),
            @("Purchasing power","The amount of goods or services that one unit of currency can buy at a particular time."),
            @("Market equilibrium","A situation in which quantity demanded equals quantity supplied.")
        )
        QA = @(
            @("What is demand?","Demand is the quantity of a product that people are willing and able to buy at a particular price."),
            @("State the law of demand.","Other things remaining constant, a rise in price generally reduces quantity demanded, while a fall in price generally increases quantity demanded."),
            @("What is market equilibrium?","Market equilibrium is the situation in which quantity demanded equals quantity supplied."),
            @("What are related goods?","Related goods are products whose demand is connected. They include substitutes, which can replace each other, and complementary goods, which are generally used together.")
        )
        Extra = @(
            "Differentiate desire from demand.",
            "Explain the difference between individual demand and market demand.",
            "How can the price of a substitute affect demand for another product?",
            "Why can the price of a product change between seasons?"
        )
        MCQQuestion = "Market equilibrium occurs when:"
        MCQOptions = @("Quantity demanded equals quantity supplied","Demand is zero","Supply is zero","All prices are identical")
        MCQCorrect = 0
        Summary = "Markets involve buyers and sellers. Demand depends on willingness and ability to buy, while supply depends on sellers' willingness and ability to offer goods. Their interaction helps determine prices. Related goods, income, preferences and seasons can also influence demand."
        MindMap = @("Demand","Price","Quantity","Supply","Market demand","Substitutes","Complements","Equilibrium","Government")
        Checklist = @("I can define demand.","I can state the law of demand.","I can explain market demand.","I can define supply and equilibrium.","I can identify substitutes and complements.")
    }
)

# ------------------------------------------------
# PAGE TEMPLATE
# ------------------------------------------------

$template = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chapter __NUM__ - __TITLE__ | Ronaldo Study Hub</title>
<style>
*{box-sizing:border-box}
html{scroll-behavior:smooth}
body{margin:0;background:#07111f;color:#f4f7fb;font:16px/1.7 Arial,Helvetica,sans-serif}
a{text-decoration:none}
header{position:sticky;top:0;z-index:10;background:#0c1728;border-bottom:1px solid #263b58;padding:17px 7%}
header a{color:#48d7ff;font-weight:bold}
main{max-width:1120px;margin:auto;padding:38px 18px}
.hero,.card{background:#101d31;border:1px solid #263b58;border-radius:14px;padding:28px;margin-bottom:22px}
.hero{background:linear-gradient(135deg,#142b48,#101d31)}
.eyebrow{color:#48d7ff;font-size:11px;font-weight:800;letter-spacing:2px}
h1{font-size:clamp(30px,5vw,52px);line-height:1.15;margin:12px 0}
h1 span,h2{color:#48d7ff}
h2{font-size:24px;margin-top:0}
h3{margin-bottom:6px}
p,li{color:#bdc9da}
.topic{padding:7px 0 16px;border-bottom:1px solid #263b58}
.topic:last-child{border-bottom:0}
.objective,.definition,.question,.check{padding:12px 14px;background:#0b1628;border-radius:8px;margin:10px 0}
.definition strong,.question strong{color:#48d7ff}
details{background:#0b1628;border-radius:8px;margin:11px 0;padding:13px}
summary{cursor:pointer;font-weight:bold;color:#f4f7fb}
.answer{padding-top:10px;color:#c7d2e2}
.grid2{display:grid;grid-template-columns:1fr 1fr;gap:18px}
.mindmap{display:flex;flex-wrap:wrap;gap:10px}
.node{padding:9px 13px;border-radius:20px;background:#17314d;color:#8fe7ff;border:1px solid #2e5578}
.checklist label{display:block;padding:9px 0}
.btn{display:inline-block;padding:11px 17px;border-radius:7px;background:#48d7ff;color:#06111b;font-weight:800;border:0;cursor:pointer;margin:7px 5px 7px 0}
.btn.secondary{background:#17314d;color:#48d7ff;border:1px solid #345b7d}
.result{font-weight:800}
.pdf{width:100%;height:620px;border:0;border-radius:8px;background:white;margin-top:15px}
footer{text-align:center;padding:35px 15px;background:#0c1728;border-top:1px solid #263b58;color:#9eacc1}
footer strong{color:#48d7ff}
.small{font-size:13px;color:#9eacc1}
@media(max-width:750px){.grid2{grid-template-columns:1fr}.pdf{height:430px}.hero,.card{padding:20px}}
</style>
</head>

<body>

<header>
<a href="../index.html">&larr; Back to Ronaldo's Study Hub</a>
</header>

<main>

<section class="hero">
<p class="eyebrow">CBSE CLASS 9 | SOCIAL SCIENCE | CHAPTER __NUM__</p>
<h1>__TITLE__</h1>
<p><strong>Subject:</strong> __SUBJECT__</p>
<p>Study the chapter in a structured way: understand, practise, revise and self-check.</p>
<a href="#notes" class="btn">Start Chapter</a>
<a href="#quick" class="btn secondary">15 Minute Revision</a>
</section>

<section class="card" id="objectives">
<h2>Learning Objectives</h2>
__OBJECTIVES__
</section>

<section class="card" id="questions">
<h2>Big Questions</h2>
<p class="small">Use these questions to guide your reading of the chapter.</p>
__BIG_QUESTIONS__
</section>

<section class="card" id="notes">
<h2>Detailed Notes</h2>
__TOPICS__
</section>

<section class="card">
<h2>Important Definitions</h2>
__DEFINITIONS__
</section>

<section class="card">
<h2>Important Questions and Answers</h2>
__QA__
</section>

<section class="card">
<h2>Extra Practice Questions</h2>
__EXTRA__
</section>

<section class="card">
<h2>MCQ Practice</h2>
<p><strong>Question:</strong> __MCQ_QUESTION__</p>
__MCQ_OPTIONS__
<button class="btn" onclick="checkMCQ()">Check Answer</button>
<p id="mcqResult" class="result"></p>
</section>

<section class="card" id="quick">
<h2>Study This Chapter in 15 Minutes</h2>
<p>Read the summary first, then review the mind map and complete the checklist.</p>
<h3>Quick Summary</h3>
<p>__SUMMARY__</p>
<h3>Mind Map</h3>
<div class="mindmap">__MINDMAP__</div>
</section>

<section class="card">
<h2>Revision Checklist</h2>
<div class="checklist">
__CHECKLIST__
</div>
</section>

<section class="card">
<h2>Original Uploaded Chapter PDF</h2>
<p class="small">Use the original chapter PDF for the complete textbook discussion, activities, examples, figures and source-specific details.</p>
<a class="btn" href="../materials/iest1dd/__PDF__" target="_blank">Open PDF</a>
<a class="btn secondary" href="../materials/iest1dd/__PDF__" download>Download PDF</a>
<iframe class="pdf" src="../materials/iest1dd/__PDF__" title="Uploaded chapter PDF"></iframe>
</section>

<a class="btn secondary" href="../index.html">&larr; Return to Homepage</a>

</main>

<footer>
<strong>RONALDO'S CLASS 9 SOCIAL SCIENCE STUDY HUB</strong><br>
Explore. Learn. Practise. Achieve.<br>
Made by Ronaldo
</footer>

<script>
const correctAnswer = __MCQ_CORRECT__;

function checkMCQ() {
    const selected = document.querySelector('input[name="mcq"]:checked');
    const result = document.getElementById('mcqResult');

    if (!selected) {
        result.textContent = 'Please select an option first.';
        result.style.color = '#f2c56b';
        return;
    }

    if (Number(selected.value) === correctAnswer) {
        result.textContent = 'Correct! Well done.';
        result.style.color = '#68dca1';
    } else {
        result.textContent = 'Incorrect. Recheck the concept and try again.';
        result.style.color = '#ff9c91';
    }
}

document.querySelectorAll('.check-input').forEach(function(box) {
    box.addEventListener('change', function() {
        const state = [];
        document.querySelectorAll('.check-input').forEach(function(item) {
            state.push(item.checked);
        });
        localStorage.setItem('chapter-__NUM__-checklist', JSON.stringify(state));
    });
});

(function loadChecklist() {
    const saved = localStorage.getItem('chapter-__NUM__-checklist');

    if (!saved) return;

    try {
        const state = JSON.parse(saved);

        document.querySelectorAll('.check-input').forEach(function(item, index) {
            item.checked = Boolean(state[index]);
        });
    } catch (error) {
        console.log('Checklist data could not be loaded.');
    }
})();
</script>

</body>
</html>
'@

# ------------------------------------------------
# HTML HELPERS
# ------------------------------------------------

function Build-ListHtml($items, $className) {
    $html = ""
    foreach ($item in $items) {
        $html += "<div class='$className'>$item</div>`r`n"
    }
    return $html
}

function Build-ObjectivesHtml($items) {
    $html = "<ol>"
    foreach ($item in $items) { $html += "<li>$item</li>" }
    $html += "</ol>"
    return $html
}

function Build-BigQuestionsHtml($items) {
    $html = "<ol>"
    foreach ($item in $items) { $html += "<li>$item</li>" }
    $html += "</ol>"
    return $html
}

function Build-TopicsHtml($items) {
    $html = ""
    foreach ($item in $items) {
        $html += "<article class='topic'><h3>$($item[0])</h3><p>$($item[1])</p></article>`r`n"
    }
    return $html
}

function Build-DefinitionsHtml($items) {
    $html = ""
    foreach ($item in $items) {
        $html += "<div class='definition'><strong>$($item[0])</strong><br>$($item[1])</div>`r`n"
    }
    return $html
}

function Build-QAHtml($items) {
    $html = ""
    $number = 1
    foreach ($item in $items) {
        $html += "<details><summary>Q$number. $($item[0])</summary><p class='answer'>$($item[1])</p></details>`r`n"
        $number++
    }
    return $html
}

function Build-ExtraHtml($items) {
    $html = "<ol>"
    foreach ($item in $items) { $html += "<li>$item</li>" }
    $html += "</ol>"
    return $html
}

function Build-MCQOptionsHtml($options) {
    $html = ""
    for ($i = 0; $i -lt $options.Count; $i++) {
        $letter = [char](65 + $i)
        $html += "<label class='objective'><input type='radio' name='mcq' value='$i'> $letter. $($options[$i])</label>`r`n"
    }
    return $html
}

function Build-MindMapHtml($items) {
    $html = ""
    foreach ($item in $items) {
        $html += "<span class='node'>$item</span>`r`n"
    }
    return $html
}

function Build-ChecklistHtml($items) {
    $html = ""
    foreach ($item in $items) {
        $html += "<label><input class='check-input' type='checkbox'> $item</label>`r`n"
    }
    return $html
}

# ------------------------------------------------
# CREATE EACH CHAPTER
# ------------------------------------------------

foreach ($c in $chapters) {

    $page = $template

    $page = $page.Replace("__NUM__", $c.N)
    $page = $page.Replace("__TITLE__", $c.Title)
    $page = $page.Replace("__SUBJECT__", $c.Subject)
    $page = $page.Replace("__PDF__", $c.Pdf)

    $page = $page.Replace("__OBJECTIVES__", (Build-ObjectivesHtml $c.Objectives))
    $page = $page.Replace("__BIG_QUESTIONS__", (Build-BigQuestionsHtml $c.BigQuestions))
    $page = $page.Replace("__TOPICS__", (Build-TopicsHtml $c.Topics))
    $page = $page.Replace("__DEFINITIONS__", (Build-DefinitionsHtml $c.Definitions))
    $page = $page.Replace("__QA__", (Build-QAHtml $c.QA))
    $page = $page.Replace("__EXTRA__", (Build-ExtraHtml $c.Extra))
    $page = $page.Replace("__MCQ_QUESTION__", $c.MCQQuestion)
    $page = $page.Replace("__MCQ_OPTIONS__", (Build-MCQOptionsHtml $c.MCQOptions))
    $page = $page.Replace("__MCQ_CORRECT__", [string]$c.MCQCorrect)
    $page = $page.Replace("__SUMMARY__", $c.Summary)
    $page = $page.Replace("__MINDMAP__", (Build-MindMapHtml $c.MindMap))
    $page = $page.Replace("__CHECKLIST__", (Build-ChecklistHtml $c.Checklist))

    $fileName = "chapter-" + $c.N + ".html"
    $filePath = Join-Path $chapterFolder $fileName

    Set-Content -LiteralPath $filePath -Value $page -Encoding UTF8

    Write-Host "Created: chapters\$fileName" -ForegroundColor Green
}

Write-Host ""
Write-Host "PHASE 2 COMPLETE." -ForegroundColor Cyan
Write-Host "All 9 chapter pages now have:" -ForegroundColor Yellow
Write-Host "Learning objectives"
Write-Host "Big Questions"
Write-Host "Detailed Notes"
Write-Host "Important Definitions"
Write-Host "Questions and Answers"
Write-Host "Extra Practice Questions"
Write-Host "MCQ Practice"
Write-Host "15 Minute Revision"
Write-Host "Mind Map"
Write-Host "Revision Checklist"
Write-Host "Original PDF"
Write-Host ""
Write-Host "Open the website with: start index.html" -ForegroundColor Cyan
