Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649AD10E0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467870; cv=none; b=BELDspCtgAIJB+3illk+K/YN/FXqkpRipZ0XUuTv3KR8v6O3ScfPK9Mckt2ybznxafs4/iZzl45j1Mm79dXl8QDSFot5xB93IS0fG5jFl8/X7P/dqnfBtydupT4nX0urTwuMVVvSaC8+aGcK2uHKtev/zTRQ2x0GSaUfFuZFTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467870; c=relaxed/simple;
	bh=eZOvY55kmB+6q68tLuzd8NAB+0K3gKlmgdi4pmXZv8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIrJRFet79qFwuKrT3gdPQZqA0u+oxtjCx6x7C6ft5TMoFKELWkjdhX7HTAcPvfYUuhA/ND5QHARyQS6cy09sJq/ZxrMHPzebnCAvKJTNNy06DY6d/c/n3aqYWPJJU5U39Cy1nsYCFYqCEs9e9D8WoVs6wl/af4VOg5Z4ft8FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD+dgjBD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD+dgjBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E3EC4CEE3;
	Wed, 28 May 2025 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748467869;
	bh=eZOvY55kmB+6q68tLuzd8NAB+0K3gKlmgdi4pmXZv8M=;
	h=From:To:Cc:Subject:Date:From;
	b=YD+dgjBDwJf12Lg0X+JThIDTc1OAy1n0KCOvvKHfjNTDykKvW9eS3b3QFIP6nRE2b
	 FsHARtugOEuSRuuQkX5M9DoxFbkbjCtMemI6rQqreOE+UtNvfV/IKWfH9iyiqpIDoK
	 O+Rpib8AvgVfEOJO9Xjrf37wxvgTSRx/sWGTCPcfbjS0FTHZj7x2mGjhOJmgqsQ4+6
	 zbjVQa7vzcNMd2JSbcSi1VwrTe2f3Z9l9F9S7YLqdyOoBnTODPboSMR4kQcYv67Tiw
	 oHAOJ6dX3QJDnv19rKHBT/U3Zx1rCNf4qOM8fsqlNTXzJoJ1zhPgIOGYB2iX+4dTgL
	 tGdbXYYSGK1VQ==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/CPU/AMD: Add CPUID faulting support
Date: Wed, 28 May 2025 23:31:05 +0200
Message-ID: <20250528213105.1149-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Add CPUID faulting support on AMD using the same user interface.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/include/asm/cpufeatures.h |  2 ++
 arch/x86/include/asm/msr-index.h   |  1 +
 arch/x86/kernel/cpu/amd.c          |  4 ++++
 arch/x86/kernel/process.c          | 20 ++++++++++++++------
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 5b50e0e35129..1e4fb02914a7 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -457,6 +457,8 @@
 #define X86_FEATURE_AUTOIBRS		(20*32+ 8) /* Automatic IBRS */
 #define X86_FEATURE_NO_SMM_CTL_MSR	(20*32+ 9) /* SMM_CTL MSR is not present */
 
+#define X86_FEATURE_GP_ON_USER_CPUID	(20*32+17) /* User CPUID faulting */
+
 #define X86_FEATURE_SBPB		(20*32+27) /* Selective Branch Prediction Barrier */
 #define X86_FEATURE_IBPB_BRTYPE		(20*32+28) /* MSR_PRED_CMD[IBPB] flushes all branch type predictions */
 #define X86_FEATURE_SRSO_NO		(20*32+29) /* CPU is not affected by SRSO */
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b7dded3c8113..ff7e9743250f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -830,6 +830,7 @@
 #define MSR_K7_HWCR_SMMLOCK		BIT_ULL(MSR_K7_HWCR_SMMLOCK_BIT)
 #define MSR_K7_HWCR_IRPERF_EN_BIT	30
 #define MSR_K7_HWCR_IRPERF_EN		BIT_ULL(MSR_K7_HWCR_IRPERF_EN_BIT)
+#define MSR_K7_HWCR_CPUID_USER_DIS_BIT	35
 #define MSR_K7_FID_VID_CTL		0xc0010041
 #define MSR_K7_FID_VID_STATUS		0xc0010042
 #define MSR_K7_HWCR_CPB_DIS_BIT		25
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2c..50f88fe51816 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -489,6 +489,10 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 	}
 
 	bsp_determine_snp(c);
+
+	if (cpu_has(c, X86_FEATURE_GP_ON_USER_CPUID))
+		setup_force_cpu_cap(X86_FEATURE_CPUID_FAULT);
+
 	return;
 
 warn:
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index c1d2dac72b9c..3c104fb4753c 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -333,13 +333,21 @@ DEFINE_PER_CPU(u64, msr_misc_features_shadow);
 
 static void set_cpuid_faulting(bool on)
 {
-	u64 msrval;
 
-	msrval = this_cpu_read(msr_misc_features_shadow);
-	msrval &= ~MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
-	msrval |= (on << MSR_MISC_FEATURES_ENABLES_CPUID_FAULT_BIT);
-	this_cpu_write(msr_misc_features_shadow, msrval);
-	wrmsrq(MSR_MISC_FEATURES_ENABLES, msrval);
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
+		u64 msrval;
+
+		msrval = this_cpu_read(msr_misc_features_shadow);
+		msrval &= ~MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
+		msrval |= (on << MSR_MISC_FEATURES_ENABLES_CPUID_FAULT_BIT);
+		this_cpu_write(msr_misc_features_shadow, msrval);
+		wrmsrq(MSR_MISC_FEATURES_ENABLES, msrval);
+	} else if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
+		if (on)
+			msr_set_bit(MSR_K7_HWCR, MSR_K7_HWCR_CPUID_USER_DIS_BIT);
+		else
+			msr_clear_bit(MSR_K7_HWCR, MSR_K7_HWCR_CPUID_USER_DIS_BIT);
+	}
 }
 
 static void disable_cpuid(void)
-- 
2.43.0

