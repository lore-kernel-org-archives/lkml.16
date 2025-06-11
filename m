Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A8926158C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635304; cv=none; b=T2cHKnb+QZNjNkk98cw8YfwndMWhGi0j7Qheo37O09MAO+RyjVNo+7jP0IqFG7tZ86U4Ki7dyTihQVKH88Jx6mjZpxZ4M70wohK28JB0c/UcUWO+0IxrW51ZARkXwbGXxXv3HkV5TKvlUEZYziWhVZOfWVf0HW3m+w7p8KeK0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635304; c=relaxed/simple;
	bh=qCJRytY2Rh8MyFpXTAnJ/gmOwtp7GF6QWpIP55oYvSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhMjBpmQ6KcsnrSXmRgkl8k015J8idfIrfQeCdYsQn0a0bmpgixjaOo2g0Bg11ndL55gCTeHxY7a2gIz2nTxCiHd0mwB7QGCHfdtkRzoeLFpIhvts2XvILUytPUdArjbMBiGk456an+4BBBCZeE5QSBItSRmbjLJZmbUnBWp+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AB7B1688;
	Wed, 11 Jun 2025 02:48:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA69A3F59E;
	Wed, 11 Jun 2025 02:48:18 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 4/7] arm64/hwcaps: add MTE_STORE_ONLY hwcaps
Date: Wed, 11 Jun 2025 10:47:59 +0100
Message-Id: <20250611094802.929332-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611094802.929332-1-yeoreum.yun@arm.com>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.

add MTE_STORE_ONLY hwcaps so that user can use this feature.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 3 +++
 arch/arm64/include/asm/hwcap.h          | 1 +
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 1 +
 arch/arm64/kernel/cpuinfo.c             | 1 +
 5 files changed, 7 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 358f5af035ff..f58ada4d6cb2 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -438,6 +438,9 @@ HWCAP2_POE
 HWCAP3_MTE_FAR
     Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.
 
+HWCAP3_MTE_STORE_ONLY
+    Functionality implied by ID_AA64PFR2_EL1.MTESTOREONLY == 0b0001.
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 28dd1ac29ecc..13f94c8ddfc0 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -177,6 +177,7 @@
 
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
 #define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
+#define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 7d22527a7975..72c78468b806 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -144,5 +144,6 @@
  * HWCAP3 flags - for AT_HWCAP3
  */
 #define HWCAP3_MTE_FAR		(1UL << 0)
+#define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index fdc48aa1f0e2..b4204fa743f0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3228,6 +3228,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
 	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),
+	HWCAP_CAP(ID_AA64PFR2_EL1, MTESTOREONLY, IMP, CAP_HWCAP , KERNEL_HWCAP_MTE_STORE_ONLY),
 #endif /* CONFIG_ARM64_MTE */
 	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
 	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index e552cb305641..ba834909a28b 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -161,6 +161,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
 	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
+	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mtestoreonly",
 };
 
 #ifdef CONFIG_COMPAT
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

