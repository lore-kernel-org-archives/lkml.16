Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796F11A3146
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952417; cv=none; b=nEJ9fPHY3AFdUNAaKHex/FFI8ryLhCP1vik4n5yJNbNzaFHb9Gcc7AyH/JeYOdbeK5yADyCuwjFiffCWe+9uORNU0RdGB41NYj73RdvbEtwtsRYagGHn6eDCi5ItwdF63L2UY2N8Fb+d+JZ1wSzATNArmLdoSGX/JlaDycgWNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952417; c=relaxed/simple;
	bh=bDAl9fVdq6Is2ea27NiJxNvcsxJzo+zOaynhIw2pRw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SQss6XZh5ffHPIFMshMEX7XvH89o+YfkEKr4qfDWrAeC5NP/LWHfdl68KZ/BNymDu3TDVsc0roLWzA8jO0BZuv19DMR2xdCYlOF6Tmub8Bn2uYZVk8ZV0bjxG4Cs5ZlMMu1NTdLNrISG0aG+ecWfGb4OlAXp8ID3N1chuMv/s+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E426512FC;
	Fri,  7 Feb 2025 10:20:30 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C68C53F63F;
	Fri,  7 Feb 2025 10:20:04 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 24/42] x86/resctrl: Allow an architecture to disable pseudo lock
Date: Fri,  7 Feb 2025 18:18:05 +0000
Message-Id: <20250207181823.6378-25-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
References: <20250207181823.6378-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pseudo-lock relies on knowledge of the micro-architecture to disable
prefetchers etc.

On arm64 these controls are typically secure only, meaning linux can't
access them. Arm's cache-lockdown feature works in a very different
way. Resctrl's pseudo-lock isn't going to be used on arm64 platforms.

Add a Kconfig symbol that can be selected by the architecture. This
enables or disables building of the pseudo_lock.c file, and replaces
the functions with stubs. An additional IS_ENABLED() check is needed
in rdtgroup_mode_write() so that attempting to enable pseudo-lock
reports an "Unknown or unsupported mode" to user-space via the
last_cmd_status file.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes since v4:
 * "last_cmd file" -> "last_cmd_status file"

Changes since v2:
 * Clarified the commit message as to where the error string is printed.

Changes since v1:
 * [Commit message only] Typo fix:
   s/psuedo/pseudo/g
---
 arch/x86/Kconfig                       |  7 ++++
 arch/x86/kernel/cpu/resctrl/Makefile   |  5 +--
 arch/x86/kernel/cpu/resctrl/internal.h | 49 +++++++++++++++++++++-----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  3 +-
 4 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f..41dda57c4953 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -505,6 +505,7 @@ config X86_CPU_RESCTRL
 	depends on X86 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	select KERNFS
 	select PROC_CPU_RESCTRL		if PROC_FS
+	select RESCTRL_FS_PSEUDO_LOCK
 	help
 	  Enable x86 CPU resource control support.
 
@@ -521,6 +522,12 @@ config X86_CPU_RESCTRL
 
 	  Say N if unsure.
 
+config RESCTRL_FS_PSEUDO_LOCK
+	bool
+	help
+	  Software mechanism to pin data in a cache portion using
+	  micro-architecture specific knowledge.
+
 config X86_FRED
 	bool "Flexible Return and Event Delivery"
 	depends on X86_64
diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index 4a06c37b9cf1..0c13b0befd8a 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_X86_CPU_RESCTRL)	+= core.o rdtgroup.o monitor.o
-obj-$(CONFIG_X86_CPU_RESCTRL)	+= ctrlmondata.o pseudo_lock.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
+obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
+obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 CFLAGS_pseudo_lock.o = -I$(src)
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 725f223ea07b..8d35bb423aad 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -512,14 +512,6 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r, struct rdt_ctrl_domain
 				  unsigned long cbm);
 enum rdtgrp_mode rdtgroup_mode_by_closid(int closid);
 int rdtgroup_tasks_assigned(struct rdtgroup *r);
-int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
-int rdtgroup_locksetup_exit(struct rdtgroup *rdtgrp);
-bool rdtgroup_cbm_overlaps_pseudo_locked(struct rdt_ctrl_domain *d, unsigned long cbm);
-bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_ctrl_domain *d);
-int rdt_pseudo_lock_init(void);
-void rdt_pseudo_lock_release(void);
-int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp);
-void rdtgroup_pseudo_lock_remove(struct rdtgroup *rdtgrp);
 struct rdt_ctrl_domain *get_ctrl_domain_from_cpu(int cpu, struct rdt_resource *r);
 struct rdt_mon_domain *get_mon_domain_from_cpu(int cpu, struct rdt_resource *r);
 int closids_supported(void);
@@ -551,4 +543,45 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+
+#ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
+int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
+int rdtgroup_locksetup_exit(struct rdtgroup *rdtgrp);
+bool rdtgroup_cbm_overlaps_pseudo_locked(struct rdt_ctrl_domain *d, unsigned long cbm);
+bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_ctrl_domain *d);
+int rdt_pseudo_lock_init(void);
+void rdt_pseudo_lock_release(void);
+int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp);
+void rdtgroup_pseudo_lock_remove(struct rdtgroup *rdtgrp);
+#else
+static inline int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int rdtgroup_locksetup_exit(struct rdtgroup *rdtgrp)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline bool rdtgroup_cbm_overlaps_pseudo_locked(struct rdt_ctrl_domain *d, unsigned long cbm)
+{
+	return false;
+}
+
+static inline bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_ctrl_domain *d)
+{
+	return false;
+}
+
+static inline int rdt_pseudo_lock_init(void) { return 0; }
+static inline void rdt_pseudo_lock_release(void) { }
+static inline int rdtgroup_pseudo_lock_create(struct rdtgroup *rdtgrp)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void rdtgroup_pseudo_lock_remove(struct rdtgroup *rdtgrp) { }
+#endif /* CONFIG_RESCTRL_FS_PSEUDO_LOCK */
+
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index a388ef66ef4c..e59271515a46 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1453,7 +1453,8 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 				goto out;
 		}
 		rdtgrp->mode = RDT_MODE_EXCLUSIVE;
-	} else if (!strcmp(buf, "pseudo-locksetup")) {
+	} else if (IS_ENABLED(CONFIG_RESCTRL_FS_PSEUDO_LOCK) &&
+		   !strcmp(buf, "pseudo-locksetup")) {
 		ret = rdtgroup_locksetup_enter(rdtgrp);
 		if (ret)
 			goto out;
-- 
2.39.2

