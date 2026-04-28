  let carrito = [];

        // Inicializar la página
        function inicializar() {
            cargarArticulos();
            document.getElementById('modal-carrito').addEventListener('click', function(e) {
                if (e.target === this) {
                    cerrarCarrito();
                }
            });
        }

        // Cargar artículos en el DOM
        function cargarArticulos() {
            const grid = document.getElementById('ofertas-grid');
            grid.innerHTML = articulos.map(articulo => {
                const descuento = Math.round(((articulo.precio_original - articulo.precio_actual) / articulo.precio_original) * 100);
                return `
                    <div class="articulo">
                        <div class="articulo-imagen">${articulo.imagen}</div>
                        <div class="articulo-contenido">
                            <div class="articulo-nombre">${articulo.nombre}</div>
                            <div class="articulo-descripcion">${articulo.descripcion}</div>
                            <div class="articulo-precios">
                                <div>
                                    <div class="precio-original">$${articulo.precio_original.toFixed(2)}</div>
                                    <div class="precio-actual">$${articulo.precio_actual.toFixed(2)}</div>
                                </div>
                                <div class="descuento">-${descuento}%</div>
                            </div>
                            <button class="btn-comprar" onclick="agregarAlCarrito(${articulo.id})">
                                Comprar
                            </button>
                        </div>
                    </div>
                `;
            }).join('');
        }

        // Agregar artículo al carrito
        function agregarAlCarrito(id) {
            const articulo = articulos.find(a => a.id === id);
            const itemEnCarrito = carrito.find(c => c.id === id);

            if (itemEnCarrito) {
                itemEnCarrito.cantidad++;
            } else {
                carrito.push({
                    ...articulo,
                    cantidad: 1
                });
            }

            actualizarCarrito();
            mostrarNotificacion(`${articulo.nombre} añadido al carrito`);
        }

        // Actualizar visualización del carrito
        function actualizarCarrito() {
            actualizarContador();
            actualizarVistaCarrito();
        }

        // Actualizar contador de items
        function actualizarContador() {
            const total = carrito.reduce((sum, item) => sum + item.cantidad, 0);
            document.getElementById('contador-items').textContent = total;
        }

        // Actualizar vista del carrito (modal)
        function actualizarVistaCarrito() {
            const carritoItems = document.getElementById('carrito-items');
            const carritoResumen = document.getElementById('carrito-resumen');

            if (carrito.length === 0) {
                carritoItems.innerHTML = '<div class="carrito-vacio">Tu carrito está vacío</div>';
                carritoResumen.style.display = 'none';
                return;
            }

            carritoResumen.style.display = 'block';
            carritoItems.innerHTML = carrito.map(item => `
                <div class="carrito-item">
                    <div class="carrito-item-info">
                        <div class="carrito-item-nombre">${item.nombre}</div>
                        <div class="carrito-item-precio">$${item.precio_actual.toFixed(2)} c/u</div>
                    </div>
                    <div class="carrito-item-cantidad">
                        <input type="number" class="cantidad-input" value="${item.cantidad}" 
                               onchange="cambiarCantidad(${item.id}, this.value)">
                    </div>
                    <button class="btn-eliminar" onclick="eliminarDelCarrito(${item.id})">
                        Eliminar
                    </button>
                </div>
            `).join('');

            calcularTotal();
        }

        // Cambiar cantidad de un item
        function cambiarCantidad(id, nuevaCantidad) {
            nuevaCantidad = parseInt(nuevaCantidad);
            if (nuevaCantidad <= 0) {
                eliminarDelCarrito(id);
                return;
            }
            const item = carrito.find(c => c.id === id);
            if (item) {
                item.cantidad = nuevaCantidad;
                actualizarCarrito();
            }
        }

        // Eliminar artículo del carrito
        function eliminarDelCarrito(id) {
            carrito = carrito.filter(item => item.id !== id);
            actualizarCarrito();
        }

        // Calcular total
        function calcularTotal() {
            const subtotal = carrito.reduce((sum, item) => sum + (item.precio_actual * item.cantidad), 0);
            const envio = subtotal > 500 ? 0 : 10;
            const total = subtotal + envio;

            document.getElementById('subtotal').textContent = `$${subtotal.toFixed(2)}`;
            document.getElementById('envio').textContent = `$${envio.toFixed(2)}`;
            document.getElementById('total').textContent = `$${total.toFixed(2)}`;
        }

        // Mostrar carrito (modal)
        function mostrarCarrito() {
            document.getElementById('modal-carrito').style.display = 'block';
            actualizarVistaCarrito();
        }

        // Cerrar carrito (modal)
        function cerrarCarrito() {
            document.getElementById('modal-carrito').style.display = 'none';
        }

        // Proceder al pago
        function procederPago() {
            const total = document.getElementById('total').textContent;
            alert(`¡Gracias por tu compra!\n\nTotal: ${total}\n\nRedirigiendo al pago...`);
            carrito = [];
            actualizarCarrito();
            cerrarCarrito();
        }

        // Mostrar notificación
        function mostrarNotificacion(mensaje) {
            const notificacion = document.createElement('div');
            notificacion.className = 'notificacion';
            notificacion.textContent = mensaje;
            document.body.appendChild(notificacion);

            setTimeout(() => {
                notificacion.remove();
            }, 3000);
        }

        // Definición de artículos
        const articulos = [
            {id:1, nombre:"Conjunto Falda y Top de Tiras", precio_original:75000, precio_actual:52000, imagen:"<img src='imagenes/oferta 1- conjunto falda y top de tiras.png' alt='Conjunto Falda y Top de Tiras'>", descripcion:"Oferta -40%"},
            {id:2, nombre:"Conjunto Falda y Top de Tiras Blanco", precio_original:70000, precio_actual:50000, imagen:"<img src='imagenes/oferta 2 conjunto falda y tiras blanco.png' alt='Conjunto Falda y Top de Tiras'>", descripcion:"SALE"},
            {id:3, nombre:"Conjunto Casual Adolescentes", precio_original:120000, precio_actual:84000, imagen:"<img src='imagenes/oferta 3- conjunto casual adolescentes.png' alt='Conjunto Casual Adolescentes'>", descripcion:"Oferta -30%"},
            {id:4, nombre:"Short y Camisa con Estampado", precio_original:90000, precio_actual:45000, imagen:"<img src='imagenes/oferta 4- short y camisa con estampado.png' alt='Short y Camisa con Estampado'>", descripcion:"Oferta -50%"},
            {id:5, nombre:"Zapatos Populares", precio_original:90000, precio_actual:67500, imagen:"<img src='imagenes/oferta 5 zapatos populares.png' alt='Zapatos Populares'>", descripcion:"Oferta -25%"},
            {id:6, nombre:"Sudadera", precio_original:50000, precio_actual:39000, imagen:"<img src='imagenes/oferta 6-  sudadera.png' alt='Sudadera'>", descripcion:"Oferta -35%"},
            {id:7, nombre:"Vestido Largo Rojo Ajustado", precio_original:110000, precio_actual:75000, imagen:"<img src='imagenes/mas vendido-1 vestido largo rojo ajustado.png' alt='Vestido Largo Rojo Ajustado'>", descripcion:"TOP"},
            {id:8, nombre:"Vestido Negro", precio_original:90000, precio_actual:72000, imagen:"<img src='imagenes/mas vendido 2-vestido negro.png' alt='Vestido Negro'>", descripcion:"Oferta -20%"},
            {id:9, nombre:"Conjunto Sudadera con Estampado Hombre", precio_original:65000, precio_actual:52000, imagen:"<img src='imagenes/mas vendido 3- conjunto sudadera estampado.png' alt='Conjunto Sudadera con Estampado'>", descripcion:"Oferta -20%"},
            {id:10, nombre:"Conjunto Sudadera con Estampado de Flores", precio_original:65000, precio_actual:48000, imagen:"<img src='imagenes/mas vendido 4- conjunto sudadera flores negra.png' alt='Conjunto Sudadera con Estampado'>", descripcion:"Oferta -20%"}
        ];

        // Inicializar al cargar la página
        window.addEventListener('load', inicializar);


document.addEventListener("DOMContentLoaded", () => {

  const productos = document.querySelectorAll(".producto-card");
  const modal = document.getElementById("modalProducto");

  if (!productos.length || !modal) return;

  const modalNombre = document.getElementById("modalNombre");
  const modalPrecio = document.getElementById("modalPrecio");
  const modalDescripcion = document.getElementById("modalDescripcion");
  const modalImagen = document.getElementById("modalImagen");
  const cerrar = document.querySelector(".cerrar");

  productos.forEach(producto => {

    producto.addEventListener("click", (e) => {

      // ❌ evitar activar modal en botón o tallas
      if (e.target.closest(".btn-producto") || e.target.closest(".tallas") || e.target.closest("a")) return;

      // 🔥 EXTRAER DATOS DIRECTO DEL HTML
      const nombre = producto.querySelector("h3")?.textContent || "Producto";
      const precio = producto.querySelector("p")?.textContent || "";
      const img = producto.querySelector("img")?.src || "";
      const descripcion = producto.dataset.descripcion || "Prenda moderna y versátil ideal para cualquier ocasión.";

      // INSERTAR EN MODAL
      modalNombre.textContent = nombre;
      modalPrecio.textContent = precio;
      modalDescripcion.textContent = descripcion;
      modalImagen.src = img;

      modal.style.display = "block";
    });

  });

  cerrar.onclick = () => modal.style.display = "none";

  window.onclick = (e) => {
    if (e.target === modal) modal.style.display = "none";
  };

});