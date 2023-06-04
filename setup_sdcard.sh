#!/bin/bash
clear
echo -e "ДОБРО ПОЖАЛОВАТЬ В АВТОУСТАНОВЩИК 2000"
echo -e "Для начала убедись что ты установил модуль для Magisk и скачал chroot версию бокса(Если нужен путь /mnt)"
echo -e "Script made by me(a.belevich(SadShrimp))"
echo -e "Для начала я добавлю кое какие штуки в .bashrc чтобы тебе не пришлось всё делать ручками"

function set_storage_ilya(){
    echo -e "Теперь выберите из какого пути брать ваш накопитель"
    echo -e "1)/storage(Медленее) - для него не нужен модуль ExSdCard"
    echo -e "2)/mnt/media_rw(Быстрее) - для данного пути нужен модуль ExSdCard"
    read set_choice
    case $set_choice in
    1)
    echo -e "Был выбран 1)/storage(Медленный способ)"
    echo -e "Теперь введите уникальный индентификатор флешки/накопителя - у меня это 0403-0201"
    echo -e "Посмотреть можно в ES проводник либо любом другом проводнике"
    echo -e "Можно ввести два накопителя через пробел"
    sudo mkdir ~/ubuntu/external
    read uuid uuid2
    echo -e "Ваш(И) UUID $uuid $uuid2"
    sudo mkdir /storage/emulated/0/external
    sudo mkdir /storage/$uuid/external
    sudo mkdir ~/ubuntu/external
    sudo mkdir ~/ubuntu/external/$uuid
    sudo mkdir ~/ubuntu/external/0
    echo "sudo mount --bind /storage/emulated/0/external $HOME/ubuntu/external/0 -o -rw" >> .bashrc
    echo "sudo mount --bind /storage/$uuid/external $HOME/ubuntu/external/$uuid -o -rw" >> .bashrc
    cd $HOME/ubuntu/root
    sudo sh -c "mv .bashrc .bashrc_backup"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/0' > $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid' > $HOME/ubuntu/root/.bashrc"
    if [ "$uuid2" != "" ]; then
        sudo mkdir ~/ubuntu/external/$uuid2
        sudo mkdir /storage/$uuid2/external
        echo "sudo mount --bind /storage/$uuid2/external $HOME/ubuntu/external/$uuid2 -o -rw" >> .bashrc
        sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid2' > $HOME/ubuntu/root/.bashrc"
    fi
    sudo sh -c "echo 'alias sd=\"cd /download/\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug64=\"WINEPREFIX=~/.wine box64 wine\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug32=\"WINEPREFIX=~/.wine box86 wine\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/ubuntu/root/.bashrc"
    echo -e "Установка завершена приятного пользования"
    break
    ;;
    2)
    echo -e "Был выбран 1)/mnt(Быстрый способ)"
    echo -e "Теперь введите уникальный индентификатор флешки/накопителя - у меня это 0403-0201"
    echo -e "Посмотреть можно в ES проводник либо любом другом проводнике"
    echo -e "Можно ввести два накопителя через пробел"
    sudo mkdir ~/ubuntu/external
    read uuid uuid2
    echo -e "Ваш(И) UUID $uuid $uuid2"
    sudo mkdir ~/ubuntu/external
    sudo mkdir /storage/emulated/0/external
    sudo mkdir /storage/$uuid/external
    sudo mkdir ~/ubuntu/external/$uuid
    sudo mkdir ~/ubuntu/external/0
    echo "sudo mount --bind /storage/emulated/0/external $HOME/ubuntu/external/0 -o -rw" >> .bashrc
    echo "sudo mount --bind /mnt/media_rw/$uuid/external $HOME/ubuntu/external/$uuid -o -rw" >> .bashrc
    cd $HOME/ubuntu/root
    sudo sh -c "mv .bashrc .bashrc_backup"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/0' > $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid' > $HOME/ubuntu/root/.bashrc"
    if [ "$uuid2" != "" ]; then
        sudo mkdir ~/ubuntu/external/$uuid2
        sudo mkdir /storage/$uuid2/external
        echo "sudo mount --bind /mnt/media_rw/$uuid2/external $HOME/ubuntu/external/$uuid2 -o -rw" >> .bashrc
        sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid2' > $HOME/ubuntu/root/.bashrc"
    fi
    sudo sh -c "echo 'alias sd=\"cd /download/\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug64=\"WINEPREFIX=~/.wine box64 wine\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug32=\"WINEPREFIX=~/.wine box86 wine\"' >> $HOME/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/ubuntu/root/.bashrc"
    echo -e "Установка завершена приятного пользования"
    break
    ;;
    *)
    echo -e "Неправильный выбор попробуй ещё раз либо выйди при помощи ctrl + c"
    break
    ;;
    esac 
}

function set_storage_herick(){
    echo -e "Теперь выберите из какого пути брать ваш накопитель"
    echo -e "1)/storage(Медленее) - для него не нужен модуль ExSdCard"
    echo -e "2)/mnt/media_rw(Быстрее) - для данного пути нужен модуль ExSdCard"
    echo -e "Можно ввести два накопителя через пробел"
    read set_choice
    case $set_choice in
    1)
    echo -e "Был выбран 1)/storage(Медленный способ)"
    echo -e "Теперь введите уникальный индентификатор флешки/накопителя - у меня это 0403-0201"
    echo -e "Посмотреть можно в ES проводник либо любом другом проводнике"
    sudo mkdir ~/Box4Droid/ubuntu/external
    read uuid uuid2
    echo -e "Ваш(И) UUID $uuid $uuid2"
    sudo mkdir /storage/emulated/0/external
    sudo mkdir /storage/$uuid/external
    sudo mkdir ~/Box4Droid/ubuntu/external/$uuid
    sudo mkdir ~/Box4Droid/ubuntu/external/0
    echo "sudo mount --bind /storage/emulated/0/external $HOME/Box4Droid/ubuntu/external/0 -o -rw" >> .bashrc
    echo "sudo mount --bind /storage/$uuid/external $HOME/Box4Droid/ubuntu/external/$uuid -o -rw" >> .bashrc
    cd $HOME/Box4Droid/ubuntu/root
    sudo sh -c "mv .bashrc .bashrc_backup"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/0' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    if [ "$uuid2" != "" ]; then
        sudo mkdir $HOME/Box4Droid/ubuntu/external/$uuid2
        sudo mkdir /storage/$uuid2/external
        echo "sudo mount --bind /storage/$uuid2/external $HOME/Box4Droid/ubuntu/external/$uuid2 -o -rw" >> .bashrc
        sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid2' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    fi
    sudo sh -c "echo 'alias sd=\"cd /download/\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug64=\"WINEPREFIX=~/.wine box64 wine\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug32=\"WINEPREFIX=~/.wine box86 wine\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    echo -e "Установка завершена приятного пользования"
    break
    ;;
    2)
    echo -e "Был выбран 1)/mnt(Быстрый способ)"
    echo -e "Теперь введите уникальный индентификатор флешки/накопителя - у меня это 0403-0201"
    echo -e "Посмотреть можно в ES проводник либо любом другом проводнике"
    echo -e "Можно ввести два накопителя через пробел"
    sudo mkdir ~/Box4Droid/ubuntu/external
    read uuid uuid2
    echo -e "Ваш(И) UUID $uuid $uuid2"
    sudo mkdir /storage/emulated/0/external
    sudo mkdir /storage/$uuid/external
    sudo mkdir ~/Box4Droid/ubuntu/external
    sudo mkdir $HOME/Box4Droid/ubuntu/external/$uuid
    sudo mkdir $HOME/Box4Droid/ubuntu/external/0
    echo "sudo mount --bind /storage/emulated/0/external $HOME/Box4Droid/ubuntu/external/0 -o -rw" >> .bashrc
    echo "sudo mount --bind /mnt/media_rw/$uuid/external $HOME/Box4Droid/ubuntu/external/$uuid -o -rw" >> .bashrc
    cd $HOME/Box4Droid/ubuntu/root
    sudo sh -c "mv .bashrc .bashrc_backup"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/0' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    if [ "$uuid2" != "" ]; then
        sudo mkdir ~/ubuntu/external/$uuid2
        sudo mkdir /storage/$uuid2/external
        echo "sudo mount --bind /mnt/media_rw/$uuid2/external $HOME/Box4Droid/ubuntu/external/$uuid2 -o -rw" >> .bashrc
        sudo sh -c "echo 'sudo mount -o remount,exec /external/$uuid2' > $HOME/Box4Droid/ubuntu/root/.bashrc"
    fi
    sudo sh -c "echo 'alias sd=\"cd /download/\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug64=\"WINEPREFIX=~/.wine box64 wine\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "echo 'alias debug32=\"WINEPREFIX=~/.wine box86 wine\"' >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    echo -e "Установка завершена приятного пользования"
    break
    ;;
    *)
    echo -e "Неправильный выбор попробуй ещё раз либо выйди при помощи ctrl + c"
    break
    ;;
    esac 
}

while true; do
    echo -e "Зайди в любой проводник перед продолжением и посмотри номер флешки обычно он идет: /storage/0403-0203/ - это мой индинтификатор флешки"
    echo -e "Для отменны ctrl + c"
    echo -e "1)Продолжить установку"
    echo -e "2)Восстановить .bashrc для переустановки монтирования"
    read choice
    case $choice in 
    1)
    clear
    echo -e "Выберите Box для которого нужно прикрутить раздел"
    echo -e "1)Box64Droid by Ilya"
    echo -e "2)Box4Droid by Herick"
    read choice_box
        case $choice_box in
        1)
        echo -e "Был выбран Box64Droid by Ilya"
        echo -e "Теперь введите уникальный индинтификатор вашего устройства"
        set_storage_ilya
        break
        ;;
        2)
        echo -e "Был выбран Box64Droid by Ilya"
        echo -e "Теперь введите уникальный индинтификатор вашего устройства"
        set_storage_herick
        break
        ;;
        *)
        echo -e "Неправильный выбор попробуй ещё раз либо выйди при помощи ctrl + c"
        break
        ;;
        esac
    break
    ;;
    2)
    echo -e "Проверка и очистка файлов"
    if [ -f ~/Box4Droid/ubuntu/root/.bashrc_backup ]; then
    sudo rm ~/.bashrc
    sudo su -c "rm ~/Box4Droid/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/Box4Droid/ubuntu/root/.bashrc"
    elif [ -f ~/ubuntu/root/.bashrc_backup ]; then
    sudo rm ~/.bashrc
    sudo su -c "rm ~/ubuntu/root/.bashrc"
    sudo sh -c "cat .bashrc_backup >> $HOME/ubuntu/root/.bashrc"
    else
    echo -e "Скрипт до этого не был установлен"
    fi
    echo -e "Очистка завершена"
    exit
    break
    ;;
    *)
        echo -e "Есть 1 большего не дано, для выхода ctrl + c"
        break
        ;;
    esac
done