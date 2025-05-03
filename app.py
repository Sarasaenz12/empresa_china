from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
import os
from werkzeug.utils import secure_filename
from config import Config
from utils.db import (
    get_all_categories, get_all_products, get_product_by_id,
    get_product_images, get_product_videos, get_product_reviews,
    add_product_review, add_product_like, add_product_dislike,
    get_product_likes_count, get_product_dislikes_count,
    get_products_by_category, get_product_categories, get_featured_products,
)

app = Flask(__name__)
app.config.from_object(Config)

# Asegurarse de que existan los directorios para subir archivos
os.makedirs(Config.UPLOAD_FOLDER, exist_ok=True)
os.makedirs(Config.CATEGORIA_FOLDER, exist_ok=True)

def archivo_permitido(nombre_archivo):
    """Verifica si la extensión del archivo está permitida"""
    return '.' in nombre_archivo and \
        nombre_archivo.rsplit('.', 1)[1].lower() in Config.ALLOWED_EXTENSIONS

def obtener_ip_cliente():
    """Obtiene la dirección IP del cliente"""
    if request.environ.get('HTTP_X_FORWARDED_FOR') is None:
        return request.environ['REMOTE_ADDR']
    else:
        return request.environ['HTTP_X_FORWARDED_FOR']

@app.route('/')
def inicio():
    """Página principal con todas las categorías"""
    categorias = get_all_categories()
    productos_destacados = get_featured_products()
    return render_template('index.html', categories=categorias, productos_destacados=productos_destacados)

@app.route('/categorias')
def categorias():
    """Muestra todas las categorías disponibles"""
    categorias = get_all_categories()
    return render_template('categorias.html', categories=categorias)

@app.route('/productos')
def productos():
    """Muestra todos los productos disponibles"""
    productos = get_all_products()
    return render_template('productos.html', products=productos)

@app.route('/categoria/<int:id_categoria>')
def productos_por_categoria(id_categoria):
    """Muestra todos los productos de una categoría específica"""
    productos = get_products_by_category(id_categoria)
    categoria = next((c for c in get_all_categories() if c['id'] == id_categoria), None)
    return render_template('productos.html', products=productos, categoria=categoria)

@app.route('/producto/<int:id_producto>')
def detalle_producto(id_producto):
    """Muestra los detalles de un producto específico"""
    producto = get_product_by_id(id_producto)
    if not producto:
        flash('Producto no encontrado', 'error')
        return redirect(url_for('productos'))

    imagenes = get_product_images(id_producto)
    videos = get_product_videos(id_producto)
    reseñas = get_product_reviews(id_producto)
    likes = get_product_likes_count(id_producto)
    dislikes = get_product_dislikes_count(id_producto)
    categorias = get_product_categories(id_producto)

    return render_template(
        'producto_detalle.html',
        producto=producto,
        images=imagenes,
        videos=videos,
        reviews=reseñas,
        likes_count=likes,
        dislikes_count=dislikes,
        categories=categorias
    )

@app.route('/producto/<int:id_producto>/reseña', methods=['POST'])
def agregar_reseña(id_producto):
    """Añade una nueva reseña para un producto"""
    if request.method == 'POST':
        contenido = request.form.get('comentario')
        estrellas = request.form.get('calificacion')
        ciudad = request.form.get('ciudad')
        ip = obtener_ip_cliente()

        if not contenido or not estrellas or not ciudad:
            flash('Todos los campos son obligatorios', 'error')
            return redirect(url_for('detalle_producto', id_producto=id_producto))

        try:
            estrellas_int = int(estrellas)
            if not 1 <= estrellas_int <= 5:
                raise ValueError('La calificación debe estar entre 1 y 5')
        except ValueError:
            flash('La calificación debe ser un número entre 1 y 5', 'error')
            return redirect(url_for('detalle_producto', id_producto=id_producto))

        add_product_review(id_producto, contenido, estrellas_int, estrellas_int, ciudad, ip)
        flash('Reseña añadida correctamente', 'success')

    return redirect(url_for('detalle_producto', id_producto=id_producto))

@app.route('/producto/<int:id_producto>/like', methods=['POST'])
def agregar_like(id_producto):
    """Añade un nuevo like para un producto"""
    ciudad = request.form.get('ciudad', 'Desconocida')
    ip = obtener_ip_cliente()

    add_product_like(id_producto, ciudad, ip)
    return jsonify({'success': True, 'count': get_product_likes_count(id_producto)})

@app.route('/producto/<int:id_producto>/dislike', methods=['POST'])
def agregar_dislike(id_producto):
    """Añade un nuevo dislike para un producto"""
    ciudad = request.form.get('ciudad', 'Desconocida')
    ip = obtener_ip_cliente()

    add_product_dislike(id_producto, ciudad, ip)
    return jsonify({'success': True, 'count': get_product_dislikes_count(id_producto)})

@app.route('/buscar', methods=['GET'])
def buscar():
    """Búsqueda de productos por nombre"""
    consulta = request.args.get('q', '')
    if not consulta:
        return redirect(url_for('productos'))

    todos_productos = get_all_products()
    productos = [
        p for p in todos_productos
        if consulta.lower() in p['nombre'].lower() or
           (p['descripcion'] and consulta.lower() in p['descripcion'].lower())
    ]

    return render_template('productos.html', products=productos, search_query=consulta)

if __name__ == '__main__':
    app.run(debug=True)