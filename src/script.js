var pag = 0;
var arrayPagine;
var indicatorePagina;

function gestoreLoad()
{
	pag = 0;
	arrayPagine = document.getElementsByClassName("page");
	indicatorePagina = document.getElementById("indicatorePagina");

	if(window.innerWidth > 1100)
		arrayPagine[0].style.display = "flex";
	else
		arrayPagine[0].style.display = "block";

	indicatorePagina.innerHTML = "Pagina " + parseInt(pag+1);
}

function cambioPagina(dir)
{
	arrayPagine[pag].style.display = "none";
	pag += dir;

	if(pag == 3)
		pag = 0;
	else if(pag == -1)
		pag = 2;

	indicatorePagina.innerHTML = "Pagina " + parseInt(pag+1);
	if(window.innerWidth > 1100)
		arrayPagine[pag].style.display = "flex";
	else
		arrayPagine[pag].style.display = "block";
}

onresize = (event) => {		if(window.innerWidth > 1100)
		arrayPagine[pag].style.display = "flex";
	else
		arrayPagine[pag].style.display = "block";};

function mostraFenomeno(fenomeno, colore, azione)
{
	bottoniPremuti = document.getElementsByClassName(fenomeno+"Btn");
	if(bottoniPremuti[0].style.backgroundColor != colore)
	{
		bottoniPremuti[0].style.backgroundColor = colore;
		bottoniPremuti[1].style.backgroundColor = colore;
		bottoniPremuti[0].style.color = "white";
		bottoniPremuti[1].style.color = "white";

	}
	else
	{
		bottoniPremuti[0].style.backgroundColor = "#eaeaea";
		bottoniPremuti[1].style.backgroundColor = "#eaeaea";
		bottoniPremuti[0].style.color = "black";
		bottoniPremuti[1].style.color = "black";
	}

	var newStile;
	spanFenomeno = document.getElementsByClassName(fenomeno);

	if(azione=="show")
	{
		if(spanFenomeno[0].style.display == "none" || spanFenomeno[0].style.display == "")
			newStile = "inline-block";
		else
			newStile = "none"

		for(var i = 0; i < spanFenomeno.length; i++)
			spanFenomeno[i].style.display = newStile;
	}
	else if(azione=="ev")
	{
		if(spanFenomeno[0].style.backgroundColor == "transparent" || spanFenomeno[0].style.backgroundColor == "")
			newStile = colore;
		else
			newStile = "transparent";

		for(var i = 0; i < spanFenomeno.length; i++)
			spanFenomeno[i].style.backgroundColor = newStile;
	}
}

function evidenzia(riga, azione)
{
	var idRigaTrascrizione = "#" + riga.id;
	if(azione ==  "on")
		document.getElementById(idRigaTrascrizione).classList.add("evidenziato");
	else
		document.getElementById(idRigaTrascrizione).classList.remove("evidenziato");

}

function mostraListe()
{
	var bottone = document.getElementById("bottonePannello");
	var content = bottone.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = (100+content.scrollHeight) + "px";
    }
}

window.onload = gestoreLoad()
