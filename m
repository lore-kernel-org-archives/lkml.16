Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69714280026
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151490; cv=none; b=HRjQBnRRn/UeE3UyfSy4M50rQxVFIWW7QVOPVMMNi2ivwVpsG9yirbS1QPplkSWSVh/IUCFjXkTU1XjSuagnkD2LVc3V7idRO6XqtuieYdFQwAilM9F1+IxwB+WebbUE8WLqUo81rLGRYXivuuiWt8hm2KGJWGOtF6vMxrAv9sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151490; c=relaxed/simple;
	bh=kON66gAz7NDVGVg8S0nkOes7rQfGi/wqq84UJvR2Ok0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOu4Gd9prXIboVvik/nj9JNVKb2n2EatcvH28rIDqgydZbeQSPnbRJNEN/S+DC4ogm2u1r0UL0Qg1xcLlMHbakwujGwc14iVe74Odn7C2AKwuo/T5x0tHPhoiAgl1Ei2xa56W4Uc6gTrB1uwiS6BUvC+chUtXyML4uDyx7Z/6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BUAoFwA/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O8nLOFSL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BUAoFwA/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O8nLOFSL"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/Bn+rfrcaD/2x6weAGgttt6xgvJMEOc9JijKoPQVYk=;
	b=BUAoFwA/mgR/4Qr8X6VzcEwlW9Ua/d5YIoGvQTnx+XPtSC2vItUZzCPi5HDZi+LIjku6n7
	4KiTx71VBI/zzjkxENIDEU1mhpHP5wYQXl0jr3Z2f0vAtwT5SPtCULMzxfxe91RuIaakFc
	3JfbywgxAykYHzCNC3h6z/SMTcjTR0rihwBvA/TACn1nhCO/ESRNBFn8jPcG/pjf4P9FQv
	4jEdS1KpxNPbiRbNWuMgnWSfC8e8n8nswR1kb49Q8t8TLPH/Vcup6HErDjgJ77zP8/jvTi
	5nZ90lGGb01B957p12La6JecTECl05bA7VtRf/SBdmKh6vBkFd+bT+16JjKZ1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/Bn+rfrcaD/2x6weAGgttt6xgvJMEOc9JijKoPQVYk=;
	b=O8nLOFSLhCj76RSCpvRZ6rCBMnIBMzERdxBt7V17NMUOyukYgHYjhQXTNO+Itntdfhp2fl
	s9ikHjshMtfZA2BQ==
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
Subject: [PATCH v2 12/27] x86/cpuid: Parse CPUID(0x2)
Date: Thu,  5 Jun 2025 21:23:41 +0200
Message-ID: <20250605192356.82250-13-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x2) support to the CPUID parser.

Keep the leaf marked as invalid at the CPUID table if the whole leaf, or
all of its output registers, were malformed.

Note, the cpuid_leaf_0x2() logic at <cpuid/api.h> will be removed once
all the CPUID(0x2) call sites are transformed to the new CPUID model API.

References: fe78079ec07f ("x86/cpu: Introduce and use CPUID leaf 0x2 parsing helpers")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  1 +
 arch/x86/kernel/cpu/cpuid_parser.c | 35 ++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 37 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index d0f0e6a8a457..7bbf0671cb95 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -215,6 +215,7 @@ struct cpuid_leaves {
 	/*         leaf		subleaf		count */
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
+	CPUID_LEAF(0x2,		0,		1);
 	CPUID_LEAF(0x80000000,	0,		1);
 };
 
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index e79835a09336..ab06c68e4453 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -22,6 +22,41 @@ static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_r
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, output->regs);
 }
 
+static void cpuid_read_0x2(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
+{
+	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->regs;
+	struct leaf_0x2_0 *l2 = (struct leaf_0x2_0 *)output->regs;
+	int invalid_regs = 0;
+
+	/*
+	 * All Intel CPUs must report an iteration count of 1.	In case of
+	 * bogus hardware, keep the leaf marked as invalid at the CPUID table.
+	 */
+	cpuid_read_subleaf(e->leaf, e->subleaf, l2);
+	if (l2->iteration_count != 0x01)
+		return;
+
+	/*
+	 * The most significant bit (MSB) of each register must be clear.
+	 * If a register is malformed, replace its descriptors with NULL.
+	 */
+	for (int i = 0; i < 4; i++) {
+		if (regs->reg[i].invalid) {
+			regs->regv[i] = 0;
+			invalid_regs++;
+		}
+	}
+
+	/*
+	 * If all the output registers were malformed, keep the leaf marked
+	 * as invalid at the CPUID table.
+	 */
+	if (invalid_regs == 4)
+		return;
+
+	output->info->nr_entries = 1;
+}
+
 static void cpuid_read_0x80000000(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
 {
 	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->regs;
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 0c79919a6138..3178e760e2b3 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -96,6 +96,7 @@ struct cpuid_parse_entry {
 	/*		  Leaf		Subleaf		Reader function */		\
 	CPUID_PARSE_ENTRY(0x0,		0,		generic),			\
 	CPUID_PARSE_ENTRY(0x1,		0,		generic),			\
+	CPUID_PARSE_ENTRY(0x2,		0,		0x2),				\
 	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),
 
 extern const struct cpuid_parse_entry cpuid_common_parse_entries[];
-- 
2.49.0

