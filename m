Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DA281365
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151509; cv=none; b=qr8yAutw+ltyUDa5p5pyZ1GnTqsC10s1L5LTIqRa96TjRRk/B6xWutkFyJieUSCC1wQvRibFINLEX5sFmWNWAeLq6vUF9056kNJQa87vyKfLF748UcNi/WFFYFZx7PopqjtauLMlnW9SU2OOSD1a5+fgfSX82/TAdN3kR2lbnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151509; c=relaxed/simple;
	bh=+qBsiSSUy1jp5TJAOjQX4DOldglOngbOXvP0Y78UtZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eikQD/Y/eTXb8DCEB61RVs8AYQig0+b+EC7AEflYWcnopY28q3V+c8pGBCSW+pNs5S0lpWede+VPY4MXTWDuKsT/cNljGXy4gYEWEFs5e3bO46AYqulVEkIfN3wKKLvZmu+UIhO7uvOR8FzrctpXpYVZk0GZ7j9zxcl4T4RaP4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OdZmDhv0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ac42tVHg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OdZmDhv0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ac42tVHg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LVvx7eIEVDJLIVUqt5/zmHhvKagbb+ZKbwzhn6boLs=;
	b=OdZmDhv0S/p4nfyvazaKvRR/lNJl0UQ2tP7eKAJW/sVRahk6W/9TKII+P4tLUBOuGtbyVH
	JtFNPWR24P+tARsUFtgGbTD/GcIWLFQkpqd6GEWaQ1xDHXyOFI5aAaBL7WyF52JqBxjfiZ
	hlCTD8IS0BuOBc+YTIWPi2lDEx6eyIta4ljKrB5aNB7H6oiuWvUcqykZxtEcdBoRWfzXiU
	65LWZTmOdKPcLMBTy6X4vi585IKaAk3CIYe+3mBVvHdl1aPsTbhaQUC8bqPWED1U6Ex3PT
	wZ6QuEOVdvN4YWotn9O9UM4ztlJAZRGQ86lgeVybmRmIv6lOHxPrv5gBXCNawA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LVvx7eIEVDJLIVUqt5/zmHhvKagbb+ZKbwzhn6boLs=;
	b=Ac42tVHgyXzvVzjLUJce86qVLFvAwuw4DVW/TfiDLMNqiSA5m2DbnP8Jf+1pDzBuMhgBWi
	zlcRmgGgpAFVwpBQ==
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
Subject: [PATCH v2 18/27] x86/cpuid: Parse deterministic cache parameters CPUID leaves
Date: Thu,  5 Jun 2025 21:23:47 +0200
Message-ID: <20250605192356.82250-19-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cpuid_parser.c | 40 +++++++++++++++++++++++++-----
 arch/x86/kernel/cpu/cpuid_parser.h |  4 ++-
 3 files changed, 39 insertions(+), 7 deletions(-)

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
index 4b960b23cab4..1f3b4cd6b411 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -14,15 +14,43 @@
 
 #include "cpuid_parser.h"
 
+/**
+ * __define_cpuid_read_function() - Generate a CPUID parser read function
+ * @_suffix:	Suffix for the generated function name (full name: cpuid_read_@_suffix())
+ * @_leaf_t:	Type to cast the CPUID query output storage pointer
+ * @_leaf:	Name of the CPUID query storage pointer
+ * @_break_c:	Condition to break the CPUID parsing loop, which may reference @_leaf, and
+ *		where @_leaf stores each iteration's CPUID query output.
+ *
+ * Define a CPUID parser read function according to the requirements stated at
+ * &struct cpuid_parse_entry->read().
+ */
+#define __define_cpuid_read_function(_suffix, _leaf_t, _leaf, _break_c)				\
+static void											\
+cpuid_read_##_suffix(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)	\
+{												\
+	struct _leaf_t *_leaf = (struct _leaf_t *)output->regs;					\
+												\
+	static_assert(sizeof(*_leaf) == 16);							\
+												\
+	output->info->nr_entries = 0;								\
+	for (int i = 0; i < e->maxcnt; i++, _leaf++, output->info->nr_entries++) {		\
+		cpuid_read_subleaf(e->leaf, e->subleaf + i, _leaf);				\
+		if (_break_c)									\
+			break;									\
+	}											\
+}
+
 /*
  * Default CPUID parser read function
  */
-static void cpuid_read_generic(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
-{
-	output->info->nr_entries = 0;
-	for (int i = 0; i < e->maxcnt; i++, output->regs++, output->info->nr_entries++)
-		cpuid_read_subleaf(e->leaf, e->subleaf + i, output->regs);
-}
+__define_cpuid_read_function(generic, cpuid_regs, ignored, false);
+
+/*
+ * Shared read function for Intel CPUID leaf 0x4 and AMD CPUID leaf 0x8000001d,
+ * as both have the same subleaf enumeration logic and registers output format.
+ */
+__define_cpuid_read_function(deterministic_cache, leaf_0x4_0, leaf, leaf->cache_type == 0);
 
 static void cpuid_read_0x2(const struct cpuid_parse_entry *e, struct cpuid_read_output *output)
 {
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index 3178e760e2b3..c79c77547a1d 100644
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

