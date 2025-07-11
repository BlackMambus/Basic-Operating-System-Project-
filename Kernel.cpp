extern "C" void kernel_main() {
    const char* message = "Hello from C++ kernel!";
    char* video_memory = (char*)0xb8000;

    for (int i = 0; message[i] != '\0'; ++i) {
        video_memory[i * 2] = message[i];      // Character
        video_memory[i * 2 + 1] = 0x07;         // Attribute byte (white on black)
    }

    while (true); // Halt
}
