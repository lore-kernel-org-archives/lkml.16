Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287415746F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141364; cv=none; b=bbNLEQaSmvITSrvnGI7DRrCwTBXMIzEgIa9l8VQcR+kfgQEJhD3wxs4Pi86w2w45BnPe9sv+ZujZgt8WCfCCNlvcZXnr2gIWSjQq6onfTFOdRp00+mg4U7iLEwEcR0TSQd5uDXsBTXF4UJfPeNer3qS5nYyypOU6lh8k1BEWsKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141364; c=relaxed/simple;
	bh=dIU2IPQXRRDph6JR52vMNSkMkpJZDqBmw+laGUXhAy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UydutReJAt2qBd/8pmxaqu5d1Ksm2+JyB/x0tuIdR+ck0qj8YFE349E4Ydv45urCl0rqYoWRWZYzig4Pwg86rxn+dbonXGvCdReIIFgCPQN6BspqlVlDjme+k4WcT3uMA6P7Hgt7FANIUVJzdc3ZM1baZdlFMjYX8kFptQEOFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=m0u+Q9Tf; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="m0u+Q9Tf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=abUxIwN6dE9IQKt0FIPVCZFxzLCAfWpqcU4Ho5sOehU=; b=m0u+Q9Tf8WMBaC6AbPKIPDrSQl
	D6rR2M40yJSKDpdQDe6CoWUWR51tpXkR5opuDcrvA2rPi9QrzenUUd2YFMwGORpeZU6RRwcvVnpjw
	U8821RnIGv9JbSci8jRZG6ebSaYnOTdkOlxJFU3aLMDvm+K7toWWd1KKTxTlX0B8pFTTY/KaUJavu
	EWuJMQnfm7M1CuCvkuBHRaFWuxYnab4PzTEwqx4TDa9HFUBSRWEwXUINLKFKQcdrJzMmA+hu8WBeF
	Rj1BHOHkvx7IWUiwM86JuvtT3mAEYVcLtN6UKZu1CERX4CyNPNfNKUfeconYIUE0CxjsYSi2baKpW
	kOE5P39Q==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3MhL;
	Thu, 05 Jun 2025 12:35:46 -0400
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
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 3/7] x86/mm: Introduce X86_FEATURE_RAR
Date: Thu,  5 Jun 2025 12:35:12 -0400
Message-ID: <20250605163544.3852565-4-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
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
index 076eaa41b8c8..f5cac46e1b91 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -335,6 +335,15 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	 */
 	if (cpu_has(c, X86_FEATURE_TME))
 		detect_tme_early(c);
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
 
 static void bsp_init_intel(struct cpuinfo_x86 *c)
-- 
2.49.0

