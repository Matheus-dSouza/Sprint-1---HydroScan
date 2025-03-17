
function calcSituacao() {

    // VARIAVEIS FIXOS SÃO PRÉ DEFINIDOS POR CADA NECESSEDADE DO CLIENTE ------------------------
    // a capacidade maxima de agua da represa em m³
    var volumeMax = 30 * (10 ** 9);

    // potencia maxima de geração de energia operando em 100%
    var potenciaMax = 14000;

    // nivel maximo da capacidade de água antes do escoamento de segurança
    var nivelAguaMax = 220;

    // VALORES INPUT -----------------------------------------------------------------------------
    // valor vindo do nosso sensor
    var nivelAgua = Number(ipt_nivelAgua.value);

    // preço de venda de cada MW
    var valorMW = Number(ipt_valorMW.value);

    // VALORES CALCULADOS COM REGRA DE TRÊS ------------------------------------------------------
    // valor do volume total com base no nivel atual da agua
    var volumeAtual = ((nivelAgua * volumeMax) / (nivelAguaMax)) / (10 ** 9);

    // quantidade de energia sendo gerada no momento por segundo
    var potenciaGerada = ((nivelAgua * potenciaMax) / (nivelAguaMax));

    // nivel da potencia de funcionamento das turbinas em porcentagem
    var porcentagemTurbinas = ((100 * potenciaGerada) / (potenciaMax));

    // quantidade de dinheiro gerada por segundo
    var potenciaMonetaria = valorMW * potenciaGerada;

    // displays
    p_nivelAgua.innerHTML = `${potenciaGerada.toFixed(2)} MWh gerados`

    p_volume.innerHTML = `Volume atual de ${volumeAtual.toFixed(3)} bilhões de m³`

    p_potencia.innerHTML = `Turbinas operando a ${porcentagemTurbinas.toFixed(1)}%`

    p_potenciaDinheiro.innerHTML = `Potencia gerada convertida em reais: R$${potenciaMonetaria.toFixed(2)}`

    if (porcentagemTurbinas > 115) {
        alert("[ALERTA]As turbinas estão operando a uma potência com risco de dano estrutural[ALERTA]")
    }
    // if alerta de segurança
    if (porcentagemTurbinas > 100 && porcentagemTurbinas <= 115) {
        alert('O nível da água está excedendo o limite da usina. As turbinas estão operando a uma potência maior que o recomendavel')
    } else if (nivelAgua < 190) {
            alert("O nível da água está abaixo do recomendado. Recomendação: diminua a potência das turbinas para o acumulo da água")
        }
}
