
let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

function guardarCarrito() {
  localStorage.setItem("carrito", JSON.stringify(carrito));
}

function eliminarProducto(indexItem) {
  carrito.splice(indexItem, 1);
  guardarCarrito();
  renderCarrito();
}

function vaciarCarrito() {
  carrito = [];
  guardarCarrito();
  renderCarrito();
}

function renderCarrito() {
  let lista = document.getElementById("lista-carrito");
  let totalElemento = document.getElementById("total");
  let contadorElemento = document.getElementById("contador");

  if (!lista || !totalElemento || !contadorElemento) {
    return;
  }

  lista.innerHTML = "";
  let total = 0;

  carrito.forEach((item, i) => {
    let li = document.createElement("li");
    li.innerHTML = `
      ${item.nombre} - $${item.precio.toLocaleString()}
      <button onclick="eliminarProducto(${i})">❌</button>
    `;
    lista.appendChild(li);
    total += item.precio;
  });

  totalElemento.textContent = total.toLocaleString();
  contadorElemento.textContent = carrito.length;
}

function contraentrega() {
  if (carrito.length === 0) {
    alert("Carrito vacío. Agrega productos antes de proceder.");
    return;
  }

  let mensaje = "Hola, quiero comprar:\n";

  carrito.forEach(item => {
    mensaje += `${item.nombre} - $${item.precio}\n`;
  });

  let numero = "573102519142";
  window.open(`https://wa.me/${numero}?text=${encodeURIComponent(mensaje)}`);
}

function pagarNequi() {
  alert("Nequi: 300 123 4567\n¡Gracias por tu compra! ✅");
}

function pagarPayPal() {
  window.open("https://www.paypal.com");
}

function pagarWeb() {
  if (carrito.length === 0) {
    alert("Carrito vacío");
    return;
  }

  alert("Pago realizado correctamente ✅");
  descargarPDF();
  vaciarCarrito();
}

function descargarPDF() {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();

  doc.setFontSize(18);
  doc.text("RECIBO DE COMPRA", 20, 20);

  doc.setFontSize(12);
  let y = 40;
  let total = 0;

  carrito.forEach(item => {
    doc.text(`${item.nombre} - $${item.precio}`, 20, y);
    y += 10;
    total += item.precio;
  });

  doc.text("------------------------", 20, y);
  y += 10;
  doc.text(`TOTAL: $${total}`, 20, y);

  doc.save("recibo.pdf");
}

function agregarCarrito(nombre, precio) {
  let producto = {
    nombre: nombre,
    precio: precio
  };

  carrito.push(producto);
  guardarCarrito();
  renderCarrito();
  alert("Producto agregado 🛒");
}

window.addEventListener("load", renderCarrito);





