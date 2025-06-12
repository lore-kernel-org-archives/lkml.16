Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F32E7F3C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771697; cv=none; b=q79ZR/gWYlADfXoAFgapcX1FrqSuFlUfYEOMIYpYKasZkaY54+qirE8fnsOFXwD20EBpL1YzcOqLnob81vLxjgOYHijojkagriIzsgGzzjH7NYZ42VaRLy3P3IoSY3+XBLAZCMKOivT5/dejrKxoGvNfy5MiEZRh+ABCGyqiJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771697; c=relaxed/simple;
	bh=NO0cbM/Mwx3CrlSUKijbUIuqtnuX4RJgbFvuEtuGHV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CV0YoZ1AzDmYpkIuLAZfLsACWRyc5pUxzB79zKMSQSbIDf6qpsg6aGVSL7uyTd4v1FBicVWpc7w7CymJLk4gwjzIkP4VUr1mtWXrx5IqBTVxYpoJjLo2aVqUrUiDMAphY8e4gOH1DcmXR7osYDrpw4+JacggXtHQJarArZArzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JoU8TjhF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fft/BwPY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JoU8TjhF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fft/BwPY"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLede88b8Ofo343hNkFru5ebfUcWPc2UOkTgoq77d6g=;
	b=JoU8TjhFHVB79eEnLSNjDedd0oeu+XcaemKRSg6na5fAdhtXqMTFved9n4pkGkogEpicjf
	+eWiBFbYf59RWGTqcH9VVPtZO84sxXQD8Eprg/9Alff7Mg983w3b+5rH5yJoW92W3i5935
	e8DrhicTUGyyeH/EEuIRTgKZ7k1zU1fuMZ+gI5ebLxXLk5ZWuQq9AwhU2AOWLEp8kaXmg0
	pY3AbD+N6aFmJWXCvdgF65o5VRISto41Cde6tomf2/5qh6p6b6vbBjyXamk+Z3kQMROdNH
	RBz0exGloAJCQBNoRpCCf8laog12BNx+5o/a3l08NkOSBe/+YskJ69TjLV41Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLede88b8Ofo343hNkFru5ebfUcWPc2UOkTgoq77d6g=;
	b=fft/BwPYKvA5P/EvTv9OyZmPf0o97BQ15AcMN8JMkqvdnDktw6XcllMX598uzNBVnPZTgL
	lkiSK18XgU45l/Bg==
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
Subject: [PATCH v3 22/44] x86/cpuid: Parse CPUID(0x80000000)
Date: Fri, 13 Jun 2025 01:39:48 +0200
Message-ID: <20250612234010.572636-23-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID parser logic for CPUID(0x80000000).

Similar to kernel/head_32.S and kernel/cpu/common.c, verify the
CPUID(0x80000000) query output beforehand.  This is due to x86-32
machines without an extended CPUID range, where a CPUID(0x80000000) query
will just repeat the max-valid standard CPUID leaf output.

References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
---
 arch/x86/include/asm/cpuid/types.h |  7 ++++++-
 arch/x86/kernel/cpu/cpuid_parser.c | 27 ++++++++++++++++++++++++++-
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 320f152675af..d0f0e6a8a457 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -33,7 +33,11 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_TILE		0x1d
 
 #define CPUID_BASE_START	0x0
-#define CPUID_BASE_END		(CPUID_BASE_START + 0xffff)
+#define CPUID_EXT_START		0x80000000
+
+#define __CPUID_RANGE_END(idx)	((idx) + 0xffff)
+#define CPUID_BASE_END		__CPUID_RANGE_END(CPUID_BASE_START)
+#define CPUID_EXT_END		__CPUID_RANGE_END(CPUID_EXT_START)
 
 /*
  * Types for CPUID(0x2) parsing:
@@ -211,6 +215,7 @@ struct cpuid_leaves {
 	/*         leaf		subleaf		count */
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
+	CPUID_LEAF(0x80000000,	0,		1);
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 3a0215e75795..e4c45658c75f 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -31,10 +31,34 @@ static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_r
  * Leaf-independent parser code:
  */
 
+static void cpuid_read_0x80000000(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
+{
+	struct leaf_0x80000000_0 *l = (struct leaf_0x80000000_0 *)output->regs;
+
+	cpuid_read_subleaf(e->leaf, e->subleaf, l);
+
+	/*
+	 * Protect against 32-bit CPUs lacking an extended CPUID range: Ensure that the
+	 * returned max extended CPUID leaf is in the 0x80000001-0x8000ffff range.
+	 *
+	 * Do not depend on leaving 'info->nr_entries' set as zero, but zero-out the
+	 * whole leaf output area as well.  This is due to the CPUID parser internals
+	 * using the __cpuid_leaves_subleaf_0() API to get the cached max extended leaf,
+	 * which does not do any sanity checks,
+	 */
+	if ((l->max_ext_leaf & 0xffff0000) != 0x80000000) {
+		*l = (struct leaf_0x80000000_0){ };
+		return;
+	}
+
+	output->info->nr_entries = 1;
+}
+
 static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
 {
 	switch (range) {
 	case CPUID_BASE_START:	return __cpuid_leaves_subleaf_0(&t->leaves, 0x0).max_std_leaf;
+	case CPUID_EXT_START:   return __cpuid_leaves_subleaf_0(&t->leaves, 0x80000000).max_ext_leaf;
 	default:		return 0;
 	}
 }
@@ -50,7 +74,8 @@ cpuid_range_valid(const struct cpuid_table *t, unsigned int leaf, unsigned int s
 
 static bool cpuid_leaf_valid(const struct cpuid_table *t, unsigned int leaf)
 {
-	return cpuid_range_valid(t, leaf, CPUID_BASE_START, CPUID_BASE_END);
+	return cpuid_range_valid(t, leaf, CPUID_BASE_START, CPUID_BASE_END) ||
+	       cpuid_range_valid(t, leaf, CPUID_EXT_START, CPUID_EXT_END);
 }
 
 static const struct cpuid_parse_entry cpuid_common_parse_entries[] = {
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 41499fa36fdc..49b7e739852d 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -96,5 +96,6 @@ struct cpuid_parse_entry {
 	/*		  Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY(0x0,		0,		generic),			\
 	CPUID_PARSE_ENTRY(0x1,		0,		generic),			\
+	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),
 
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.49.0

