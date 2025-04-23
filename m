Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EA263F5E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377795; cv=none; b=T9IguwmpiE5wKJDnvczeeQfPqdKvXtOBjSNGan4WaTkaXEbZ/TVDQC/+ds4dmfWEGfQpM4eRMLCCQuMHaPLC0NitqYl/qUUYdbhDfQxT9EIxVOQxHvY3dGKtQorigQODXD0F0PgdYPsTzsU3IJQWrIvznimrCokZzTQ/L/P63VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377795; c=relaxed/simple;
	bh=oTpsehoZbXy0jXsOZr3vLVODxh7wFFjRuhGAMhkosps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkufbvhGnRT4Oj3rNr4nFpGbm83+iHDoHzKNRLOD3hx9jGFnkfl1R7Uo+LmermUpSWpd+WHVOLPVSJ5ZuwhvlYduCLZPH1T7tkQn0nMvUKjPilAH8yHcstXkRqYYxyRockpTYm1d49ld0NFbbYnaLUCoNARAmuiczwR3cQdxuAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kh2gj0B8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kh2gj0B8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745377794; x=1776913794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTpsehoZbXy0jXsOZr3vLVODxh7wFFjRuhGAMhkosps=;
  b=kh2gj0B8o8QIJI8MxVvsx9ecE6KU+w2VNHLtr7XsQUjVcxZt2R7vRDjY
   oweixX+xcVYmoFh9XeJy9qOjmVTNsE+qEwYhnkL0RtNUsuYgPCPJSoyBf
   EzWiUiGiar5MdXeQPvZfTdIc+q+oZ55A+iXa03z7XVcZDYue1/IezUF2B
   ODDkZsgqH0bIXSfpSfEDphxdqI2h2MbMluGuIiCCd6vQX6utsV41JZ3id
   iviCWo27s9YkA/xEdeNHdHW8XNAHlaoB0dk/RWlOs1DrKgkbEvWoDaJcr
   XjrD+QrRJ7lWJSUFV5EYZzRAYL12l1YmRcAWr8cbEIykrNQYuJBtoL1Oe
   g==;
X-CSE-ConnectionGUID: kg/sRbGUQYyLvxqJT0Yu/Q==
X-CSE-MsgGUID: wIu0Bdk8SqGvQjSpuMoLwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57145937"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="57145937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 20:09:53 -0700
X-CSE-ConnectionGUID: rGduN7WgRFO7X7xDBQNulw==
X-CSE-MsgGUID: b7I9iVkKQPKG4fAmwcBMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="155398698"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2025 20:09:51 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 1/3] iommu/vt-d: Use ida to manage domain id
Date: Wed, 23 Apr 2025 11:10:18 +0800
Message-ID: <20250423031020.2189546-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423031020.2189546-1-baolu.lu@linux.intel.com>
References: <20250423031020.2189546-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the intel iommu driver to use the ida mechanism for managing domain
IDs, replacing the previous fixed-size bitmap.

The previous approach allocated a bitmap large enough to cover the maximum
number of domain IDs supported by the hardware, regardless of the actual
number of domains in use. This led to unnecessary memory consumption,
especially on systems supporting a large number of iommu units but only
utilizing a small number of domain IDs.

The ida allocator dynamically manages the allocation and freeing of integer
IDs, only consuming memory for the IDs that are currently in use. This
significantly optimizes memory usage compared to the fixed-size bitmap.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/dmar.c  |  2 +
 drivers/iommu/intel/iommu.c | 80 ++++++++-----------------------------
 drivers/iommu/intel/iommu.h | 18 +++++++--
 3 files changed, 33 insertions(+), 67 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index e540092d664d..0afba7434a5c 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1099,6 +1099,8 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
 	spin_lock_init(&iommu->device_rbtree_lock);
 	mutex_init(&iommu->iopf_lock);
 	iommu->node = NUMA_NO_NODE;
+	spin_lock_init(&iommu->lock);
+	ida_init(&iommu->domain_ida);
 
 	ver = readl(iommu->reg + DMAR_VER_REG);
 	pr_info("%s: reg_base_addr %llx ver %d:%d cap %llx ecap %llx\n",
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index b29da2d96d0b..76e170922149 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1289,52 +1289,13 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
 	raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
 }
 
-static int iommu_init_domains(struct intel_iommu *iommu)
-{
-	u32 ndomains;
-
-	ndomains = cap_ndoms(iommu->cap);
-	pr_debug("%s: Number of Domains supported <%d>\n",
-		 iommu->name, ndomains);
-
-	spin_lock_init(&iommu->lock);
-
-	iommu->domain_ids = bitmap_zalloc(ndomains, GFP_KERNEL);
-	if (!iommu->domain_ids)
-		return -ENOMEM;
-
-	/*
-	 * If Caching mode is set, then invalid translations are tagged
-	 * with domain-id 0, hence we need to pre-allocate it. We also
-	 * use domain-id 0 as a marker for non-allocated domain-id, so
-	 * make sure it is not used for a real domain.
-	 */
-	set_bit(0, iommu->domain_ids);
-
-	/*
-	 * Vt-d spec rev3.0 (section 6.2.3.1) requires that each pasid
-	 * entry for first-level or pass-through translation modes should
-	 * be programmed with a domain id different from those used for
-	 * second-level or nested translation. We reserve a domain id for
-	 * this purpose. This domain id is also used for identity domain
-	 * in legacy mode.
-	 */
-	set_bit(FLPT_DEFAULT_DID, iommu->domain_ids);
-
-	return 0;
-}
-
 static void disable_dmar_iommu(struct intel_iommu *iommu)
 {
-	if (!iommu->domain_ids)
-		return;
-
 	/*
 	 * All iommu domains must have been detached from the devices,
 	 * hence there should be no domain IDs in use.
 	 */
-	if (WARN_ON(bitmap_weight(iommu->domain_ids, cap_ndoms(iommu->cap))
-		    > NUM_RESERVED_DID))
+	if (WARN_ON(!ida_is_empty(&iommu->domain_ida)))
 		return;
 
 	if (iommu->gcmd & DMA_GCMD_TE)
@@ -1343,10 +1304,7 @@ static void disable_dmar_iommu(struct intel_iommu *iommu)
 
 static void free_dmar_iommu(struct intel_iommu *iommu)
 {
-	if (iommu->domain_ids) {
-		bitmap_free(iommu->domain_ids);
-		iommu->domain_ids = NULL;
-	}
+	ida_destroy(&iommu->domain_ida);
 
 	if (iommu->copied_tables) {
 		bitmap_free(iommu->copied_tables);
@@ -1380,7 +1338,6 @@ static bool first_level_by_default(struct intel_iommu *iommu)
 int domain_attach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 {
 	struct iommu_domain_info *info, *curr;
-	unsigned long ndomains;
 	int num, ret = -ENOSPC;
 
 	if (domain->domain.type == IOMMU_DOMAIN_SVA)
@@ -1399,14 +1356,13 @@ int domain_attach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 		return 0;
 	}
 
-	ndomains = cap_ndoms(iommu->cap);
-	num = find_first_zero_bit(iommu->domain_ids, ndomains);
-	if (num >= ndomains) {
+	num = ida_alloc_range(&iommu->domain_ida, FLPT_DEFAULT_DID + 1,
+			      cap_ndoms(iommu->cap) - 1, GFP_ATOMIC);
+	if (num < 0) {
 		pr_err("%s: No free domain ids\n", iommu->name);
 		goto err_unlock;
 	}
 
-	set_bit(num, iommu->domain_ids);
 	info->refcnt	= 1;
 	info->did	= num;
 	info->iommu	= iommu;
@@ -1421,7 +1377,7 @@ int domain_attach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 	return 0;
 
 err_clear:
-	clear_bit(info->did, iommu->domain_ids);
+	ida_free(&iommu->domain_ida, info->did);
 err_unlock:
 	spin_unlock(&iommu->lock);
 	kfree(info);
@@ -1438,7 +1394,7 @@ void domain_detach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 	spin_lock(&iommu->lock);
 	info = xa_load(&domain->iommu_array, iommu->seq_id);
 	if (--info->refcnt == 0) {
-		clear_bit(info->did, iommu->domain_ids);
+		ida_free(&iommu->domain_ida, info->did);
 		xa_erase(&domain->iommu_array, iommu->seq_id);
 		domain->nid = NUMA_NO_NODE;
 		kfree(info);
@@ -2042,7 +1998,7 @@ static int copy_context_table(struct intel_iommu *iommu,
 
 		did = context_domain_id(&ce);
 		if (did >= 0 && did < cap_ndoms(iommu->cap))
-			set_bit(did, iommu->domain_ids);
+			ida_alloc_range(&iommu->domain_ida, did, did + 1, GFP_KERNEL);
 
 		set_context_copied(iommu, bus, devfn);
 		new_ce[idx] = ce;
@@ -2169,11 +2125,6 @@ static int __init init_dmars(void)
 		}
 
 		intel_iommu_init_qi(iommu);
-
-		ret = iommu_init_domains(iommu);
-		if (ret)
-			goto free_iommu;
-
 		init_translation_status(iommu);
 
 		if (translation_pre_enabled(iommu) && !is_kdump_kernel()) {
@@ -2651,9 +2602,7 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	if (iommu->gcmd & DMA_GCMD_TE)
 		iommu_disable_translation(iommu);
 
-	ret = iommu_init_domains(iommu);
-	if (ret == 0)
-		ret = iommu_alloc_root_entry(iommu);
+	ret = iommu_alloc_root_entry(iommu);
 	if (ret)
 		goto out;
 
@@ -2972,9 +2921,14 @@ static ssize_t domains_used_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
-	return sysfs_emit(buf, "%d\n",
-			  bitmap_weight(iommu->domain_ids,
-					cap_ndoms(iommu->cap)));
+	unsigned int count = 0;
+	int id;
+
+	for (id = 0; id < cap_ndoms(iommu->cap); id++)
+		if (ida_exists(&iommu->domain_ida, id))
+			count++;
+
+	return sysfs_emit(buf, "%d\n", count);
 }
 static DEVICE_ATTR_RO(domains_used);
 
diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index c4916886da5a..993232292400 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -722,7 +722,7 @@ struct intel_iommu {
 	unsigned char	name[16];    /* Device Name */
 
 #ifdef CONFIG_INTEL_IOMMU
-	unsigned long 	*domain_ids; /* bitmap of domains */
+	struct ida	domain_ida; /* domain id allocator */
 	unsigned long	*copied_tables; /* bitmap of copied tables */
 	spinlock_t	lock; /* protect context, domain ids */
 	struct root_entry *root_entry; /* virtual address */
@@ -809,11 +809,21 @@ static inline struct dmar_domain *to_dmar_domain(struct iommu_domain *dom)
 }
 
 /*
- * Domain ID reserved for pasid entries programmed for first-level
- * only and pass-through transfer modes.
+ * Domain ID 0 and 1 are reserved:
+ *
+ * If Caching mode is set, then invalid translations are tagged
+ * with domain-id 0, hence we need to pre-allocate it. We also
+ * use domain-id 0 as a marker for non-allocated domain-id, so
+ * make sure it is not used for a real domain.
+ *
+ * Vt-d spec rev3.0 (section 6.2.3.1) requires that each pasid
+ * entry for first-level or pass-through translation modes should
+ * be programmed with a domain id different from those used for
+ * second-level or nested translation. We reserve a domain id for
+ * this purpose. This domain id is also used for identity domain
+ * in legacy mode.
  */
 #define FLPT_DEFAULT_DID		1
-#define NUM_RESERVED_DID		2
 
 /* Retrieve the domain ID which has allocated to the domain */
 static inline u16
-- 
2.43.0

