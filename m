Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA5C1E1A3B;
	Thu, 10 Apr 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271252; cv=none; b=kfBEMnSxxH5jIPiu1mX1umc7S5S9rEARh+JuD+S2qwDjx1LuNU2kO5pcaZaFLsJAeTkQYb5akp+jYxO7pBGj2ScDvIjHmVwLvmEZRhw9sZ+ahAs7Swq1uzPXetbpbqLGQ/plCozjc65gBr7SaCaIrVgDbdiRcyvUjIXr5D+cciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271252; c=relaxed/simple;
	bh=LDs5xL4guyPGIPWYAGPp2GAicAgD5+f+jk4hMt3Chc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fulFce4HapCBIyTcnGRaLaxZTHp6Qn4nTyL1b82EzsnOTVblQs1JZH3sgxsOtn7dBlJbnilrUprc73fHLnguutCI2F7n1E57G6WgwMljvPGlcFh3nKJSpqa+7tDIogysHjONN3saDsBX1HevlgaGhjOYKwPs7egdnLL/j6lKi4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D183E1516;
	Thu, 10 Apr 2025 00:47:29 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4EF63F6A8;
	Thu, 10 Apr 2025 00:47:26 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Date: Thu, 10 Apr 2025 08:47:19 +0100
Message-Id: <20250410074721.947380-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410074721.947380-1-yeoreum.yun@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
all non-address bits on a synchronous MTE tag check fault since Armv8.9

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
---
 Documentation/arch/arm64/elf_hwcaps.rst      |  3 +++
 Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
 arch/arm64/include/asm/hwcap.h               |  1 +
 arch/arm64/include/uapi/asm/hwcap.h          |  1 +
 arch/arm64/kernel/cpufeature.c               |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c                  |  1 +
 arch/arm64/tools/cpucaps                     |  1 +
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 69d7afe56853..358f5af035ff 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -435,6 +435,9 @@ HWCAP2_SME_SF8DP4
 HWCAP2_POE
     Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.

+HWCAP3_MTE_FAR
+    Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.
+
 4. Unused AT_HWCAP bits
 -----------------------

diff --git a/Documentation/arch/arm64/tagged-pointers.rst b/Documentation/arch/arm64/tagged-pointers.rst
index 81b6c2a770dd..73c59a9c7a63 100644
--- a/Documentation/arch/arm64/tagged-pointers.rst
+++ b/Documentation/arch/arm64/tagged-pointers.rst
@@ -60,11 +60,12 @@ that signal handlers in applications making use of tags cannot rely
 on the tag information for user virtual addresses being maintained
 in these fields unless the flag was set.

-Due to architecture limitations, bits 63:60 of the fault address
-are not preserved in response to synchronous tag check faults
-(SEGV_MTESERR) even if SA_EXPOSE_TAGBITS was set. Applications should
-treat the values of these bits as undefined in order to accommodate
-future architecture revisions which may preserve the bits.
+If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
+are preserved in response to synchronous tag check faults (SEGV_MTESERR)
+otherwise not preserved even if SA_EXPOSE_TAGBITS was set.
+Applications should interpret the values of these bits based on
+the support for the 'mte_far' hwcap. If the support is not present,
+the values of these bits should be considered as undefined otherwise valid.

 For signals raised in response to watchpoint debug exceptions, the
 tag information will be preserved regardless of the SA_EXPOSE_TAGBITS
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 1c3f9617d54f..28dd1ac29ecc 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -176,6 +176,7 @@
 #define KERNEL_HWCAP_POE		__khwcap2_feature(POE)

 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
+#define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)

 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 705a7afa8e58..7d22527a7975 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -143,5 +143,6 @@
 /*
  * HWCAP3 flags - for AT_HWCAP3
  */
+#define HWCAP3_MTE_FAR		(1UL << 0)

 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..183b4b7e3074 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -312,6 +312,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {

 static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
 	ARM64_FTR_END,
 };

@@ -2861,6 +2862,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE3)
 	},
+	{
+		.desc = "FAR on MTE Tag Check Fault",
+		.capability = ARM64_MTE_FAR,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTEFAR, IMP)
+	},
 #endif /* CONFIG_ARM64_MTE */
 	{
 		.desc = "RCpc load-acquire (LDAPR)",
@@ -3191,6 +3199,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 #ifdef CONFIG_ARM64_MTE
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
+	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),
 #endif /* CONFIG_ARM64_MTE */
 	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
 	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 285d7d538342..e2b13454e38a 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
 	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
+	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",
 };

 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 772c1b008e43..ef62ea04ba37 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -67,6 +67,7 @@ MPAM
 MPAM_HCR
 MTE
 MTE_ASYMM
+MTE_FAR
 SME
 SME_FA64
 SME2
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

