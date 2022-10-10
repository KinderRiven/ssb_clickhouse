#include <memory>
#include <unistd.h>
int main(int argc, char **argv)
{
    size_t size = 24UL * 1024 * 1024 * 1024;
    auto blank = std::make_unique<char[]>(size);
    while (true) { sleep(60); }
    return 0;
}