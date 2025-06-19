import mysql.connector

# Conectar a Clever Cloud
conexion = mysql.connector.connect(
    host="bmmp9npnwfao1tc9nnpi-mysql.services.clever-cloud.com",
    user="uyzv86ig4di2iu6e",
    password="7LlbuRN4MClJwUb0G5TH",
    database="bmmp9npnwfao1tc9nnpi",
    port=3306
)

cursor = conexion.cursor()

# Leer el archivo SQL
with open("Diagrama_LiFus.sql", "r", encoding="utf-8") as archivo_sql:
    instrucciones = archivo_sql.read()


# Ejecutar cada sentencia por separado
for instruccion in instrucciones.split(";"):
    instruccion = instruccion.strip()
    if instruccion:
        try:
            cursor.execute(instruccion)
        except mysql.connector.Error as err:
            print(f"Error ejecutando instrucción:\n{instruccion}\n{err}")

conexion.commit()
cursor.close()
conexion.close()

print("Todas las tablas fueron creadas correctamente.")
