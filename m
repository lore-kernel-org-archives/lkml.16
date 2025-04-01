Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2742052
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487039; cv=none; b=gNlFGVr/hZ14qzRZTdr0N3uxl4HLHXXM0/hFz3QnGSFcZGndd8ohcfLOdj6c/dfM0K6imTzXrs4SsYF5yoOIcFlx6EldGIm1CLdDp6YvBl2bhsYQQlF0QKpUZUn/CIi+qpLyJI2sqZoTi1XLCCRM31PqzWcjsgWDNNvqC9h8/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487039; c=relaxed/simple;
	bh=laSVaLHor5K86cMAdejOUs0Hw+LqvLg1f6d4a2mtazA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nja3cuIKU83olm0OFcXOY1hsQRzdWH3plutmi7HyvntkNrDn6Ejmbgb2eCig6cKWb1fdHyV1SXEkp2aADYbUUBCfHzPE7faY1XGVLQVcJpRcrqIkULCFPEHQ88Zch1CiR4XRkR0zDrQawzvpDS7MGhz4YPNEl8HGf98WneQk1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=TZ7Y9k9S; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="TZ7Y9k9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1743487029;
	bh=gZ2K2yRuX3n2XC0+3N29SwonLnVP9QZfOmPOM4hsvSc=;
	h=From:To:Cc:Subject:Date:From;
	b=TZ7Y9k9S2HNQ7CSRuLTQ0hjRngisXb0wYsW9lSIr5HyUiiJ4WpVP+g3qv9WQ5TrjA
	 8+f+C7xZzmkgCg6BKqfiVQP3dquFL5h27wUefmCDqgZLHdd5aSPQvCgk+f1zblbCTf
	 wNt4uVRl5dTBijl88oeEJhEiBge8VyC2Bm+mTtKs=
Received: from stargazer.. (unknown [IPv6:240e:454:4110:bc5d:d62b:3688:1f37:16aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 80E32659C8;
	Tue,  1 Apr 2025 01:57:03 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: [PATCH] arm64: Add overrride for MPAM
Date: Tue,  1 Apr 2025 13:56:50 +0800
Message-ID: <20250401055650.22542-1-xry111@xry111.site>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
CPU support for MPAM") already states, if a buggy firmware fails to
either enable MPAM or emulate the trap as if it were disabled, the
kernel will just fail to boot.  While upgrading the firmware should be
the best solution, we have some hardware of which the vender have made
no response 2 months after we requested a firmware update.  Allow
overriding it so our devices don't become some e-waste.

Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Mingcong Bai <jeffbai@aosc.io>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/include/asm/cpufeature.h           | 12 ++++++++++
 arch/arm64/include/asm/el2_setup.h            | 14 -----------
 arch/arm64/kernel/cpufeature.c                | 23 +++++++++++++++++--
 arch/arm64/kernel/cpuinfo.c                   |  2 +-
 arch/arm64/kernel/pi/idreg-override.c         |  2 ++
 arch/arm64/kernel/setup.c                     |  2 ++
 arch/arm64/kernel/smp.c                       |  2 ++
 8 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3435a062a208..4f2caa706268 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -458,6 +458,9 @@
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
+	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
+			Monitoring support
+
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index c4326f1cb917..1dfc03a6e65c 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1048,6 +1048,18 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }
 
+static inline bool cpu_has_mpam(void)
+{
+	u64 pfr0 = read_sysreg_s(SYS_ID_AA64PFR0_EL1);
+
+	pfr0 &= ~id_aa64pfr0_override.mask;
+	pfr0 |= id_aa64pfr0_override.val;
+	return cpuid_feature_extract_unsigned_field(pfr0,
+						    ID_AA64PFR0_EL1_MPAM_SHIFT);
+}
+
+void cpu_init_el2_mpam(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749..8db261d42ad8 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -294,19 +294,6 @@
 .Lskip_gcs_\@:
 .endm
 
-.macro __init_el2_mpam
-	/* Memory Partitioning And Monitoring: disable EL2 traps */
-	mrs	x1, id_aa64pfr0_el1
-	ubfx	x0, x1, #ID_AA64PFR0_EL1_MPAM_SHIFT, #4
-	cbz	x0, .Lskip_mpam_\@		// skip if no MPAM
-	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
-						// and disable lower traps
-	mrs_s	x0, SYS_MPAMIDR_EL1
-	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@	// skip if no MPAMHCR reg
-	msr_s	SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
-.Lskip_mpam_\@:
-.endm
-
 /**
  * Initialize EL2 registers to sane values. This should be called early on all
  * cores that were booted in EL2. Note that everything gets initialised as
@@ -324,7 +311,6 @@
 	__init_el2_stage2
 	__init_el2_gicv3
 	__init_el2_hstr
-	__init_el2_mpam
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..64579fecf4c9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -88,6 +88,7 @@
 #include <asm/mte.h>
 #include <asm/hypervisor.h>
 #include <asm/processor.h>
+#include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
 #include <asm/traps.h>
@@ -1191,7 +1192,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1)))
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 
 	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
@@ -1443,7 +1444,7 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
 					info->reg_mpamidr, boot->reg_mpamidr);
 	}
@@ -3992,3 +3993,21 @@ ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "Vulnerable\n");
 	}
 }
+
+/* This is not done by the early el2 setup because we want to allow
+ * id_aa64pfr0.mpam=0 to disable MPAM initialization for buggy firmware
+ * which failed enable MPAM or emulate the trap as if it were disabled.
+ */
+void cpu_init_el2_mpam(void)
+{
+	u64 idr;
+
+	if (read_sysreg(CurrentEL) != CurrentEL_EL2 || !cpu_has_mpam())
+		return;
+
+	write_sysreg_s(0, SYS_MPAM2_EL2);
+
+	idr = read_sysreg_s(SYS_MPAMIDR_EL1);
+	if (idr & MPAMIDR_EL1_HAS_HCR)
+		write_sysreg_s(0, SYS_MPAMHCR_EL2);
+}
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 285d7d538342..51f346044672 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -494,7 +494,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+	if (cpu_has_mpam())
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 
 	if (IS_ENABLED(CONFIG_ARM64_SME) &&
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index c6b185b885f7..836e5a9b98d0 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -127,6 +127,7 @@ static const struct ftr_set_desc pfr0 __prel64_initconst = {
 	.fields		= {
 	        FIELD("sve", ID_AA64PFR0_EL1_SVE_SHIFT, pfr0_sve_filter),
 		FIELD("el0", ID_AA64PFR0_EL1_EL0_SHIFT, NULL),
+		FIELD("mpam", ID_AA64PFR0_EL1_MPAM_SHIFT, NULL),
 		{}
 	},
 };
@@ -246,6 +247,7 @@ static const struct {
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
 	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
+	{ "arm64.nompam",		"id_aa64pfr0.mpam=0" },
 };
 
 static int __init parse_hexdigit(const char *p, u64 *v)
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 85104587f849..9ab6db5968d9 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -313,6 +313,8 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	 */
 	local_daif_restore(DAIF_PROCCTX_NOIRQ);
 
+	cpu_init_el2_mpam();
+
 	/*
 	 * TTBR0 is only used for the identity mapping at this stage. Make it
 	 * point to zero page to avoid speculatively fetching new entries.
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..75009284aafa 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -214,6 +214,8 @@ asmlinkage notrace void secondary_start_kernel(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	cpu_init_el2_mpam();
+
 	/*
 	 * TTBR0 is only used for the identity mapping at this stage. Make it
 	 * point to zero page to avoid speculatively fetching new entries.
-- 
2.48.1


