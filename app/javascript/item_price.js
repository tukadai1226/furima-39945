function price () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // 入力価格の取得および税込価格の入力先の取得
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    // 税込価格の計算および計算結果の出力
    let tax = inputValue * 0.1;
    let taxInclude = Math.floor(tax);
    addTaxDom.innerHTML = taxInclude;
    // 販売利益の計算および計算結果の出力
    const profit = document.getElementById("profit");
    const salesProfit = inputValue - taxInclude;
    profit.innerHTML = salesProfit;
  });
}

window.addEventListener("turbo:load", price)
window.addEventListener("turbo:render", price);