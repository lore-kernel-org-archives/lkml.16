Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DD1F0E4F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261603; cv=none; b=jucbqvPiHRqUnTkZicnk6fnnzgnS4Omi6RFEGvqDXNz32ewQR2xPknSqfTk3zj/LaCyojHkcqfqipq+ZsBhGNdRvkPbQaSCQf9JM5i8TrZrRlsXM9C5N66u6zphSEE+eM8H2AT6BDwXBuCo09dYGTSfK21MgkK7v8k0JzQakAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261603; c=relaxed/simple;
	bh=FdRk1E1sd13LPXFtF8M3rZN5HzbOEhTA/TZIuR7q/Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W17TCVDqxWs0jb/704UTeFCTvlWErNa47Vtt1SqeXVZ6NqmzVpbniiicL+BNPAiZJ3gi4hslAaa9HS9khRnR3OAoOSmG1utgNa8xQuL7VqshU9hkhd6InVxfXRVPuuTEDdEV8BEsjNKOQHpTRM5Du88ED3yn4FBMm2y/Rd0fSN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZoZmDae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZoZmDae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB29AC4CEEC;
	Mon, 21 Apr 2025 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261603;
	bh=FdRk1E1sd13LPXFtF8M3rZN5HzbOEhTA/TZIuR7q/Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZoZmDae00YVthCR4q5yPaQFYGkH4OXtASxbZR3HhJnUEfeNlmdnWhvLoPAnB8Nyx
	 qRaz6/eobmiQrPce+zyVbAfxUvV7gR5n1mL/m/t3KD1riKNI3oVSDaqvLCVgdeMBgd
	 QSKzIuWJta1ArUyxZR3QYVN+X13bhxleXY4+xxRYfF86On4Xef74ELbmlM9GelJp5D
	 /icVIPBzELhPr2rKEhYdIlbcQ+KVB+iwPC6pqa1/bcAtn8SIUkgN7QDOm9fu0U/rg7
	 TFpWqPcLzogFUBVR5A/WjmmH9DCxc0Io5IedcMtmRqpM1xpEf22ATPgIkle1gTGZDL
	 03nR6bDHi8VSA==
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
Subject: [PATCH 12/29] x86/boot/e820: Clean up confusing and self-contradictory verbiage around E820 related resource allocations
Date: Mon, 21 Apr 2025 20:51:52 +0200
Message-ID: <20250421185210.3372306-13-mingo@kernel.org>
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

So the E820 code has a rather confusing area of code at around
e820__reserve_resources(), which is, by its plain reading,
rather self-contradictory. For example, the comment explaining
e820__reserve_resources() claims:

 - '* Mark E820 reserved areas as busy for the resource manager'

By 'E820 reserved areas' one can naively conclude that it's
talking about E820_TYPE_RESERVED areas - while those areas
are treated in exactly the opposite fashion by do_mark_busy():

        switch (type) {
        case E820_TYPE_RESERVED:
        case E820_TYPE_SOFT_RESERVED:
        case E820_TYPE_PRAM:
        case E820_TYPE_PMEM:
                return false;

Ie. E820_TYPE_RESERVED areas are *not* marked busy for the
resource manager, because E820_TYPE_RESERVED areas are
device regions that might eventually be claimed by a device driver.

This type of confusion permeates this whole area of code,
making it exceedingly difficult to read (for me at least).

So untangle it bit by bit:

 - Instead of talking about ambiguous 'reserved areas',
   talk about 'E820 device address regions' instead,
   and 'register'/'lock' them.

 - The do_mark_busy() function is a misnomer as well, because despite
   its name it 'does' nothing - it only determines what type
   of resource handling an E820 type should receive from the
   kernel. Rename it to e820_device_region() and negate its
   meaning, to avoid the 'busy/reserved' confusion. Because
   that's what this code is really about: filtering out
   device regions such as E820_TYPE_RESERVED, E820_TYPE_PRAM,
   E820_TYPE_PMEM, etc., and allowing them to be claimed
   by device drivers later on.

 - All other E820 regions (system regions) are registered and
   locked early on, before the PCI resource manager does its
   search for device BAR addresses, etc.

Also fix this somewhat misleading comment:

	/*
	 * Try to bump up RAM regions to reasonable boundaries, to
	 * avoid stolen RAM:
	 */

and explain that here we register artificial 'gap' resources
at the end of suspiciously sized RAM regions, as heuristics
to try to avoid buggy firmware with undeclared 'stolen RAM' regions:

	/*
	 * Create additional 'gaps' at the end of RAM regions,
	 * rounding them up to 64k/1MB/64MB boundaries, should
	 * they be weirdly sized, and register extra, locked
	 * resource regions for them, to make sure drivers
	 * won't claim those addresses.
	 *
	 * These are basically blind guesses and heuristics to
	 * avoid resource conflicts with broken firmware that
	 * doesn't properly list 'stolen RAM' as a system region
	 * in the E820 map.
	 */

Also improve the printout of this extra resource a bit: make the
message more unambiguous, and upgrade it from pr_debug() (where
very few people will see it), to pr_info() (where it will make
it into the syslog on default distro configs).

Also fix spelling and improve comment placement.

No change in functionality intended.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 55 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 8fcf4edd832e..484419711ecf 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1106,37 +1106,44 @@ static unsigned long __init e820_type_to_iores_desc(struct e820_entry *entry)
 	}
 }
 
-static bool __init do_mark_busy(enum e820_type type, struct resource *res)
+/*
+ * We assign one resource entry for each E820 map entry:
+ */
+static struct resource __initdata *e820_res;
+
+/*
+ * Is this a device address region that should not be marked busy?
+ * (Versus system address regions that we register & lock early.)
+ */
+static bool __init e820_device_region(enum e820_type type, struct resource *res)
 {
-	/* this is the legacy bios/dos rom-shadow + mmio region */
+	/* This is the legacy BIOS/DOS ROM-shadow + MMIO region: */
 	if (res->start < (1ULL<<20))
-		return true;
+		return false;
 
 	/*
 	 * Treat persistent memory and other special memory ranges like
-	 * device memory, i.e. reserve it for exclusive use of a driver
+	 * device memory, i.e. keep it available for exclusive use of a
+	 * driver:
 	 */
 	switch (type) {
 	case E820_TYPE_RESERVED:
 	case E820_TYPE_SOFT_RESERVED:
 	case E820_TYPE_PRAM:
 	case E820_TYPE_PMEM:
-		return false;
+		return true;
 	case E820_TYPE_RAM:
 	case E820_TYPE_ACPI:
 	case E820_TYPE_NVS:
 	case E820_TYPE_UNUSABLE:
 	default:
-		return true;
+		return false;
 	}
 }
 
 /*
- * Mark E820 reserved areas as busy for the resource manager:
+ * Mark E820 system regions as busy for the resource manager:
  */
-
-static struct resource __initdata *e820_res;
-
 void __init e820__reserve_resources(void)
 {
 	int i;
@@ -1162,18 +1169,18 @@ void __init e820__reserve_resources(void)
 		res->desc  = e820_type_to_iores_desc(entry);
 
 		/*
-		 * Don't register the region that could be conflicted with
-		 * PCI device BAR resources and insert them later in
-		 * pcibios_resource_survey():
+		 * Skip and don't register device regions that could be conflicted
+		 * with PCI device BAR resources. They get inserted later in
+		 * pcibios_resource_survey() -> e820__reserve_resources_late():
 		 */
-		if (do_mark_busy(entry->type, res)) {
+		if (!e820_device_region(entry->type, res)) {
 			res->flags |= IORESOURCE_BUSY;
 			insert_resource(&iomem_resource, res);
 		}
 		res++;
 	}
 
-	/* Expose the kexec e820 table to the sysfs. */
+	/* Expose the kexec e820 table to sysfs: */
 	for (i = 0; i < e820_table_kexec->nr_entries; i++) {
 		struct e820_entry *entry = e820_table_kexec->entries + i;
 
@@ -1207,6 +1214,10 @@ void __init e820__reserve_resources_late(void)
 	int i;
 	struct resource *res;
 
+	/*
+	 * Register device address regions listed in the E820 map,
+	 * these can be claimed by device drivers later on:
+	 */
 	res = e820_res;
 	for (i = 0; i < e820_table->nr_entries; i++) {
 		if (!res->parent && res->end)
@@ -1215,8 +1226,16 @@ void __init e820__reserve_resources_late(void)
 	}
 
 	/*
-	 * Try to bump up RAM regions to reasonable boundaries, to
-	 * avoid stolen RAM:
+	 * Create additional 'gaps' at the end of RAM regions,
+	 * rounding them up to 64k/1MB/64MB boundaries, should
+	 * they be weirdly sized, and register extra, locked
+	 * resource regions for them, to make sure drivers
+	 * won't claim those addresses.
+	 *
+	 * These are basically blind guesses and heuristics to
+	 * avoid resource conflicts with broken firmware that
+	 * doesn't properly list 'stolen RAM' as a system region
+	 * in the E820 map.
 	 */
 	for (i = 0; i < e820_table->nr_entries; i++) {
 		struct e820_entry *entry = &e820_table->entries[i];
@@ -1232,7 +1251,7 @@ void __init e820__reserve_resources_late(void)
 		if (start >= end)
 			continue;
 
-		printk(KERN_DEBUG "e820: reserve RAM buffer [mem %#010llx-%#010llx]\n", start, end);
+		pr_info("e820: register RAM buffer resource [mem %#010llx-%#010llx]\n", start, end);
 		reserve_region_with_split(&iomem_resource, start, end, "RAM buffer");
 	}
 }
-- 
2.45.2

