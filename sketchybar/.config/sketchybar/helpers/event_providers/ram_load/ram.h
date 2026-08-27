#include <mach/mach.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/sysctl.h>
#include <unistd.h>

struct ram {
  host_t host;
  mach_msg_type_number_t count;
  vm_statistics64_data_t statistics;
  uint64_t total_pages;
  vm_size_t page_size;
  int usage;
};

static inline void ram_init(struct ram* ram) {
  ram->host = mach_host_self();
  ram->count = HOST_VM_INFO64_COUNT;
  host_page_size(ram->host, &ram->page_size);

  uint64_t memory_size = 0;
  size_t memory_size_length = sizeof(memory_size);
  sysctlbyname("hw.memsize", &memory_size, &memory_size_length, NULL, 0);
  ram->total_pages = memory_size / ram->page_size;
  ram->usage = 0;
}

static inline void ram_update(struct ram* ram) {
  ram->count = HOST_VM_INFO64_COUNT;
  kern_return_t error = host_statistics64(
    ram->host,
    HOST_VM_INFO64,
    (host_info64_t)&ram->statistics,
    &ram->count
  );

  if (error != KERN_SUCCESS || ram->total_pages == 0) {
    printf("Error: Could not read memory host statistics.\n");
    return;
  }

  uint64_t available_pages = ram->statistics.free_count
                           + ram->statistics.inactive_count
                           + ram->statistics.speculative_count;
  uint64_t used_pages = ram->total_pages > available_pages
                      ? ram->total_pages - available_pages
                      : 0;
  ram->usage = (double)used_pages / (double)ram->total_pages * 100.0;
}