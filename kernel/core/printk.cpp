int printk(const char* text){
    // point to memory location for printing
    unsigned short* video_memory = (unsigned short*)0xb8000;

    for(int i = 0; text[i] != '\0'; ++i){
        // we set memory location such that the value of the
        // memory location to set the color is not overidden
        video_memory[i] = (video_memory[i] & 0xFF00) | text[i];
    }

    return 0;
}