Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EC11A3169
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952462; cv=none; b=LLylk3PWRPJrH2GUBawAZTaPPsfttuLS+O6Zar9pld1GJiLsy2QAbRfLZ5TtoI1+olw6SvJohnN4w9YuT1fYHtfcl92vUEhDTnwZDwdD6yt6l0ObSr5NUCNPu+MSeIBfEl2fZGSVE22I2Rsro2XiFb8Zw0zxNhQCgfVZtWfpdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952462; c=relaxed/simple;
	bh=VUGleMK/+xJz8gRtemupv1FyMZPafNGNqgh//LzM7rI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WGPR+KcdSFJIBspXDcEK5AFhNLyE21HrbMFSzrw2cUQmyfb0zl4J53VuW7bwrNILfyMzy8wlMGRtVCfRJ1Dems4qk2hgBG2iFBdpKu8H+IidRhSowZIFJzLpTujw5f9JJ+swDiQenBXwfNovJI5eHYTjlikK60fht7hc4ZkBiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67CC31F02;
	Fri,  7 Feb 2025 10:21:16 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F8743F63F;
	Fri,  7 Feb 2025 10:20:50 -0800 (PST)
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
Subject: [PATCH v6 37/42] x86/restrl: Expand the width of dom_id by replacing mon_data_bits
Date: Fri,  7 Feb 2025 18:18:18 +0000
Message-Id: <20250207181823.6378-38-james.morse@arm.com>
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
mon_data_bits union to a structure. This is allocated when the kernfs
file is created, and free'd when the monitor directory is rmdir'd.
Readers and writers must hold the rdtgroup_mutex, and readers should
check for a NULL pointer to protect against an open file preventing
the kernfs file from being free'd immediately after the rmdir call.

Signed-off-by: James Morse <james.morse@arm.com>
---
Previously the MPAM tree repainted the cache-id to compact them,
argue-ing there was no other user. With VFIO use of this PCIe feature,
this is no longer an option:
http://inbox.dpdk.org/dev/PH7PR12MB8596BF09963460CEAE17582E82522@PH7PR12MB8596.namprd12.prod.outlook.com/
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 19 +++++++-----
 arch/x86/kernel/cpu/resctrl/internal.h    | 37 +++++++++++------------
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 28 ++++++++++++-----
 3 files changed, 50 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 032a585293af..0b475e274483 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -645,7 +645,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 	u32 resid, evtid, domid;
 	struct rdtgroup *rdtgrp;
 	struct rdt_resource *r;
-	union mon_data_bits md;
+	struct mon_data *md;
 	int ret = 0;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
@@ -654,17 +654,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		goto out;
 	}
 
-	md.priv = of->kn->priv;
-	resid = md.u.rid;
-	domid = md.u.domid;
-	evtid = md.u.evtid;
+	md = of->kn->priv;
+	if (!md) {
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
index 32ed9aeffb90..16c1a391d012 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -103,27 +103,24 @@ struct mon_evt {
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
+ * @rid:             Resource id associated with the event file.
+ * @evtid:           Event id associated with the event file.
+ * @sum:             Set when event must be summed across multiple
+ *                   domains.
+ * @domid:           When @sum is zero this is the domain to which
+ *                   the event file belongs. When @sum is one this
+ *                   is the id of the L3 cache that all domains to be
+ *                   summed share.
+ *
+ * Stored in the kernfs kn->priv field, readers and writers must hold
+ * rdtgroup_mutex.
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
+	unsigned int rid;
+	enum resctrl_event_id evtid;
+	unsigned int sum;
+	unsigned int domid;
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6832ae603db3..abebe01447ba 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -3113,11 +3113,19 @@ static struct file_system_type rdt_fs_type = {
 };
 
 static int mon_addfile(struct kernfs_node *parent_kn, const char *name,
-		       void *priv)
+		       struct mon_data *_priv)
 {
 	struct kernfs_node *kn;
+	struct mon_data *priv;
 	int ret = 0;
 
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	memcpy(priv, _priv, sizeof(*priv));
+
 	kn = __kernfs_create_file(parent_kn, name, 0444,
 				  GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, 0,
 				  &kf_mondata_ops, priv, NULL, NULL);
@@ -3137,9 +3145,15 @@ static void mon_rmdir_one_subdir(struct kernfs_node *pkn, char *name, char *subn
 {
 	struct kernfs_node *kn;
 
+	lockdep_assert_held(&rdtgroup_mutex);
+
 	kn = kernfs_find_and_get(pkn, name);
 	if (!kn)
 		return;
+
+	kfree(kn->priv);
+	kn->priv = NULL;
+
 	kernfs_put(kn);
 
 	if (kn->dir.subdirs <= 1)
@@ -3180,19 +3194,19 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 			     bool do_sum)
 {
 	struct rmid_read rr = {0};
-	union mon_data_bits priv;
+	struct mon_data priv;
 	struct mon_evt *mevt;
 	int ret;
 
 	if (WARN_ON(list_empty(&r->evt_list)))
 		return -EPERM;
 
-	priv.u.rid = r->rid;
-	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
-	priv.u.sum = do_sum;
+	priv.rid = r->rid;
+	priv.domid = do_sum ? d->ci->id : d->hdr.id;
+	priv.sum = do_sum;
 	list_for_each_entry(mevt, &r->evt_list, list) {
-		priv.u.evtid = mevt->evtid;
-		ret = mon_addfile(kn, mevt->name, priv.priv);
+		priv.evtid = mevt->evtid;
+		ret = mon_addfile(kn, mevt->name, &priv);
 		if (ret)
 			return ret;
 
-- 
2.39.2

