Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6624A076
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507913; cv=none; b=Idx6OiWJ7oeBeUXEzBimb4WhkBGsfzBHYAJypjFuHSBYcFzbRGFuazffmCvDFSaar9g69V28QR19iDH9wUxwAd548NdTyD/y1VVlMSLGY1nK8G429MIYHCoIku2dmPYOKYVoWRnSAZeNyDNUubenkdoWSSq2DlSc17Q3FcoORX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507913; c=relaxed/simple;
	bh=DirrYUOkJKsq4AEPujeetMH3JS4Vq8qX1aZeSD62dyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xr17VPgtkavLLIOl9YAwq9ocg4jcHNld/Jjz5W4y5dQ0LDOc/p0AFjxY7FXKeTn1tq/wtni6pVhvBZOkDdl9lgPb+MlePubk/pmikJx+fJy+MmKyeZBz63VZ0H9npCEYWQvO3sMrx69/WOA5u+RN8LCxkYy+YnuMJxTi+WU0UUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PTbJ/KCS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DbQ6a9mz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PTbJ/KCS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DbQ6a9mz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXAo7blaQX2bmL74gt2hb8UBPnwcJyTXJ6tEKJfM9qk=;
	b=PTbJ/KCSo3EpAlEG1elV4MFuB0O3FoHBpE1qrxKn3IMC0vC3YE+L+5Lbh1oA5rHSh1m4yr
	xUREvq4VPwABo7pQbHC8X7zCtgN2itqgl4FmHNgOvDyKP1WX4mzHkNnLmaZYLdYjaLgn63
	cumiiTLm0vHktjyGxjgiPh9Cy++OHmfKxQPrIMqXGDi9BdesKIjfsVTN4JOD9BR8/pspPM
	TOIR+nwtcqTfeJgzaQa1v1n9NJjEEcqFBntdXsiEZ1I61GK3Ohy9omJdahblSTKOiV7JmU
	7zZKUDGWitzZq0+pKhpcRQ6iTWSsyH3ivjXZoGOfHVbW1qGc1FiX+7A9fnbGRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXAo7blaQX2bmL74gt2hb8UBPnwcJyTXJ6tEKJfM9qk=;
	b=DbQ6a9mzIs7U69uv/ogOqOfLX6+3sgFKsTBmoj9DF0MlkRC94FBFAjKQpslkrBRZxzW9Xd
	narFEz2I2+tgISDQ==
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
Subject: [PATCH v1 07/26] x86/cpuid: Introduce debugfs 'x86/scanned_cpuid/[0-ncpus]'
Date: Tue,  6 May 2025 07:04:18 +0200
Message-ID: <20250506050437.10264-8-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the debugfs files 'x86/scanned_cpuid/[0-ncpus]' to dump the
scanned CPUID table for each CPU.

While dumping the tables, for each cached CPUID leaf/subleaf entry, run
the corresponding CPUID instruction on the target CPU.  Compare the live
hardware output with the cached register values.  If a cached register
differs, mark its cached value output entry with an asterisk.

This should help with tricky bug reports in the future, if/when the
scanned CPUID tables get (unexpectedly) out of sync with actual hardware
state.  It also simplifies the development and testing of adding new
CPUID leaves and custom read functions to the CPUID scanner.

Note, add an extern 'cpuid_common_scan_entries[]' declaration to the
"cpuid_scanner.h" internal header to allow the debugfs code to access the
CPUID scan entries directly.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/Makefile        |  1 +
 arch/x86/kernel/cpu/cpuid_debugfs.c | 98 +++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/cpuid_scanner.c |  6 +-
 arch/x86/kernel/cpu/cpuid_scanner.h |  3 +
 4 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 994539fd0e17..eb9cd1dee58e 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
 obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
 
 obj-$(CONFIG_DEBUG_FS)			+= debugfs.o
+obj-$(CONFIG_DEBUG_FS)			+= cpuid_debugfs.o
 
 obj-$(CONFIG_X86_BUS_LOCK_DETECT)	+= bus_lock.o
 
diff --git a/arch/x86/kernel/cpu/cpuid_debugfs.c b/arch/x86/kernel/cpu/cpuid_debugfs.c
new file mode 100644
index 000000000000..f6ef93b0a403
--- /dev/null
+++ b/arch/x86/kernel/cpu/cpuid_debugfs.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CPUID scanner debugfs entries: x86/scanned_cpuid/[0-ncpus]
+ *
+ * Dump each CPU's scanned CPUID table and compare cached values against
+ * current CPUID output.  Mark changed entries with an asterisk.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/types.h>
+
+#include <asm/cpuid.h>
+#include <asm/cpuid/internal_api.h>
+#include <asm/percpu.h>
+#include <asm/processor.h>
+
+#include "cpuid_scanner.h"
+
+static void cpuid_this_cpu(void *info)
+{
+	struct cpuid_regs *regs = info;
+
+	__cpuid(&regs->eax, &regs->ebx, &regs->ecx, &regs->edx);
+};
+
+static void
+cpuid_show_leaf(struct seq_file *m, uintptr_t cpu_id, const struct leaf_query_info *info,
+		const struct cpuid_regs *cached, const struct cpuid_scan_entry *entry)
+{
+	for (int j = 0; j < info->nr_entries; j++) {
+		u32 subleaf = entry->subleaf + j;
+		struct cpuid_regs regs = {
+			.eax = entry->leaf,
+			.ecx = subleaf,
+		};
+
+		smp_call_function_single(cpu_id, cpuid_this_cpu, &regs, true);
+
+		seq_printf(m, "Leaf 0x%08x, subleaf %u:\n", entry->leaf, subleaf);
+
+		seq_printf(m, "cached: EAX=0x%08x%s\tEBX=0x%08x%s\tECX=0x%08x%s\tEDX=0x%08x%s\n",
+			   cached[j].eax, cached[j].eax == regs.eax ? "" : "*",
+			   cached[j].ebx, cached[j].ebx == regs.ebx ? "" : "*",
+			   cached[j].ecx, cached[j].ecx == regs.ecx ? "" : "*",
+			   cached[j].edx, cached[j].edx == regs.edx ? "" : "*");
+		seq_printf(m, "actual: EAX=0x%08x\tEBX=0x%08x\tECX=0x%08x\tEDX=0x%08x\n",
+			   regs.eax, regs.ebx, regs.ecx, regs.edx);
+	}
+}
+
+static int cpuid_debug_show(struct seq_file *m, void *p)
+{
+	uintptr_t cpu_id = (uintptr_t)m->private;
+	const struct cpuinfo_x86 *c = per_cpu_ptr(&cpu_info, cpu_id);
+	const struct cpuid_leaves *leaves = &c->cpuid_table.leaves;
+	const struct cpuid_scan_entry *entry = cpuid_common_scan_entries;
+
+	for (unsigned int i = 0; i < cpuid_common_scan_entries_size; i++, entry++) {
+		const struct leaf_query_info *info = cpuid_leaves_info_p(leaves, entry->info_offs);
+		const struct cpuid_regs *leaf = cpuid_leaves_leaf_p(leaves, entry->leaf_offs);
+
+		cpuid_show_leaf(m, cpu_id, info, leaf, entry);
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
+	struct dentry *base, *dir;
+	uintptr_t cpu_id;
+	char cpu_name[24];
+
+	base = debugfs_create_dir("scanned_cpuid", arch_debugfs_dir);
+	dir = debugfs_create_dir("cpus", base);
+
+	for_each_possible_cpu(cpu_id) {
+		scnprintf(cpu_name, sizeof(cpu_name), "%lu", cpu_id);
+		debugfs_create_file(cpu_name, 0444, dir, (void *)cpu_id, &cpuid_ops);
+	}
+
+	return 0;
+}
+late_initcall(cpuid_init_debugfs);
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
index ec45c441bde5..7200dd66939f 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.c
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -62,10 +62,12 @@ static bool cpuid_leaf_valid(const struct cpuid_leaves *l, unsigned int leaf)
 		cpuid_range_valid(l, leaf, CPUID_EXT_START, CPUID_EXT_END);
 }
 
-static const struct cpuid_scan_entry cpuid_common_scan_entries[] = {
+const struct cpuid_scan_entry cpuid_common_scan_entries[] = {
 	CPUID_SCAN_ENTRIES
 };
 
+const int cpuid_common_scan_entries_size = ARRAY_SIZE(cpuid_common_scan_entries);
+
 static void cpuid_scan(const struct cpuid_scan_info *info)
 {
 	const struct cpuid_scan_entry *entry = info->entries;
@@ -97,7 +99,7 @@ void cpuid_scan_cpu(struct cpuinfo_x86 *c)
 	const struct cpuid_scan_info info = {
 		.cpuid_table	= &c->cpuid_table,
 		.entries	= cpuid_common_scan_entries,
-		.nr_entries	= ARRAY_SIZE(cpuid_common_scan_entries),
+		.nr_entries	= cpuid_common_scan_entries_size,
 	};
 
 	cpuid_scan(&info);
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
index b3e4676ab7f7..02bb223b406a 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.h
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -106,4 +106,7 @@ struct cpuid_scan_info {
 	unsigned int			nr_entries;
 };
 
+extern const struct cpuid_scan_entry cpuid_common_scan_entries[];
+extern const int cpuid_common_scan_entries_size;
+
 #endif /* _ARCH_X86_CPUID_SCANNER_H */
-- 
2.49.0

