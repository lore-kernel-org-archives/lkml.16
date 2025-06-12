Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF842ECEB6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771765; cv=none; b=qZboH/GOzLLTTKB4IGmkd75ZHUeDpO2l5sCaqQR9eWfr3YMNpKXstI9OOEMxeSOJPGvVuXNyTeH8dHsYTju7JRV68lOCCawL8A5zeyuX7RrxQvYPdU04xzIm+y5IQjkz0AW5WSYOevz2sMMq01z8oInxkTRb+W8Gq6MqMwV5ZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771765; c=relaxed/simple;
	bh=8Z8DzIpBi/ZkYTVyIpXYybxgXpT2m2QXqkLWK+een1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8zoPUmyKPZ/tYXD183+JSn+vRLixWVX7vPVY8xE9QBQFJyfdwkEUSbpPIgJ+lCrekYqZAadSeGL0iGMpkBHnLPLnvWyHEv7MHlyq1J/mqVfCr4IeHz+zrH78gFpVGcY0hSntqlPnX0dJJtEpkZPVzZNL60/Z/YzT1dcBL/nn1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=koyNiSky; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qecpKycV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="koyNiSky";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qecpKycV"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83xWVTLv2SQJxvrNZ04ptTVzV4QN6q1DpfqyN70JUP4=;
	b=koyNiSkyItfgN21wZ52plZgloDg04BdN0czDB0LUZmopP9mO3REPme+HhW8UuIrCJtiaId
	rU4YXwLUf/kN180QD6Oc0gbzpL7CdtICpeMw8Evpx+8m1dujolFoLdTi4P8JSWnVl4dEDy
	CaTaVvDCSVeW77oe4PyuGmcOoglbBrHMO9hN5+ZSHskE8xamksipb1XmhH4D87vqlwGC0O
	kQ2lkiFtRxN/Vm1tgte8tzGsi49hufqs6tr59Z327pwQngeSDFHCCVYJa5yyeIk23yxfzg
	6GWr0L45YkrXRmev7GxleH1f94jpfRDJ5y9uZl+z50WCPcazclOct3gFDV4zAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83xWVTLv2SQJxvrNZ04ptTVzV4QN6q1DpfqyN70JUP4=;
	b=qecpKycVIH5xSb8z8RyimQ2uHF/ERCLrjrLSMygVVcMU6++hjCpkJ3NpwywYzZchhtkYnW
	7DuD9PvKQWNFmHBw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 43/44] x86/cpu: Rescan CPUID table after PSN disable
Date: Fri, 13 Jun 2025 01:40:09 +0200
Message-ID: <20250612234010.572636-44-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Pentium-III and Transmeta CPUs, disabling the CPUID(0x3) Processor
Serial Number (PSN) can affect the maximum valid CPUID standard leaf.

Rescan the CPU's CPUID table in that case, not to have stale cached data.
Use parsed CPUID(0x0) access, instead of direct CPUID query, afterwards.

Rename squash_the_stupid_serial_number() to disable_cpu_serial_number()
and explain the rational for disabling the CPU's PSN.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 023613698b15..81fe33976ceb 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -327,15 +327,17 @@ bool cpuid_feature(void)
 	return flag_is_changeable_p(X86_EFLAGS_ID);
 }
 
-static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+/*
+ * For privacy concerns, disable legacy Intel and Transmeta CPUID(0x3)
+ * feature, Processor Serial Number, by default.
+ */
+static void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
 	unsigned long lo, hi;
 
 	if (!cpu_has(c, X86_FEATURE_PN) || !disable_x86_serial_nr)
 		return;
 
-	/* Disable processor serial number: */
-
 	rdmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
 	lo |= 0x200000;
 	wrmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
@@ -343,8 +345,12 @@ static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 	pr_notice("CPU serial number disabled.\n");
 	clear_cpu_cap(c, X86_FEATURE_PN);
 
-	/* Disabling the serial number may affect the cpuid level */
-	c->cpuid_level = cpuid_eax(0);
+	/*
+	 * Disabling CPUID(0x3) might have affected the maximum standard
+	 * CPUID level.  Rescan the CPU's CPUID table afterwards.
+	 */
+	cpuid_parser_scan_cpu(c);
+	c->cpuid_level = cpuid_leaf(c, 0x0)->max_std_leaf;
 }
 
 static int __init x86_serial_nr_setup(char *s)
@@ -354,7 +360,7 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+static inline void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
 }
 #endif
@@ -1968,7 +1974,7 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	bus_lock_init();
 
 	/* Disable the PN if appropriate */
-	squash_the_stupid_serial_number(c);
+	disable_cpu_serial_number(c);
 
 	/* Set up SMEP/SMAP/UMIP */
 	setup_smep(c);
-- 
2.49.0

