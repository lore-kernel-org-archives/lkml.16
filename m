Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342320B80C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488621; cv=none; b=hoge9A6vRbCznsORO9eq4u5Ntuk6yc/r/zjgV7qTTeLZd/1IdQzZIZltbU2eaghlQUoFoXn9ykwY4YF4cyVqdDGd/d5LE+0SLyY6KQagV5in9SIlYM8p79DAxB2U1wTBLATwji/rjFAwwGEtJ5ywi0/D+z22PvIORVs53D7m5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488621; c=relaxed/simple;
	bh=qdwFTJ8C+emRKRkKXpntYbJhjqIasOPlpTsUYmO5PBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gondb+E3MYbla+UnAqLIKxno1yimF0oOKdEzRzNu6wrSojY40e1dVUrAeriBNuqvr+VXKfzJVIcHWypt4rL9/uGlBmuapWEPOf12VQ+DaWvv+bvuNjgr+OsvwFiX4v65C1M9yUwYji6oYULmBDQ2OA3hiMFopGWEj6Hi+VSs0BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MpUVV5ly; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MpUVV5ly"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748488616; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1iwzGnZDZpHDMBRvc1IZXUZ8rPjneqH+wvSHuvQPM90=;
	b=MpUVV5ly25u+CeFliwdKU1L9AUfAIHQDALajok0JkD78o+o6h6m3mtDL+aAap0Vw8GLuVL/nrisz0zSB440JOxS24YtKSQGK8t0zAeC+yYj/ylJLclEZ3hfjxy85mzAZdZa3MIymVipgTHO07lHZRDa4iq50m58ci/iOdfsxB4A=
Received: from localhost.localdomain(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcFfwzx_1748488615 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 May 2025 11:16:55 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Thu, 29 May 2025 11:16:50 +0800
Message-ID: <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
References: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
structure previously relies on the cacheinfo interface to store L3 cache
information (e.g., shared_cpu_map) for monitoring. However, this approach
introduces risks when CPUs go offline:

The ci field in rdt_mon_domain is initialized using the first online CPU
of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
to contain only the offline CPU itself. Subsequently, attempting to read
counters via smp_call_on_cpu(offline_cpu) would fail, but returning zero
values for "top-level events" without error indication.

To resolve these issues:

1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).

2. The hdr.cpu_mask maintained by resctrl constitutes a subset of
shared_cpu_map. When reading top-level events, we dynamically select a CPU
from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctrl
to determine valid CPUs for reading RMID counter via the MSR interface.

Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
---
 arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
 fs/resctrl/ctrlmondata.c           | 13 +++++++++----
 fs/resctrl/internal.h              |  4 ++--
 fs/resctrl/monitor.c               |  6 ++++--
 fs/resctrl/rdtgroup.c              |  6 +++---
 include/linux/resctrl.h            |  4 ++--
 6 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7109cbfcad4fd..187d527ef73b6 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -498,6 +498,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	struct rdt_hw_mon_domain *hw_dom;
 	struct rdt_domain_hdr *hdr;
 	struct rdt_mon_domain *d;
+	struct cacheinfo *ci;
 	int err;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -525,12 +526,13 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	d = &hw_dom->d_resctrl;
 	d->hdr.id = id;
 	d->hdr.type = RESCTRL_MON_DOMAIN;
-	d->ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
-	if (!d->ci) {
+	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+	if (!ci) {
 		pr_warn_once("Can't find L3 cache for CPU:%d resource %s\n", cpu, r->name);
 		mon_domain_free(hw_dom);
 		return;
 	}
+	d->ci_id = ci->id;
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
 	arch_mon_domain_online(r, d);
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 6ed2dfd4dbbd9..d98e0d2de09fd 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -594,9 +594,10 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 	struct rmid_read rr = {0};
 	struct rdt_mon_domain *d;
 	struct rdtgroup *rdtgrp;
+	int domid, cpu, ret = 0;
 	struct rdt_resource *r;
+	struct cacheinfo *ci;
 	struct mon_data *md;
-	int domid, ret = 0;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
 	if (!rdtgrp) {
@@ -623,10 +624,14 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		 * one that matches this cache id.
 		 */
 		list_for_each_entry(d, &r->mon_domains, hdr.list) {
-			if (d->ci->id == domid) {
-				rr.ci = d->ci;
+			if (d->ci_id == domid) {
+				rr.ci_id = d->ci_id;
+				cpu = cpumask_any(&d->hdr.cpu_mask);
+				ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+				if (!ci)
+					continue;
 				mon_event_read(&rr, r, NULL, rdtgrp,
-					       &d->ci->shared_cpu_map, evtid, false);
+					       &ci->shared_cpu_map, evtid, false);
 				goto checkresult;
 			}
 		}
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 9a8cf6f11151d..0a1eedba2b03a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -98,7 +98,7 @@ struct mon_data {
  *	   domains in @r sharing L3 @ci.id
  * @evtid: Which monitor event to read.
  * @first: Initialize MBM counter when true.
- * @ci:    Cacheinfo for L3. Only set when @d is NULL. Used when summing domains.
+ * @ci_id: Cacheinfo id for L3. Only set when @d is NULL. Used when summing domains.
  * @err:   Error encountered when reading counter.
  * @val:   Returned value of event counter. If @rgrp is a parent resource group,
  *	   @val includes the sum of event counts from its child resource groups.
@@ -112,7 +112,7 @@ struct rmid_read {
 	struct rdt_mon_domain	*d;
 	enum resctrl_event_id	evtid;
 	bool			first;
-	struct cacheinfo	*ci;
+	unsigned int		ci_id;
 	int			err;
 	u64			val;
 	void			*arch_mon_ctx;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index bde2801289d35..f5637855c3aca 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -361,6 +361,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
 	struct rdt_mon_domain *d;
+	struct cacheinfo *ci;
 	struct mbm_state *m;
 	int err, ret;
 	u64 tval = 0;
@@ -388,7 +389,8 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	}
 
 	/* Summing domains that share a cache, must be on a CPU for that cache. */
-	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
+	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
+	if (!ci || ci->id != rr->ci_id)
 		return -EINVAL;
 
 	/*
@@ -400,7 +402,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 	 */
 	ret = -EINVAL;
 	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
-		if (d->ci->id != rr->ci->id)
+		if (d->ci_id != rr->ci_id)
 			continue;
 		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
 					     rr->evtid, &tval, rr->arch_mon_ctx);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc37f58b47dd7..74b25bbb9872c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3034,7 +3034,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 	char name[32];
 
 	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
-	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
+	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
 	if (snc_mode)
 		sprintf(subname, "mon_sub_%s_%02d", r->name, d->hdr.id);
 
@@ -3059,7 +3059,7 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 		return -EPERM;
 
 	list_for_each_entry(mevt, &r->evt_list, list) {
-		domid = do_sum ? d->ci->id : d->hdr.id;
+		domid = do_sum ? d->ci_id : d->hdr.id;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
 		if (WARN_ON_ONCE(!priv))
 			return -EINVAL;
@@ -3087,7 +3087,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
-	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
+	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
 	kn = kernfs_find_and_get(parent_kn, name);
 	if (kn) {
 		/*
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 9ba771f2ddead..6fb4894b8cfd1 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -159,7 +159,7 @@ struct rdt_ctrl_domain {
 /**
  * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
  * @hdr:		common header for different domain types
- * @ci:			cache info for this domain
+ * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
  * @mbm_total:		saved state for MBM total bandwidth
  * @mbm_local:		saved state for MBM local bandwidth
@@ -170,7 +170,7 @@ struct rdt_ctrl_domain {
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
-	struct cacheinfo		*ci;
+	unsigned int			ci_id;
 	unsigned long			*rmid_busy_llc;
 	struct mbm_state		*mbm_total;
 	struct mbm_state		*mbm_local;
-- 
2.43.5

