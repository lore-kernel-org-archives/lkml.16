Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5E245037
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507906; cv=none; b=JMzqEmD7Wj46QYvmPpW16yDzJUdJ7J1H+fgUmUAGI5hSRxiXEXPI3bsK+9OkRJdl2gHIJploUW9+v6X+qYMxB+qkmtn9OKZdDqXlBZXCJAdt+6hOweTrFOeQAEHbUIb5BaCRAioSR+WUHwJHEHgGqVg4vfEdxgiC0PD8EyxNC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507906; c=relaxed/simple;
	bh=k0lik8VoPjJ/eHlv1M2IKPQ6nNi8X6CZwXSzJSaZR6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSxXz5EdHDn4IlTSWiMbyu6I9YjFPCz714yl2S26V03Z/f0zf4EgVwY/YsgztwUw7YSe+4hF7BYKcubNeU/+E6cIMlItJoi0dh6uA8cj+7srL3aUrFI/awcgaG5lPCJV47xQU5V8XysysEUc1+cLeY/GyOpZWiLl77BjULph2v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WASECCpP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tUZulqL7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WASECCpP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tUZulqL7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQibyaUT2kAuLzH0tL2o2yN8aw8A1/gtxf4sE3gKO7Y=;
	b=WASECCpPuGU3Bjn4cdKOvEaIbQHc7QFKfuwNLtlrKcDmKq+QpPbfimIPCCBXPxO79oUM+3
	elPOU4FtHxmDUOElAviI1Bqu0HHI9EWbS2+3Y6+uz5LuUx5a/AVJAQbzuFBW2NTrnQ3Zxt
	CvtoYzd4TKh1P/2Y4hYYtLVyTSh0YcgnmCbyShu9R4mEjreM7ijjcZf98N/6zbH0bIk2M6
	vv16rqW+lzLLsyD3JtTcf4kHqSOJkRjL4eyAv2XuwGrxtXjYV1C+i85w9gXGRTMesPeyWy
	cUh82xmhlrkUJOcNOXiEpsjiKxeR2zPIGXndp+GAstxeDobGQjLl8IoCql3sew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQibyaUT2kAuLzH0tL2o2yN8aw8A1/gtxf4sE3gKO7Y=;
	b=tUZulqL7svXAYrc34u++Z93vw8Srxon2ztXBdy9dPaSiMxHQRXhDdXg+/LYzbDkjZoyRgY
	OT1Dl0mf1JkRWEDQ==
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
Subject: [PATCH v1 05/26] x86/cpuid: Introduce CPUID scanner
Date: Tue,  6 May 2025 07:04:16 +0200
Message-ID: <20250506050437.10264-6-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce scanner code for the system CPUID data.  Since accessing a
leaf and its related info structures from CPUID data requires compile
time tokenization, divide the scanner logic into two stages: macros for
tokenization + generic runtime code.

Save the output of the tokenization macros in a compile time generated
table, then pass that table later to the generic runtime scanning code.

Provide the option of choosing different CPUID read functions for each
leaf to be scanned, since most of the complex leaves requires separate
logic for figuring out their number of subleaves.

Scan the system CPUID data tables at CPU capability structures
initialization (struct cpuinfo_x86), so that early boot x86 subsystem
code can also use scanned CPUID data instead of directly invoking CPUID.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid.h           |   1 +
 arch/x86/include/asm/cpuid/table_api.h |   9 +++
 arch/x86/include/asm/cpuid/types.h     |   3 +
 arch/x86/kernel/cpu/Makefile           |   1 +
 arch/x86/kernel/cpu/common.c           |   2 +
 arch/x86/kernel/cpu/cpuid_scanner.c    |  84 +++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_scanner.h    | 108 +++++++++++++++++++++++++
 7 files changed, 208 insertions(+)
 create mode 100644 arch/x86/include/asm/cpuid/table_api.h
 create mode 100644 arch/x86/kernel/cpu/cpuid_scanner.c
 create mode 100644 arch/x86/kernel/cpu/cpuid_scanner.h

diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
index 585819331dc6..7a0ff94f36fc 100644
--- a/arch/x86/include/asm/cpuid.h
+++ b/arch/x86/include/asm/cpuid.h
@@ -5,5 +5,6 @@
 
 #include <asm/cpuid/api.h>
 #include <asm/cpuid/leaf_0x2_api.h>
+#include <asm/cpuid/table_api.h>
 
 #endif /* _ASM_X86_CPUID_H */
diff --git a/arch/x86/include/asm/cpuid/table_api.h b/arch/x86/include/asm/cpuid/table_api.h
new file mode 100644
index 000000000000..d4b6d848eac2
--- /dev/null
+++ b/arch/x86/include/asm/cpuid/table_api.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_CPUID_TABLE_API_H
+#define _ASM_X86_CPUID_TABLE_API_H
+
+#include <asm/processor.h>
+
+void cpuid_scan_cpu(struct cpuinfo_x86 *c);
+
+#endif /* _ASM_X86_CPUID_TABLE_API_H */
diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index df115a8440bc..6150cb0fa77e 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -32,6 +32,9 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_FREQ		0x16
 #define CPUID_LEAF_TILE		0x1d
 
+#define CPUID_BASE_START	0x0
+#define CPUID_BASE_END		(CPUID_BASE_START + 0xffff)
+
 /*
  * Types for CPUID(0x2) parsing
  * Check <asm/cpuid/leaf_0x2_api.h>
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 1e26179ff18c..994539fd0e17 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -19,6 +19,7 @@ KCSAN_SANITIZE_common.o := n
 
 obj-y			:= cacheinfo.o scattered.o
 obj-y			+= topology_common.o topology_ext.o topology_amd.o
+obj-y			+= cpuid_scanner.o
 obj-y			+= common.o
 obj-y			+= rdrand.o
 obj-y			+= match.o
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e5734df3b4a1..f1e28ffbffec 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1631,6 +1631,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 
 	/* cyrix could have cpuid enabled via c_identify()*/
 	if (have_cpuid_p()) {
+		cpuid_scan_cpu(c);
 		cpu_detect(c);
 		get_cpu_vendor(c);
 		intel_unlock_cpuid_leafs(c);
@@ -2011,6 +2012,7 @@ void identify_secondary_cpu(unsigned int cpu)
 		*c = boot_cpu_data;
 	c->cpu_index = cpu;
 
+	cpuid_scan_cpu(c);
 	identify_cpu(c);
 #ifdef CONFIG_X86_32
 	enable_sep_cpu();
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
new file mode 100644
index 000000000000..8f290047b661
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <asm/cpuid.h>
+#include <asm/cpuid/internal_api.h>
+#include <asm/percpu.h>
+#include <asm/processor.h>
+
+#include "cpuid_scanner.h"
+
+/*
+ * Default CPUID scanner read function
+ */
+static void cpuid_read_generic(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
+{
+	output->info->nr_entries = 0;
+	for (int i = 0; i < e->maxcnt; i++, output->leaf++, output->info->nr_entries++)
+		cpuid_subleaf(e->leaf, e->subleaf + i, output->leaf);
+}
+
+static unsigned int cpuid_range_max_leaf(const struct cpuid_leaves *leaves, unsigned int range)
+{
+	switch (range) {
+	case CPUID_BASE_START:	return cpuid_get(leaves, 0x0).max_std_leaf;
+	default:		return 0;
+	}
+}
+
+static bool
+cpuid_range_valid(const struct cpuid_leaves *l, unsigned int leaf, unsigned int start, unsigned int end)
+{
+	if (leaf < start || leaf > end)
+		return false;
+
+	return leaf == start || leaf <= cpuid_range_max_leaf(l, start);
+}
+
+static bool cpuid_leaf_valid(const struct cpuid_leaves *l, unsigned int leaf)
+{
+	return cpuid_range_valid(l, leaf, CPUID_BASE_START, CPUID_BASE_END);
+}
+
+static const struct cpuid_scan_entry cpuid_common_scan_entries[] = {
+	CPUID_SCAN_ENTRIES
+};
+
+static void cpuid_scan(const struct cpuid_scan_info *info)
+{
+	const struct cpuid_scan_entry *entry = info->entries;
+	struct cpuid_leaves *leaves = &info->cpuid_table->leaves;
+
+	for (unsigned int i = 0; i < info->nr_entries; i++, entry++) {
+		struct cpuid_read_output output = {
+			.leaf		= cpuid_leaves_leaf_p(leaves, entry->leaf_offs),
+			.info		= cpuid_leaves_info_p(leaves, entry->info_offs),
+		};
+
+		if (!cpuid_leaf_valid(&info->cpuid_table->leaves, entry->leaf))
+			continue;
+
+		entry->read(entry, &output);
+	}
+}
+
+/**
+ * cpuid_scan_cpu() - Populate CPUID data for the current CPU
+ * @c:		CPU capability structure associated with the current CPU
+ *
+ * Populate the CPUID table embedded within @c with scanned CPUID data.
+ * Since all the CPUID instructions are run locally, this function must be
+ * called on the CPU associated with @c.
+ */
+void cpuid_scan_cpu(struct cpuinfo_x86 *c)
+{
+	const struct cpuid_scan_info info = {
+		.cpuid_table	= &c->cpuid_table,
+		.entries	= cpuid_common_scan_entries,
+		.nr_entries	= ARRAY_SIZE(cpuid_common_scan_entries),
+	};
+
+	cpuid_scan(&info);
+}
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
new file mode 100644
index 000000000000..ff34b478c74f
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ARCH_X86_CPUID_SCANNER_H
+#define _ARCH_X86_CPUID_SCANNER_H
+
+#include <asm/cpuid/types.h>
+
+/*
+ * struct cpuid_leaves leaf output and leaf query info accessors:
+ * @_leaf:	Leaf number in the 0xN format
+ * @_subleaf:	Subleaf number in decimal
+ *
+ * Accessing a leaf and its metadata requires compile-time tokenization, so
+ * divide the CPUID scanning logic into two steps: macros and generic runtime
+ * code.  The output of the macros, __cpuid_leaves_*_offset(), will be cached
+ * by a compile-time "scan entry" then passed to the cpuid_leaves_*_p()
+ * inline functions.
+ */
+
+#define __cpuid_leaves_leaf_offset(_leaf, _subleaf)			\
+	offsetof(struct cpuid_leaves, leaf_ ## _leaf ## _ ## _subleaf)
+
+#define __cpuid_leaves_info_offset(_leaf, _subleaf)			\
+	offsetof(struct cpuid_leaves, leaf_ ## _leaf ## _ ## _subleaf ## _ ## info)
+
+#define __cpuid_leaves_leaf_maxcnt(_leaf, _subleaf)			\
+	ARRAY_SIZE(((struct cpuid_leaves *)NULL)->leaf_ ## _leaf ## _ ## _subleaf)
+
+static inline struct cpuid_regs *
+cpuid_leaves_leaf_p(const struct cpuid_leaves *leaves, unsigned long leaf_offset)
+{
+	return (struct cpuid_regs *)((unsigned long)(leaves) + leaf_offset);
+}
+
+static inline struct leaf_query_info *
+cpuid_leaves_info_p(const struct cpuid_leaves *leaves, unsigned long info_offset)
+{
+	return (struct leaf_query_info *)((unsigned long)(leaves) + info_offset);
+}
+
+/**
+ * struct cpuid_read_output - Output of a CPUID read operation
+ * @leaf:	Pointer to an array of registers; for saving read CPUID data
+ * @info:	Pointer to query info; for saving number of filled @leaf entries
+ *
+ * A CPUID read function such as cpuid_read_generic() or cpuid_read_0xN() uses this
+ * structure for output.  Storage for @leaf and @info is provided by the CPUID read
+ * function caller, and is typically within a CPUID repo (&struct cpuid_table.leaves).
+ */
+struct cpuid_read_output {
+	struct cpuid_regs	*leaf;
+	struct leaf_query_info	*info;
+};
+
+/**
+ * struct cpuid_scan_entry - Scan info for @leaf/@subleaf
+ * @leaf:	Leaf number to be scanned
+ * @subleaf:	Subleaf number to be scanned
+ * @leaf_offs:	struct cpuid_leaves entry offset for @leaf/@subleaf; to be passed to cpuid_leaves_leaf_p()
+ * @info_offs:	struct cpuid_leaves entry offset for @leaf/@subleaf scan info; to be passed to cpuid_leaves_info_p()
+ * @maxcnt:	Maximum number of storage entries available for a @leaf/@subleaf query
+ * @read:	Read function for this entry.  It must save the read CPUID data to the passed
+ *		struct cpuid_read_output.leaf register array of size >= @maxcnt.  It must also
+ *		set struct cpuid_read_output.info.nr_entries to the number of entries filled.
+ *		A generic implementation is provided at cpuid_read_generic().
+ */
+struct cpuid_scan_entry {
+	unsigned int	leaf;
+	unsigned int	subleaf;
+	unsigned int	leaf_offs;
+	unsigned int	info_offs;
+	unsigned int	maxcnt;
+	void		(*read)(const struct cpuid_scan_entry *e, struct cpuid_read_output *o);
+};
+
+/**
+ * SCAN_ENTRY() - Define a struct cpuid_scan_entry entry for @_leaf/@_subleaf
+ * @_leaf:	Leaf number in 0xN format
+ * @_subleaf:	Subleaf number in decimal
+ * @_reader:	Read function suffix, to CPUID query @_leaf/@_subleaf
+ */
+#define SCAN_ENTRY(_leaf, _subleaf, _reader)					\
+	{									\
+		.leaf		= _leaf,					\
+		.subleaf	= _subleaf,					\
+		.leaf_offs	= __cpuid_leaves_leaf_offset(_leaf, _subleaf),	\
+		.info_offs	= __cpuid_leaves_info_offset(_leaf, _subleaf),	\
+		.maxcnt		= __cpuid_leaves_leaf_maxcnt(_leaf, _subleaf),	\
+		.read		= cpuid_read_ ## _reader,			\
+	}
+
+#define CPUID_SCAN_ENTRIES							\
+	/*	   leaf		subleaf		reader */			\
+	SCAN_ENTRY(0x0,		0,		generic),			\
+	SCAN_ENTRY(0x1,		0,		generic),			\
+
+/**
+ * struct cpuid_scan_info - Parameters for generic CPUID scan logic
+ * @cpuid_table:	CPUID table for saving scan output
+ * @entries:		Leaf/subleaf scan entries
+ * @nr_entries:		Array size of @entries
+ */
+struct cpuid_scan_info {
+	struct cpuid_table		*cpuid_table;
+	const struct cpuid_scan_entry	*entries;
+	unsigned int			nr_entries;
+};
+
+#endif /* _ARCH_X86_CPUID_SCANNER_H */
-- 
2.49.0

