Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97827EC7D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151474; cv=none; b=cJZSC8hcGWlK2rjCSBL6crU7gtXA2epM9dQakWrcsJJjxDI5voQAfusI8rAXsSgbBDFn5cT8IivSKCv1mGk+8oxCsDi+SrvVxB8usDeVfjlntQIBBRPL8/V5LgwZ+ib9gPHnN0N51dg+MYMKcM0p14aoT4wfOCUVYUP7WEw/Kj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151474; c=relaxed/simple;
	bh=15COt2OXMwRfconWnNPjKpT2eq0Z1ad5WLFEdsdeR4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iN+UIATVZErmNynfUH9xF2jNjUce9nI09tkc8oKnNXVpMYran4kA3reDLgw2vijTfE4dSaiB3Jk8Xs7rqz7ctwHVdxSfn8IDON4AdTYlczUbLUuAqSaj+3v/hUK4FAwTaUzxXUVYNRcQCmmLi8XuPYKC3H6vm/itHW1FzWZGXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vfQE6UYt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HEMcDGMg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vfQE6UYt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HEMcDGMg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gy7h4HawSvU5tLHqrdABGWs1B/wd8RgWXzUlvPObMJk=;
	b=vfQE6UYtA8as5f8H7CfF4htske2JNAf4t+sSLvmlQ390X1b8urxc5iKBK//CRrjsy98iWA
	7gv3G7QLHlWGVU27XI6CDg2f1leT2eC4Gcm9FTAJ/lKEsk7Vbz3dAOQLU0o53hrxgo1FyJ
	AtR6HMuVkLwR0m35cgCEFp9OhiyH6N6ltUZ6QKkZV1QT0bYN1v8oU59z7fa3iq3dItLbTT
	AQUwio6ehNw5ILiXUBQj5HNJYb/qN9UwrpXM1WX9a1p0xsCwwi46dQoEoqUaFSggH6sEo6
	3ebAUwfwfJkUj4VvMdMTTsrF9Kz3H/kDTc/yl3iY9UOi93toelqEa7VKsdg2fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gy7h4HawSvU5tLHqrdABGWs1B/wd8RgWXzUlvPObMJk=;
	b=HEMcDGMgEkyMpHCXLRw67vxxAukzyhED/10rjWCLDULfTuwQCjHtBKdLFOgUoVEOgM2xb7
	9H6a0iKuu5VF8KDw==
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
Subject: [PATCH v2 07/27] x86/cpuid: Introduce CPUID parser debugfs interface
Date: Thu,  5 Jun 2025 21:23:36 +0200
Message-ID: <20250605192356.82250-8-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the debugfs files 'x86/cpuid/[0-ncpus]' to dump each CPU's
cached CPUID table.  For each cached CPUID leaf/subleaf, invoke the
CPUID instruction on the target CPU and compare the hardware result
against the cached values.

Mark any mismatched cached CPUID output value with an asterisk.  This
should help with tricky bug reports in the future, if/when the cached
CPUID tables get unexpectedly out of sync with actual hardware state.  It
also simplifies the development and testing of adding new CPUID leaves to
the CPUID parser.

Note, expose cpuid_common_parse_entries[] via "cpuid_parser.h" to allow
the debugfs code to traverse and dump the parsed CPUID data.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/Makefile        |   2 +-
 arch/x86/kernel/cpu/cpuid_debugfs.c | 102 ++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_parser.c  |   7 +-
 arch/x86/kernel/cpu/cpuid_parser.h  |   3 +
 4 files changed, 110 insertions(+), 4 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index b2421cfb59ed..4e032ad851c7 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -61,7 +61,7 @@ obj-$(CONFIG_X86_LOCAL_APIC)		+= perfctr-watchdog.o
 obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
 obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
 
-obj-$(CONFIG_DEBUG_FS)			+= debugfs.o
+obj-$(CONFIG_DEBUG_FS)			+= debugfs.o cpuid_debugfs.o
 
 obj-$(CONFIG_X86_BUS_LOCK_DETECT)	+= bus_lock.o
 
diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
new file mode 100644
index 000000000000..fd39305a3c99
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_debugfs.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CPUID parser debugfs entries: x86/cpuid/[0-ncpus]
+ *
+ * Dump each CPU's cached CPUID table and compare its values against current
+ * CPUID output on that CPU.  Mark changed entries with an asterisk.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/types.h>
+
+#include <asm/cpuid/api.h>
+#include <asm/percpu.h>
+#include <asm/processor.h>
+
+#include "cpuid_parser.h"
+
+static void cpuid_this_cpu(void *info)
+{
+	struct cpuid_regs *regs = info;
+
+	__cpuid(&regs->eax, &regs->ebx, &regs->ecx, &regs->edx);
+}
+
+static void
+cpuid_show_leaf(struct seq_file *m, uintptr_t cpu_id, const struct cpuid_parse_entry *entry,
+		const struct leaf_query_info *info, const struct cpuid_regs *cached)
+{
+	for (int j = 0; j < info->nr_entries; j++) {
+		u32 subleaf = entry->subleaf + j;
+		struct cpuid_regs regs = {
+			.eax = entry->leaf,
+			.ecx = subleaf,
+		};
+		int ret;
+
+		seq_printf(m, "Leaf 0x%08x, subleaf %u:\n", entry->leaf, subleaf);
+
+		ret = smp_call_function_single(cpu_id, cpuid_this_cpu, &regs, true);
+		if (ret) {
+			seq_printf(m, "Failed to invoke CPUID on CPU %lu: %d\n\n", cpu_id, ret);
+			continue;
+		}
+
+		seq_printf(m, "  cached:   %cEAX=0x%08x   %cEBX=0x%08x   %cECX=0x%08x   %cEDX=0x%08x\n",
+			   cached[j].eax == regs.eax ? ' ' : '*', cached[j].eax,
+			   cached[j].ebx == regs.ebx ? ' ' : '*', cached[j].ebx,
+			   cached[j].ecx == regs.ecx ? ' ' : '*', cached[j].ecx,
+			   cached[j].edx == regs.edx ? ' ' : '*', cached[j].edx);
+		seq_printf(m, "  actual:    EAX=0x%08x    EBX=0x%08x    ECX=0x%08x    EDX=0x%08x\n",
+			   regs.eax, regs.ebx, regs.ecx, regs.edx);
+	}
+}
+
+static int cpuid_debug_show(struct seq_file *m, void *p)
+{
+	uintptr_t cpu_id = (uintptr_t)m->private;
+	const struct cpuinfo_x86 *c = per_cpu_ptr(&cpu_info, cpu_id);
+
+	const struct cpuid_parse_entry *entry = cpuid_common_parse_entries;
+	const struct cpuid_leaves *leaves = &c->cpuid.leaves;
+
+	for (unsigned int i = 0; i < cpuid_common_parse_entries_size; i++, entry++) {
+		const struct leaf_query_info *qi = cpuid_leaves_query_info_p(leaves, entry->info_offs);
+		const struct cpuid_regs *qr = cpuid_leaves_query_regs_p(leaves, entry->regs_offs);
+
+		cpuid_show_leaf(m, cpu_id, entry, qi, qr);
+	}
+
+	return 0;
+}
+
+static int cpuid_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cpuid_debug_show, inode->i_private);
+}
+
+static const struct file_operations cpuid_ops = {
+	.open		= cpuid_debug_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static __init int cpuid_init_debugfs(void)
+{
+	struct dentry *dir;
+	uintptr_t cpu_id;
+	char cpu_name[24];
+
+	dir = debugfs_create_dir("cpuid", arch_debugfs_dir);
+
+	for_each_possible_cpu(cpu_id) {
+		scnprintf(cpu_name, sizeof(cpu_name), "%lu", cpu_id);
+		debugfs_create_file(cpu_name, 0444, dir, (void *)cpu_id, &cpuid_ops);
+	}
+
+	return 0;
+}
+late_initcall(cpuid_init_debugfs);
diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index 731aab2ff9c0..e79835a09336 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -64,10 +64,12 @@ static bool cpuid_leaf_valid(const struct cpuid_leaves *l, unsigned int leaf)
 		cpuid_range_valid(l, leaf, CPUID_EXT_START, CPUID_EXT_END);
 }
 
-static const struct cpuid_parse_entry cpuid_common_parse_entries[] = {
+const struct cpuid_parse_entry cpuid_common_parse_entries[] = {
 	CPUID_PARSE_ENTRIES
 };
 
+const int cpuid_common_parse_entries_size = ARRAY_SIZE(cpuid_common_parse_entries);
+
 static void
 cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[], unsigned int nr_entries)
 {
@@ -95,6 +97,5 @@ cpuid_fill_table(struct cpuid_table *t, const struct cpuid_parse_entry entries[]
  */
 void cpuid_parser_scan_cpu(struct cpuinfo_x86 *c)
 {
-	cpuid_fill_table(&c->cpuid, cpuid_common_parse_entries,
-			 ARRAY_SIZE(cpuid_common_parse_entries));
+	cpuid_fill_table(&c->cpuid, cpuid_common_parse_entries, cpuid_common_parse_entries_size);
 }
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index f440948fc2fc..0c79919a6138 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -98,4 +98,7 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY(0x1,		0,		generic),			\
 	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),
 
+extern const struct cpuid_parse_entry cpuid_common_parse_entries[];
+extern const int cpuid_common_parse_entries_size;
+
 #endif /* _ARCH_X86_CPUID_PARSER_H */
-- 
2.49.0

