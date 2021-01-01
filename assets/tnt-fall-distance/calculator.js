function calculatorOnInput(ev) {
    const v = ev.target.value
    const a = 9.81
    const d = ev.target.value
    setCalculatorResult("calculatorResultDispenser", 4.4 - d)
    setCalculatorResult("calculatorResultDuper", 4.1 - d)
    return true
}

function setCalculatorResult(elementId, t) {
    const h = 9.81/2*t*t
    const hr = Math.round(h*100)/100
    const element = document.getElementById(elementId)
    // console.log("setting " + elementId + " to " + hr)
    element.innerText = hr
}
