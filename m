Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A1B27E7F4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151471; cv=none; b=uaU1S0ZtzQMsnMlI2MNZ74fbzvd8stG9LfU6v82pjISitX5XflH3EFlWfv2yH/bzrZVl9flF89P5998djY8tV2G0pJuHxmn+AbQwwWJomsdllxkNB60+rXUvSRKCnLutkQ0gjsa++rmHXs6uJ5aSJjebzLdnokdoe8c54x0VWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151471; c=relaxed/simple;
	bh=uGq4PDMRlkbDz2q9cE8/8yjG9MzWmqLpG6DREyo6Buo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpOUCt+XwVVMpNIYg+V38iov6+WTZ/SguFIZujWRd7OPDdOeV+t+ZPatqfotN0prR7m9OqWAWf3KJbqGDCnYLMuxupLmFqLlwBoMm44k7WPVD//XgXfLkoTK0fOls/L12nqc51lyiR8DBHOOO+hQdsJkh2VWch3Pn53tdQffmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fMhJoRxg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PyVZjl1y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fMhJoRxg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PyVZjl1y"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRw9/W2ZgpLvBd3Ycf4s2jzsX5uuNkOk7zIzQx3robI=;
	b=fMhJoRxgstPTpvegoP/lrP4NLlwseUkwpTPoF+DhRAy1OjNaJkX8P2nHIgbJDuInGpqRQu
	buyg0RodX7soeLy2QzAUsNZIzLUDQSndePs1FA6QMuPCeb9Rqm8oH70DtalU4dLLxXwBrG
	5BF6FgESmYjEMHcbZzOozHme/IDV6eIuZdI4lJNK5I5Qm3UxyJ9d88RpPiMfE4P48PsHW1
	nzjI/RJXyGiIIIigYaz8dkP+TwnPX4Xp2C6G5vwAMimTX65vPk1gM42AkegNHVQ2X5xXXd
	A1CifkoBBiCEs1nx3umKI0vLCwrShDOfZx4bASGroTQDwy/8AeQwJeDGlle6oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRw9/W2ZgpLvBd3Ycf4s2jzsX5uuNkOk7zIzQx3robI=;
	b=PyVZjl1yfRQbr5RTEJULEuXtcPDzaJtEreqoW1Kac+dKreufsjPNC4Og/7GD2SUlyiQA43
	K/7+fotZO95UpjCA==
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
Subject: [PATCH v2 06/27] x86/cpuid: Parse CPUID(0x80000000)
Date: Thu,  5 Jun 2025 21:23:35 +0200
Message-ID: <20250605192356.82250-7-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cpuid_parser.c | 22 +++++++++++++++++++++-
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

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
index 949a731e03b1..731aab2ff9c0 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -22,10 +22,29 @@ static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_r
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, output->regs);
 }
 
+static void cpuid_read_0x80000000(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
+{
+	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
+
+	cpuid_read_subleaf(e->leaf, e->subleaf, el0);
+
+	/*
+	 * Protect against 32-bit CPUs lacking extended CPUID support: Max
+	 * extended CPUID leaf must be in the 0x80000001-0x8000ffff range.
+	 */
+	if ((el0->max_ext_leaf & 0xffff0000) != 0x80000000) {
+		*el0 = (struct leaf_0x80000000_0){ };
+		return;
+	}
+
+	output->info->nr_entries = 1;
+}
+
 static unsigned int cpuid_range_max_leaf(const struct cpuid_leaves *l, unsigned int range)
 {
 	switch (range) {
 	case CPUID_BASE_START:	return __cpuid_leaves_subleaf_0(l, 0x0).max_std_leaf;
+	case CPUID_EXT_START:   return __cpuid_leaves_subleaf_0(l, 0x80000000).max_ext_leaf;
 	default:		return 0;
 	}
 }
@@ -41,7 +60,8 @@ cpuid_range_valid(const struct cpuid_leaves *l, unsigned int leaf, unsigned int
 
 static bool cpuid_leaf_valid(const struct cpuid_leaves *l, unsigned int leaf)
 {
-	return cpuid_range_valid(l, leaf, CPUID_BASE_START, CPUID_BASE_END);
+	return	cpuid_range_valid(l, leaf, CPUID_BASE_START, CPUID_BASE_END) ||
+		cpuid_range_valid(l, leaf, CPUID_EXT_START, CPUID_EXT_END);
 }
 
 static const struct cpuid_parse_entry cpuid_common_parse_entries[] = {
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index b09c39a9a0b8..f440948fc2fc 100644
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

