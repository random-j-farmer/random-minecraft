// generates etho_clock_ticks.json
const fs = require("fs")

function items(start, end) {
    const ns = []
    for (let i = start; i <= end; i++) {
        ns.push(i)
    }
    return ns
}

function normal(n) {
    const total = 4 + 16 * (n - 1)
    const up = 8 * (n - 1)
    const down = 4 + 8 * (n - 1)
    return seconds({ n, total, up, down })
}

function doubleFrequency(n) {
    const total = 2 + 8 * (n - 1)
    const up = 2
    const down = 8 * (n - 1)
    return seconds({ n, total, up, down })
}

function seconds(tup) {
    tup.totalSeconds = tup.total / 20
    tup.upSeconds = tup.up / 20
    tup.downSeconds = tup.down / 20
    return tup
}

function tickTable(n) {
    return {
        normal: items(2, n).map(normal),
        doubleFrequency: items(2, n).map(doubleFrequency),
    }
}

const json = JSON.stringify(tickTable(12), null, 4)
fs.writeFileSync("_data/etho_clock_ticks.json", json)
