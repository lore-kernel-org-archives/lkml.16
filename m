Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEC0207A27;
	Wed,  7 May 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611891; cv=none; b=IYaFUEop0lcWf3OiGBe5WJ7lKblIhnK0AjfH56q3/ZNdOP5C4SILEt/XC2cXI7hDolzLg1vWBh9bXI1dqVZrP6iB9fNVHTzxv+DjLkrEigaytr9QQADuxKqPrO62Nx1wsxb59ZaUnHYTcdo8AbcFXZstjIDtpn4f3FJ06IoO10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611891; c=relaxed/simple;
	bh=YxvVmEAaU+iUsX2FWzlfDIf/dolKXpRXag/JAFjWFNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rR7dgR12FH5Ahl4rTJkoKcMtHYlaF4yP5IWSts75UBz13/MjCPtrOUSmBeanPVeVoBnenQBXkRK3Ir9/LYYnL/S2/FdCjxFmNrpw4rBBntSuqcci33jr6Eo62haM2YYpJRxG2TGXPRjPv2SfHENGjbdIIjmzjaGyMOh1Ph3Clag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFCF616F2;
	Wed,  7 May 2025 02:57:58 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE04A3F5A1;
	Wed,  7 May 2025 02:58:05 -0700 (PDT)
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
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 1/6] arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
Date: Wed,  7 May 2025 10:57:52 +0100
Message-Id: <20250507095757.1663684-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507095757.1663684-1-yeoreum.yun@arm.com>
References: <20250507095757.1663684-1-yeoreum.yun@arm.com>
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
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..fdb3c1cef236 100644
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

