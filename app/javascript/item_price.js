function item_price(){
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = inputValue - (inputValue * 0.1)
 })
};

window.addEventListener('load', item_price);