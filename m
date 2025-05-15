Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D988D29B8E6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310839; cv=none; b=LJXMu/IOqLtcMOCra1GNcfco1gvFBLO9zCvrKuS0T2c3PzRxLfNOrATeeEksvEPj7QNJ4+HjLoaQW8o3oiSEbUHoXxx7Tq9FQy7874Ekrf0JSMJnETqfw9fcNZYw8p2jdMKIZtTiCEzqD8ZDigR/zb9ymSlkISe2NitoODzO5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310839; c=relaxed/simple;
	bh=Y7uskAA1BCAYuTKKXerazkurQXVkOObkZARhKUv4AMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDMhPuiybrGVHFtVsuVRuZODdKJevmNIeu4WOXelY4ekP8ysWXIg+joyfn+lU1JPmOAPBimdvj8Dlmw7fkylsjrUJYIPIjfQWs80/Hu+I4WIHR/Sx09zJHfBeOzOksyX1Mt0Mb1b0yu9d2iiMa5t015vkm4H+yCxWPbCcgwhW7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3quujlr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3quujlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D3BC4CEE9;
	Thu, 15 May 2025 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310839;
	bh=Y7uskAA1BCAYuTKKXerazkurQXVkOObkZARhKUv4AMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f3quujlrZKTcej8578ktRt3q98W+Ibphr3hLd8vIuBp51VwtmQbH7tDc6YvmhvAPd
	 fly7H3srMAdUHb5OJLnny3XiUbWM0R20dr1EHzKPfaxno4R2mGpQlvTPc0BuaJZ8qS
	 SempYpdRIO5yH4cZYg/KQGg7zzAEgmOglTVqmA5iUYFr4VctHbfswEEMaVhGSmo175
	 smj/SlI1j0jiCWGgrw/JAiewjYdVPsl6o0/ucYoQs0TmEG76Uyqi+GFaM+fR7eI1+1
	 ISxhgTk10j1s31pMHbFMLXLbGtYQI8xoTy0RSd9u+6xMEQQJP22LzhZED9dEu/0Yli
	 cn0Q0S7YJGNUg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 24/32] x86/boot/e820: Standardize __init/__initdata tag placement
Date: Thu, 15 May 2025 14:05:40 +0200
Message-ID: <20250515120549.2820541-25-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So the e820.c file has a hodgepodge of __init and __initdata tag
placements:

    static int __init e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
    __init void e820__setup_pci_gap(void)
    __init void e820__reallocate_tables(void)
    void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
    void __init e820__register_nosave_regions(unsigned long limit_pfn)
    static int __init e820__register_nvs_regions(void)
    u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)

Standardize on the style used by e820__setup_pci_gap() and place
them before the storage class.

In addition to the consistency, as a bonus this makes the grep output
rather clean looking:

    __init void e820__range_remove(u64 start, u64 size, enum e820_type filter_type)
    __init void e820__update_table_print(void)
    __init static void e820__update_table_kexec(void)
    __init static int e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
    __init void e820__setup_pci_gap(void)
    __init void e820__reallocate_tables(void)
    __init void e820__memory_setup_extended(u64 phys_addr, u32 data_len)
    __init void e820__register_nosave_regions(unsigned long limit_pfn)
    __init static int e820__register_nvs_regions(void)

... and if one learns to just ignore the leftmost '__init' noise then
the rest of the line looks just like a regular C function definition.

With the 'mixed' tag placement style the __init tag breaks up the function's
prototype for no good reason.

Do the same for __initdata.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 92 +++++++++++++++++++++++++-------------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 7c27661d0e41..447f8bbb77b8 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -54,9 +54,9 @@
  * re-propagated. So its main role is a temporary bootstrap storage of firmware
  * specific memory layout data during early bootup.
  */
-static struct e820_table e820_table_init		__initdata;
-static struct e820_table e820_table_kexec_init		__initdata;
-static struct e820_table e820_table_firmware_init	__initdata;
+__initdata static struct e820_table e820_table_init;
+__initdata static struct e820_table e820_table_kexec_init;
+__initdata static struct e820_table e820_table_firmware_init;
 
 __refdata struct e820_table *e820_table			= &e820_table_init;
 __refdata struct e820_table *e820_table_kexec		= &e820_table_kexec_init;
@@ -143,7 +143,7 @@ static struct e820_entry *__e820__mapped_all(u64 start, u64 end,
 /*
  * This function checks if the entire range <start,end> is mapped with type.
  */
-bool __init e820__mapped_all(u64 start, u64 end, enum e820_type type)
+__init bool e820__mapped_all(u64 start, u64 end, enum e820_type type)
 {
 	return __e820__mapped_all(start, end, type);
 }
@@ -161,7 +161,7 @@ int e820__get_entry_type(u64 start, u64 end)
 /*
  * Add a memory region to the kernel E820 map.
  */
-static void __init __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
+__init static void __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
 {
 	u32 idx = table->nr_entries;
 	struct e820_entry *entry_new;
@@ -181,12 +181,12 @@ static void __init __e820__range_add(struct e820_table *table, u64 start, u64 si
 	table->nr_entries++;
 }
 
-void __init e820__range_add(u64 start, u64 size, enum e820_type type)
+__init void e820__range_add(u64 start, u64 size, enum e820_type type)
 {
 	__e820__range_add(e820_table, start, size, type);
 }
 
-static void __init e820_print_type(enum e820_type type)
+__init static void e820_print_type(enum e820_type type)
 {
 	switch (type) {
 	case E820_TYPE_RAM:		pr_cont(" System RAM");				break;
@@ -236,7 +236,7 @@ static void e820_print_size(u64 size)
 		pr_cont(" %4llu   TB", size/SZ_1T);
 }
 
-static void __init e820__print_table(const char *who)
+__init static void e820__print_table(const char *who)
 {
 	u64 range_end_prev = 0;
 	u32 idx;
@@ -343,12 +343,12 @@ struct change_member {
 	u64			addr;
 };
 
-static struct change_member	change_point_list[2*E820_MAX_ENTRIES]	__initdata;
-static struct change_member	*change_point[2*E820_MAX_ENTRIES]	__initdata;
-static struct e820_entry	*overlap_list[E820_MAX_ENTRIES]		__initdata;
-static struct e820_entry	new_entries[E820_MAX_ENTRIES]		__initdata;
+__initdata static struct change_member	change_point_list[2*E820_MAX_ENTRIES];
+__initdata static struct change_member	*change_point[2*E820_MAX_ENTRIES];
+__initdata static struct e820_entry	*overlap_list[E820_MAX_ENTRIES];
+__initdata static struct e820_entry	new_entries[E820_MAX_ENTRIES];
 
-static int __init cpcompare(const void *a, const void *b)
+__init static int cpcompare(const void *a, const void *b)
 {
 	struct change_member * const *app = a, * const *bpp = b;
 	const struct change_member *ap = *app, *bp = *bpp;
@@ -383,7 +383,7 @@ static bool e820_type_mergeable(enum e820_type type)
 	return true;
 }
 
-int __init e820__update_table(struct e820_table *table)
+__init int e820__update_table(struct e820_table *table)
 {
 	struct e820_entry *entries = table->entries;
 	u32 max_nr_entries = ARRAY_SIZE(table->entries);
@@ -483,7 +483,7 @@ int __init e820__update_table(struct e820_table *table)
 	return 0;
 }
 
-static int __init __append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
+__init static int __append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
 {
 	struct boot_e820_entry *entry = entries;
 
@@ -514,7 +514,7 @@ static int __init __append_e820_table(struct boot_e820_entry *entries, u32 nr_en
  * will have given us a memory map that we can use to properly
  * set up memory.  If we aren't, we'll fake a memory map.
  */
-static int __init append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
+__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
 {
 	/* Only one memory region (or negative)? Ignore it */
 	if (nr_entries < 2)
@@ -523,7 +523,7 @@ static int __init append_e820_table(struct boot_e820_entry *entries, u32 nr_entr
 	return __append_e820_table(entries, nr_entries);
 }
 
-static u64 __init
+__init static u64
 __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
 {
 	u64 end;
@@ -591,19 +591,19 @@ __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_ty
 	return real_updated_size;
 }
 
-u64 __init e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
+__init u64 e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
 {
 	return __e820__range_update(e820_table, start, size, old_type, new_type);
 }
 
-u64 __init e820__range_update_table(struct e820_table *t, u64 start, u64 size,
+__init u64 e820__range_update_table(struct e820_table *t, u64 start, u64 size,
 				    enum e820_type old_type, enum e820_type new_type)
 {
 	return __e820__range_update(t, start, size, old_type, new_type);
 }
 
 /* Remove a range of memory from the E820 table: */
-u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
+__init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
 {
 	u32 idx;
 	u64 end;
@@ -664,7 +664,7 @@ u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 	return real_removed_size;
 }
 
-void __init e820__update_table_print(void)
+__init void e820__update_table_print(void)
 {
 	if (e820__update_table(e820_table))
 		return;
@@ -673,7 +673,7 @@ void __init e820__update_table_print(void)
 	e820__print_table("modified");
 }
 
-static void __init e820__update_table_kexec(void)
+__init static void e820__update_table_kexec(void)
 {
 	e820__update_table(e820_table_kexec);
 }
@@ -683,7 +683,7 @@ static void __init e820__update_table_kexec(void)
 /*
  * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
  */
-static int __init e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
+__init static int e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
 {
 	u64 last = MAX_GAP_END;
 	int idx = e820_table->nr_entries;
@@ -786,7 +786,7 @@ __init void e820__reallocate_tables(void)
  * the remaining (if any) entries are passed via the SETUP_E820_EXT node of
  * struct setup_data, which is parsed here.
  */
-void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
+__init void e820__memory_setup_extended(u64 phys_addr, u32 data_len)
 {
 	int entries;
 	struct boot_e820_entry *extmap;
@@ -815,7 +815,7 @@ void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
  * This function requires the E820 map to be sorted and without any
  * overlapping entries.
  */
-void __init e820__register_nosave_regions(unsigned long limit_pfn)
+__init void e820__register_nosave_regions(unsigned long limit_pfn)
 {
 	u32 idx;
 	u64 last_addr = 0;
@@ -840,7 +840,7 @@ void __init e820__register_nosave_regions(unsigned long limit_pfn)
  * Register ACPI NVS memory regions, so that we can save/restore them during
  * hibernation and the subsequent resume:
  */
-static int __init e820__register_nvs_regions(void)
+__init static int e820__register_nvs_regions(void)
 {
 	u32 idx;
 
@@ -864,7 +864,7 @@ core_initcall(e820__register_nvs_regions);
  * This allows kexec to fake a new mptable, as if it came from the real
  * system.
  */
-u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)
+__init u64 e820__memblock_alloc_reserved(u64 size, u64 align)
 {
 	u64 addr;
 
@@ -891,7 +891,7 @@ u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)
 /*
  * Find the highest page frame number we have available
  */
-static unsigned long __init e820__end_ram_pfn(unsigned long limit_pfn)
+__init static unsigned long e820__end_ram_pfn(unsigned long limit_pfn)
 {
 	u32 idx;
 	unsigned long last_pfn = 0;
@@ -927,20 +927,20 @@ static unsigned long __init e820__end_ram_pfn(unsigned long limit_pfn)
 	return last_pfn;
 }
 
-unsigned long __init e820__end_of_ram_pfn(void)
+__init unsigned long e820__end_of_ram_pfn(void)
 {
 	return e820__end_ram_pfn(MAX_ARCH_PFN);
 }
 
-unsigned long __init e820__end_of_low_ram_pfn(void)
+__init unsigned long e820__end_of_low_ram_pfn(void)
 {
 	return e820__end_ram_pfn(1UL << (32 - PAGE_SHIFT));
 }
 
-static int userdef __initdata;
+__initdata static int userdef;
 
 /* The "mem=nopentium" boot option disables 4MB page tables on 32-bit kernels: */
-static int __init parse_memopt(char *p)
+__init static int parse_memopt(char *p)
 {
 	u64 mem_size;
 
@@ -974,7 +974,7 @@ static int __init parse_memopt(char *p)
 }
 early_param("mem", parse_memopt);
 
-static int __init parse_memmap_one(char *p)
+__init static int parse_memmap_one(char *p)
 {
 	char *oldp;
 	u64 start_at, mem_size;
@@ -1031,7 +1031,7 @@ static int __init parse_memmap_one(char *p)
 	return *p == '\0' ? 0 : -EINVAL;
 }
 
-static int __init parse_memmap_opt(char *str)
+__init static int parse_memmap_opt(char *str)
 {
 	while (str) {
 		char *k = strchr(str, ',');
@@ -1052,7 +1052,7 @@ early_param("memmap", parse_memmap_opt);
  * have been processed, in which case we already have an E820 table filled in
  * via the parameter callback function(s), but it's not sorted and printed yet:
  */
-void __init e820__finish_early_params(void)
+__init void e820__finish_early_params(void)
 {
 	if (userdef) {
 		if (e820__update_table(e820_table) < 0)
@@ -1063,7 +1063,7 @@ void __init e820__finish_early_params(void)
 	}
 }
 
-static const char *__init e820_type_to_string(struct e820_entry *entry)
+__init static const char * e820_type_to_string(struct e820_entry *entry)
 {
 	switch (entry->type) {
 	case E820_TYPE_RAM:		return "System RAM";
@@ -1078,7 +1078,7 @@ static const char *__init e820_type_to_string(struct e820_entry *entry)
 	}
 }
 
-static unsigned long __init e820_type_to_iomem_type(struct e820_entry *entry)
+__init static unsigned long e820_type_to_iomem_type(struct e820_entry *entry)
 {
 	switch (entry->type) {
 	case E820_TYPE_RAM:		return IORESOURCE_SYSTEM_RAM;
@@ -1093,7 +1093,7 @@ static unsigned long __init e820_type_to_iomem_type(struct e820_entry *entry)
 	}
 }
 
-static unsigned long __init e820_type_to_iores_desc(struct e820_entry *entry)
+__init static unsigned long e820_type_to_iores_desc(struct e820_entry *entry)
 {
 	switch (entry->type) {
 	case E820_TYPE_ACPI:		return IORES_DESC_ACPI_TABLES;
@@ -1111,13 +1111,13 @@ static unsigned long __init e820_type_to_iores_desc(struct e820_entry *entry)
 /*
  * We assign one resource entry for each E820 map entry:
  */
-static struct resource __initdata *e820_res;
+__initdata static struct resource *e820_res;
 
 /*
  * Is this a device address region that should not be marked busy?
  * (Versus system address regions that we register & lock early.)
  */
-static bool __init e820_device_region(enum e820_type type, struct resource *res)
+__init static bool e820_device_region(enum e820_type type, struct resource *res)
 {
 	/* This is the legacy BIOS/DOS ROM-shadow + MMIO region: */
 	if (res->start < (1ULL<<20))
@@ -1146,7 +1146,7 @@ static bool __init e820_device_region(enum e820_type type, struct resource *res)
 /*
  * Mark E820 system regions as busy for the resource manager:
  */
-void __init e820__reserve_resources(void)
+__init void e820__reserve_resources(void)
 {
 	u32 idx;
 	struct resource *res;
@@ -1193,7 +1193,7 @@ void __init e820__reserve_resources(void)
 /*
  * How much should we pad the end of RAM, depending on where it is?
  */
-static unsigned long __init ram_alignment(resource_size_t pos)
+__init static unsigned long ram_alignment(resource_size_t pos)
 {
 	unsigned long mb = pos >> 20;
 
@@ -1211,7 +1211,7 @@ static unsigned long __init ram_alignment(resource_size_t pos)
 
 #define MAX_RESOURCE_SIZE ((resource_size_t)-1)
 
-void __init e820__reserve_resources_late(void)
+__init void e820__reserve_resources_late(void)
 {
 	u32 idx;
 	struct resource *res;
@@ -1261,7 +1261,7 @@ void __init e820__reserve_resources_late(void)
 /*
  * Pass the firmware (bootloader) E820 map to the kernel and process it:
  */
-char *__init e820__memory_setup_default(void)
+__init char * e820__memory_setup_default(void)
 {
 	char *who = "BIOS-e820";
 
@@ -1299,7 +1299,7 @@ char *__init e820__memory_setup_default(void)
  * E820 map - with an optional platform quirk available for virtual platforms
  * to override this method of boot environment processing:
  */
-void __init e820__memory_setup(void)
+__init void e820__memory_setup(void)
 {
 	char *who;
 
@@ -1315,7 +1315,7 @@ void __init e820__memory_setup(void)
 	e820__print_table(who);
 }
 
-void __init e820__memblock_setup(void)
+__init void e820__memblock_setup(void)
 {
 	u32 idx;
 	u64 end;
-- 
2.45.2

