#!/bin/bash

function import(){
  sleep 2
  sudo apt-get update
  sudo apt-get install bc
  clear
}

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
    echo "--- KONVERSI SATUAN ---"
    echo "1. Konversi Panjang"
    echo "2. Konversi Berat"
    echo "0. Kembali Ke Menu Utama"
    printf "\nMasukan Pilihan : "
    read pilihan
    case "$pilihan" in
    "1")
      Satuan_panjang;
      menu4;
    ;;
    "2")
      Satuan_Berat
    menu4;
    ;;
    "0")
      main;
    ;;
    *)
      echo "Pilihan tidak tersedia!"
    ;;
    esac
}

function menu5(){
  clear
  declare -a ipk
  
  echo "--- MENGHITUNG NILAI IPK ---"
  echo -n "Masukan berapa banyak data : "
  read data
  
  for (( i = 1 ; i <= $data ; i++))
  do
    echo -n "Masukan nilai ke" $i 
    printf " : "
    read nilai
    let "sum += nilai"
    ipk[$i]="$nilai"
  done
  
  clear
  let "jumlah = sum/data"
  printf "Nilai\t\t: "
  echo "${ipk[@]}"
  printf "Total nilai\t: "$sum
  printf "\nNilai IPK\t: "$jumlah
  
  echo ""
}

function Satuan_panjang(){
  clear
    echo "Konversi Satuan Panjang"
    echo "1. mm ke cm"
    echo "2. mm ke m"
    echo "3. mm ke km"
    echo "4. cm ke mm"
    echo "5. cm ke m"
    echo "6. cm ke km"
    echo "7. m ke mm"
    echo "8. m ke cm"
    echo "9. m ke km"
    echo "10. km ke mm"
    echo "11. km ke cm"
    echo "12. km ke m"
    printf "Pilih konversi : "
    read kpjg
    printf "Masukan Angka: "
    read Angka
    
    case "$kpjg" in
    "1")
    echo "Konversi Satuan Milimeter ke Centimeter"
    total=$(echo "$Angka / 10" | bc -l)
    printf "$Angka/10 = $total\n\n"
    ;;
    "2")
    echo "Konversi Satuan Milimeter ke Meter"
    total=$(echo "$Angka / 1000" | bc -l)
    printf "$Angka/1000 = $total\n\n"
    ;;
    "3")
    echo "Konversi Satuan Milimeter ke Kilometer"
    total=$(echo "$Angka / 1000000" | bc -l)
    printf "$Angka/1000000 = $total\n\n"
    ;;
    "4")
    echo "Konversi Satuan Centimeter ke Milimeter"
    total=$(echo "$Angka * 10" | bc -l)
    printf "$Angka*10 = $total\n\n"
    ;;
    "5")
    echo "Konversi Satuan Centimeter ke Meter"
    total=$(echo "$Angka * 100" | bc -l)
    printf "$Angka*100 = $total\n\n"
    ;;
    "6")
    echo "Konversi Satuan Centimeter ke Kilometer"
    total=$(echo "$Angka * 100000" | bc -l)
    printf "$Angka*100000 = $total\n\n"
    ;;
    "7")
    echo "Konversi Satuan Meter ke Milimeter"
    total=$(echo "$Angka * 1000" | bc -l)
    printf "$Angka*1000 = $total\n\n"
    ;;
    "8")
    echo "Konversi Satuan Meter ke Centimeter"
    total=$(echo "$Angka * 100" | bc -l)
    printf "$Angka*1000 = $total\n\n"
    ;;
    "9")
    echo "Konversi Satuan Meter ke Kilometer"
    total=$(echo "$Angka / 1000" | bc -l)
    printf "$Angka/1000 = $total\n\n"
    ;;
    "10")
    echo "Konversi Satuan Kilometer ke Milimeter"
    total=$(echo "$Angka * 1000000" | bc -l)
    printf "$Angka*1000000 = $total\n\n"
    ;;
    "11")
    echo "Konversi Satuan Kilometer ke Milimeter"
    total=$(echo "$Angka * 100000" | bc -l)
    printf "$Angka*100000 = $total\n\n"
    ;;
    "12")
    echo "Konversi Satuan Kilometer ke Milimeter"
    total=$(echo "$Angka * 1000" | bc -l)
    printf "$Angka*1000 = $total\n\n"
    ;;
    *)
    echo "Inputan anda salah"
    ;;
    esac
}

function Satuan_Berat(){
    echo "Konversi Satuan Berat"
    echo "1. Gram ke Ons"
    echo "2. Gram ke Kilogram"
    echo "3. Gram ke Kwintal"
    echo "4. Gram ke Ton"
    echo "5. Ons ke Gram"
    echo "6. Ons ke Kilogram"
    echo "7. Ons ke Kwintal"
    echo "8. Ons ke Ton"
    echo "9. Kilogram ke Gram"
    echo "10. Kilogram ke Ons"
    echo "11. Kilogram ke Kwintal"
    echo "12. Kilogram ke Ton"
    echo "13. Kwintal ke Gram"
    echo "14. Kwintal ke Ons"
    echo "15. Kwintal ke Kilogram"
    echo "16. Kwintal ke Ton"
    echo "17. Ton ke Gram"
    echo "18. Ton ke Ons"
    echo "19. Ton ke Kilogram"
    echo "20. Ton ke Kwintal"

    printf "Pilih konversi : "
    read kbrt
    printf "Masukan Berat : "
    read berat

    case "$kbrt" in
    "1")
    echo "Konversi Satuan Gram ke Ons"
    total=$(echo "$berat / 100" | bc -l)
    printf "$berat/100 = $total\n\n"
    ;;
    "2")
    echo "Konversi Satuan Gram ke Kilogram"
    total=$(echo "$berat / 1000" | bc -l)
    printf "$berat/1000 = $total\n\n"
    ;;
    "3")
    echo "Konversi Satuan Gram ke Kwintal"
    total=$(echo "$berat / 10000" | bc -l)
    printf "$berat/10000 = $total\n\n"
    ;;
    "4")
    echo "Konversi Satuan Gram ke Ton"
    total=$(echo "$berat / 1000000" | bc -l)
    printf "$berat/1000000 = $total\n\n"
    ;;
    "5")
    echo "Konversi Satuan Ons ke Gram"
    total=$(echo "$berat * 10" | bc -l)
    printf "$berat*10 = $total\n\n"
    ;;
    "6")
    echo "Konversi Satuan Ons ke Kilogram"
    total=$(echo "$berat / 10" | bc -l)
    printf "$berat/10 = $total\n\n"
    ;;
    "7")
    echo "Konversi Satuan Ons ke Kwintal"
    total=$(echo "$berat / 100" | bc -l)
    printf "$berat/100 = $total\n\n"
    ;;
    "8")
    echo "Konversi Satuan Ons ke Ton"
    total=$(echo "$berat / 10000" | bc -l)
    printf "$berat/10000 = $total\n\n"
    ;;
    "9")
    echo "Konversi Satuan Kilogram ke Gram"
    total=$(echo "$berat * 1000" | bc -l)
    printf "$berat*1000 = $total\n\n"
    ;;
    "10")
    echo "Konversi Satuan Kilogram ke Ons"
    total=$(echo "$berat * 10" | bc -l)
    printf "$berat*10 = $total\n\n"
    ;;
    "11")
    echo "Konversi Satuan Kilogram ke Kwintal"
    total=$(echo "$berat / 100" | bc -l)
    printf "$berat/100 = $total\n\n"
    ;;
    "12")
    echo "Konversi Satuan Kilogram ke Ton"
    total=$(echo "$berat / 1000" | bc -l)
    printf "$berat/1000 = $total\n\n"
    ;;
    "13")
    echo "Konversi Satuan Kwintal ke Gram"
    total=$(echo "$berat * 10000" | bc -l)
    printf "$berat*10000 = $total\n\n"
    ;;
    "14")
    echo "Konversi Satuan Kwintal ke Ons"
    total=$(echo "$berat * 100" | bc -l)
    printf "$berat*100 = $total\n\n"
    ;;
    "15")
    echo "Konversi Satuan Kwintal ke Kilogram"
    total=$(echo "$berat * 100" | bc -l)
    printf "$berat*100 = $total\n\n"
    ;;
    "16")
    echo "Konversi Satuan Kwintal ke Ton"
    total=$(echo "$berat / 10" | bc -l)
    printf "$berat/10 = $total\n\n"
    ;;
    "17")
    echo "Konversi Satuan Ton ke Gram"
    total=$(echo "$berat * 1000000" | bc -l)
    printf "$berat*1000000 = $total\n\n"
    ;;
    "18")
    echo "Konversi Satuan Ton ke Ons"
    total=$(echo "$berat * 10000" | bc -l)
    printf "$berat*10000 = $total\n\n"
    ;;
    "19")
    echo "Konversi Satuan Ton ke Kilogram"
    total=$(echo "$berat * 1000" | bc -l)
    printf "$berat*1000 = $total\n\n"
    ;;
    "20 ")
    echo "Konversi Satuan Konversi Ton ke Kwintal"
    total=$(echo "$berat * 10" | bc -l)
    printf "$berat*10 = $total\n\n" 
    ;;
    
    *)
    echo "Inputan anda salah"
    ;;
    esac
}

# Main
echo ; date
echo ""
echo "[c] Created by."
echo "[•] Prinafsika (21081010278)"
echo "[•] Rena Rama Rosalinda (21081010190)"
echo ""
import; main; echo ""
