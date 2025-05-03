import os
from dotenv import load_dotenv

# Cargar variables de entorno desde el archivo .env
load_dotenv()


class Config:
    # Configuración para Flask
    SECRET_KEY = os.getenv('SECRET_KEY', 'clave_secreta_predeterminada')

    # Configuración para MySQL
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_USER = os.getenv('DB_USER', 'root')
    DB_PASSWORD = os.getenv('DB_PASSWORD', '')
    DB_NAME = os.getenv('DB_NAME', 'empresa_productos_china')

    # Carpetas para almacenar imágenes y videos
    UPLOAD_FOLDER = os.path.join('static', 'img', 'productos')
    CATEGORIA_FOLDER = os.path.join('static', 'img', 'categorias')
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

    # Tamaño máximo para archivos subidos (16MB)
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024