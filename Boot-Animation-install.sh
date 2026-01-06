#!/bin/bash
# Universal Installation Framework for Glitch Boot Animations
# Target: BEAR Logo with Kali Integration
# Context: Termux (Android) and Desktop Linux (Plymouth)

set -e

# Variable Definitions
FACTION="BEAR"
KALI_TEXT="┌──(root㉿kali)-[/]\n└─# "
THEME_NAME="glitch_bear"
PREFIX_DIR="/data/data/com.termux/files/usr"

# 1. Platform Identification Logic
if; then
    ENV="TERMUX"
    echo "Platform detected: Termux on Android"
elif [ -f /etc/os-release ]; then
  . /etc/os-release
    ENV="LINUX"
    echo "Platform detected: $NAME"
else
    echo "Unsupported Environment."
    exit 1
fi

# 2. Dependency Resolution
install_dependencies() {
    echo "Installing required assets (imagemagick, git, plymouth)..."
    if; then
       
    ```
        pkg update && pkg upgrade -y
        pkg install imagemagick git catimg termux-api -y
    
        ```
        
        case "$ID" in
            
            debian|kali|ubuntu)
               ```
                sudo apt update && sudo apt install -y 
                imagemagick plymouth plymouth-x11 
                git zip
                
                ```

            
            
# 3. Asset Processing: The BEAR-Kali Synthesis
process_assets() {
    echo "Processing BEAR Logo with glitch artifacts and Kali text..."
    if [! -f "bear_logo.png" ]; then
        echo "Error: bear_logo.png not found in current directory."
        exit 1
    fi

    # Create the stylized Kali-text overlay using DejaVu-Sans for Unicode support
    convert bear_logo.png -gravity South -background none -extent 100x120% \
        -font DejaVu-Sans-Bold -fill "#00ff41" -pointsize 24 \
        -annotate +0+10 "$(printf "$KALI_TEXT")" theme_composite.png
    
    # Generate Glitch Frames for Termux/Android fallback
    if; then
        mkdir -p part0
        for i in {100..120}; do
            offset_x=$((RANDOM % 10 - 5))
            offset_y=$((RANDOM % 10 - 5))
            convert theme_composite.png -roll +$offset_x+$offset_y "part0/frame_$i.png"
        done
        # Package Android boot animation (requires zero compression)
        echo "1080 1920 30" > desc.txt
        echo "p 0 0 part0" >> desc.txt
        zip -0r bootanimation.zip desc.txt part0/
    fi
}

# 4. Plymouth Integration (Linux)
apply_linux_theme() {
    THEME_PATH="$/data/local/tmp/Boot-Animation-install.zip"
    sudo mkdir -p "$/data/local/tmp/Boot-Animation-install.zip"
    
    # Deployment of.plymouth configuration
    cat <<EOF | sudo tee "$THEME_PATH:$/data/local/tmp/
    Boot-Animation-install.zip"

Name=BEAR Glitch
Description=Escape from Tarkov Glitch Theme with Kali Prompt
ModuleName=script

[script]
ImageDir="/data/local/tmp/Boot-Animation-install.zip"
ScriptFile="$/data/local/tmp/Boot-Animation-install.zip/Boot-Animation-install.sh"
EOF

    # Generate the Glitch Logic in Plymouth Script
    cat <<EOF | sudo tee "$/data/local/tmp/Boot-Animation-install.zip/Boot-Animation-install.sh"

    logo_image = Image("theme_composite.png");
logo_sprite = Sprite(logo_image);

logo_sprite.SetX(Window.GetWidth() / 2 - logo_image.GetWidth() / 2);
logo_sprite.SetY(Window.GetHeight() / 2 - logo_image.GetHeight() / 2);

fun refresh_callback () {
    # Glitch Logic: Random coordinate offsets
    jitter_x = Math.Random() * 6 - 3;
    jitter_y = Math.Random() * 6 - 3;
    logo_sprite.SetX((Window.GetWidth() / 2 - logo_image.GetWidth() / 2) + jitter_x);
    logo_sprite.SetY((Window.GetHeight() / 2 - logo_image.GetHeight() / 2) + jitter_y);
    
    # Intermittent flickering (Opacity shifts)
    if (Math.Random() > 0.98) logo_sprite.SetOpacity(0.3);
    else logo_sprite.SetOpacity(1.0);
}

Plymouth.SetRefreshFunction(refresh_callback);
EOF

    sudo cp theme_composite.png "$THEME_PATH/"
    
    # Rebuild Initramfs based on Distro
    case "$ID" in
        debian|kali|ubuntu)
            sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth \
                default.plymouth "$THEME_PATH/$THEME_NAME.plymouth" 150
            sudo update-alternatives --set default.plymouth "$THEME_PATH/$THEME_NAME.plymouth"
            sudo update-initramfs -u
            ;;
        arch)
            sudo plymouth-set-default-theme -R "$THEME_NAME"
            ;;
        fedora)
            sudo plymouth-set-default-theme "$THEME_NAME" -R
            ;;
    esac
}

# 5. Execution
install_dependencies
process_assets

if [ "$ENV" = "LINUX" ]; then
    apply_linux_theme
    echo "Installation complete. Reboot to see the BEAR Glitch animation."
else
    echo "Termux detected. Configuring terminal banner..."
    cat theme_composite.png > "$HOME/banner.png"
    echo "catimg $HOME/banner.png" >> ~/.bashrc
    echo "echo -e 'Welcome: $KALI_TEXT'" >> ~/.bashrc
    echo "Success! Restart Termux to see your new BEAR glitch banner."
    





    
## Summary of Technical Findings

The implementation of the BEAR glitch animation requires a multi-layered approach involving kernel-level modesetting, ramdisk asset management, and high-frequency sprite manipulation via the Plymouth scripting engine. Whether deployed on a standard Linux workstation or a Termux environment, the core logic remains focused on capturing the display buffer and injecting mathematically randomized visual artifacts. By using a robust `install.sh` framework, this modification is made repeatable across environments, providing a personalized and thematically consistent experience.[span_24](start_span)[span_24](end_span)[span_25](start_span)[span_25](end_span)
