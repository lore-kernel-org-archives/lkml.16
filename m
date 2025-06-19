Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DF2376E0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364013; cv=none; b=EvBXCl+9Shm47deNXDljXi438qiYfFzS735hvYE4vycCOKb4AZhsUN3KmF+ZHideN2Dk+rrbuXl17V1E4TJVPXB2ZCXr2UPyl7bfH/lZ9bJ+l+o9vmRGxJxAuO3OYnOIW8ByOxy4gvCOP6hB2s4UQWSsgSo/1OjJ3bUv62XjDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364013; c=relaxed/simple;
	bh=/qHKwe5oY99HlryV7lJq93+bmzGCoTdk/xaSSofklOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHfoZH+WBoeq+SAc9m4c0gjWlJzT9Ey47nyqh5ZVRJV9KhGc40i4+araLA9gTkddQMt3rPm1Iy9pPRTCY69KK7AK9dPeqbJVxw8TIDEV1n3NhHlhDoF8y/s0ff4BIXk93CFM5n5sYOHys3o1QGMAKxfyQQsS92DTpS7fGLb3S/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=HFPl4/XQ; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="HFPl4/XQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XtSvW75Ct2VFujlqOE4744AQ9smmg8lk7Y796rX4H6k=; b=HFPl4/XQEYFq/UwQS2c/z2VHJs
	fx+FAc0GgLAxV9Q2CeoG6DIUMpgszXO+W3/YMiXc8yrrTbKyQCATrjGVvNatjbUqBdu8G8wIx7NbV
	TGwuQm3W/tG8TViXL/T7aKDRrZH+3+Y1ioASw3rjrXT5QqZw0P2cpDJGCjgYLCLD1bYJlR2ttr3tD
	yHK7Ee4LWRQo5Hhgerw1xXmU3yTfvCuQG9ijjHZdDRcManCBohksczQaOnMvC4aVt4BcPve0/zy3o
	81hHHCXACLguUkiaDvlrm70hWcCojvLTerXsu/MXp/wpdcjy4PKWHCzc9icKN3orGShjKgW9zoxQN
	6SpOPHzQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-1ZaV;
	Thu, 19 Jun 2025 16:04:44 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v4 3/8] x86/mm: Introduce X86_FEATURE_RAR
Date: Thu, 19 Jun 2025 16:03:55 -0400
Message-ID: <20250619200442.1694583-4-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

Introduce X86_FEATURE_RAR and enumeration of the feature.

[riel: moved initialization to intel.c and disabling to Kconfig.cpufeatures]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/Kconfig.cpufeatures       | 4 ++++
 arch/x86/include/asm/cpufeatures.h | 2 +-
 arch/x86/kernel/cpu/intel.c        | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
index 250c10627ab3..7d459b5f47f7 100644
--- a/arch/x86/Kconfig.cpufeatures
+++ b/arch/x86/Kconfig.cpufeatures
@@ -195,3 +195,7 @@ config X86_DISABLED_FEATURE_SEV_SNP
 config X86_DISABLED_FEATURE_INVLPGB
 	def_bool y
 	depends on !BROADCAST_TLB_FLUSH
+
+config X86_DISABLED_FEATURE_RAR
+	def_bool y
+	depends on !BROADCAST_TLB_FLUSH
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index ee176236c2be..e6781541ffce 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -76,7 +76,7 @@
 #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
 #define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture */
 #define X86_FEATURE_ZEN6		( 3*32+ 6) /* CPU based on Zen6 microarchitecture */
-/* Free                                 ( 3*32+ 7) */
+#define X86_FEATURE_RAR			( 3*32+ 7) /* Intel Remote Action Request */
 #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a constant rate */
 #define X86_FEATURE_UP			( 3*32+ 9) /* "up" SMP kernel running on UP */
 #define X86_FEATURE_ART			( 3*32+10) /* "art" Always running timer (ART) */
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..0cc4ae27127c 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -719,6 +719,15 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 	cpuid_leaf_0x2(&regs);
 	for_each_cpuid_0x2_desc(regs, ptr, desc)
 		intel_tlb_lookup(desc);
+
+	if (cpu_has(c, X86_FEATURE_CORE_CAPABILITIES)) {
+		u64 msr;
+
+		rdmsrl(MSR_IA32_CORE_CAPS, msr);
+
+		if (msr & MSR_IA32_CORE_CAPS_RAR)
+			setup_force_cpu_cap(X86_FEATURE_RAR);
+	}
 }
 
 static const struct cpu_dev intel_cpu_dev = {
-- 
2.49.0

