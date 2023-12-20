import fnmatch
import smtplib
import getpass
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.encoders import encode_base64

print("**** Enviar Correo Office ****")
user = input("Cuenta de Office: ")
password = getpass.getpass("Password: ")

remitente = input("From, ejemplo: administrador <admin@utp.edu.pe>: ")
destinatario = input("To, ejemplo: amigo <amigo@gmail.com>: ")
asunto = input("Subject, Asunto del mensaje: ")
mensaje = input("Mensaje HTML: ")
nombre_archivo = input("Adjuntar archivo: ")

gmail = smtplib.SMTP('smtp.office365.com', 587)
gmail.starttls()
gmail.login(user, password)
gmail.set_debuglevel(1)

header = MIMEMultipart()
header['Subject'] = asunto
header['From'] = remitente
header['To'] = destinatario

mensaje = MIMEText(mensaje, 'html')
header.attach(mensaje)

def buscar_archivo(nombre_archivo, directorio):
    archivos_encontrados = []

    for ruta_actual, directorios, archivos in os.walk(directorio):
        for archivo in fnmatch.filter(archivos, nombre_archivo):
            ruta_completa = os.path.join(ruta_actual, archivo)
            archivos_encontrados.append(ruta_completa)

    return archivos_encontrados

directorio_inicial = "ArchivoCorreo"

archivos_encontrados = buscar_archivo(nombre_archivo, directorio_inicial)

if archivos_encontrados:
    print("Archivos encontrados:")
    for archivo in archivos_encontrados:
        if os.path.isfile(archivo):
            adjunto = MIMEBase('application', 'octet-stream')
            adjunto.set_payload(open(archivo, "rb").read())
            encode_base64(adjunto)
            adjunto.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(archivo))
            header.attach(adjunto)

    gmail.sendmail(remitente, destinatario, header.as_string())
    gmail.quit()

else:
    print("Ningún archivo encontrado.")
