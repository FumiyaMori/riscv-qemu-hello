volatile char * UART = (volatile char*)0x10000000;

int main(){
    char *msg = "Hello RISC-V!!!\n";
    while(*msg != 0){
        *UART = *msg;
        msg++;
    }
}
