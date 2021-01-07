(function() {

    function simpleCalculatorOnInput(ev) {
        const d = ev.target.value
        setCalculatorResult("simpleCalculatorResultMytteriPiston", 
            falldistanceByDelay(79 - 4)(d))
        setCalculatorResult("simpleCalculatorResultKadesTrapdoor",
            falldistanceByDelay(83 - 4)(d))
        return true
    }

    function exactCalculatorOnInput(ev) {
        const d = ev.target.value
        setCalculatorResult("exactCalculatorResult", falldistance(d))
        return true
    }

    function setCalculatorResult(elementId, h) {
        const hr = Math.round(h*100)/100
        const element = document.getElementById(elementId)
        // console.log("setting " + elementId + " to " + hr)
        element.innerText = hr
    }

    function falldistanceByDelay(maxFuse) {
        return function(seconds) {
            return falldistance(maxFuse - Math.floor(20*seconds))
        }
    }

    function falldistance(ticks) {
        // console.log("ticks", ticks)
        let v = 0
        let h = 0.04
        for (let i = 0; i < ticks; i++) {
            v = 0.98*(v + 0.04)
            h = h + v + 0.04
        }
        return h
    }

    const simpleCalculator = document.getElementById("simpleCalculatorInput")
    simpleCalculator.oninput = simpleCalculatorOnInput;
    if (simpleCalculator.value) {
        const fakeEvent = {target: {value: simpleCalculator.value}}
        simpleCalculatorOnInput(fakeEvent)
    }

    const exactCalculator = document.getElementById("exactCalculatorInput")
    exactCalculator.oninput = exactCalculatorOnInput;
    if (exactCalculator.value) {
        const fakeEvent = {target: {value: exactCalculator.value}}
        exactCalculatorOnInput(fakeEvent)
    }

})();
