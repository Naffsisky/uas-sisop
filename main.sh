#!/bin/bash

function main(){
    printf "\n\n---- MENU ----\n"
    echo "1. Membuat Folder"
    echo "2. Manipulasi Hak Akses Folder"
    echo "3. Mengakses URL"
    echo "4. Konversi Satuan"
    echo "5. Menghitung IPK Mahasiswa"
    echo "0. Keluar"
    echo "--------------"
    printf "\nMasukkan pilihan : "
    read pilihan
    case "$pilihan" in
        "1")
            menu1;
            main;
        ;;
        "2")
            menu2;
            main;
        ;;
        "3")
            menu3;
            main;
        ;;
        "4")
            menu4;
            main;
        ;;
        "5")
            menu5;
            main;
        ;;
        "0")
            exit;
        ;;
        *)
            echo "Pilihan tidak ada"
            menu;
        ;;
    esac
}

function menu1(){
    clear
    printf "\nBerapa banyak folder : "
    read banyak
    for ((i=1; i<=$banyak; i++))
      do
        clear
        printf "Masukan nama folder ke $i : "
        read folder
        mkdir $folder
      done
    clear
    echo "[!] Folder berhasil dibuat!"
}

function menu2(){
    ls
    echo "----------------------------------------"
    pwd;
    printf "\n\nMasukan lokasi file : "
    read loc
    echo ""
    echo "Manipulasi Hak Akses Folder"
    printf "\nMasukkan nama folder [sensitive]: "
    read folder
    if [[ ! -d "$loc/$folder" ]]
      then
        echo "Folder tidak ada!"
        exit;
    fi
    clear
    echo "Owner | Group | Anyone"
    printf "\n[7]\t= read, write and execute [rwx]\n"
    printf "[6]\t= read and write [rw-]\n"
    printf "[5]\t= read and execute [r-x]\n"
    printf "[4]\t= read only [r--]\n"
    printf "[3]\t= write and execute [-wx]\n"
    printf "[2]\t= write only [-w-]\n"
    printf "[1]\t= execute only [--x]\n"
    printf "[0]\t= none [---]\n"
    printf "\nMasukkan hak akses (ex. 777) : "
    read hak
    chmod $hak $folder
    clear
    echo "[!] Hak akses berhasil diubah!"
}

function menu3(){
  clear
  echo "-------------- Opening Website --------------"
  printf "\n\n[•] Education\n"
  echo "1. Daftar Kelas Mahasiswa Semester 3"
  echo "2. Kalender Pendidikan UPNVJT"
  echo "3. Ilmu UPNVJT"
  printf "\n\n[•] Social Media\n"
  echo "4. Instagram"
  echo "5. Youtube"
  echo "6. Whatsapp"
  printf "\n\n[•] Information Gathering Tools\n"
  echo "7. Shodan.io"
  printf "\n\n Press 0 to EXIT\n\n"
  printf "Masukan pilihan : "
  read pilihan
  case "$pilihan" in
        "1")
            firefox https://siamik.upnjatim.ac.id/html/siamik/daftarMtKuliah.asp?progdi=C7B93311EB938E4363FAE20E544938B47227BED4F39339B7
        ;;
        "2")
            firefox https://siamik.upnjatim.ac.id/html/siamik/umum/KALENDER_AKADEMIK-UPNVJT_2022_2023.pdf
        ;;
        "3")
            firefox https://ilmu.upnjatim.ac.id/login/index.php?authCAS=NOCAS
        ;;
        "4")
            printf "\nMasukan username : "
            read username
            firefox https://www.instagram.com/$username/
        ;;
        "5")
            printf "\nMasukan id channel (ex. UPNVeteranJawaTimurOfficial) \nPress enter to default : "
            read channel
            if [[ $channel == "" || $channel == " " ]];
              then
              firefox https://www.youtube.com/
            else
              firefox https://www.youtube.com/@$channel/
            fi
        ;;
        "6")
            printf "\nMasukan nomor : "
            read no
            printf "Masukan pesan : "
            read pesan
            firefox https://api.whatsapp.com/send?phone=$no&text=$pesan
        ;;
        "7")
            printf "\nMasukan ip address (ex. 114.5.89.190) : "
            read ipaddress
            firefox https://www.shodan.io/host/$ipaddress
        ;;
        *)
          exit
        ;;
  esac
}

function menu4(){
    echo "4."
}

function menu5(){
    echo "5."
}
# Main
echo ; date
echo ""
echo "[c] Created by."
echo "[•] Prinafsika (21081010278)"
echo "[•] Rena Rama Rosalinda (21081010190)"
main; echo ""
