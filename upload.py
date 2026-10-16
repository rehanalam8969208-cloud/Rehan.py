import os

PINK = '\033[38;5;206m'
BLUE = '\033[38;5;39m'
WHITE = '\033[1;37m'
RESET = '\033[0m'

def backup_to_mega():
    os.system('clear')
    print(f"{PINK}╔════════════════════════════════════════╗{RESET}")
    print(f"{PINK}║ {WHITE}     REHAN MEGA CLOUD UPLOADER      {PINK} ║{RESET}")
    print(f"{PINK}╚════════════════════════════════════════╝{RESET}\n")
    
    print(f"{BLUE}[+] MirrorNotes ka data Mega par bheja ja raha hai...{RESET}")
    print(f"{BLUE}[*] Kripya wait karein...\n{RESET}")
    
    # Rclone command jo MirrorNotes ko Mega me 'MirrorBackup' folder me save karega
    os.system("rclone copy /storage/emulated/0/MirrorNotes mega:MirrorBackup --progress")
    
    print(f"\n{PINK}✨ BACKUP COMPLETE! Tumhara data Mega Cloud me save ho gaya. ✨{RESET}")

if __name__ == "__main__":
    backup_to_mega()
    
