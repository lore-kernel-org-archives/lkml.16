Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2B2E92D3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771716; cv=none; b=Y1RiwfBltbx19dY1yyOpDtGgobWZRSu7DJkUGP+bvX/CCUB7aKJUQIbMBXClWAQERoqwCq325qozKxWshNsdUEphJcC6psgrVj0npaMFxcEZ0ScIUXaWmNbTZ54Sn9r2WbUjXiPgPVEFSbbGRkH2Cat20381Wj4c3Xce/7iDgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771716; c=relaxed/simple;
	bh=fxZA4A0MuuY0Xd61MPGho94Qj3uh9SSI2gFLBw5yCr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ai3EzN9S7yGY4b0DMMyHGkTvUt4OWLOazfwa3RTWniz0zohnCPlCGqszQbu7W19O/O9teeWbEodsIycrab/r2Ch3wN99jFMk/aaPd9Me5s1uXWd7LSatZUA98wlXhDxQ0DhX7KffUFzfqU2qlPzqfk+ZQagwqCsTbadHuZfN0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tAOWOCNC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P94ySQS9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tAOWOCNC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P94ySQS9"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aucTGch6VIspEvZqsNKH9dxMONrsSTbqBKsLK1ul2nA=;
	b=tAOWOCNCBOhpXxdL+z8WrRlzXJoy/xnjE2kWAjDNQlFzH2XwLfI6YAwA2CAoQIR45hnf82
	OWniDYNyTMFUq5WE35nBhb+XM6xHg9oCnRLqUDAo1FPZNG0JZAbFg981+/z/J5x5wBwL07
	PwH0AjNwO8L/sVwIECQIPXI60GtKokmfmN9omkM88JNQs+w126Vx8oKF29PUIPjWjKjFZR
	puOyc/IyHg8fSC3g5ngT59EmYvDAWvOwy+FEfa9+KQe6E5KDaOAgsYcETaoLUkwNDYzwf2
	fYlkYSzG3DMJeCUn/niPT0Eg+7VoLT40z1vXrpHs6Vnywmt1icUoq1BEpqc10w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aucTGch6VIspEvZqsNKH9dxMONrsSTbqBKsLK1ul2nA=;
	b=P94ySQS9ROnKBS5U+6EulaGW9hPjUNt8j4aOY7hNfe4H6nWmQLNI2iZHySlp1OASUnHvwv
	AYlYd60SpnuWc9Dw==
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
Subject: [PATCH v3 28/44] x86/cpuid: Parse CPUID(0x2)
Date: Fri, 13 Jun 2025 01:39:54 +0200
Message-ID: <20250612234010.572636-29-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cpuid_parser.c | 41 +++++++++++++++++++++++++++---
 arch/x86/kernel/cpu/cpuid_parser.h |  1 +
 3 files changed, 40 insertions(+), 3 deletions(-)

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
index eb8975de497a..9bd68b150150 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -27,9 +27,40 @@ static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_r
 		cpuid_read_subleaf(e->leaf, e->subleaf + i, output->regs);
 }
 
-/*
- * Leaf-independent parser code:
- */
+static void cpuid_read_0x2(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
+{
+	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->regs;
+	struct leaf_0x2_0 *l = (struct leaf_0x2_0 *)output->regs;
+	int invalid_regs = 0;
+
+	/*
+	 * All Intel CPUs must report an iteration count of 1.  For broken hardware,
+	 * keep the leaf marked as invalid at the CPUID table.
+	 */
+	cpuid_read_subleaf(e->leaf, e->subleaf, l);
+	if (l->iteration_count != 0x01)
+		return;
+
+	/*
+	 * The most significant bit (MSB) of each CPUID(0x2) register must be clear.
+	 * If a register is malformed, replace its 1-byte descriptors with NULL.
+	 */
+	for (int i = 0; i < 4; i++) {
+		if (regs->reg[i].invalid) {
+			regs->regv[i] = 0;
+			invalid_regs++;
+		}
+	}
+
+	/*
+	 * If all of the CPUID(0x2) output registers were malformed, keep the leaf
+	 * marked as invalid at the CPUID table.
+	 */
+	if (invalid_regs == 4)
+		return;
+
+	output->info->nr_entries = 1;
+}
 
 static void cpuid_read_0x80000000(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
 {
@@ -54,6 +85,10 @@ static void cpuid_read_0x80000000(const struct cpuid_parse_entry *e, struct cpui
 	output->info->nr_entries = 1;
 }
 
+/*
+ * Leaf-independent parser code:
+ */
+
 static unsigned int cpuid_range_max_leaf(const struct cpuid_table *t, unsigned int range)
 {
 	switch (range) {
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 882e96b000ba..cf999e6a574d 100644
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

