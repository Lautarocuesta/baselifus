import mysql.connector

# Establecer la conexión con MySQL (XAMPP)
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # En XAMPP por defecto no hay contraseña
    database="lifus"
)

# Crear cursor
cursor = conexion.cursor()

# Consulta SQL para insertar un jugador
sql = "INSERT INTO Jugadores (nombre, equipo_categoria, posicion) VALUES (%s, %s, %s)"
valores = ("momo", "Sub-18", "Defensa")

# Ejecutar la consulta
cursor.execute(sql, valores)

# Confirmar los cambios en la base
conexion.commit()

# Confirmación
print("Jugador insertado correctamente.")

# Cerrar cursor y conexión
cursor.close()
conexion.close()
