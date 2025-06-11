Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E002322331E;
	Wed, 11 Jun 2025 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665265; cv=none; b=aa2P7zCBOZuuFUd+Rp6PI0GE0jCLVBAxRI0HIu3SiG7cihlQCClpXWxQCvj+VEdgJJjwVLY/bUx60fGcRj6O3J3xHp0T5/bWcM+xXZCyyHCsjKAqh9sAoLpGnavccVJAaJ/Wyup/CiWFik1fcu1bN5qrjlYcwHH88UuFGI5YzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665265; c=relaxed/simple;
	bh=+JIrPuGS8nUD4SB8FQOcnnhPfYRc/S7ugJdAbyTE1SM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px/npZbt0mo+T4baIVzjQtHJ/wqKEF2QrCo8Mg2haZa+5byMpHFdE2YATBQ8xQkYJMbKLdZPpH5lvBE0IgYHl6pWhiyQDkUageeKqBbE/yF0EIaEZO//OFQ+dupYYBPbrtBGaQwMrsn5vVp54iNewqebi03Y5IT8YlhE/8Nj4LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7391688;
	Wed, 11 Jun 2025 11:07:23 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCE3A3F673;
	Wed, 11 Jun 2025 11:07:40 -0700 (PDT)
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
Subject: [PATCH v8 1/9] arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
Date: Wed, 11 Jun 2025 19:07:26 +0100
Message-Id: <20250611180734.63657-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611180734.63657-1-yeoreum.yun@arm.com>
References: <20250611180734.63657-1-yeoreum.yun@arm.com>
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
index b34044e20128..af6a6924a3e8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -320,6 +320,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
 	ARM64_FTR_END,
 };
 
@@ -2874,6 +2875,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 10effd4cff6b..fe8f4f8ce95c 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -68,6 +68,7 @@ MPAM
 MPAM_HCR
 MTE
 MTE_ASYMM
+MTE_FAR
 SME
 SME_FA64
 SME2
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

