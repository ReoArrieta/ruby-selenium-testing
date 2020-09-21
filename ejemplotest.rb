# Llamar a las dependencias
require 'selenium-webdriver'
require 'rspec'

# TEST

# Aplicación
describe 'Aplicación de usuario' do 
    describe 'Registro de usuario' do #Feature(Historia de usuario)
        it 'Confirmar que el usuario fue correctamente registrado' do

            # Crear un objeto de selenium-webdriver
            driver = Selenium::WebDriver.for :firefox
            driver.navigate.to 'https://selenium-blog.herokuapp.com/signup'

            # Variable con fecha y hora del sistema
            fecha_sistema = Time.now.to_i

            # Flujo de trabajo en la interfaz mencionada

            # Elemento de la interfaz:
            username_field = driver.find_element(id: 'user_username')
            # Automatizar la escritura en ese campos
            username_field.send_keys("Rafa#{fecha_sistema}")

            # Elemento de la interfaz:
            email_field = driver.find_element(id: 'user_email')
            # Automatizar la escritura en ese campos
            email_field.send_keys("Rafa#{fecha_sistema}@gmail.com")

            # Elemento de la interfaz:
            password_field = driver.find_element(id: 'user_password')
            # Automatizar la escritura en ese campos
            password_field.send_keys('1234')

            # Clic del botón
            submit_button = driver.find_element(id: 'submit')
            # Automatizar acción clic
            submit_button.click

            # Revisión del banner de respuesta
            banner = driver.find_element(id: 'flash_success')
            # Pongo una variable el texto del banner
            banner_text = banner.text

            # Comparar el texto obtenido con el textto esperado
            expect(banner_text).to eq("Welcome to the alpha blog Rafa#{fecha_sistema}")

            # Cerrar conexión
            driver.quit()
        end
    end
end