Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC3E1A3166
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952367; cv=none; b=qfQoFfH3klSrxz1rs8o5rAPF+Ltn6+fFYIJ3vSdY4L731edFWXSwOeog27QYq5LpzTe7Q4QxFV8Td4LA9r2CKkP6inNTJNMFoc5S0KnMRTFGDlrqSRZIFpZZsP27lC8bOMnmAJfP6bmCaa9iWPcxu0pECT8Jt1qqsjkypGM8rKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952367; c=relaxed/simple;
	bh=bvp5ix4uCN3Fy6P24qZytjBrEO7AlC/mADMSnaOtKsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sm2qAr0heTciS522UaQzRtxww7IJY8dEfMvUcFCxUdeKJ6wK3MHCPkM+MLPpz4XW7yQKl2HxjAt1SL5QD9WIkJK6E7cr0e4aeVT21Ue2QQFOlDK2YmYMTsVd+Oyrs6pe03Wg76N1XhHDxvMNRR48kIOzR7+VvPCLzojBh6PiaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CE991DB5;
	Fri,  7 Feb 2025 10:19:48 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65B5E3F63F;
	Fri,  7 Feb 2025 10:19:22 -0800 (PST)
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
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH v6 12/42] x86/resctrl: Move rdt_find_domain() to be visible to arch and fs code
Date: Fri,  7 Feb 2025 18:17:53 +0000
Message-Id: <20250207181823.6378-13-james.morse@arm.com>
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

rdt_find_domain() finds a domain given a resource and a cache-id.
This is used by both the architecture code and the filesystem code.

After the filesystem code moves to live in /fs/, this helper will no
longer be visible.

Move it to the global header file. As its now globally visible, and
has only a handful of callers, swap the 'rdt' for 'resctrl'.

Signed-off-by: James Morse <james.morse@arm.com>

---
Changes since v5:
 * This patch replaced one that split off the 'new entry to insert'
   behaviour.
---
 arch/x86/kernel/cpu/resctrl/core.c        | 38 +++--------------------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |  2 --
 include/linux/resctrl.h                   | 34 ++++++++++++++++++++
 4 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 18e5f13bc4ae..49a9ac0dd96c 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -395,36 +395,6 @@ void rdt_ctrl_update(void *arg)
 	hw_res->msr_update(m);
 }
 
-/*
- * rdt_find_domain - Search for a domain id in a resource domain list.
- *
- * Search the domain list to find the domain id. If the domain id is
- * found, return the domain. NULL otherwise.  If the domain id is not
- * found (and NULL returned) then the first domain with id bigger than
- * the input id can be returned to the caller via @pos.
- */
-struct rdt_domain_hdr *rdt_find_domain(struct list_head *h, int id,
-				       struct list_head **pos)
-{
-	struct rdt_domain_hdr *d;
-	struct list_head *l;
-
-	list_for_each(l, h) {
-		d = list_entry(l, struct rdt_domain_hdr, list);
-		/* When id is found, return its domain. */
-		if (id == d->id)
-			return d;
-		/* Stop searching when finding id's position in sorted list. */
-		if (id < d->id)
-			break;
-	}
-
-	if (pos)
-		*pos = l;
-
-	return NULL;
-}
-
 static void setup_default_ctrlval(struct rdt_resource *r, u32 *dc)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -535,7 +505,7 @@ static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r)
 		return;
 	}
 
-	hdr = rdt_find_domain(&r->ctrl_domains, id, &add_pos);
+	hdr = resctrl_find_domain(&r->ctrl_domains, id, &add_pos);
 	if (hdr) {
 		if (WARN_ON_ONCE(hdr->type != RESCTRL_CTRL_DOMAIN))
 			return;
@@ -590,7 +560,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 		return;
 	}
 
-	hdr = rdt_find_domain(&r->mon_domains, id, &add_pos);
+	hdr = resctrl_find_domain(&r->mon_domains, id, &add_pos);
 	if (hdr) {
 		if (WARN_ON_ONCE(hdr->type != RESCTRL_MON_DOMAIN))
 			return;
@@ -655,7 +625,7 @@ static void domain_remove_cpu_ctrl(int cpu, struct rdt_resource *r)
 		return;
 	}
 
-	hdr = rdt_find_domain(&r->ctrl_domains, id, NULL);
+	hdr = resctrl_find_domain(&r->ctrl_domains, id, NULL);
 	if (!hdr) {
 		pr_warn("Can't find control domain for id=%d for CPU %d for resource %s\n",
 			id, cpu, r->name);
@@ -701,7 +671,7 @@ static void domain_remove_cpu_mon(int cpu, struct rdt_resource *r)
 		return;
 	}
 
-	hdr = rdt_find_domain(&r->mon_domains, id, NULL);
+	hdr = resctrl_find_domain(&r->mon_domains, id, NULL);
 	if (!hdr) {
 		pr_warn("Can't find monitor domain for id=%d for CPU %d for resource %s\n",
 			id, cpu, r->name);
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 5d87f279085f..7df98fda8a32 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -695,7 +695,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		 * This file provides data from a single domain. Search
 		 * the resource to find the domain with "domid".
 		 */
-		hdr = rdt_find_domain(&r->mon_domains, domid, NULL);
+		hdr = resctrl_find_domain(&r->mon_domains, domid, NULL);
 		if (!hdr || WARN_ON_ONCE(hdr->type != RESCTRL_MON_DOMAIN)) {
 			ret = -ENOENT;
 			goto out;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 8291f1b59981..da73404183da 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -581,8 +581,6 @@ void rdtgroup_kn_unlock(struct kernfs_node *kn);
 int rdtgroup_kn_mode_restrict(struct rdtgroup *r, const char *name);
 int rdtgroup_kn_mode_restore(struct rdtgroup *r, const char *name,
 			     umode_t mask);
-struct rdt_domain_hdr *rdt_find_domain(struct list_head *h, int id,
-				       struct list_head **pos);
 ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
 				char *buf, size_t nbytes, loff_t off);
 int rdtgroup_schemata_show(struct kernfs_open_file *of,
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b74853f224f7..6cec088ae0d9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -372,6 +372,40 @@ static inline void resctrl_arch_rmid_read_context_check(void)
 		might_sleep();
 }
 
+/**
+ * resctrl_find_domain() - Search for a domain id in a resource domain list.
+ * @h:		The domain list to search.
+ * @id:		The domain id to search for.
+ * @pos:	A pointer to position in the list id should be inserted.
+ *
+ * Search the domain list to find the domain id. If the domain id is
+ * found, return the domain. NULL otherwise.  If the domain id is not
+ * found (and NULL returned) then the first domain with id bigger than
+ * the input id can be returned to the caller via @pos.
+ */
+static inline struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h,
+							 int id,
+							 struct list_head **pos)
+{
+	struct rdt_domain_hdr *d;
+	struct list_head *l;
+
+	list_for_each(l, h) {
+		d = list_entry(l, struct rdt_domain_hdr, list);
+		/* When id is found, return its domain. */
+		if (id == d->id)
+			return d;
+		/* Stop searching when finding id's position in sorted list. */
+		if (id < d->id)
+			break;
+	}
+
+	if (pos)
+		*pos = l;
+
+	return NULL;
+}
+
 /**
  * resctrl_arch_reset_rmid() - Reset any private state associated with rmid
  *			       and eventid.
-- 
2.39.2

