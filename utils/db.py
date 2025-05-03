import mysql.connector
from mysql.connector import Error
from config import Config


def get_db_connection():
    """Establece y retorna una conexión a la base de datos MySQL"""
    try:
        connection = mysql.connector.connect(
            host=Config.DB_HOST,
            user=Config.DB_USER,
            password=Config.DB_PASSWORD,
            database=Config.DB_NAME
        )
        return connection
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        return None


def execute_query(query, params=None, fetch=True):
    """Ejecuta una consulta SQL y devuelve los resultados si fetch=True"""
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    result = None

    try:
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)

        if fetch:
            result = cursor.fetchall()
        else:
            connection.commit()
            result = cursor.lastrowid

    except Error as e:
        print(f"Error al ejecutar la consulta: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

    return result


def get_all_categories():
    """Obtiene todas las categorías de la base de datos"""
    query = "SELECT * FROM categorias"
    return execute_query(query)


def get_products_by_category(category_id):
    query = """
    SELECT p.* FROM productos p
    JOIN producto_categoria pc ON p.id = pc.producto_id
    WHERE pc.categoria_id = %s
    """
    productos = execute_query(query, (category_id,))
    for p in productos:
        imagenes = execute_query("SELECT * FROM imagenes_producto WHERE producto_id = %s", (p['id'],))
        p['imagenes'] = imagenes
    return productos

def get_all_products():
    productos = execute_query("SELECT * FROM productos")
    for p in productos:
        imagenes = execute_query("SELECT * FROM imagenes_producto WHERE producto_id = %s", (p['id'],))
        p['imagenes'] = imagenes
    return productos


def get_product_by_id(product_id):
    """Obtiene un producto específico por su ID"""
    query = "SELECT * FROM productos WHERE id = %s"
    result = execute_query(query, (product_id,))
    return result[0] if result else None


def get_product_images(product_id):
    """Obtiene todas las imágenes de un producto específico"""
    query = "SELECT * FROM imagenes_producto WHERE producto_id = %s"
    return execute_query(query, (product_id,))


def get_product_videos(product_id):
    """Obtiene todos los videos de un producto específico"""
    query = "SELECT * FROM videos_producto WHERE producto_id = %s"
    return execute_query(query, (product_id,))


def get_product_reviews(product_id):
    """Obtiene todas las reseñas de un producto específico"""
    query = "SELECT * FROM resenas WHERE producto_id = %s ORDER BY fecha DESC"
    return execute_query(query, (product_id,))


def add_product_review(product_id, content, rating, stars, city, ip):
    """Añade una nueva reseña para un producto"""
    query = """
    INSERT INTO resenas (producto_id, contenido, puntuacion, estrellas, ciudad, ip)
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    params = (product_id, content, rating, stars, city, ip)
    return execute_query(query, params, fetch=False)


def add_product_like(product_id, city, ip):
    """Añade un nuevo like para un producto"""
    query = """
    INSERT INTO likes (producto_id, ciudad, ip)
    VALUES (%s, %s, %s)
    """
    params = (product_id, city, ip)
    return execute_query(query, params, fetch=False)


def add_product_dislike(product_id, city, ip):
    """Añade un nuevo dislike para un producto"""
    query = """
    INSERT INTO dislikes (producto_id, ciudad, ip)
    VALUES (%s, %s, %s)
    """
    params = (product_id, city, ip)
    return execute_query(query, params, fetch=False)


def get_product_likes_count(product_id):
    """Obtiene el número total de likes para un producto"""
    query = "SELECT COUNT(*) as count FROM likes WHERE producto_id = %s"
    result = execute_query(query, (product_id,))
    return result[0]['count'] if result else 0


def get_product_dislikes_count(product_id):
    """Obtiene el número total de dislikes para un producto"""
    query = "SELECT COUNT(*) as count FROM dislikes WHERE producto_id = %s"
    result = execute_query(query, (product_id,))
    return result[0]['count'] if result else 0


def get_product_categories(product_id):
    """Obtiene todas las categorías a las que pertenece un producto"""
    query = """
    SELECT c.* FROM categorias c
    JOIN producto_categoria pc ON c.id = pc.categoria_id
    WHERE pc.producto_id = %s
    """
    return execute_query(query, (product_id,))

def get_featured_products():
    nombres_destacados = ['iPhone 16', 'Zapatillas Deportivas', 'Kit de Herramientas', 'Monopoly Juego de mesa']
    placeholders = ','.join(['%s'] * len(nombres_destacados))
    query = f"SELECT * FROM productos WHERE nombre IN ({placeholders})"
    productos = execute_query(query, nombres_destacados)
    for p in productos:
        imagenes = execute_query("SELECT * FROM imagenes_producto WHERE producto_id = %s", (p['id'],))
        p['imagenes'] = imagenes
    return productos
