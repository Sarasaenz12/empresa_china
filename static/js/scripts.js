document.addEventListener('DOMContentLoaded', function() {
    // Inicializar tooltips de Bootstrap
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Manejar envío de likes/dislikes con AJAX
    document.querySelectorAll('form[action*="/like"], form[action*="/dislike"]').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const formData = new FormData(this);
            const action = this.getAttribute('action');
            const button = this.querySelector('button');

            // Mostrar spinner de carga
            const originalContent = button.innerHTML;
            button.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';
            button.disabled = true;

            fetch(action, {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    // Actualizar contador
                    const countMatch = button.textContent.match(/\((\d+)\)/);
                    if(countMatch) {
                        button.innerHTML = button.innerHTML.replace(
                            /\(\d+\)/,
                            `(${data.count})`
                        );
                    }

                    // Feedback visual
                    button.classList.add('active');
                    setTimeout(() => {
                        button.classList.remove('active');
                    }, 1000);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            })
            .finally(() => {
                // Restaurar contenido original del botón
                button.innerHTML = originalContent;
                button.disabled = false;
            });
        });
    });

    // Obtener ciudad automáticamente si el campo existe
    const ciudadField = document.getElementById('ciudad');
    if(ciudadField && ciudadField.value === '') {
        // Usar un servicio de geolocalización por IP
        fetch('https://ipapi.co/json/')
            .then(response => response.json())
            .then(data => {
                if(data.city) {
                    ciudadField.value = data.city;
                }
            })
            .catch(error => {
                console.error('Error al obtener ubicación:', error);
                // Fallback a un servicio alternativo
                return fetch('https://geolocation-db.com/json/');
            })
            .then(response => response?.json())
            .then(data => {
                if(data?.city) {
                    ciudadField.value = data.city;
                }
            })
            .catch(error => {
                console.error('Error con servicio alternativo:', error);
            });
    }

    // Manejar el sistema de valoración con estrellas
    const ratingInputs = document.querySelectorAll('.rating input');
    ratingInputs.forEach(input => {
        input.addEventListener('change', function() {
            const starsContainer = this.closest('.rating');
            const labels = starsContainer.querySelectorAll('label');
            const selectedValue = parseInt(this.value);

            labels.forEach((label, index) => {
                const icon = label.querySelector('i');
                if (index < selectedValue) {
                    icon.classList.replace('bi-star', 'bi-star-fill');
                } else {
                    icon.classList.replace('bi-star-fill', 'bi-star');
                }
            });
        });

        // Simular hover para mejor experiencia de usuario
        input.addEventListener('mouseover', function() {
            const starsContainer = this.closest('.rating');
            const labels = starsContainer.querySelectorAll('label');
            const hoverValue = parseInt(this.value);

            labels.forEach((label, index) => {
                const icon = label.querySelector('i');
                if (index < hoverValue) {
                    icon.style.color = '#ffc107';
                }
            });
        });

        input.addEventListener('mouseout', function() {
            const starsContainer = this.closest('.rating');
            const labels = starsContainer.querySelectorAll('label');

            labels.forEach(label => {
                const icon = label.querySelector('i');
                icon.style.color = '';
            });
        });
    });

    // Mejorar la experiencia del formulario de reseñas
    const reviewForm = document.querySelector('form[action*="/reseña"]');
    if(reviewForm) {
        reviewForm.addEventListener('submit', function(e) {
            const stars = this.querySelector('input[name="calificacion"]:checked');
            const comment = this.querySelector('textarea[name="comentario"]');
            const city = this.querySelector('input[name="ciudad"]');

            if(!stars || !comment.value.trim() || !city.value.trim()) {
                e.preventDefault();

                if(!stars) {
                    const ratingContainer = this.querySelector('.rating');
                    ratingContainer.classList.add('shake');
                    setTimeout(() => {
                        ratingContainer.classList.remove('shake');
                    }, 500);
                }

                if(!comment.value.trim()) {
                    comment.classList.add('is-invalid');
                } else {
                    comment.classList.remove('is-invalid');
                }

                if(!city.value.trim()) {
                    city.classList.add('is-invalid');
                } else {
                    city.classList.remove('is-invalid');
                }

                // Mostrar alerta general
                const alert = document.createElement('div');
                alert.className = 'alert alert-danger mt-3';
                alert.textContent = 'Por favor completa todos los campos requeridos';
                this.appendChild(alert);

                setTimeout(() => {
                    alert.remove();
                }, 3000);
            }
        });
    }

    // Animación para cards al aparecer
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        setTimeout(() => {
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, index * 100);
    });
});