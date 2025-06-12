from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Configuración de la conexión a MySQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:@localhost/copa_renault'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Modelo básico
class Jugador(db.Model):
    __tablename__ = 'Jugadores'
    nombre = db.Column(db.String(255), primary_key=True)
    equipo_categoria = db.Column(db.String(255))
    posicion = db.Column(db.String(255))

@app.route('/')
def index():
    jugadores = Jugador.query.all()
    resultado = '<br>'.join([f"{j.nombre} - {j.posicion}" for j in jugadores])
    return resultado

if __name__ == '__main__':
    app.run(debug=True)
