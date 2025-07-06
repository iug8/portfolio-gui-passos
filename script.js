// Mostra a seção escolhida e oculta as outras
function mostrarSecao(secaoId) {
    const secoes = document.querySelectorAll(".secao");
    secoes.forEach(secao => secao.classList.remove("ativa"));
    document.getElementById(secaoId).classList.add("ativa");
}
  const form = document.querySelector("form");
  const mensagemConfirmacao = document.getElementById("mensagem-confirmacao");
  form.addEventListener("submit", function (event) {
    event.preventDefault(); // Impede o envio real
    mensagemConfirmacao.style.display = "block"; // Mostra a mensagem
    form.reset(); // Limpa o formulário
  });
  form.addEventListener("input", () => {
    mensagemConfirmacao.style.display = "none"; // Esconde ao digitar algo novo
});

  


