Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F07420E003
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602767; cv=none; b=KvaDI5FIcHKlNHI9h06Ni7/JDzVVzWuA8NwMFJC43WNjuh67k1uaR+4favpMdjJKOGcqZ7sZumdxmQC7cEfXVHjItF36skkmvs4/xqwMkTHm52MDCEa3GeyrXaU4POb75OR7QZEPi0rICeziZ5CJv/Ejceay3JDo0VuhQb4qRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602767; c=relaxed/simple;
	bh=0rVWs/pQ2ECszqPKRJpMBeAD7vYvK9K4/5BsuT36QD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNZZnHByjrqlTNgUeWJxHk0rwXWZ8Nukms1vGn6bfiTh1KqiV1itQ0N0q/UpnLn+yb7X1D3/KFj7A8IHrlxy3kFjFvNmiLfpGyXdG5fwU3NggEB92yJ5D/k+1Jz/rSwc10NgA1g9rd5FlrNSw1af/CussuLTJB53aij0UJ1mPWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1618B2008;
	Fri, 25 Apr 2025 10:39:19 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64223F59E;
	Fri, 25 Apr 2025 10:39:20 -0700 (PDT)
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
	fenghuay@nvidia.com,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v9 08/27] x86/resctrl: Expand the width of domid by replacing mon_data_bits
Date: Fri, 25 Apr 2025 17:37:50 +0000
Message-Id: <20250425173809.5529-9-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
References: <20250425173809.5529-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
the domain-id, and is packed into the mon_data_bits union bitfield.
The width of cache-id in this field is 14 bits.

Expanding the union would break 32bit x86 platforms as this union is
stored as the kernfs kn->priv pointer. This saved allocating memory
for the priv data storage.

The firmware on MPAM platforms have used the PPTT cache-id field to
expose the interconnect's id for the cache, which is sparse and uses
more than 14 bits. Use of this id is to enable PCIe direct cache
injection hints. Using this feature with VFIO means the value provided
by the ACPI table should be exposed to user-space.

To support cache-id values greater than 14 bits, convert the
mon_data_bits union to a structure. These are shared between control
and monitor groups, and are allocated on first use. The list of
allocated struct mon_data is free'd when the filesystem is umount()ed.

Co-developed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
Previously the MPAM tree repainted the cache-id to compact them,
argue-ing there was no other user. With VFIO use of this PCIe feature,
this is no longer an option.

Changes since v8:
 * Removed underscore in dom_id in the patch subject.
 * Change types in struct mon_data to match the data.
 * Renamed the global list to be more descriptive.
 * Numerous comments were clarified.

Changes since v7:
 * Replaced with Tony Luck's list based version.

Changes since v6:
 * Added the get/put helpers.
 * Special case the creation of the mondata files for the default control
   group.
 * Removed wording about files living longer than expected, the corresponding
   error handling is wrapped in WARN_ON_ONCE() as this indicates a bug.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 19 ++++--
 arch/x86/kernel/cpu/resctrl/internal.h    | 39 ++++++-----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 79 +++++++++++++++++++++--
 3 files changed, 103 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 0a0ac5f6112e..159972c3fe73 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -667,7 +667,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 	u32 resid, evtid, domid;
 	struct rdtgroup *rdtgrp;
 	struct rdt_resource *r;
-	union mon_data_bits md;
+	struct mon_data *md;
 	int ret = 0;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
@@ -676,17 +676,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		goto out;
 	}
 
-	md.priv = of->kn->priv;
-	resid = md.u.rid;
-	domid = md.u.domid;
-	evtid = md.u.evtid;
+	md = of->kn->priv;
+	if (WARN_ON_ONCE(!md)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	resid = md->rid;
+	domid = md->domid;
+	evtid = md->evtid;
 	r = resctrl_arch_get_resource(resid);
 
-	if (md.u.sum) {
+	if (md->sum) {
 		/*
 		 * This file requires summing across all domains that share
 		 * the L3 cache id that was provided in the "domid" field of the
-		 * mon_data_bits union. Search all domains in the resource for
+		 * struct mon_data. Search all domains in the resource for
 		 * one that matches this cache id.
 		 */
 		list_for_each_entry(d, &r->mon_domains, hdr.list) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 36a862a4832f..954dc391fc33 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -103,27 +103,26 @@ struct mon_evt {
 };
 
 /**
- * union mon_data_bits - Monitoring details for each event file.
- * @priv:              Used to store monitoring event data in @u
- *                     as kernfs private data.
- * @u.rid:             Resource id associated with the event file.
- * @u.evtid:           Event id associated with the event file.
- * @u.sum:             Set when event must be summed across multiple
- *                     domains.
- * @u.domid:           When @u.sum is zero this is the domain to which
- *                     the event file belongs. When @sum is one this
- *                     is the id of the L3 cache that all domains to be
- *                     summed share.
- * @u:                 Name of the bit fields struct.
+ * struct mon_data - Monitoring details for each event file.
+ * @list:            Member of the global @mon_data_kn_priv_list list.
+ * @rid:             Resource id associated with the event file.
+ * @evtid:           Event id associated with the event file.
+ * @sum:             Set when event must be summed across multiple
+ *                   domains.
+ * @domid:           When @sum is zero this is the domain to which
+ *                   the event file belongs. When @sum is one this
+ *                   is the id of the L3 cache that all domains to be
+ *                   summed share.
+ *
+ * Pointed to by the kernfs kn->priv field of monitoring event files.
+ * Readers and writers must hold rdtgroup_mutex.
  */
-union mon_data_bits {
-	void *priv;
-	struct {
-		unsigned int rid		: 10;
-		enum resctrl_event_id evtid	: 7;
-		unsigned int sum		: 1;
-		unsigned int domid		: 14;
-	} u;
+struct mon_data {
+	struct list_head	list;
+	enum resctrl_res_level	rid;
+	enum resctrl_event_id	evtid;
+	int			domid;
+	bool			sum;
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index eccdfcb1a6f5..7ef5cf0c4d1d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
 /* list of entries for the schemata file */
 LIST_HEAD(resctrl_schema_all);
 
+/*
+ * List of struct mon_data containing private data of event files for use by
+ * rdtgroup_mondata_show(). Protected by rdtgroup_mutex.
+ */
+static LIST_HEAD(mon_data_kn_priv_list);
+
 /* The filesystem can only be mounted once. */
 bool resctrl_mounted;
 
@@ -3093,6 +3099,63 @@ static void rmdir_all_sub(void)
 	kernfs_remove(kn_mondata);
 }
 
+/**
+ * mon_get_kn_priv() - Get the mon_data priv data for this event.
+ *
+ * The same values are used across the mon_data directories of all control and
+ * monitor groups for the same event in the same domain. Keep a list of
+ * allocated structures and re-use an existing one with the same values for
+ * @rid, @domid, etc.
+ *
+ * @rid:    The resource id for the event file being created.
+ * @domid:  The domain id for the event file being created.
+ * @mevt:   The type of event file being created.
+ * @do_sum: Whether SNC summing monitors are being created.
+ */
+static struct mon_data *mon_get_kn_priv(int rid, int domid,
+					struct mon_evt *mevt,
+					bool do_sum)
+{
+	struct mon_data *priv;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	list_for_each_entry(priv, &mon_data_kn_priv_list, list) {
+		if (priv->rid == rid && priv->domid == domid &&
+		    priv->sum == do_sum && priv->evtid == mevt->evtid)
+			return priv;
+	}
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return NULL;
+
+	priv->rid = rid;
+	priv->domid = domid;
+	priv->sum = do_sum;
+	priv->evtid = mevt->evtid;
+	list_add_tail(&priv->list, &mon_data_kn_priv_list);
+
+	return priv;
+}
+
+/**
+ * mon_put_kn_priv() - Free all allocated mon_data structures.
+ *
+ * Called when resctrl file system is unmounted.
+ */
+static void mon_put_kn_priv(void)
+{
+	struct mon_data *priv, *tmp;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	list_for_each_entry_safe(priv, tmp, &mon_data_kn_priv_list, list) {
+		list_del(&priv->list);
+		kfree(priv);
+	}
+}
+
 static void resctrl_fs_teardown(void)
 {
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -3102,6 +3165,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
 	closid_exit();
@@ -3208,19 +3272,20 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 			     bool do_sum)
 {
 	struct rmid_read rr = {0};
-	union mon_data_bits priv;
+	struct mon_data *priv;
 	struct mon_evt *mevt;
-	int ret;
+	int ret, domid;
 
 	if (WARN_ON(list_empty(&r->evt_list)))
 		return -EPERM;
 
-	priv.u.rid = r->rid;
-	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
-	priv.u.sum = do_sum;
 	list_for_each_entry(mevt, &r->evt_list, list) {
-		priv.u.evtid = mevt->evtid;
-		ret = mon_addfile(kn, mevt->name, priv.priv);
+		domid = do_sum ? d->ci->id : d->hdr.id;
+		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
+		if (WARN_ON_ONCE(!priv))
+			return -EINVAL;
+
+		ret = mon_addfile(kn, mevt->name, priv);
 		if (ret)
 			return ret;
 
-- 
2.39.5

