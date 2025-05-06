Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819727A135
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507929; cv=none; b=MXBUS0HOkGYIn8PvBZ4EJ4uMyAI7zUILvTVd27u1uAqCCt8nlzJZkTDbCPLLjr3qeBkyZwaKVwFowkIaF5ds+KtAuk274x8wn2I8emHoQrtCi+mq3D1ox2GvGgmoNWDbcj1HmdqVNfUPdNh/fIon4YBLAYxwEmmXEpgHNArWHQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507929; c=relaxed/simple;
	bh=jUSKJDRfXzAEsb+2bRdRi65d/mDZHkMuQMeciHxOeGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqhmXUXTfKk9W1maeS5LyshAfvjnsDfu92PSEPuwJAIxy9hRGpLHOT9lcWoMRWdKIrsr9veGi95jloL+iIwQyM5raCwIoyTKloY7WvO3/q8G8FtjEM7xb4wuRR6iZoq0BN9z/Bx/J5GWVay/G7axo4PA1yO1Chiu/lc/7rIW87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gQ2QoKEj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0n9HypzG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gQ2QoKEj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0n9HypzG"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjWoKcWox7Z3Z/R/nkbYtQUpikUaU/A/fj1Kgph07bk=;
	b=gQ2QoKEjK1INtCCsHKEqo8A0yf1rVbd9N/OLRSCPQXHc4S4XWTjm8gn6+c5L9emSEYxVZ3
	W9zj190Vm/TEI8ewqWr1UcLdKydNF5F2sxuCw8JxU9cvFqCYzbSKFiaCzhOOpG1bPQ6Xtf
	0IqDH0rBzKekaFLmglNmgHYnVJo5t+CVAf+GOnFv/DVKpZoggY9vuRf94TCfxQ7fnCseNc
	Fgew5+jeeU5UsvbAyFNPiBY/KiG3g+3wnwDWlg1dTdjdSuy+gpHWPFHIVHNbDeRU3ofj+g
	jqrJNCnzB8YC+BDFkBZ24hy19+WpNVu0RxC4QGi/GjuK/h3SGDWUzr6SthUjbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjWoKcWox7Z3Z/R/nkbYtQUpikUaU/A/fj1Kgph07bk=;
	b=0n9HypzGhcyM4RQMnCWwdrQPdvnkWwvUOVGBe5mr3oEBjPVkd48hUw8WQTneJAm4Zr2hCQ
	cwt2AtjOb4uosdCA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 13/26] x86/cpuid: Scan CPUID(0x2)
Date: Tue,  6 May 2025 07:04:24 +0200
Message-ID: <20250506050437.10264-14-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID(0x2) support to the CPUID scanner.

Keep the leaf marked as invalid at the CPUID table if the whole leaf, or
all of its output registers, were malformed.

Note, the cpuid_get_leaf_0x2_regs() logic at <cpuid/leaf_0x2_api.h> will
be removed once all CPUID(0x2) call sites are transformed to the new
scanned API.

References: fe78079ec07f ("x86/cpu: Introduce and use CPUID leaf 0x2 parsing helpers")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h  |  1 +
 arch/x86/kernel/cpu/cpuid_scanner.c | 35 +++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_scanner.h |  1 +
 3 files changed, 37 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 51b7e1b59ea5..b8e525725def 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -180,6 +180,7 @@ struct cpuid_leaves {
 	/*         leaf		subleaf		count */
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
+	CPUID_LEAF(0x2,		0,		1);
 	CPUID_LEAF(0x80000000,	0,		1);
 };
 
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
index 7200dd66939f..aaee1ede0472 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.c
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -20,6 +20,41 @@ static void cpuid_read_generic(const struct cpuid_scan_entry *e, struct cpuid_re
 		cpuid_subleaf(e->leaf, e->subleaf + i, output->leaf);
 }
 
+static void cpuid_read_0x2(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
+{
+	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->leaf;
+	struct leaf_0x2_0 *l2 = (struct leaf_0x2_0 *)output->leaf;
+	int invalid_regs = 0;
+
+	/*
+	 * All Intel CPUs must report an iteration count of 1.	In case of
+	 * bogus hardware, keep the leaf marked as invalid at the CPUID table.
+	 */
+	cpuid_subleaf(e->leaf, e->subleaf, l2);
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
 static void cpuid_read_0x80000000(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
 {
 	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->leaf;
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
index 02bb223b406a..dc1d518c9768 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.h
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -92,6 +92,7 @@ struct cpuid_scan_entry {
 	/*	   leaf		subleaf		reader */			\
 	SCAN_ENTRY(0x0,		0,		generic),			\
 	SCAN_ENTRY(0x1,		0,		generic),			\
+	SCAN_ENTRY(0x2,		0,		0x2),				\
 	SCAN_ENTRY(0x80000000,  0,              0x80000000),
 
 /**
-- 
2.49.0

