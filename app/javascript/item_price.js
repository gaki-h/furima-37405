// window.addEventListener('load', () => {
//   const itemPrice = document.getElementById("item-price");
//   itemPrice.addEventListener("input", () => {
//     const inputValue = itemPrice.value;
//     const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
//     const addProfitDom = document.getElementById("profit");
//     addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))  
//  })
// });
// 変更差分確認

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});