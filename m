Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2002E6D38
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771769; cv=none; b=Oqyp3VwDzIOQRqOJtwSZcFiUICHrfUH+XZFvUIuiss1y3Vs+ZF7s82nRCM6cL9YwV6Zb90nBccMGYTI46NVZUsGk4CPwLTLvNrnnGj6YH6cE1xY47N0OEa3/X7kN3gcjLTyH8mFNi6AOqwF4igKtWN3hWSZ2D3BfFu2P7cQt4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771769; c=relaxed/simple;
	bh=99/rmdC76lXafxdI59q/csW0I07ujjJoHzTFBs1h2jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEVUYl6dcnpthvrs1Jtw6Xx7BtO67TpXl/9oXYS0LZ6yvGc1HLlbo/WVisAn7yuIFBsovaLImTL3aItC73UpNxpz0xM8ExZ/vDau/Qbf7qOcz7SZjmPFiKjwIb9nhKysKXaA2VIsKoBDryNPTkP8d+YPxaDCsQMgxmRfsfCc8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HDb1LTTo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fJONCEj+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HDb1LTTo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fJONCEj+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xM6jpBCj2QZBxsvLfh5xBbyT4OKBSIAuCLE2scKBOQ=;
	b=HDb1LTToIapoL0ZHw/7LThym1XYWFC5Y9jnmB/b3iFElVQcCox5E/41OQsLz3hCXReE/JP
	CVinsPOzUjEgROe5Fxrb7avvgzkJUDNhBlAdEU7hsmqhQ/ftVbvyB0i1VkK5cOITltcGTs
	5eQUNoSMvV7H51++kXF0uC0rHRCyUYs2Y7PJ/O+Rf7ib2REM0KOZ916AzBXiPDZn8T42Lo
	T4567W5oalPB88qe4ygNuHIYdnl5CALMIfupvnW5Slf5i+RA2gwmDn1yloEUbpYgEGXqzY
	o27PfGHSMBbvua8J+QFBKLcd0FyPtPuwxbanp3Th5FDMkO6HpF3ZELxyN6v4ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xM6jpBCj2QZBxsvLfh5xBbyT4OKBSIAuCLE2scKBOQ=;
	b=fJONCEj+g3/5PxMAOmQVCsTiC25VKf0r2DwfxLeYAQKa0XsV+DCp4tWg3S99TKKCIsxWwX
	bWlWQ48cPlaX1bCA==
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
Subject: [PATCH v3 44/44] x86/cpu: Rescan CPUID table after unlocking full CPUID range
Date: Fri, 13 Jun 2025 01:40:10 +0200
Message-ID: <20250612234010.572636-45-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel CPUs have an MSR bit to limit CPUID enumeration to leaf two, which
can be set by old BIOSen before booting Linux.

Rescan the CPUID table after unlocking the CPU's full CPUID range.  Use
parsed CPUID(0x0) access, instead of a direct CPUID query, afterwards.

References: 066941bd4eeb ("x86: unmask CPUID levels on Intel CPUs")
References: 0c2f6d04619e ("x86/topology/intel: Unlock CPUID before evaluating anything")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 06c249110c8b..fe4d1cf479c2 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -192,11 +192,14 @@ void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 		return;
 
 	/*
-	 * The BIOS can have limited CPUID to leaf 2, which breaks feature
-	 * enumeration. Unlock it and update the maximum leaf info.
+	 * Intel CPUs have an MSR bit to limit CPUID enumeration to CPUID(0x2),
+	 * which can be set by old BIOSes before booting Linux.  If enabled,
+	 * unlock the CPU's full CPUID range and rescan its CPUID table.
 	 */
-	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0)
-		c->cpuid_level = cpuid_eax(0);
+	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0) {
+		cpuid_parser_scan_cpu(c);
+		c->cpuid_level = cpuid_leaf(c, 0x0)->max_std_leaf;
+	}
 }
 
 static void early_init_intel(struct cpuinfo_x86 *c)
-- 
2.49.0

