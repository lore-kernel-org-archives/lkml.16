Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C9D2E1748
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771733; cv=none; b=ijNjVNj/1rqbROudjpXSl+svoCV/2E08PT+SBjsTiokqdw7mFuNkRU31x6LAanRYZQMk+LpL+rlwJehzfDOaimlfgaWQ5rryfeTdI/3M7m9fRNpzKrTW7zHTDmi3RzS3i6nryPJiDumVRdX373Sui1FlttSiQsZeYRf0p8o6AuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771733; c=relaxed/simple;
	bh=aR+UI4C4MAimQMAqPv1GqDX3IwIC2H0GKylAz7pDzCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfqaFbjo5w+teULUHtFa0uXNRSGb2HrUYaAfFe5b5PYx4i6S2KOcRjO1hGzj6/3vnQxqtwqDZBrxtsuArgFnxnsl1+43V3Gvlb8Ekshc0Sw1adr1jYvzvN7lOMgCZ47ovl1NbdjiJhIVUfKuSLwngEoEMgyb5K8SmgxBYmU/xII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0OhGCgq4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CSnzt7WK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0OhGCgq4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CSnzt7WK"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whCh25rfx8GS4+bYaV14J04tuZqHGipi3a6qkBt9AVI=;
	b=0OhGCgq4qnehIpgm7u20AM9hxqQqZQDuGIXvX97WcGQZMD9eUr3UXMtUfPN5zMCXAqYUlf
	/EAqdTdfge754+p4XQYIVeCLZnlBoAe0u/x1joOKxHHn33p9wdVRIsZW73p3mHF+l0fSjh
	CzqmwWlX2a5QT51rGb9gt+u7DEzK/n+XJr2h3wAoleL/lqwAh51lfDyizQcNEHFoVU9vSC
	Z5+yicCDvorZ8D6s7KgL5n6of6L+flH54qWxW2dLgIc9ikcFUnJkqgxWmlJF4EioJiSBI7
	W9HyCoaLnmRc92SlWocFAFIptcyOk55yOtu+kuSwXWaNp3oBaV3Hu+abMxW5uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whCh25rfx8GS4+bYaV14J04tuZqHGipi3a6qkBt9AVI=;
	b=CSnzt7WKS6qSpdnBqVQhEnIRdIn0PVxGHTFmhvRenq2znSTY91Cl6oyPKnrIhX7qhkQfOD
	kVqhd6d70gWb/nDA==
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
Subject: [PATCH v3 33/44] x86/cpuid: Parse deterministic cache parameters CPUID leaves
Date: Fri, 13 Jun 2025 01:39:59 +0200
Message-ID: <20250612234010.572636-34-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID parser logic for Intel CPUID(0x4) and AMD CPUID(0x8000001d).

Define a single cpuid_read_deterministic_cache() parsing function for
both leaves, as both have the same subleaf cache enumeration logic.

Introduce __define_cpuid_read_function() macro to avoid code duplication
between cpuid_read_generic(), the CPUID parser's default read function,
and the new cpuid_read_deterministic_cache() one.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h |  2 ++
 arch/x86/kernel/cpu/cpuid_parser.c | 37 +++++++++++++++++++++++++-----
 arch/x86/kernel/cpu/cpuid_parser.h |  4 +++-
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 7bbf0671cb95..89c399629e58 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -216,7 +216,9 @@ struct cpuid_leaves {
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
 	CPUID_LEAF(0x2,		0,		1);
+	CPUID_LEAF(0x4,		0,		8);
 	CPUID_LEAF(0x80000000,	0,		1);
+	CPUID_LEAF(0x8000001d,	0,		8);
 };
 
 /*
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 9bd68b150150..3d0fa1c12ad0 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -16,17 +16,42 @@
  * Leaf read functions:
  */
 
-/*
- * Default CPUID parser read function
+/**
+ * __define_cpuid_parser_read_function() - Generate a CPUID parser leaf read function
+ * @suffix:	Generated function name suffix (full name becomes: cpuid_read_@suffix())
+ * @_leaf_t:	Type to cast the CPUID query output storage pointer
+ * @_leaf:	Name of the CPUID query storage pointer
+ * @_break_c:	Condition to break the CPUID parsing loop, which may reference @_leaf, and
+ *		where @_leaf stores each iteration's CPUID query output.
  *
  * Satisfies the requirements stated at 'struct cpuid_parse_entry'->read().
+ * Define a CPUID parser read function according to the requirements stated at
+ * 'struct cpuid_parse_entry'->read().
  */
-static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
-{
-	for (int i = 0; i < e->maxcnt; i++, output->regs++, output->info->nr_entries++)
-		cpuid_read_subleaf(e->leaf, e->subleaf + i, output->regs);
+#define __define_cpuid_parser_read_function(suffix, _leaf_t, _leaf, _break_c)			\
+static void											\
+cpuid_read_##suffix(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)	\
+{												\
+	struct _leaf_t *_leaf = (struct _leaf_t *)output->regs;					\
+												\
+	for (int i = 0; i < e->maxcnt; i++, _leaf++, output->info->nr_entries++) {		\
+		cpuid_read_subleaf(e->leaf, e->subleaf + i, _leaf);				\
+		if (_break_c)									\
+			break;									\
+	}											\
 }
 
+/*
+ * Default CPUID parser read function
+ */
+__define_cpuid_parser_read_function(generic, cpuid_regs, ignored, false);
+
+/*
+ * Shared read function for Intel CPUID(0x4) and AMD CPUID(0x8000001d), as both have
+ * the same subleaf enumeration logic and registers output format.
+ */
+__define_cpuid_parser_read_function(deterministic_cache, leaf_0x4_0, l, l->cache_type == 0);
+
 static void cpuid_read_0x2(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
 {
 	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->regs;
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index cf999e6a574d..be4ef64c48b6 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -97,7 +97,9 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY(0x0,		0,		generic),			\
 	CPUID_PARSE_ENTRY(0x1,		0,		generic),			\
 	CPUID_PARSE_ENTRY(0x2,		0,		0x2),				\
-	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),
+	CPUID_PARSE_ENTRY(0x4,		0,		deterministic_cache),		\
+	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),			\
+	CPUID_PARSE_ENTRY(0x8000001d,	0,		deterministic_cache),
 
 extern const struct cpuid_parse_entry cpuid_common_parse_entries[];
 extern const int cpuid_common_parse_entries_size;
-- 
2.49.0

