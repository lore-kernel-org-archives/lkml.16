Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833329B213
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310819; cv=none; b=K8OrmE2jnHDw+HcUl+lJPJ9q2fmgD8Cm4E1o0UWuvLWS9D6AckvIxySG1SO0GK8fz9x5YGwMhU8KAfJuAv6V2oxYDs+lQdkXAkxz1Wsym8ZthnlVB1j6ZPiBu+SYyKqf0aJKNbm8h6vOKJ0Yze2JDf3iWVJDpD+YfQo8P+xE6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310819; c=relaxed/simple;
	bh=SSOpkzVQJ+Gun4Vf24Yh+HZva+MfCX/aj4fVSd7bon4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxiUMbQqJhzg5DVeNITgyaIw5WPTKLuvd4Bs7Eb31/2gsZP3Q2Df0w83iSX82ek2hGZKOYKvv3YHzlZJnfPJIADz/P4PAFtZpoRZtU/40npHHQglEKLBMKPI2cR+btRRXHostEsIgi55G3Z+Lqr8yv3LZrY9OjDZua3oZPzUWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlqhiA/l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlqhiA/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1A0C4CEEF;
	Thu, 15 May 2025 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310818;
	bh=SSOpkzVQJ+Gun4Vf24Yh+HZva+MfCX/aj4fVSd7bon4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FlqhiA/lkcZP4k8rSiDbq5wirhDzhDCbTEpPh9FLoBEyy1H1eXNePrWU2ueZrsCL8
	 A7ztdskv0eLeZDe4zzEbfX+vBL0DivHkvhxvRGsf36pDyYGl+npWQPynGX8pIkL8/n
	 QqB8a1GpD6LliVGHqo+6P4oAVikkOEGrm4I9C97Qmb6UKmsCJPnJQIROV58e/EP2Yi
	 zX9mxqFM9vbls0/F2CxwiLCCzBXxqxznxJ1XQ1XRyOLvxtBwvaG0cqxlYtG4JAW2fj
	 843MhGXsBrBAeM2Yqodp8jcWbekcw2Xw+EQBggO7JF5ppi/8KpQWlcTvIC8wUqK5Gw
	 ves1TsxVVAFEQ==
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
Subject: [PATCH 18/32] x86/boot/e820: Standardize e820 table index variable types under 'u32'
Date: Thu, 15 May 2025 14:05:34 +0200
Message-ID: <20250515120549.2820541-19-mingo@kernel.org>
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

So we have 'idx' types of 'int' and 'unsigned int', and sometimes
we assign 'u32' fields such as e820_table::nr_entries to these 'int'
values.

While there's no real risk of overflow with these tables, make it
all cleaner by standardizing on a single type: u32.

This also happens to shrink the code a bit:

   text      data      bss        dec        hex    filename
   7745     44072        0      51817       ca69    e820.o.before
   7613     44072        0      51685       c9e5    e820.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 3ee266673fee..ee8b56605e4a 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -75,7 +75,7 @@ EXPORT_SYMBOL(pci_mem_start);
 static bool _e820__mapped_any(struct e820_table *table,
 			      u64 start, u64 end, enum e820_type type)
 {
-	int idx;
+	u32 idx;
 
 	for (idx = 0; idx < table->nr_entries; idx++) {
 		struct e820_entry *entry = &table->entries[idx];
@@ -110,7 +110,7 @@ EXPORT_SYMBOL_GPL(e820__mapped_any);
 static struct e820_entry *__e820__mapped_all(u64 start, u64 end,
 					     enum e820_type type)
 {
-	int idx;
+	u32 idx;
 
 	for (idx = 0; idx < e820_table->nr_entries; idx++) {
 		struct e820_entry *entry = &e820_table->entries[idx];
@@ -163,7 +163,7 @@ int e820__get_entry_type(u64 start, u64 end)
  */
 static void __init __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
 {
-	int idx = table->nr_entries;
+	u32 idx = table->nr_entries;
 
 	if (idx >= ARRAY_SIZE(table->entries)) {
 		pr_err("too many E820 table entries; ignoring [mem %#010llx-%#010llx]\n",
@@ -236,7 +236,7 @@ static void e820_print_size(u64 size)
 static void __init e820__print_table(const char *who)
 {
 	u64 range_end_prev = 0;
-	int idx;
+	u32 idx;
 
 	for (idx = 0; idx < e820_table->nr_entries; idx++) {
 		struct e820_entry *entry = e820_table->entries + idx;
@@ -524,7 +524,7 @@ static u64 __init
 __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
 {
 	u64 end;
-	unsigned int idx;
+	u32 idx;
 	u64 real_updated_size = 0;
 
 	BUG_ON(old_type == new_type);
@@ -602,7 +602,7 @@ u64 __init e820__range_update_table(struct e820_table *t, u64 start, u64 size,
 /* Remove a range of memory from the E820 table: */
 u64 __init e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
 {
-	int idx;
+	u32 idx;
 	u64 end;
 	u64 real_removed_size = 0;
 
@@ -814,7 +814,7 @@ void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
  */
 void __init e820__register_nosave_regions(unsigned long limit_pfn)
 {
-	int idx;
+	u32 idx;
 	u64 last_addr = 0;
 
 	for (idx = 0; idx < e820_table->nr_entries; idx++) {
@@ -839,7 +839,7 @@ void __init e820__register_nosave_regions(unsigned long limit_pfn)
  */
 static int __init e820__register_nvs_regions(void)
 {
-	int idx;
+	u32 idx;
 
 	for (idx = 0; idx < e820_table->nr_entries; idx++) {
 		struct e820_entry *entry = &e820_table->entries[idx];
@@ -890,7 +890,7 @@ u64 __init e820__memblock_alloc_reserved(u64 size, u64 align)
  */
 static unsigned long __init e820__end_ram_pfn(unsigned long limit_pfn)
 {
-	int idx;
+	u32 idx;
 	unsigned long last_pfn = 0;
 	unsigned long max_arch_pfn = MAX_ARCH_PFN;
 
@@ -1145,7 +1145,7 @@ static bool __init e820_device_region(enum e820_type type, struct resource *res)
  */
 void __init e820__reserve_resources(void)
 {
-	int idx;
+	u32 idx;
 	struct resource *res;
 	u64 end;
 
@@ -1210,7 +1210,7 @@ static unsigned long __init ram_alignment(resource_size_t pos)
 
 void __init e820__reserve_resources_late(void)
 {
-	int idx;
+	u32 idx;
 	struct resource *res;
 
 	/*
@@ -1314,7 +1314,7 @@ void __init e820__memory_setup(void)
 
 void __init e820__memblock_setup(void)
 {
-	int idx;
+	u32 idx;
 	u64 end;
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-- 
2.45.2

