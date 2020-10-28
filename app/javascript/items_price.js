window.addEventListener('load',() => {
  const priceCalc = document.getElementById("item-price");
  priceCalc.addEventListener("input",() => {
    const inputValue = priceCalc.value;
    const salesCom = document.getElementById("add-tax-price")
    salesCom.innerHTML = Math.floor(inputValue * 0.1)
    const salesProf = document.getElementById("profit")
    salesProf.innerHTML = Math.floor(inputValue - inputValue * 0.1 )
  })
})