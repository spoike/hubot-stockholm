# Description:
#   Stockholmska
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot stockholm on/off - Turn on/off "hubot med stockholmsslang"
#
# Author:
#   spoike

stockholm = [
  "Skaru me till donken och krubba?",
  "Det ringde det en nasare å skulle prångla på mig nått nytt elavtal!",
  "Skicka pluggen hörru.",
  "En lajban tillställning",
  "Sluta blaja säg nåt vettigt istället!",
  "Vad gaspar skorpan?",
  "Ha ru stång i arschlet?",
  "Ha ru tjackat blängsylta?",
  "Sila tugget grabbar, det är bönor i vagnen",
  "Det ska du ge blanka fan i",
  "En jävla kareta!",
  "Ska gå på muggen och slå en båge",
  "Dags att gå och spräcka lite kakel",
  "Faaeen kiisen har du knäck i lurarna?",
  "Ha ru deg till det där då?",
  "Akta så inte bängen kommer",
  "Ska ru tjacka de där?",
  "Ha ru nå tjack?",
  "En slang med slira och halka, tack",
  "Va muckar du för?",
  "Hiva det för ballen",
  "Vaffö tjaffsar du?",
  "Hajjar du tugget, homie?",
  "What’s up med Bamse?",
  "Vad jäspar skorpan?"
  "Lirarn trucka på ner till bönan, sku vigga nåra spänn avna.",
  "Helt gul serú.",
  "Ska dra på galej å förvisso tjacka pivo å katangakråka.",
  "Månne kulorna behaga rulla in",
  "Glider undertecknad i bulle."
  "En annan serú, slår inte dank men sonedera Eken för russina, serú.",
  "Slaggar ett par ryck. Hojta nären landar sneseglarn",
  "Grabben gick ned till tjejen, skulle försöka få lite pengar av henne.",
  "Alldeles pank.",
  "Skall på fest och planerar att handla öl och kyckling.",
  "Om jag får tag på pengar åker jag taxi dit.",
  "Slaggar en liten stund. Säg till när knäppskallen kommer.",
  "Vad bellar dinkan? ",
  "Dags att schappa, bengen trålar.",
  "En annan har ju vajsig på påken.",
  "Tjacka en slang mé halka.",
  "Hiva taskmörten i drickat.",
  "Lira jota.",
  "Hajjarú inte klyket halvpanna?",
  "Skaru henga me ner på stritan? En annan tänker tjacka ny vepa, knacks å maron för å impa på chinnonan nere på haket!"
]

module.exports = (robot) ->
  getConfig = () ->
    robot.brain.get("hubot-stockholm") or {}
  setRoom = (room, enabled) ->
    config = getConfig()
    config[room] = enabled
    robot.brain.set("hubot-stockholm", config)
  isEnabled = (msg) ->
    getConfig()[msg.message.room]
  robot.respond /stockholm (on|yo)/i, (msg) ->
    config = getConfig
    setRoom msg.message.room, true
  robot.respond /stockholm (off|stfu)/i, (msg) ->
    config = getConfig
    setRoom msg.message.room, false
  robot.hear /(^stockholm|[\s\W]stockholm|sthlm)/i, (msg) ->
    msg.send msg.random stockholm if isEnabled(msg)
  robot.hear /(^noll ?ått(a|or)|[\s\W]noll ?ått(a|or))/i, (msg) ->
    msg.send msg.random stockholm if isEnabled(msg)
