const express = require('express');
const config = require('./config');
const app = express();
const mysql = require('mysql'); //llamamos mysql
const connection = mysql.createConnection({ //credenciales de mysql
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'junaeb',
  });

// parse application/x-www-form-urlencoded
// parse application/json
const { json } = require('body-parser');
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//session application para reservar el contenido de mis URL
var session = require('express-session');
app.use(session({ secret: 'plataforma5', resave: true, saveUninitialized: true }));

app.set('view engine', 'ejs'); // Motor de plantillas
app.set('views', __dirname + '/views'); // Rutas de vistas
app.use(express.static(__dirname + "/public"));

// Levantamos la aplicación
app.listen(config.port, () => {
    console.log('Aplicación Andando');
})

//Verificamos conexión MySQL
connection.connect(function(err) {
    if (err) throw err;
    console.log("Conectado con MySQL");
  });

//Muestra la página de inicio (HOME)
app.get('/', (req, res) => {
     if ((res.status(200))){
        res.render("./home");
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
 })

 //Muestra la página de registro
 app.get('/register', (req, res) => {
    if ((res.status(200))) {
        res.render("./registro")
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
 })
 
 //Muestra la página de logeo
app.get('/inicioSesion', (req, res) => {
    if ((res.status(200))){
        res.render("./login")
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
})

//Muestra la página de error
app.get('/errorPagina', (req, res) => {
    res.render("./errorPagina")
})

//Logeo de usuario
app.post('/Pedidos', async (req, res) => {
    const datos = req.body;
    const query = 'SELECT * FROM schools WHERE name = ? AND PASSWORD = ?';
    connection.query(query, [datos.ingresarNombre, datos.ingresarPassword], (error, results) => {
    if (error) {
        console.error('Error al realizar la consulta: ', error); // Manejamos el error
      } else {
        if (results.length > 0) {
          res.render("./paginaPedidos", { mensaje: datos.ingresarNombre }) 
        } else {
          res.render("./errorPagina", { mensaje: 'Credenciales inválida Vuelva a intentar nuevamente' }) 
        }
      }    
  })
});
     
//Muesta la página de registro
app.get('/registroUsuario', (req, res) => {
    if ((res.status(200))){
        res.render("./registro")
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
})

//Registrar el Usuario
app.post('/registro', async (req, res) => {
    const datos = req.body;
    try {
    if (datos.empty){
    res.status(400).json({ message: "No hay datos" });
    } else {
    const nuevoRegistro = { name: datos.user, email: datos.mail , password: datos.password };
    connection.query('INSERT INTO schools SET ?', nuevoRegistro, (error, results) => {
      if (error) {
        console.log('Error al realizar la inserción')
      } else {
        res.render("exito", { mensaje: 'Usuario ha sido ingresado correctamente' }) 
      }
    });
    }
    } catch (error) {
    res.status(400).json({ message: error.mesagge });
    }  
})

 //Muestra la página de pedidos
 app.get('/ingresarPedido', (req, res) => {
    if ((res.status(200))) {
        //const fechaActual = new Date();
        //const fechaFormateada = `${fechaActual.getDate().toString().padStart(2, '0')}-${(fechaActual.getMonth() + 1).toString().padStart(2, '0')}-${fechaActual.getFullYear()}`;
        //console.log(fechaFormateada)
        res.render("./pedidos"/* { fechaActual: fechaFormateada }*/);
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
 })

 //Registrar un pedido
app.post('/confirmarPedido', async (req, res) => {
  const datos = req.body;
  try {
  if (datos.empty){
  res.status(400).json({ message: "No hay datos" });
  } else {
  const nuevoRegistro =  { fecha: datos.fecha, vegetarian: datos.vegetarianos, caloric: datos.caloricos , celiac: datos.celiacos, ethnic: datos.autoctonos, standard: datos.estandar };
  connection.query('INSERT INTO orders SET ?', nuevoRegistro, (error, results) => {
    if (error) {
      console.error('Error al realizar la inserción', error)
    } else {
      res.render("exito", { mensaje: 'Pedido ha sido ingresado correctamente'}) 
    }
  });
  }
  } catch (error) {
  res.status(400).json({ message: error.mesagge });
  }  
})

  //Muestra la página de pedidos
  app.get('/paginaPedidos', (req, res) => {
    if ((res.status(200))) {
        res.render("./paginaPedidos")
    } else {
        res.render.json({message: "error de conexión, favor avisar a soporte"})
    }
 })