# 🍕 Pizzería Don Piccolo — Sistema de Gestión de Pedidos y Domicilios

Sistema de base de datos desarrollado en **MySQL** para gestionar y controlar las operaciones de la **Pizzería Don Piccolo**, permitiendo administrar clientes, pizzas, ingredientes, pedidos, repartidores, domicilios y pagos.

El proyecto busca solucionar los problemas generados por el manejo manual de la información, como retrasos en la atención, errores en los registros y dificultades para controlar el inventario y las entregas.

---

## 📌 Descripción del proyecto

**Pizzería Don Piccolo** requiere un sistema que permita centralizar la información relacionada con la venta de pizzas y el servicio de domicilios.

La base de datos permite realizar el seguimiento completo de un pedido, desde que es registrado por un cliente hasta que es preparado, entregado y pagado.

Además, se implementan funcionalidades avanzadas de MySQL como:

* Funciones almacenadas
* Procedimientos almacenados
* Triggers
* Vistas
* Consultas con `JOIN`
* Consultas con `GROUP BY`
* Subconsultas
* Funciones de agregación
* Control automático de inventario
* Sistema de auditoría de precios

---

## 🎯 Objetivo general

Diseñar e implementar una **base de datos relacional en MySQL** que permita gestionar de manera eficiente el proceso de venta de pizzas y domicilios, garantizando el control de clientes, productos, pedidos, inventario, repartidores, entregas y pagos.

---

## ⚙️ Funcionalidades principales

### 👤 Gestión de clientes

El sistema permite:

* Registrar clientes.
* Almacenar nombre, teléfono, dirección y correo electrónico.
* Consultar el historial de pedidos.
* Identificar clientes frecuentes.
* Consultar cuánto ha gastado cada cliente.

Se considera cliente frecuente aquel que realiza **más de 5 pedidos durante un mes**.

---

### 🍕 Gestión de pizzas

Permite administrar:

* Nombre de la pizza.
* Tamaño.
* Precio base.
* Tipo de pizza:

  * Clásica
  * Vegetariana
  * Especial
* Ingredientes utilizados.
* Disponibilidad de ingredientes.

Las pizzas se relacionan con sus respectivos ingredientes para facilitar el control de inventario.

---

### 🛒 Gestión de pedidos

Cada pedido almacena información como:

* Cliente asociado.
* Fecha y hora.
* Pizzas solicitadas.
* Cantidad.
* Método de pago.
* Estado del pedido.
* Total del pedido.

Los estados disponibles son:

* `Pendiente`
* `En preparación`
* `Entregado`
* `Cancelado`

El total del pedido se calcula teniendo en cuenta:

**Precio de las pizzas + costo de envío + IVA**

---

### 🛵 Gestión de repartidores

El sistema permite registrar:

* Nombre del repartidor.
* Zona asignada.
* Estado del repartidor.

Los repartidores pueden encontrarse en estado:

* `Disponible`
* `No disponible`

Cada domicilio puede ser asignado a un repartidor.

---

### 🏠 Gestión de domicilios

Cada domicilio está relacionado con un pedido y registra:

* Hora de salida.
* Hora de entrega.
* Distancia aproximada.
* Costo del envío.
* Repartidor asignado.

El costo del envío puede determinarse de acuerdo con la distancia o zona de entrega.

---

## 🧠 Funciones y procedimientos

### Función para calcular el total de un pedido

Calcula automáticamente el valor total de un pedido teniendo en cuenta:

```text
Total = Precio de pizzas + Costo de envío + IVA
```

### Función para calcular la ganancia neta diaria

Permite obtener la ganancia de la pizzería durante un día:

```text
Ganancia neta = Ventas - Costos de ingredientes
```

### Procedimiento para finalizar pedidos

Se utiliza para cambiar automáticamente el estado de un pedido a:

```text
Entregado
```

cuando se registra la hora de entrega.

---

## ⚡ Triggers

El proyecto implementa triggers para automatizar diferentes procesos.

### 📦 Actualización automática de stock

Cuando se realiza un pedido, el sistema actualiza automáticamente la cantidad disponible de los ingredientes utilizados.

### 💰 Historial de precios

Cada vez que se modifica el precio de una pizza, se registra el cambio en la tabla:

```text
historial_precios
```

Esto permite mantener un registro de los precios anteriores.

### 🛵 Disponibilidad del repartidor

Cuando finaliza un domicilio, el repartidor vuelve automáticamente a estar disponible para recibir otro pedido.

---

## 👀 Vistas

Se implementan las siguientes vistas para facilitar la consulta de información.

### Resumen de pedidos por cliente

Muestra:

* Nombre del cliente.
* Cantidad de pedidos.
* Total gastado.

### Desempeño de repartidores

Muestra información como:

* Número de entregas.
* Tiempo promedio de entrega.
* Zona asignada.

### Stock bajo

Permite identificar los ingredientes cuyo stock se encuentra por debajo del mínimo permitido.

---

## 🔎 Consultas SQL

El proyecto incluye consultas para obtener información relevante del negocio, entre ellas:

* Clientes con pedidos entre dos fechas utilizando `BETWEEN`.
* Pizzas más vendidas utilizando `GROUP BY` y `COUNT`.
* Pedidos realizados por cada repartidor utilizando `JOIN`.
* Promedio de tiempo de entrega por zona utilizando `AVG` y `JOIN`.
* Clientes que han gastado más de determinado monto utilizando `HAVING`.
* Búsqueda de pizzas por coincidencia parcial utilizando `LIKE`.
* Subconsulta para identificar clientes frecuentes con más de 5 pedidos mensuales.

---

## 🗂️ Estructura general de la base de datos

El sistema está compuesto por diferentes entidades relacionadas entre sí:

```text
CLIENTE
   │
   └── PEDIDO
          │
          ├── DETALLE_PEDIDO
          │        │
          │        └── PIZZA
          │              │
          │              └── INGREDIENTE
          │
          ├── PAGO
          │
          └── DOMICILIO
                    │
                    └── REPARTIDOR
```

La estructura busca mantener la información organizada y evitar la duplicación innecesaria de datos.

---

## 🛠️ Tecnologías utilizadas

* **MySQL**
* SQL
* Procedimientos almacenados
* Funciones almacenadas
* Triggers
* Views
* Consultas avanzadas
* Relaciones entre tablas

---

## 🚀 Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone URL_DEL_REPOSITORIO
```

### 2. Abrir MySQL

Puedes utilizar herramientas como:

* MySQL Workbench
* XAMPP
* phpMyAdmin
* MySQL CLI

### 3. Crear la base de datos

Ejecutar el script SQL principal:

```sql
CREATE DATABASE pizzeria_don_piccolo;
USE pizzeria_don_piccolo;
```

### 4. Ejecutar los scripts

Ejecutar los archivos SQL en el orden correspondiente:

```text
01_base_de_datos.sql
02_tablas.sql
03_datos.sql
04_funciones.sql
05_procedimientos.sql
06_triggers.sql
07_vistas.sql
08_consultas.sql
```

---

## 📚 Objetivos de aprendizaje

Este proyecto permite poner en práctica conceptos fundamentales de bases de datos relacionales:

* Diseño de bases de datos.
* Claves primarias y foráneas.
* Relaciones entre tablas.
* Normalización.
* `INNER JOIN` y `LEFT JOIN`.
* `GROUP BY`.
* `HAVING`.
* Subconsultas.
* Funciones de agregación.
* Funciones almacenadas.
* Procedimientos almacenados.
* Triggers.
* Vistas.
* Manejo de inventario.
* Automatización de procesos mediante SQL.

---

## 👨‍💻 Autor

**Mario Rojas**

Proyecto académico desarrollado como parte del proceso de formación en desarrollo de software.

---

## 📄 Estado del proyecto

🟢 **En desarrollo / Proyecto académico**

El proyecto puede ampliarse posteriormente con una aplicación web o de escritorio que permita interactuar con la base de datos mediante una interfaz gráfica.
