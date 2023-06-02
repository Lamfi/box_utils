#!/bin/bash
clear
echo -e "ДОБРО ПОЖАЛОВАТЬ В АВТОУСТАНОВЩИК 2000"
echo -e "ТЫ ГОТОВ ПОЗНАТЬ МИР ФЛЕШЕК?"
echo -e "Для начала убедись что ты установил модуль для Magisk и скачал chroot версию бокса"
echo -e "Ну чё погнали"
echo -e "Script made by me(a.belevich(SadShrimp))"
echo -e "Для начала я добавлю кое какие штуки в .bashrc чтобы тебе не пришлось всё делать ручками"
echo -e "А так же мне нужны Root права"


while true; do
    echo -e "Зайди в любой проводник перед продолжением и посмотри номер флешки обычно он идет: /storage/0403-0203/ - это мой индинтификатор флешки"
    echo -e "Для отменны ctrl + c"
    echo -e "1)Продолжить"
    read choice
    case $choice in 
        1)
        sudo mkdir ~/ubuntu/download
        echo -e "Я создал папку для sdcard чтобы был доступ к флешке её в box64droid находится она по пути ~/ubuntu/download"
        echo -e "Теперь введи тот самый номмер тут: например 0403-0203"
        read number;
        echo "sudo mount --bind /mnt/media_rw/$number/Download $HOME/ubuntu/download/ -o -rw" >> .bashrc
        source ~/.bashrc
        echo -e "Теперь у тебя будет всё автоматизировано, тебе не надо больше будет вводить комманды для доступа к флешке"
        echo -e "Осталась одна поправочка в боксе и жизнь в шоколаде"
        echo -e "Я так же добавлю для тебя некоторые удобные комманды"
        sudo sh -c "echo 'sudo mount -o remount,exec /download' >> $ubuntu/root/.bashrc"
        sudo sh -c "echo 'alias sd=cd /download/' >> $HOME/ubuntu/root/.bashrc"
        sudo sh -c "echo 'alias debug64=WINEPREFIX=~/.wine box64 wine' >>$HOME/ubuntu/root/.bashrc"
        sudo sh -c "echo 'alias debug32=WINEPREFIX=~/.wine box86 wine' >>$HOME/ubuntu/root/.bashrc"
        sudo sh -c "echo 'alias debug64all=WINEDEBUG=-all WINEPREFIX=~/.wine box64 wine' >> $HOME/ubuntu/root/.bashrc"
        sudo sh -c "echo 'alias debug32all=WINEDEBUG=-all WINEPREFIX=~/.wine box86 wine' >>$HOME/ubuntu/root/.bashrc"
        rm ./setup_sdcard
        echo -e "Установка завершена :) запускай start-box-root и радуйся :)"  
        break     
        ;;
        *)
        echo "ЕСТЬ ТОЛЬКО 1) Выбирай только его либо ливай отсюда ctrl + c"
        break
        ;;
    esac
done