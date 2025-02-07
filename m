Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D224D1AB6F1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952433; cv=none; b=bdlwXFxTfg5vPeGcM5CDVbZZ6OI9fThVv7y7nZhH8FCfEbfPDHPzZuz3qUGV7lel9LLHTzSH14XL9kilF/mSXUd9hZkyBz3kvdMq+cLF+9xeebv6XxjVmIUt5W/LfFe7nb1htb6pbHBFpnh7QZnEHDtuzLxq8g7eYS0MQ8yi/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952433; c=relaxed/simple;
	bh=w+bbhIAIJhgNfljRoXv0ZbfZW4zjjcJ26BYJ8WjbJlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tk5ddb33L9i9v8fJjaVdBvveS1lzkG83Z4ZbNZt0jZAlHmeRPzQPZupwQo5NTPx8RDxsR5Lukb0vdbLmxHs1/6LCCeYezmrIW5N87Dem9aGqcgLx9IcYAM8fh8IIaLrwLLrq8pjSmvlwUf/6/Bq8LBl61Omi3Hcf/j1gYPE9uvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F07441DB5;
	Fri,  7 Feb 2025 10:20:51 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7183F63F;
	Fri,  7 Feb 2025 10:20:25 -0800 (PST)
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
Subject: [PATCH v6 30/42] x86/resctrl: Claim get_{mon,ctrl}_domain_from_cpu() helpers for resctrl
Date: Fri,  7 Feb 2025 18:18:11 +0000
Message-Id: <20250207181823.6378-31-james.morse@arm.com>
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

get_{mon,ctrl}_domain_from_cpu() are handy helpers that both the arch
code and resctrl need to use. Rename them to have a resctrl_ prefix
and move them to a header file.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
Changes from v5:
 * Added the word from to a comment.
---
 arch/x86/kernel/cpu/resctrl/core.c     | 30 ---------------------
 arch/x86/kernel/cpu/resctrl/internal.h |  2 --
 arch/x86/kernel/cpu/resctrl/monitor.c  |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  2 +-
 include/linux/resctrl.h                | 37 ++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index e4b676879227..921c351d57ae 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -348,36 +348,6 @@ static void cat_wrmsr(struct msr_param *m)
 		wrmsrl(hw_res->msr_base + i, hw_dom->ctrl_val[i]);
 }
 
-struct rdt_ctrl_domain *get_ctrl_domain_from_cpu(int cpu, struct rdt_resource *r)
-{
-	struct rdt_ctrl_domain *d;
-
-	lockdep_assert_cpus_held();
-
-	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
-		/* Find the domain that contains this CPU */
-		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
-			return d;
-	}
-
-	return NULL;
-}
-
-struct rdt_mon_domain *get_mon_domain_from_cpu(int cpu, struct rdt_resource *r)
-{
-	struct rdt_mon_domain *d;
-
-	lockdep_assert_cpus_held();
-
-	list_for_each_entry(d, &r->mon_domains, hdr.list) {
-		/* Find the domain that contains this CPU */
-		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
-			return d;
-	}
-
-	return NULL;
-}
-
 u32 resctrl_arch_get_num_closid(struct rdt_resource *r)
 {
 	return resctrl_to_arch_res(r)->num_closid;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 0d13006e920b..c44c5b496355 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -475,8 +475,6 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r, struct rdt_ctrl_domain
 				  unsigned long cbm);
 enum rdtgrp_mode rdtgroup_mode_by_closid(int closid);
 int rdtgroup_tasks_assigned(struct rdtgroup *r);
-struct rdt_ctrl_domain *get_ctrl_domain_from_cpu(int cpu, struct rdt_resource *r);
-struct rdt_mon_domain *get_mon_domain_from_cpu(int cpu, struct rdt_resource *r);
 int closids_supported(void);
 void closid_free(int closid);
 int alloc_rmid(u32 closid);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index d99a05fc1b44..470cf16f506e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -773,7 +773,7 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
 	if (WARN_ON_ONCE(!pmbm_data))
 		return;
 
-	dom_mba = get_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
+	dom_mba = resctrl_get_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
 	if (!dom_mba) {
 		pr_warn_once("Failure to get domain for MBA update\n");
 		return;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5fc60c9ce28f..08fec23a38bf 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4274,7 +4274,7 @@ void resctrl_offline_cpu(unsigned int cpu)
 	if (!l3->mon_capable)
 		goto out_unlock;
 
-	d = get_mon_domain_from_cpu(cpu, l3);
+	d = resctrl_get_mon_domain_from_cpu(cpu, l3);
 	if (d) {
 		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
 			cancel_delayed_work(&d->mbm_over);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 29415d023aab..511dab4ffcdc 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -3,6 +3,7 @@
 #define _RESCTRL_H
 
 #include <linux/cacheinfo.h>
+#include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/pid.h>
@@ -399,6 +400,42 @@ static inline u32 resctrl_get_config_index(u32 closid,
 	}
 }
 
+/*
+ * Caller must hold the cpuhp read lock to prevent the struct rdt_domain from
+ * being freed.
+ */
+static inline struct rdt_ctrl_domain *
+resctrl_get_ctrl_domain_from_cpu(int cpu, struct rdt_resource *r)
+{
+	struct rdt_ctrl_domain *d;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		/* Find the domain that contains this CPU */
+		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
+			return d;
+	}
+
+	return NULL;
+}
+
+static inline struct rdt_mon_domain *
+resctrl_get_mon_domain_from_cpu(int cpu, struct rdt_resource *r)
+{
+	struct rdt_mon_domain *d;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		/* Find the domain that contains this CPU */
+		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
+			return d;
+	}
+
+	return NULL;
+}
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.39.2

