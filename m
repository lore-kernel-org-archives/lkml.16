Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B271F2C45
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261617; cv=none; b=M3Ewm93Vifw7YckfSobZ/59xNzYGQjVtXSgM2xo/XXGHjfQUwot/aUzpQlosFFSeDvCJO0FPZWR7wdYvoOlyMaq6blws3poihlDwo6xlo7Go8PYsxL3YWctdMaPMMVIgirFwl0VAGvPffZHrsuiO9rHgk86SCDu1gnrtxi/IyOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261617; c=relaxed/simple;
	bh=fCQu+gk3aJcQ+GQqT/viek+ThuSUtAcMaB9uW8cQlGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZmRYkeGbVQow0pcnmY8tLH1XTt6eRLNPF4CVewFQrgpzgCarFBk1j7/Nbs8iuQN9l+Ee5priFYIoCTa/wdjcN/lD88dj19QgtdGcQJSpdC2v18Ej7BA7alZ8sLLNJbXWMKzpbPT5uYX0MuE8OYm/6f+YxR4sF8+9vNlvzEubKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC74/ZzI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC74/ZzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1503C4CEEA;
	Mon, 21 Apr 2025 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261617;
	bh=fCQu+gk3aJcQ+GQqT/viek+ThuSUtAcMaB9uW8cQlGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nC74/ZzIC3rydPQdAOwWGn4fph2R/7ania8lvOd7sy5kxRPDy8Xblpc6ra2Qv59CW
	 hXJH0z95/hw/h2oG9a67n11F7jmblJZ0lCtnFzcFV0p7GnhHVMU0sYcP2ZIZzS23OI
	 W3hTI+OKwkUMIH7JHDB2GjzZ/Ek70uOhwZr8YtsYoYrCTce2DtcquiVxbAd9sY/YFn
	 vmoUQ3jCOAd7O5Jci5IErOlOHTKwYim4VnZ2cXJEtJ4IhKUiS+s6hX8DArShuvCVRe
	 iGZqzut9YRCyyAfqmoNEaGuk32gJBwzpO5PWELI3sP7S7QHzXt9QB1cySV/9YxPRFc
	 L5jdP5MztwzIg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 17/29] x86/boot/e820: Standardize e820 table index variable names under 'idx'
Date: Mon, 21 Apr 2025 20:51:57 +0200
Message-ID: <20250421185210.3372306-18-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 114 ++++++++++++++++++++++++-------------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 158f9a46ba55..919950d0f03d 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -75,10 +75,10 @@ EXPORT_SYMBOL(pci_mem_start);
 static bool _e820__mapped_any(struct e820_table *table,
 			      u64 start, u64 end, enum e820_type type)
 {
-	int i;
+	int idx;
 
-	for (i = 0; i < table->nr_entries; i++) {
-		struct e820_entry *entry = &table->entries[i];
+	for (idx = 0; idx < table->nr_entries; idx++) {
+		struct e820_entry *entry = &table->entries[idx];
 
 		if (type && entry->type != type)
 			continue;
@@ -110,10 +110,10 @@ EXPORT_SYMBOL_GPL(e820__mapped_any);
 static struct e820_entry *__e820__mapped_all(u64 start, u64 end,
 					     enum e820_type type)
 {
-	int i;
+	int idx;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 
 		if (type && entry->type != type)
 			continue;
@@ -236,10 +236,10 @@ static void e820_print_size(u64 size)
 static void __init e820__print_table(const char *who)
 {
 	u64 range_end_prev = 0;
-	int i;
+	int idx;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = e820_table->entries + i;
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = e820_table->entries + idx;
 		u64 range_start, range_end;
 
 		range_start = entry->addr;
@@ -387,7 +387,7 @@ int __init e820__update_table(struct e820_table *table)
 	enum e820_type current_type, last_type;
 	u64 last_addr;
 	u32 new_nr_entries, overlap_entries;
-	u32 i, chg_idx, chg_nr;
+	u32 idx, chg_idx, chg_nr;
 
 	/* If there's only one memory region, don't bother: */
 	if (table->nr_entries < 2)
@@ -396,26 +396,26 @@ int __init e820__update_table(struct e820_table *table)
 	BUG_ON(table->nr_entries > max_nr_entries);
 
 	/* Bail out if we find any unreasonable addresses in the map: */
-	for (i = 0; i < table->nr_entries; i++) {
-		if (entries[i].addr + entries[i].size < entries[i].addr)
+	for (idx = 0; idx < table->nr_entries; idx++) {
+		if (entries[idx].addr + entries[idx].size < entries[idx].addr)
 			return -1;
 	}
 
 	/* Create pointers for initial change-point information (for sorting): */
-	for (i = 0; i < 2 * table->nr_entries; i++)
-		change_point[i] = &change_point_list[i];
+	for (idx = 0; idx < 2 * table->nr_entries; idx++)
+		change_point[idx] = &change_point_list[idx];
 
 	/*
 	 * Record all known change-points (starting and ending addresses),
 	 * omitting empty memory regions:
 	 */
 	chg_idx = 0;
-	for (i = 0; i < table->nr_entries; i++)	{
-		if (entries[i].size != 0) {
-			change_point[chg_idx]->addr	= entries[i].addr;
-			change_point[chg_idx++]->entry	= &entries[i];
-			change_point[chg_idx]->addr	= entries[i].addr + entries[i].size;
-			change_point[chg_idx++]->entry	= &entries[i];
+	for (idx = 0; idx < table->nr_entries; idx++)	{
+		if (entries[idx].size != 0) {
+			change_point[chg_idx]->addr	= entries[idx].addr;
+			change_point[chg_idx++]->entry	= &entries[idx];
+			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
+			change_point[chg_idx++]->entry	= &entries[idx];
 		}
 	}
 	chg_nr = chg_idx;
@@ -437,9 +437,9 @@ int __init e820__update_table(struct e820_table *table)
 			overlap_list[overlap_entries++] = change_point[chg_idx]->entry;
 		} else {
 			/* Remove entry from list (order independent, so swap with last): */
-			for (i = 0; i < overlap_entries; i++) {
-				if (overlap_list[i] == change_point[chg_idx]->entry)
-					overlap_list[i] = overlap_list[overlap_entries-1];
+			for (idx = 0; idx < overlap_entries; idx++) {
+				if (overlap_list[idx] == change_point[chg_idx]->entry)
+					overlap_list[idx] = overlap_list[overlap_entries-1];
 			}
 			overlap_entries--;
 		}
@@ -449,9 +449,9 @@ int __init e820__update_table(struct e820_table *table)
 		 * 1=usable, 2,3,4,4+=unusable)
 		 */
 		current_type = 0;
-		for (i = 0; i < overlap_entries; i++) {
-			if (overlap_list[i]->type > current_type)
-				current_type = overlap_list[i]->type;
+		for (idx = 0; idx < overlap_entries; idx++) {
+			if (overlap_list[idx]->type > current_type)
+				current_type = overlap_list[idx]->type;
 		}
 
 		/* Continue building up new map based on this information: */
@@ -524,7 +524,7 @@ static u64 __init
 __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
 {
 	u64 end;
-	unsigned int i;
+	unsigned int idx;
 	u64 real_updated_size = 0;
 
 	BUG_ON(old_type == new_type);
@@ -539,8 +539,8 @@ __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_ty
 	e820_print_type(new_type);
 	pr_cont("\n");
 
-	for (i = 0; i < table->nr_entries; i++) {
-		struct e820_entry *entry = &table->entries[i];
+	for (idx = 0; idx < table->nr_entries; idx++) {
+		struct e820_entry *entry = &table->entries[idx];
 		u64 final_start, final_end;
 		u64 entry_end;
 
@@ -602,7 +602,7 @@ u64 __init e820__range_update_table(struct e820_table *t, u64 start, u64 size,
 /* Remove a range of memory from the E820 table: */
 u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
 {
-	int i;
+	int idx;
 	u64 end;
 	u64 real_removed_size = 0;
 
@@ -615,8 +615,8 @@ u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 		e820_print_type(old_type);
 	pr_cont("\n");
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 		u64 final_start, final_end;
 		u64 entry_end;
 
@@ -683,12 +683,12 @@ static void __init e820__update_table_kexec(void)
 static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsize)
 {
 	u64 last = MAX_GAP_END;
-	int i = e820_table->nr_entries;
+	int idx = e820_table->nr_entries;
 	int found = 0;
 
-	while (--i >= 0) {
-		u64 start = e820_table->entries[i].addr;
-		u64 end = start + e820_table->entries[i].size;
+	while (--idx >= 0) {
+		u64 start = e820_table->entries[idx].addr;
+		u64 end = start + e820_table->entries[idx].size;
 
 		/*
 		 * Since "last" is at most 4GB, we know we'll
@@ -814,11 +814,11 @@ void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
  */
 void __init e820__register_nosave_regions(unsigned long limit_pfn)
 {
-	int i;
+	int idx;
 	u64 last_addr = 0;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 
 		if (entry->type != E820_TYPE_RAM)
 			continue;
@@ -839,10 +839,10 @@ void __init e820__register_nosave_regions(unsigned long limit_pfn)
  */
 static int __init e820__register_nvs_regions(void)
 {
-	int i;
+	int idx;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 
 		if (entry->type == E820_TYPE_NVS)
 			acpi_nvs_register(entry->addr, entry->size);
@@ -890,12 +890,12 @@ u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)
  */
 static unsigned long __init e820__end_ram_pfn(unsigned long limit_pfn)
 {
-	int i;
+	int idx;
 	unsigned long last_pfn = 0;
 	unsigned long max_arch_pfn = MAX_ARCH_PFN;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 		unsigned long start_pfn;
 		unsigned long end_pfn;
 
@@ -1145,7 +1145,7 @@ static bool __init e820_device_region(enum e820_type type, struct resource *res)
  */
 void __init e820__reserve_resources(void)
 {
-	int i;
+	int idx;
 	struct resource *res;
 	u64 end;
 
@@ -1153,8 +1153,8 @@ void __init e820__reserve_resources(void)
 			     SMP_CACHE_BYTES);
 	e820_res = res;
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = e820_table->entries + i;
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = e820_table->entries + idx;
 
 		end = entry->addr + entry->size - 1;
 		if (end != (resource_size_t)end) {
@@ -1180,8 +1180,8 @@ void __init e820__reserve_resources(void)
 	}
 
 	/* Expose the kexec e820 table to sysfs: */
-	for (i = 0; i < e820_table_kexec->nr_entries; i++) {
-		struct e820_entry *entry = e820_table_kexec->entries + i;
+	for (idx = 0; idx < e820_table_kexec->nr_entries; idx++) {
+		struct e820_entry *entry = e820_table_kexec->entries + idx;
 
 		firmware_map_add_early(entry->addr, entry->addr + entry->size, e820_type_to_string(entry));
 	}
@@ -1210,7 +1210,7 @@ static unsigned long __init ram_alignment(resource_size_t pos)
 
 void __init e820__reserve_resources_late(void)
 {
-	int i;
+	int idx;
 	struct resource *res;
 
 	/*
@@ -1218,7 +1218,7 @@ void __init e820__reserve_resources_late(void)
 	 * these can be claimed by device drivers later on:
 	 */
 	res = e820_res;
-	for (i = 0; i < e820_table->nr_entries; i++) {
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
 		if (!res->parent && res->end)
 			insert_resource_expand_to_fit(&iomem_resource, res);
 		res++;
@@ -1236,8 +1236,8 @@ void __init e820__reserve_resources_late(void)
 	 * doesn't properly list 'stolen RAM' as a system region
 	 * in the E820 map.
 	 */
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 		u64 start, end;
 
 		if (entry->type != E820_TYPE_RAM)
@@ -1314,7 +1314,7 @@ void __init e820__memory_setup(void)
 
 void __init e820__memblock_setup(void)
 {
-	int i;
+	int idx;
 	u64 end;
 
 #ifdef CONFIG_MEMORY_HOTPLUG
@@ -1358,8 +1358,8 @@ void __init e820__memblock_setup(void)
 	 */
 	memblock_allow_resize();
 
-	for (i = 0; i < e820_table->nr_entries; i++) {
-		struct e820_entry *entry = &e820_table->entries[i];
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		struct e820_entry *entry = &e820_table->entries[idx];
 
 		end = entry->addr + entry->size;
 		if (end != (resource_size_t)end)
-- 
2.45.2

