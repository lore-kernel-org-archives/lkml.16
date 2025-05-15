Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877629A311
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310850; cv=none; b=U0m5+6kbqv0inKMBJn1L77tGdEzOWDcEE7NsDMeBLBOF1hdu/2/6NDa1+6VORaGRbR8f7l2ew5SYOYLEQvLeLSEbAJ6Yw9YutqGG4BjSb5v12RAcrZWhmiDEhrqaVbWveO4HhIXT9cc9Ukvq8sTIT+TpZTfptca3OwF2i5M+Mik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310850; c=relaxed/simple;
	bh=WGx/wVMyN1mwQ5Wl4n4+val1Ddn9GH3N8wmYMPoD6kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAnfAjxrlAlTlgb0serjzJvmlxe7cG5NC+lm3oJI3iBZyPhLd6BycQRrKwir27i+DPx7al2Ng4sUyMWxJ50U/ZWlSCycUxfvBs4SsVawEh5o+ABDaLydl7Z+c73eIPP0yeHGvWMOHv1jrjwxKJ9nJV5oVlFp8yahOtn7a0qiyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8KHsPJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8KHsPJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34964C4CEEF;
	Thu, 15 May 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310850;
	bh=WGx/wVMyN1mwQ5Wl4n4+val1Ddn9GH3N8wmYMPoD6kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r8KHsPJge9yWMHPROuqaizU6K1Y4zwQ6juA2Tgx931OLZyDi59ly1vn1OMRWmEYW8
	 MYEj6IWHRB6w5gYXAlRK+vvvjd7IA9xIOdauurGitnE6oHcN+fPDuRQ4bn17YMMJAu
	 kKfXw9NgQS0k83JFxi2M/Kfq+2avoiO/tpG7tQn3Mq3Y+8n97rbbqrRHKp5iicj+gE
	 pdA9NIdKIMZO+Ti4XYY6WaBCXphggGLqxJDKDY0c1V//io6vhtYdbYI/xHh1+NqKFV
	 26LlEVCkMAZm4idzPStao2YIIlfo3/6ufWJOBWrDfDfWHTzcfEtn7mpQKRvcL6nmXA
	 2wCjgVxfmICTw==
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
Subject: [PATCH 27/32] x86/boot/e820: Simplify the e820__range_remove() API
Date: Thu, 15 May 2025 14:05:43 +0200
Message-ID: <20250515120549.2820541-28-mingo@kernel.org>
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

Right now e820__range_remove() has two parameters to control the
E820 type of the range removed:

	extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);

Since E820 types start at 1, zero has a natural meaning of 'no type.

Consolidate the (old_type,check_type) parameters into a single (filter_type)
parameter:

	extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);

Note that both e820__mapped_raw_any() and e820__mapped_any()
already have such semantics for their 'type' parameter, although
it's currently not used with '0' by in-kernel code.

Also, the __e820__mapped_all() internal helper already has such
semantics implemented as well, and the e820__get_entry_type() API
uses the '0' type to such effect.

This simplifies not just e820__range_remove(), and synchronizes its
use of type filters with other E820 API functions, but simplifies
usage sites as well, such as parse_memmap_one(), beyond the reduction
of the number of parameters:

  -               else if (from)
  -                       e820__range_remove(start_at, mem_size, from, 1);
                  else
  -                       e820__range_remove(start_at, mem_size, 0, 0);
  +                       e820__range_remove(start_at, mem_size, from);

The generated code gets smaller as well:

	add/remove: 0/0 grow/shrink: 0/5 up/down: 0/-66 (-66)

	Function                                     old     new   delta
	parse_memopt                                 112     107      -5
	efi_init                                    1048    1039      -9
	setup_arch                                  2719    2709     -10
	e820__range_remove                           283     273     -10
	parse_memmap_opt                             559     527     -32

	Total: Before=22,675,600, After=22,675,534, chg -0.00%

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/api.h |  2 +-
 arch/x86/kernel/e820.c          | 16 +++++++---------
 arch/x86/kernel/setup.c         |  4 ++--
 arch/x86/platform/efi/efi.c     |  3 +--
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index 9cf416f7a84f..bbe0c8de976c 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -16,7 +16,7 @@ extern bool e820__mapped_all(u64 start, u64 end, enum e820_type type);
 
 extern void e820__range_add   (u64 start, u64 size, enum e820_type type);
 extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
-extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
+extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);
 extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
 
 extern int  e820__update_table(struct e820_table *table);
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 0fc77ab72c5f..0d7e9794cd52 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -590,7 +590,7 @@ __init u64 e820__range_update_table(struct e820_table *t, u64 start, u64 size,
 }
 
 /* Remove a range of memory from the E820 table: */
-__init void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
+__init void e820__range_remove(u64 start, u64 size, enum e820_type filter_type)
 {
 	u32 idx;
 	u64 end;
@@ -600,8 +600,8 @@ __init void e820__range_remove(u64 start, u64 size, enum e820_type old_type, boo
 
 	end = start + size;
 	printk(KERN_DEBUG "e820: remove [mem %#010Lx-%#010Lx]", start, end - 1);
-	if (check_type)
-		e820_print_type(old_type);
+	if (filter_type)
+		e820_print_type(filter_type);
 	pr_cont("\n");
 
 	for (idx = 0; idx < e820_table->nr_entries; idx++) {
@@ -609,7 +609,7 @@ __init void e820__range_remove(u64 start, u64 size, enum e820_type old_type, boo
 		u64 final_start, final_end;
 		u64 entry_end;
 
-		if (check_type && entry->type != old_type)
+		if (filter_type && entry->type != filter_type)
 			continue;
 
 		entry_end = entry->addr + entry->size;
@@ -945,7 +945,7 @@ __init static int parse_memopt(char *p)
 	if (mem_size == 0)
 		return -EINVAL;
 
-	e820__range_remove(mem_size, ULLONG_MAX - mem_size, E820_TYPE_RAM, 1);
+	e820__range_remove(mem_size, ULLONG_MAX - mem_size, E820_TYPE_RAM);
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 	max_mem_size = mem_size;
@@ -1001,12 +1001,10 @@ __init static int parse_memmap_one(char *p)
 			e820__range_update(start_at, mem_size, from, to);
 		else if (to)
 			e820__range_add(start_at, mem_size, to);
-		else if (from)
-			e820__range_remove(start_at, mem_size, from, 1);
 		else
-			e820__range_remove(start_at, mem_size, 0, 0);
+			e820__range_remove(start_at, mem_size, from);
 	} else {
-		e820__range_remove(mem_size, ULLONG_MAX - mem_size, E820_TYPE_RAM, 1);
+		e820__range_remove(mem_size, ULLONG_MAX - mem_size, E820_TYPE_RAM);
 	}
 
 	return *p == '\0' ? 0 : -EINVAL;
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index f40dffc3e014..72ac61c58ec8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -732,7 +732,7 @@ static void __init trim_bios_range(void)
 	 * area (640Kb -> 1Mb) as RAM even though it is not.
 	 * take them out.
 	 */
-	e820__range_remove(BIOS_BEGIN, BIOS_END - BIOS_BEGIN, E820_TYPE_RAM, 1);
+	e820__range_remove(BIOS_BEGIN, BIOS_END - BIOS_BEGIN, E820_TYPE_RAM);
 
 	e820__update_table(e820_table);
 }
@@ -754,7 +754,7 @@ static void __init e820_add_kernel_range(void)
 		return;
 
 	pr_warn(".text .data .bss are not marked as E820_TYPE_RAM!\n");
-	e820__range_remove(start, size, E820_TYPE_RAM, 0);
+	e820__range_remove(start, size, 0);
 	e820__range_add(start, size, E820_TYPE_RAM);
 }
 
diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 463b784499a8..d00c6de7f3b7 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -333,8 +333,7 @@ static void __init efi_remove_e820_mmio(void)
 			if (size >= 256*1024) {
 				pr_info("Remove mem%02u: MMIO range=[0x%08llx-0x%08llx] (%lluMB) from e820 map\n",
 					i, start, end, size >> 20);
-				e820__range_remove(start, size,
-						   E820_TYPE_RESERVED, 1);
+				e820__range_remove(start, size, E820_TYPE_RESERVED);
 			} else {
 				pr_info("Not removing mem%02u: MMIO range=[0x%08llx-0x%08llx] (%lluKB) from e820 map\n",
 					i, start, end, size >> 10);
-- 
2.45.2

