Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14462AE6C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748839079; cv=none; b=MRRpN5Txz0qQGrPLFIZcEcqEc4j84ZlAIPU5uN0QGhfDJ7VBs8HOGatbPmqv1yZBOvWBG7KRk5O2QqHNrwJg2yWHXHRfJVVvx2VUozu0h3yiu1u+eAHAhRZe/X+98Fys7GHwVnml8YHUgLq3Q9J1a1Az4oqmhelllhEVyaZ3gaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748839079; c=relaxed/simple;
	bh=JF9rmx8cvcbqYeMmk1qR/OkYZF3sH65uGOGnMiPUwE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbJx8bTPJ1aOjuJ43sx4Whulhp2b2Mw0Glk0MYvWCodp0AAu9UdfYaGl4L+hASnGTo7Paj1LywzpYmjezoA0WdKLxruwlLcMYZsnCMqLA1KWEnu8LPj7nQ2ub1BA7qVx7QL8yOyx2aO52sAUbhHygFdMozop7pEcCCYnzXBSWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=UgKHh0o+; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="UgKHh0o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748839074;
	bh=7dWIffWf/lBgr+2Z+Bqm6v/IxM+GtOD7cOG9tkaJ+Jo=;
	h=From:To:Cc:Subject:Date:From;
	b=UgKHh0o+uup5PHtnUwNqkBq+Wdz87xKT1LvLsO02XBchEv0GlReGdDm0OKaoE/CHo
	 dmZ/0AMjPmH96g7BaKlN8Lhh5VFkrKNOnNbG2qdYb1UToxe/qptmI02Fo3tnTp0hc1
	 fiOsTAxUsIX/DX8aV+CZ5z0aj9CgO0Mdgqg/GUhg=
Received: from stargazer.. (unknown [IPv6:240e:457:1020:6dd9:c550:ccee:c743:4246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 91E9965F62;
	Mon,  2 Jun 2025 00:37:44 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [PATCH v4] arm64: Add override for MPAM
Date: Mon,  2 Jun 2025 12:33:21 +0800
Message-ID: <20250602043723.216338-1-xry111@xry111.site>
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
the best solution, we have some hardware of which the vendor have made
no response 2 months after we requested a firmware update.  Allow
overriding it so our devices don't become some e-waste.

Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: Shaopeng Tan <tan.shaopeng@fujitsu.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---

[v3]->v4:
- Also clear aa64pfr0_el1.mpam_frac for arm64.nompam to avoid
  incorrect announcement of MPAM 0.x.

[v2]->v3:
- Fix typos in the subject and a comment.
- Remove a useless #include directive.

[v1]->v2:
- Handle the override and initialize EL2 mpam in finalise_el2_state
- Move info->mpamidr assignment to {init,update}_cpu_features

[v3]: https://lore.kernel.org/all/20250516102556.9688-1-xry111@xry111.site/
[v2]: https://lore.kernel.org/all/20250402031603.35411-1-xry111@xry111.site/
[v1]: https://lore.kernel.org/all/20250401055650.22542-1-xry111@xry111.site/

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/include/asm/el2_setup.h            | 24 ++++++++-----------
 arch/arm64/kernel/cpufeature.c                |  7 ++++--
 arch/arm64/kernel/cpuinfo.c                   |  7 ++++--
 arch/arm64/kernel/pi/idreg-override.c         |  3 +++
 5 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a3ea40b22fb9..f1f2c0874da9 100644
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
 
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 1e7c7475e43f..ba5df0df02a4 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -298,19 +298,6 @@
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
@@ -328,7 +315,6 @@
 	__init_el2_stage2
 	__init_el2_gicv3
 	__init_el2_hstr
-	__init_el2_mpam
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
@@ -375,6 +361,16 @@
 #endif
 
 .macro finalise_el2_state
+	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
+
+.Linit_mpam_\@:
+	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
+						// and disable lower traps
+	mrs_s	x0, SYS_MPAMIDR_EL1
+	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@  // skip if no MPAMHCR reg
+	msr_s   SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
+
+.Lskip_mpam_\@:
 	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_\@, .Lskip_sve_\@, x1, x2
 
 .Linit_sve_\@:	/* SVE register access */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 45ea79cacf46..b34044e20128 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1199,8 +1199,10 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
+	}
 
 	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
@@ -1453,7 +1455,8 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
 					info->reg_mpamidr, boot->reg_mpamidr);
 	}
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94525abd1c22..c1f2b6b04b41 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -496,8 +496,11 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+	/*
+	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
+	 * don't want to read it (and trigger a trap on buggy firmware) if
+	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
+	 */
 
 	if (IS_ENABLED(CONFIG_ARM64_SME) &&
 	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index c6b185b885f7..bc57b290e5e7 100644
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
@@ -154,6 +155,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
+		FIELD("mpam_frac", ID_AA64PFR1_EL1_MPAM_frac_SHIFT, NULL),
 		{}
 	},
 };
@@ -246,6 +248,7 @@ static const struct {
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
 	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
+	{ "arm64.nompam",		"id_aa64pfr0.mpam=0 id_aa64pfr1.mpam_frac=0" },
 };
 
 static int __init parse_hexdigit(const char *p, u64 *v)
-- 
2.49.0

