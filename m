Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07928642D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151538; cv=none; b=bT+sWMPo64k0A++TEnwYdcu/Bgx/3wMrpoOQzFt3aztcVdDra1YqbFB0aQXdq+V2J7Nidm3VqyTY30W9h//20NUiizaZqAX3/F8BFaX5eDaNUIu98Egd9pSw5Ny5HguUjtgR7BwiEn4BgrtK9kPQTl4h9WM/7BJcA3E7s8QhW3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151538; c=relaxed/simple;
	bh=oAdmUOsJ/hI0kEQIro0mWFWtDEHDV5wWzT5xDgGKpFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8TwCUJSLZyB5srE9tIVfvVWqxy4pkyFFnk3uE0r2ypc688LnJ9yBfqz3ZLz1u2O+8RMTOwUDYpoMyoeV4RUfmgsPbAVIfk/d0QO1RYvWhKyb45/w4wrTrbHKU3lGr+gjKE22b+LvKMUAzBY7cIqnxjBA0bzeNXzzUxN7fKxSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=agGCmPOK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nCOdgxiT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="agGCmPOK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nCOdgxiT"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvaCvMJm0jpMRter6UXb3BRb34UtTypyr6H6vZTefjg=;
	b=agGCmPOK3sr5mehlLg3XK4x35yRiZYu6GGMB/Ft/FJNp/ZEjZ+yMZIRc2BRyR0yhPNrUXa
	VHD2TMklcYXA2tRU4JOUkR25b7ByTkHP0kAVeu2kK6cI3VMKGQcRDMm7qDpJ8BG4FcTP7N
	HNhUVEQfuUikapPeytMevTTRi7LO64wDfUb2H36LT3B/6gfU1maCA/r6itnkB7QRZqyMmi
	YwseZiMQJCJJ/m4jR/OVJbzY3HFv8yxb2P5bw9F/UapqVZJlW2ziq2fd9Ur92rRz9NO2gV
	vPU5eCH7oaYDQ2fmGLnJmk7m6IcQR6axErrhhzQe/sHvc63csFxtbZK0u2pz8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvaCvMJm0jpMRter6UXb3BRb34UtTypyr6H6vZTefjg=;
	b=nCOdgxiTdrfQcmx0x2SideQCA88pYlehDRMFmecAoUPY1mLY51Jct+H4WKJZeCdu3mzloG
	7eG5GQr3OVsPOZBw==
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
Subject: [PATCH v2 27/27] x86/cpu: Rescan CPUID table after unlocking full CPUID range
Date: Thu,  5 Jun 2025 21:23:56 +0200
Message-ID: <20250605192356.82250-28-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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
index 06c249110c8b..4784afaf178b 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -192,11 +192,14 @@ void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 		return;
 
 	/*
-	 * The BIOS can have limited CPUID to leaf 2, which breaks feature
-	 * enumeration. Unlock it and update the maximum leaf info.
+	 * Intel CPUs have an MSR bit to limit CPUID enumeration to CPUID(0x2),
+	 * which can be set by old BIOSes before booting Linux.  Unlock the CPU's
+	 * full CPUID range then rescan its CPUID table.
 	 */
-	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0)
-		c->cpuid_level = cpuid_eax(0);
+	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0) {
+		cpuid_parser_rescan_cpu(c);
+		c->cpuid_level = cpuid_leaf(c, 0x0)->max_std_leaf;
+	}
 }
 
 static void early_init_intel(struct cpuinfo_x86 *c)
-- 
2.49.0

