Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3BE296FC0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299459; cv=none; b=ubDx6YKz69KMIPSW0HxM9VovhrVwDdi98rddLfbpo1r42ynD4z4/IcOwALuPt3FlSBFHn4j9Wz2tP8vz8H6kPKPnKlqPC4BHS/Hc4AboIa0BaB7uD2LnHdGgjn0B01otl8/1hrx335FUK3salOLyxVIwMRxtjstZauUHLQQaQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299459; c=relaxed/simple;
	bh=HDnpYwIauPePSMATxCNW3RWTEOAyDzQmFqPynWVoP2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBlcd3hJXvfZbeKmTnt339txJ+EMe36iqSJe3f7dvT8LXnBM9O2HOtZ18X3nx47mpM5VgvTFhEe/yYLuWwqWOAwPCVRdjt7WgVLjMduo04i/8yQeJ+uYYLgVDADvH67k38WoWAJOSwZ4qdsf1kQ+YpPOguyQO4yah/in1juzOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQp9YtyQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQp9YtyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE5FC4CEE7;
	Thu, 15 May 2025 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299459;
	bh=HDnpYwIauPePSMATxCNW3RWTEOAyDzQmFqPynWVoP2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQp9YtyQCBJGqWbuHr18Zx8t0lTfY0baCs3DqSfNmlqNoCd+quY8MpbKfNcvZy3VW
	 Upa0V+j1HwozH/F3v3vFR6AO6RmpwmqVFE5Q5CYq07t2mDKRck6yuiA5YxdIkZgA0Q
	 zhUIcbwiEwnsbcieYykkQw4SjTFImAxZFMBdUtUCc4Wvq3AJu3TIHlGV69XAWlrP18
	 /hyLylaKYN2AkUIY5WWv62eSNCPVJAUml1ni/pid4k7UAj/tzbld+dbbb1SXlEYOgK
	 VWHKn0ftDEg43E9SQrzYtPy21Rjz02xIn1xU4UlSvoWS75iSak/TcoKnpwNckW0HO+
	 WNWhbX4GOEL2Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 07/15] x86/cpu, cpufreq: Remove AMD ELAN support
Date: Thu, 15 May 2025 10:56:57 +0200
Message-ID: <20250515085708.2510123-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515085708.2510123-1-mingo@kernel.org>
References: <20250515085708.2510123-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-8-mingo@kernel.org
---
 arch/x86/Makefile_32.cpu     |   3 -
 drivers/cpufreq/Kconfig.x86  |  26 -----
 drivers/cpufreq/Makefile     |   2 -
 drivers/cpufreq/elanfreq.c   | 226 -------------------------------------------
 drivers/cpufreq/sc520_freq.c | 136 --------------------------
 5 files changed, 393 deletions(-)

diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index 43226c9fe795..f5e933077bf4 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -28,9 +28,6 @@ cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
 cflags-$(CONFIG_MATOM)		+= -march=atom
 
-# AMD Elan support
-cflags-$(CONFIG_MELAN)		+= -march=i486
-
 # Geode GX1 support
 cflags-$(CONFIG_MGEODEGX1)	+= -march=pentium-mmx
 cflags-$(CONFIG_MGEODE_LX)	+= $(call cc-option,-march=geode,-march=pentium-mmx)
diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 2c5c228408bf..dcd78ae62e47 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -112,32 +112,6 @@ config X86_ACPI_CPUFREQ_CPB
 	  By enabling this option the acpi_cpufreq driver provides the old
 	  entry in addition to the new boost ones, for compatibility reasons.
 
-config ELAN_CPUFREQ
-	tristate "AMD Elan SC400 and SC410"
-	depends on MELAN
-	help
-	  This adds the CPUFreq driver for AMD Elan SC400 and SC410
-	  processors.
-
-	  You need to specify the processor maximum speed as boot
-	  parameter: elanfreq=maxspeed (in kHz) or as module
-	  parameter "max_freq".
-
-	  For details, take a look at <file:Documentation/cpu-freq/>.
-
-	  If in doubt, say N.
-
-config SC520_CPUFREQ
-	tristate "AMD Elan SC520"
-	depends on MELAN
-	help
-	  This adds the CPUFreq driver for AMD Elan SC520 processor.
-
-	  For details, take a look at <file:Documentation/cpu-freq/>.
-
-	  If in doubt, say N.
-
-
 config X86_POWERNOW_K6
 	tristate "AMD Mobile K6-2/K6-3 PowerNow!"
 	depends on X86_32
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 22ab45209f9b..701d90423b75 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -38,8 +38,6 @@ obj-$(CONFIG_X86_POWERNOW_K6)		+= powernow-k6.o
 obj-$(CONFIG_X86_POWERNOW_K7)		+= powernow-k7.o
 obj-$(CONFIG_X86_LONGHAUL)		+= longhaul.o
 obj-$(CONFIG_X86_E_POWERSAVER)		+= e_powersaver.o
-obj-$(CONFIG_ELAN_CPUFREQ)		+= elanfreq.o
-obj-$(CONFIG_SC520_CPUFREQ)		+= sc520_freq.o
 obj-$(CONFIG_X86_LONGRUN)		+= longrun.o
 obj-$(CONFIG_X86_GX_SUSPMOD)		+= gx-suspmod.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)		+= speedstep-ich.o
diff --git a/drivers/cpufreq/elanfreq.c b/drivers/cpufreq/elanfreq.c
deleted file mode 100644
index fc5a58088b35..000000000000
--- a/drivers/cpufreq/elanfreq.c
+++ /dev/null
@@ -1,226 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *	elanfreq:	cpufreq driver for the AMD ELAN family
- *
- *	(c) Copyright 2002 Robert Schwebel <r.schwebel@pengutronix.de>
- *
- *	Parts of this code are (c) Sven Geggus <sven@geggus.net>
- *
- *      All Rights Reserved.
- *
- *	2002-02-13: - initial revision for 2.4.18-pre9 by Robert Schwebel
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-
-#include <linux/delay.h>
-#include <linux/cpufreq.h>
-
-#include <asm/cpu_device_id.h>
-#include <linux/timex.h>
-#include <linux/io.h>
-
-#define REG_CSCIR 0x22		/* Chip Setup and Control Index Register    */
-#define REG_CSCDR 0x23		/* Chip Setup and Control Data  Register    */
-
-/* Module parameter */
-static int max_freq;
-
-struct s_elan_multiplier {
-	int clock;		/* frequency in kHz                         */
-	int val40h;		/* PMU Force Mode register                  */
-	int val80h;		/* CPU Clock Speed Register                 */
-};
-
-/*
- * It is important that the frequencies
- * are listed in ascending order here!
- */
-static struct s_elan_multiplier elan_multiplier[] = {
-	{1000,	0x02,	0x18},
-	{2000,	0x02,	0x10},
-	{4000,	0x02,	0x08},
-	{8000,	0x00,	0x00},
-	{16000,	0x00,	0x02},
-	{33000,	0x00,	0x04},
-	{66000,	0x01,	0x04},
-	{99000,	0x01,	0x05}
-};
-
-static struct cpufreq_frequency_table elanfreq_table[] = {
-	{0, 0,	1000},
-	{0, 1,	2000},
-	{0, 2,	4000},
-	{0, 3,	8000},
-	{0, 4,	16000},
-	{0, 5,	33000},
-	{0, 6,	66000},
-	{0, 7,	99000},
-	{0, 0,	CPUFREQ_TABLE_END},
-};
-
-
-/**
- *	elanfreq_get_cpu_frequency: determine current cpu speed
- *
- *	Finds out at which frequency the CPU of the Elan SOC runs
- *	at the moment. Frequencies from 1 to 33 MHz are generated
- *	the normal way, 66 and 99 MHz are called "Hyperspeed Mode"
- *	and have the rest of the chip running with 33 MHz.
- */
-
-static unsigned int elanfreq_get_cpu_frequency(unsigned int cpu)
-{
-	u8 clockspeed_reg;    /* Clock Speed Register */
-
-	local_irq_disable();
-	outb_p(0x80, REG_CSCIR);
-	clockspeed_reg = inb_p(REG_CSCDR);
-	local_irq_enable();
-
-	if ((clockspeed_reg & 0xE0) == 0xE0)
-		return 0;
-
-	/* Are we in CPU clock multiplied mode (66/99 MHz)? */
-	if ((clockspeed_reg & 0xE0) == 0xC0) {
-		if ((clockspeed_reg & 0x01) == 0)
-			return 66000;
-		else
-			return 99000;
-	}
-
-	/* 33 MHz is not 32 MHz... */
-	if ((clockspeed_reg & 0xE0) == 0xA0)
-		return 33000;
-
-	return (1<<((clockspeed_reg & 0xE0) >> 5)) * 1000;
-}
-
-
-static int elanfreq_target(struct cpufreq_policy *policy,
-			    unsigned int state)
-{
-	/*
-	 * Access to the Elan's internal registers is indexed via
-	 * 0x22: Chip Setup & Control Register Index Register (CSCI)
-	 * 0x23: Chip Setup & Control Register Data  Register (CSCD)
-	 *
-	 */
-
-	/*
-	 * 0x40 is the Power Management Unit's Force Mode Register.
-	 * Bit 6 enables Hyperspeed Mode (66/100 MHz core frequency)
-	 */
-
-	local_irq_disable();
-	outb_p(0x40, REG_CSCIR);		/* Disable hyperspeed mode */
-	outb_p(0x00, REG_CSCDR);
-	local_irq_enable();		/* wait till internal pipelines and */
-	udelay(1000);			/* buffers have cleaned up          */
-
-	local_irq_disable();
-
-	/* now, set the CPU clock speed register (0x80) */
-	outb_p(0x80, REG_CSCIR);
-	outb_p(elan_multiplier[state].val80h, REG_CSCDR);
-
-	/* now, the hyperspeed bit in PMU Force Mode Register (0x40) */
-	outb_p(0x40, REG_CSCIR);
-	outb_p(elan_multiplier[state].val40h, REG_CSCDR);
-	udelay(10000);
-	local_irq_enable();
-
-	return 0;
-}
-/*
- *	Module init and exit code
- */
-
-static int elanfreq_cpu_init(struct cpufreq_policy *policy)
-{
-	struct cpuinfo_x86 *c = &cpu_data(0);
-	struct cpufreq_frequency_table *pos;
-
-	/* capability check */
-	if ((c->x86_vendor != X86_VENDOR_AMD) ||
-	    (c->x86 != 4) || (c->x86_model != 10))
-		return -ENODEV;
-
-	/* max freq */
-	if (!max_freq)
-		max_freq = elanfreq_get_cpu_frequency(0);
-
-	/* table init */
-	cpufreq_for_each_entry(pos, elanfreq_table)
-		if (pos->frequency > max_freq)
-			pos->frequency = CPUFREQ_ENTRY_INVALID;
-
-	policy->freq_table = elanfreq_table;
-	return 0;
-}
-
-
-#ifndef MODULE
-/**
- * elanfreq_setup - elanfreq command line parameter parsing
- *
- * elanfreq command line parameter.  Use:
- *  elanfreq=66000
- * to set the maximum CPU frequency to 66 MHz. Note that in
- * case you do not give this boot parameter, the maximum
- * frequency will fall back to _current_ CPU frequency which
- * might be lower. If you build this as a module, use the
- * max_freq module parameter instead.
- */
-static int __init elanfreq_setup(char *str)
-{
-	max_freq = simple_strtoul(str, &str, 0);
-	pr_warn("You're using the deprecated elanfreq command line option. Use elanfreq.max_freq instead, please!\n");
-	return 1;
-}
-__setup("elanfreq=", elanfreq_setup);
-#endif
-
-
-static struct cpufreq_driver elanfreq_driver = {
-	.get		= elanfreq_get_cpu_frequency,
-	.flags		= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
-	.verify		= cpufreq_generic_frequency_table_verify,
-	.target_index	= elanfreq_target,
-	.init		= elanfreq_cpu_init,
-	.name		= "elanfreq",
-};
-
-static const struct x86_cpu_id elan_id[] = {
-	X86_MATCH_VENDOR_FAM_MODEL(AMD, 4, 10, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, elan_id);
-
-static int __init elanfreq_init(void)
-{
-	if (!x86_match_cpu(elan_id))
-		return -ENODEV;
-	return cpufreq_register_driver(&elanfreq_driver);
-}
-
-
-static void __exit elanfreq_exit(void)
-{
-	cpufreq_unregister_driver(&elanfreq_driver);
-}
-
-
-module_param(max_freq, int, 0444);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Robert Schwebel <r.schwebel@pengutronix.de>, "
-		"Sven Geggus <sven@geggus.net>");
-MODULE_DESCRIPTION("cpufreq driver for AMD's Elan CPUs");
-
-module_init(elanfreq_init);
-module_exit(elanfreq_exit);
diff --git a/drivers/cpufreq/sc520_freq.c b/drivers/cpufreq/sc520_freq.c
deleted file mode 100644
index b360f03a116f..000000000000
--- a/drivers/cpufreq/sc520_freq.c
+++ /dev/null
@@ -1,136 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *	sc520_freq.c: cpufreq driver for the AMD Elan sc520
- *
- *	Copyright (C) 2005 Sean Young <sean@mess.org>
- *
- *	Based on elanfreq.c
- *
- *	2005-03-30: - initial revision
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-
-#include <linux/delay.h>
-#include <linux/cpufreq.h>
-#include <linux/timex.h>
-#include <linux/io.h>
-
-#include <asm/cpu_device_id.h>
-
-#define MMCR_BASE	0xfffef000	/* The default base address */
-#define OFFS_CPUCTL	0x2   /* CPU Control Register */
-
-static __u8 __iomem *cpuctl;
-
-static struct cpufreq_frequency_table sc520_freq_table[] = {
-	{0, 0x01,	100000},
-	{0, 0x02,	133000},
-	{0, 0,	CPUFREQ_TABLE_END},
-};
-
-static unsigned int sc520_freq_get_cpu_frequency(unsigned int cpu)
-{
-	u8 clockspeed_reg = *cpuctl;
-
-	switch (clockspeed_reg & 0x03) {
-	default:
-		pr_err("error: cpuctl register has unexpected value %02x\n",
-		       clockspeed_reg);
-		fallthrough;
-	case 0x01:
-		return 100000;
-	case 0x02:
-		return 133000;
-	}
-}
-
-static int sc520_freq_target(struct cpufreq_policy *policy, unsigned int state)
-{
-
-	u8 clockspeed_reg;
-
-	local_irq_disable();
-
-	clockspeed_reg = *cpuctl & ~0x03;
-	*cpuctl = clockspeed_reg | sc520_freq_table[state].driver_data;
-
-	local_irq_enable();
-
-	return 0;
-}
-
-/*
- *	Module init and exit code
- */
-
-static int sc520_freq_cpu_init(struct cpufreq_policy *policy)
-{
-	struct cpuinfo_x86 *c = &cpu_data(0);
-
-	/* capability check */
-	if (c->x86_vendor != X86_VENDOR_AMD ||
-	    c->x86 != 4 || c->x86_model != 9)
-		return -ENODEV;
-
-	/* cpuinfo and default policy values */
-	policy->cpuinfo.transition_latency = 1000000; /* 1ms */
-	policy->freq_table = sc520_freq_table;
-
-	return 0;
-}
-
-
-static struct cpufreq_driver sc520_freq_driver = {
-	.get	= sc520_freq_get_cpu_frequency,
-	.verify	= cpufreq_generic_frequency_table_verify,
-	.target_index = sc520_freq_target,
-	.init	= sc520_freq_cpu_init,
-	.name	= "sc520_freq",
-};
-
-static const struct x86_cpu_id sc520_ids[] = {
-	X86_MATCH_VENDOR_FAM_MODEL(AMD, 4, 9, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, sc520_ids);
-
-static int __init sc520_freq_init(void)
-{
-	int err;
-
-	if (!x86_match_cpu(sc520_ids))
-		return -ENODEV;
-
-	cpuctl = ioremap((unsigned long)(MMCR_BASE + OFFS_CPUCTL), 1);
-	if (!cpuctl) {
-		pr_err("sc520_freq: error: failed to remap memory\n");
-		return -ENOMEM;
-	}
-
-	err = cpufreq_register_driver(&sc520_freq_driver);
-	if (err)
-		iounmap(cpuctl);
-
-	return err;
-}
-
-
-static void __exit sc520_freq_exit(void)
-{
-	cpufreq_unregister_driver(&sc520_freq_driver);
-	iounmap(cpuctl);
-}
-
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Sean Young <sean@mess.org>");
-MODULE_DESCRIPTION("cpufreq driver for AMD's Elan sc520 CPU");
-
-module_init(sc520_freq_init);
-module_exit(sc520_freq_exit);
-
-- 
2.45.2

