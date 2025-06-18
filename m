Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81AC28000E;
	Wed, 18 Jun 2025 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236325; cv=none; b=DQryQ/nKzIPBrMT8W+DNIm04WFhTSWOwHmJWB/hsuDCHxK1rX6k2uSRlzW+GsCt74US1zNEHSQMkw1W69iy7Wq/THJkU8KMt/kz1inyN2gD5Xz10qoFHgF8LMZBi4DBHGwmapXGhmV8TuuaLuZtk3ZA/Vk0ni3thxXTrVJ++5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236325; c=relaxed/simple;
	bh=85tOdC7OURh2ZbL/F08AO0a0Wwl27m6CoU9i/qdIXU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KxBGBzW1pB+/cNyW6+IV0Ps5+IU5UrGVQt5oGAR/APXZVYq9mCxCVeWFVHc9gBNo5mLKgr2lhZA3gzVnQnsJ+AVUEGbjBA/pEWbyN7aQYCbbIwtagUbtKXmye+l0DWyx1kYjJwvr7dy6T9WMY+tq2fgu4epWnVcdEVMP8NLjemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 688B914BF;
	Wed, 18 Jun 2025 01:45:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C36A83F66E;
	Wed, 18 Jun 2025 01:45:20 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 02/10] arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
Date: Wed, 18 Jun 2025 09:45:05 +0100
Message-Id: <20250618084513.1761345-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
are preserved in response to synchronous tag check faults (SEGV_MTESERR).

This patch modifies below to support this feature:
  - Use the original FAR_EL1 value when an MTE tag check fault occurs,
    if ARM64_MTE_FAR is supported so that not only logical tag
    (bits 59:56) but also address tag (bits 63:60] being reported too.

  - Add HWCAP for mtefar to let user know bits 63:60 includes
    address tag information when when FEAT_MTE_TAGGED_FAR is supported.

Applications that require this information should install
a signal handler with the SA_EXPOSE_TAGBITS flag.
While this introduces a minor ABI change,
most applications do not set this flag and therefore will not be affected.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/arch/arm64/elf_hwcaps.rst      |  3 +++
 Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
 arch/arm64/include/asm/hwcap.h               |  1 +
 arch/arm64/include/uapi/asm/hwcap.h          |  1 +
 arch/arm64/kernel/cpufeature.c               |  1 +
 arch/arm64/kernel/cpuinfo.c                  |  1 +
 arch/arm64/mm/fault.c                        |  7 +++++--
 7 files changed, 18 insertions(+), 7 deletions(-)

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
index 81b6c2a770dd..f87a925ca9a5 100644
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
+the support for the HWCAP3_MTE_FAR. If the support is not present,
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
index af6a6924a3e8..8a5284c733b7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3219,6 +3219,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 #ifdef CONFIG_ARM64_MTE
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
+	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),
 #endif /* CONFIG_ARM64_MTE */
 	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
 	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index c1f2b6b04b41..e552cb305641 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
 	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
+	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
 };
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..832d8540e13b 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	/*
 	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
 	 * for tag check faults. Set them to corresponding bits in the untagged
-	 * address.
+	 * address if ARM64_MTE_FAR isn't supported.
+	 * Otherwise, bits 63:60 of FAR_EL1 are not UNKNOWN.
 	 */
-	far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+	if (!cpus_have_cap(ARM64_MTE_FAR))
+		far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+
 	do_bad_area(far, esr, regs);
 	return 0;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

