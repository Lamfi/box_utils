#!bin/bash
clear
echo -e "ДОБРО ПОЖАЛОВАТЬ В АВТОУСТАНОВЩИК 2000"
echo -e "ТЫ ГОТОВ ПОЗНАТЬ МИР ФЛЕШЕК?"
echo -e "Для начала убедись что ты установил модуль для Magisk и скачал chroot версию бокса"
echo -e "Ну чё погнали"
echo -e "Script made by me(a.belevich(SadShrimp))"
echo -e "Для начала я добавлю кое какие штуки в .bashrc чтобы тебе не пришлось всё делать ручками"
echo -e "А так же мне нужны Root права"
su -c 

while true; do
    echo -e "Зайди в любой проводник перед продолжением и посмотри номер флешки обычно он идет: /storage/0403-0203/ - это мой индинтификатор флешки"
    echo -e "Для отменны ctrl + c"
    echo -e "1)Продолжить"
    read choice
    case $choice in 
        1)
        mkdir ~/ubuntu/download
        echo -e "Я создал папку для sdcard чтобы был доступ к флешке её в box64droid находится она по пути ~/ubuntu/download"
        echo -e "Теперь введи тот самый номмер тут: например 0403-0203"
        read number;
        echo "sudo mount —bind /mnt/media_rw/$number/Download $HOME/ubuntu/Download/ -o -rw" ».bashrc && source ~/.bashrc
        echo -e "Теперь у тебя будет всё автоматизировано, тебе не надо больше будет вводить комманды для доступа к флешке"
        echo -e "Осталась одна поправочка в боксе и жизнь в шоколаде"
        echo -e "Я так же добавлю для тебя некоторые удобные комманды, если ты их забудешь их можно будет вызвать при помощи box-help"
        echo "sudo mount -o remount,exec /Download" >> .bashrc 
        touch ~/ubuntu/usr/bin/box-help"
        chmod +x ~/ubuntu/usr/bin/box-help"
        echo "alias sd=cd /Download/"».bashrc
        echo "alias debug64=WINEPREFIX=~/.wine box64 wine" ».bashrc
        echo "alias debug32=WINEPREFIX=~/.wine box86 wine" ».bashrc
        echo "alias sd=cd /Download/"».bashrc
        echo "alias debug64all=WINEDEBUG=-all WINEPREFIX=~/.wine box64 wine" ».bashrc
        echo "alias debug32all=WINEDEBUG=-all WINEPREFIX=~/.wine box86 wine" ».bashrc
        echo "#!bin/bash" >> ~/ubuntu/usr/bin/box-help
        echo "echo -e debug32 имя.exe - запускает win32 приложение и выводит отладочную информацию" >> ~/ubuntu/usr/bin/box-help
        echo "echo -e debug64 имя.exe - запускает win64 приложение и выводит отладочную информацию" >> ~/ubuntu/usr/bin/box-help
        echo "echo -e sd - открывает сразу /Download" >> ~/ubuntu/usr/bin/box-help   
        echo "echo -e debug32all - запускает win32 приложение и выводит более подробную отладочную информацию" >> ~/ubuntu/usr/bin/box-help  
        echo "echo -e debug64all - запускает win64 приложение и выводит более подробную отладочную информацию" >> ~/ubuntu/usr/bin/box-help 
        rm ~/setup_sdcard
        echo -e "Установка завершена :) запускай start-box-root и радуйся :)"       
        ;;
        *)
        echo "ЕСТЬ ТОЛЬКО 1) Выбирай только его либо ливай отсюда ctrl + c"
        ;;
    esac
done