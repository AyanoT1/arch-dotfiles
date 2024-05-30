# 📖 Prefacio (ahrre palabra pituca)

Éste readme es más una guía de Introducción al Ricing, para explicar los conceptos más basicos de la customización de Linux, los contenidos del repositorio son mis configuraciónes actuales (mis dotfiles) que espero sirvan de ejemplo más que simplemente copiar y pegar, aunque claro, recomendaría hacer todo este proceso (al menos) una sola vez y despues sí copiar y pegar.

# ⬇️ Descargar e Instalar Arch Linux

Lo típico, usar una vm con la iso de arch linux x86_64 o hacer un booteable con rufus, iniciar y elegir arch install medium (la primera opción), esperar hasta que salga la terminal y correr el comando archinstall (no, nadie quiere particionar un dico a mano).

## ⚙️ Settings de archinstall

En cuanto a paquetes adicionales que puse en las settings, dejo un resumen de lo que son:
| Paquete  | Descripción |
|----------|-------------|
| kitty    | emulador (programa) de terminal, usa aceleración por GPU igual que Alacritty, es re famoso así que hay bastante documentación y ejemplos de configuración |
| neofetch | script que muestra información del sistema |
| fastfetch| otro script que muestra info pero es más rápido y muestra más que Neofetch |
| neovim   | editor de texto por terminal, un poco raro de aprender a usar pero cómodo cuando te acostumbras |
| zsh      | una shell aparte de Bash, es más nueva y bien documentada, es el default de macOS de hecho (la shell es la que se encarga de comunicar los comandos a la máquina) |
| starship | un script que funciona arriba de la shell y se encarga de mostrar la info de manera más aesthetic ✨ |
| thunar   | es un explorador de archivos |
| fzf      | conocido como Fuzzy Finder, es una utilidad muy op, se usa para buscar cosas de manera eficiente y se puede encadenar con los demás comandos, es súper util |
| ttf-firacode-nerd | es la fuente con iconos especiales que uso, hay mil mas en [nerdfonts](https://www.nerdfonts.com/), normalmente para instalarlas se ocupa yay|


Tip: En las configuraciones donde sale una lista larga usar / para buscar rápido

* Languague: English (100%)
* Mirrors: Chile
* Locales: default (us, en_US, UTF-8)  (esta es la opción del teclado, elegir opción acorde)
* Disk config: Use best-effort default - btrfs - default - use compression (acá es la opción de partición automatica y sistema de archivos, btrfs es algo más nuevo que ext4)
* Disk encription: None
* Bootloader: Grub
* Swap: True
* Hostname: archlinux (btw?) (opción de nombre de la máquina)
* Root password: (una contraseña)
* User account: (un usuario con permisos de superusuario aka sudo)
* Profile: Desktop - KDE  (opción de elegir entorno de escritorio, el repositorio se enfoca en KDE)
* Audio: pulseaudio (opción de servidor de audio, he notado que pulseaudio tiene más soporte por las aplicaciones)
* Kernels: linux (Linus Unix)
* Additional Packages: git firefox kitty neofetch fastfetch neovim zsh starship thunar fzf ttf-firacode-nerd
* Network configuration: Use NetworkManager (IMPORTANTISIMO)
* Timezone: (Chile/Continental)
* NTP: true (un protocolo de redes, nothing to worry about)
* Optional repos: multilib (una extensión de pacman, el apt de arch)

Luego instalar, cuando pregunte si quieres hacer algún cambio post-install decir que no y reiniciar con el comando

```bash
reboot
```

# 🗺️ Y ahora qué? Empieza la cosecha de arroz 🌾

En la comunidad de [r/unixporn](https://www.reddit.com/r/unixporn/) y de Arch en general, se le llama ricing a configurar exhaustivamente el sistema hasta que quede bien aesthetic ✨, viene de que es un proceso tan tedioso como cosechar arroz.

Bueno ahora sí, que hacer ahora? el sistema ya está utilizable, pero bastante mid, asi que hay que configurar para que quede digno de un Terminal Wizzard, Hacker o tu estereotipo de computación favorito, para eso podemos hacer lo siguiente:

De aquí en adelante mayoritariamente se va a ocupar la terminal (Kitty en este caso)

Instalar el repositorio de usuarios de Arch, que contiene más cosas que pacman como programas, fuentes, etc.

```bash
pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Luego antes de ocupar yay hay que correr los siguentes comandos (sólo se hace cuando se instala por primera vez en la maquina):

```bash
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
```

Y listo, ya podemos usar yay como nuestro package manager, sólo tener en cuenta que yay es un repositrio mantenido por usuarios y no es oficial de Arch, asi que recomiendo fuertemente buscar los paquetes antes de instalar para verificar las versiones que se quiere instalar, con buscar "nombreDelPaquete Arch" en google debería ser suficiente para cachar la versión del paquete y origen (UpStreamURL), para actualizar los paquetes del sistema podemos simplemente ejecutar `yay` y lo hace solo, cualquier duda revisar el [repositorio oficial](https://github.com/Jguer/yay).

## 🤖 Tutorial MUY MUY basico de Vim/NeoVim

⚠️ Ojo, si realmente no quieres usar NeoVim puedes instalar VS Code con `yay Visual Studio Code` y listo⚠️

Neovim es una versión modernizada de Vim, que a su vez es una modernización de Vi, un editor de texto por terminal. Es un editor basado en modos:

- **Modo Normal**: Es el modo por defecto para navegar y manipular texto.
- **Modo Insert**: Permite insertar texto. Se accede a él desde el modo Normal.

Para abrir un archivo con Neovim (o crearlo si no existe) se usa:

```bash
nvim direccion_del_archivo
```
La dirección del archivo se refiere a la dirección relativa al directorio que esté abierto en ese momento en la terminal, se puede usar dirección absoluta centrada en home con `~/dirección`.

Los comandos de uso básico son:

| Tecla(s) | Modo  | Descripción                                 |
|----------|-------|---------------------------------------------|
| <kbd>i   | Normal| Entra en modo Insert antes del cursor       |
| <kbd>Esc | Insert| Vuelve al modo Normal                       |
| <kbd>x   | Normal| Borra el carácter bajo el cursor            |
| <kbd>:   | Normal| Entra en el modo de línea de comandos       |
| <kbd>u   | Normal| Deshace la última acción (equivale a Ctrl+Z)|
| <kbd>/   | Normal| Busca una cadena de texto                   |
| `:w`     | Normal| Escribe los cambios al archivo              |
| `:q`     | Normal| Cierra Neovim si no hay cambios sin guardar |
| `:wq`    | Normal| Guarda el archivo y cierra Neovim           |
| `:q!`    | Normal| Cierra Neovim sin guardar                   |
| `dd`     | Normal| Borra la línea actual                       |

Esto es todo lo necesario para usar NeoVim, un tutorial (mucho) más completo se encuentra dentro de NeoVim con el comando `:Tutor`.

## 🪄 Embellecer la terminal 🧙‍♂️

Como buenos computines, pasamos un buen rato en la terminal asi que debería al menos ser agradable a la vista, asi que manos a la o

### 🐈‍⬛ Tema de kitty

En general todos los programas de linux guardan sus configuraciones en `~/.config`, algunos como las shell lo guardan directamente en `~`, asi que sabiendo esto, crearemos el archivo de configuración de Kitty, si un directorio no existe, hay que crearlo con `mkdir`.

```bash
cd
cd .config/
cd kitty
nvim kitty.conf
```

La configuración que más importa de este archivo es seleccionar la fuente, acá también se guardan los colores y otras cosas, ver el archivo del repositorio o consultar la [documentación oficial de kitty](https://sw.kovidgoyal.net/kitty/), asi que con NeoVim en insert-mode agregamos lo siguiente:

```bash
font_family       FiraCode Nerd Font
bold_font         FiraCode Nerd Font
italic_font       FiraCode Nerd Font
bold_italic_font  FiraCode Nerd Font
```

Saliendo del insert-mode con la tecla <kbd>Esc</kbd> y guardando el archivo con el comando `:wq`, al cerrar y abrir kitty debería estar listo.

### 🐚 Cambiando Bash por Zsh

Se puede ver qué shell está usando la terminal mediante

```bash
echo $SHELL
```

El comando va a retornar la dirección en donde se encuentra Bash, como vamos a cambiar a zsh para nuestro usuario usamos el comando:

```bash
chsh -s $(which zsh)
```

Si probamos denuevo `echo $SHELL` nos va a seguir saliendo Bash, pues tenemos que reiniciar la maquina para guardar los cambios. Al abrir kitty una vez reiniciada la maquina se notará que la terminal cambió, porque se ve horrible, pero nada de lo que preocuparse, solo falta configurar starship.

### 🚀 Configurar Starship

Para integrar starship en la terminal debemos modificar el archivo `.zshrc` que debería estar en home (`~/`), (si no está da lo mismo, lo creamos con neovim):

```bash
cd
nvim .zshrc
```

Para iniciar Starship agregamos al archivo anterior la linea:

```bash
eval "$(starship init zsh)"
```

Si ahora reiniciamos la terminal, el formato debe haber cambiado. La configuración de Starship está en `~/.config` en un archivo que se llama `starship.toml`, acá pueden copiar y pegar la configuración que está en este repositorio, probar los presets de la página o hacer su propia config, el funcionamiento de cada módulo y las presents están en la página oficial de [Starship](https://starship.rs/).

Por último, falta algo muy importante, el autocompletado y el destacado de comandos y el historial de comandos, para eso en home tenemos que clonar unos repositorios:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

Despues creamos el archivo donde se guarda el historial de comandos (archivo vacío, salir con `:wq`):

```bash
nvim .zsh_history
```

Luego para activar estas características hay que agregar al archivo `.zshrc` lo siguiente:

```bash
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
```

Trucazo con el fzf, gracias al source fzf de arriba, cuando apretamos <kbd>Ctrl</kbd> + <kbd>r</kbd> podemos navegar el historial de comandos.

En este mismo archivo podemos crear aliases que nos parezcan útiles con:
```
alias nombre="comando"
```
Los que estoy usando son:
| Alias     | Comando                                    | Descripción                                                   |
|-----------|--------------------------------------------|---------------------------------------------------------------|
| ls        | ls -lah --color                                   | Muestra en formato lista, incluyendo archivos ocultos, con tamaños leíbles |
| fontlist  | fc-list \| cut -d'/' -f4- \| fzf           | Permite ver las fuentes instaladas y el nombre                |
| vim       | nvim                                       | Sí, vim es más corto que nvim                                 |

Para ocupar los aliases creados hay que reinicar el terminal.

# Coming Soon 🔜
