Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D781A5BB7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415587; cv=none; b=iw2nvnTBpkNGReNa/nlu4KpRwP1bEPXicIVrSe55MdnSWTBbSq1P1n0FdHALsxaXYr50QV7xzwZQFyHMIbjJHCkKPPtlLLnYPE0a5BRG6isborKgNHyUNnssi6BmZ8+zBpmlApFgGW4XXkVH5RshZTiHEiVKWw9dMlfaSTqQr/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415587; c=relaxed/simple;
	bh=uJBVdZvqBOEUMTWrnXpjWUMjhvUeVxx4u3ef8ehhyYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H/Ks4ahxfQzlEXSLHVrealbLl7tDH7uz7W/zMI00MyvqxWs48dGBsNQPo/ZOzt8VJd6nk7/Cxj2kjmFtRPTcGOUG0l0f3+Ygd5uI/bL3cL8BalLPDPLnRFTo0Fw1gEVIvcxVWTYrX/fcPutgzWxpG9HuZIY5z0U5KifnqLCXfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=Qtdk1/ux; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="Qtdk1/ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745415583; x=1776951583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DoX1mLsF5BZf8Dfmzq+q3ULu4XnvR8sckoyZnXWuhbo=;
  b=Qtdk1/uxZxB10+b7aG/58yox1x7W91NuWp3mRcGoltZjyrh3de8JCES3
   3Udg/S8eqSaSxdgEdYiHv06kMfI8cTagiuwyQhMcPcxo5uWdGxkN9ew+F
   ZbkbdVPNM9FgZ22flKk6psWwi0AjsCAPGsA8pH8gHWwiPGk8PUKJPGYPI
   4=;
X-IronPort-AV: E=Sophos;i="6.15,233,1739836800"; 
   d="scan'208";a="491901288"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 13:39:39 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.17.79:47330]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.46.127:2525] with esmtp (Farcaster)
 id b3015d5d-5400-4018-90ac-1dbab7b74be4; Wed, 23 Apr 2025 13:39:24 +0000 (UTC)
X-Farcaster-Flow-ID: b3015d5d-5400-4018-90ac-1dbab7b74be4
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 13:39:24 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 13:39:22 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <nh-open-source@amazon.com>, Bartosz Szczepanek <bsz@amazon.de>, Alexander
 Graf <graf@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] arm64: Emit debug bootcodes for early kernel boot
Date: Wed, 23 Apr 2025 13:39:07 +0000
Message-ID: <20250423133910.909-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D042UWB004.ant.amazon.com (10.13.139.150) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)

Hi all,

I'm looking for your comments on the following change, that came out
of our investigations of rare crashes in the very early phase of kernel
boot while still in the assembly code. The change we came up with relies
on contextidr_el2 which is used to record checkpoints (bootcodes), to be
used later for narrowing down on the point of failure. To do so, one needs
modified firmware or another tool capable of dumping contextidr_el2 after
failure happens.

The usage of contextidr_el2 register comes from the fact that it's not
used for any purpose within the kernel (contrary to contextidr_el1), and
contents of it are unlikely to change even if any other code would be
executed after the failure.

Primary alternative solution – debugging by printing – hardly applies to
such early code, as page table mappings are not yet established and
stable virtual address of console can't be relied upon.

On the other hand, bisecting through the code is not always feasible,
especially if the failure rates are very low. Bootcodes help that case.

What I'd like to get your input on:
- Is there an alternative solution for post-mortem analysis of rare
  crashes in very early kernel boot that we missed?
- Would the introduction of bootcodes be welcome upstream, in this or
  any other shape? If so, how could we make it suitable for inclusion?

Kind regards
Bartosz

-------------------------------------------------
arm64: Emit debug bootcodes for early kernel boot

Reuse contextidr_el2 register which is unused in the early boot phase
for the purpose of tracking bootcodes. This allows to identify point of
failure in early boot code and helps investigations.

To make the change safe on targets without contextidr_el2, we're
checking dfr0_el1 debug version bits. If it tells us we're below
ARMV8.1, we bail out without writing to contextidr_el2.

To make use of the change, modified firmware or another tool capable of
periodically dumping contextidr_el2 is necessary.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 arch/arm64/Kconfig.debug   |  6 ++++++
 arch/arm64/kernel/Makefile |  5 +++++
 arch/arm64/kernel/head.S   | 40 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..668bda096773 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,10 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+config DEBUG_EARLY_BOOT
+	bool "Early boot debugging"
+	help
+	  Enable this option to use contextidr_el2 register for storing
+	  bootcodes from the early assembly code.
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 71c29a2a2f19..72b38e8314d4 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -84,5 +84,10 @@ ifeq ($(CONFIG_DEBUG_EFI),y)
 AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
 endif
 
+ifeq ($(CONFIG_DEBUG_EARLY_BOOT),y)
+AFLAGS_head.o += -march=armv8.1-a
+CFLAGS_setup.o += -march=armv8.1-a
+endif
+
 # for cleaning
 subdir- += vdso vdso32
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 2ce73525de2c..f15db7e83b6e 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -42,6 +42,34 @@
 #error PAGE_OFFSET must be at least 2MB aligned
 #endif
 
+#ifdef CONFIG_DEBUG_EARLY_BOOT
+/*
+ * This debugging enhancement makes use of contextidr_el2 for the purpose
+ * of storing bootcodes.
+ */
+.macro _emit_bootcode val, t1
+	/* Check if in EL2 */
+	mrs	\t1, CurrentEL
+	ubfx    \t1, \t1, #2, #2
+	cmp	\t1, #2
+	b.ne	1f
+
+	/* Check if we're at least ARMv8.1 */
+	mrs	\t1, ID_AA64DFR0_EL1
+	ubfx	\t1, \t1, #0, #4
+	cmp	\t1, #7
+	b.lt	1f
+
+	mov	\t1, #\val
+	msr	contextidr_el2, \t1
+1:
+	/* Quit */
+.endm
+#define emit_bootcode(reg) _emit_bootcode __LINE__, reg
+#else
+#define emit_bootcode(reg)
+#endif
+
 /*
  * Kernel startup entry point.
  * ---------------------------
@@ -86,6 +114,7 @@ SYM_CODE_START(primary_entry)
 	bl	record_mmu_state
 	bl	preserve_boot_args
 
+	emit_bootcode(x22)
 	adrp	x1, early_init_stack
 	mov	sp, x1
 	mov	x29, xzr
@@ -101,6 +130,7 @@ SYM_CODE_START(primary_entry)
 	cbnz	x19, 0f
 	dmb     sy
 	mov	x1, x0				// end of used region
+	emit_bootcode(x22)
 	adrp    x0, init_idmap_pg_dir
 	adr_l	x2, dcache_inval_poc
 	blr	x2
@@ -126,7 +156,9 @@ SYM_CODE_START(primary_entry)
 	 * On return, the CPU will be ready for the MMU to be turned on and
 	 * the TCR will have been set.
 	 */
+	emit_bootcode(x22)
 	bl	__cpu_setup			// initialise processor
+	emit_bootcode(x22)
 	b	__primary_switch
 SYM_CODE_END(primary_entry)
 
@@ -220,10 +252,12 @@ SYM_CODE_END(preserve_boot_args)
 SYM_FUNC_START_LOCAL(__primary_switched)
 	adr_l	x4, init_task
 	init_cpu_task x4, x5, x6
+	emit_bootcode(x22)
 
 	adr_l	x8, vectors			// load VBAR_EL1 with virtual
 	msr	vbar_el1, x8			// vector table address
 	isb
+	emit_bootcode(x22)
 
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
@@ -236,6 +270,7 @@ SYM_FUNC_START_LOCAL(__primary_switched)
 
 	mov	x0, x20
 	bl	set_cpu_boot_mode_flag
+	emit_bootcode(x22)
 
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	bl	kasan_early_init
@@ -243,6 +278,7 @@ SYM_FUNC_START_LOCAL(__primary_switched)
 	mov	x0, x20
 	bl	finalise_el2			// Prefer VHE if possible
 	ldp	x29, x30, [sp], #16
+	emit_bootcode(x22)
 	bl	start_kernel
 	ASM_BUG()
 SYM_FUNC_END(__primary_switched)
@@ -464,6 +500,7 @@ SYM_FUNC_START(__enable_mmu)
 	cmp     x3, #ID_AA64MMFR0_EL1_TGRAN_SUPPORTED_MAX
 	b.gt    __no_granule_support
 	phys_to_ttbr x2, x2
+	emit_bootcode(x22)
 	msr	ttbr0_el1, x2			// load TTBR0
 	load_ttbr1 x1, x1, x3
 
@@ -506,16 +543,19 @@ SYM_FUNC_START_LOCAL(__no_granule_support)
 SYM_FUNC_END(__no_granule_support)
 
 SYM_FUNC_START_LOCAL(__primary_switch)
+	emit_bootcode(x22)
 	adrp	x1, reserved_pg_dir
 	adrp	x2, init_idmap_pg_dir
 	bl	__enable_mmu
 
+	emit_bootcode(x22)
 	adrp	x1, early_init_stack
 	mov	sp, x1
 	mov	x29, xzr
 	mov	x0, x20				// pass the full boot status
 	mov	x1, x21				// pass the FDT
 	bl	__pi_early_map_kernel		// Map and relocate the kernel
+	emit_bootcode(x22)
 
 	ldr	x8, =__primary_switched
 	adrp	x0, KERNEL_START		// __pa(KERNEL_START)
-- 
2.47.1

