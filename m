Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8F23AE93;
	Thu,  3 Jul 2025 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509732; cv=none; b=RyT4WQ01cDmBawE8wO49NAsCvwGPe+jwuUHYTes6sBeC8wdmrhTsr2EIo33B9opu5bHtpjAbrumXHja3R+5Md37cIYSywXnnvMYJx0DH1aIOl9R7Sg1P636bIluLKRPYwT9+zZ6u12w4sm2Mkc9+YriZqj7cRLsSGw7wg0hUbzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509732; c=relaxed/simple;
	bh=5ZWE++Ke99wbluQ8Fdi4CnKqeDW2clEBi0u2ENEm/CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1GJqzrv5EnCATLBpdnkFKinaJBt83TXcreCkHxISR68Iq7OwNnuqXi29k785+BwnPrHWdAjEAApd242cBNxlYd5TPcPNapBUWnRGxs9AVSRbLEYLa2rXg2OCHMfGY6KMm+6Iv+4RjmbsJdHHdM/mc9gnKNXQOEdxi22jLNjHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zqr0TibH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zqr0TibH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509731; x=1783045731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ZWE++Ke99wbluQ8Fdi4CnKqeDW2clEBi0u2ENEm/CY=;
  b=Zqr0TibHoA6AqJ40EwRf5n148eYJ32mzMxlRl6Tsv6OC4m86CTCfNUD+
   FGjNwbeOguGKTztwXnExLkr53JeeqmAeLeE5Dx88b1rL+3gX/Jtc099y4
   tWaWldvwOy6c17Ra/lycbnL0DO+g55fHf1jIrDT7xh+OvQ/hnfCoRpzNm
   4F/bBAF6aKjBWrfdl99is/G50mkZRe8LxfoCpwrdDcDgNeyEYsk6ChdOZ
   moSumXlmOEz4BCr+lTDZWpF8rItIref57K5j0qclRbnHmwKnXeyTk+Nox
   g0VvTbUt/bmI8nSKd6Kms6kVBpNaUKynvVZ/mDf4w8N5l1A0yPab+LEA6
   g==;
X-CSE-ConnectionGUID: 3y1D0PcpQLyes5/XsnWiQg==
X-CSE-MsgGUID: esyJZ7U1QjaZ0NZ/rXcESw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450259"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:45 -0700
X-CSE-ConnectionGUID: 62TGK0E5RF2eNRD00VayhA==
X-CSE-MsgGUID: icDs8HHpS5S+PVQxf4YQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594085"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH V3 14/15] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature
Date: Wed,  2 Jul 2025 19:28:29 -0700
Message-ID: <20250703022832.1302928-15-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Introduce a new API, intel_pmt_get_regions_by_feature(), that gathers
telemetry regions based on a provided capability flag. This API enables
retrieval of regions with various capabilities (for example, RMID-based
telemetry) and provides a unified interface for accessing them. Resource
management is handled via reference counting using
intel_pmt_put_feature_group().

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - In pmt_telem_get_endpoint_info() use __free() for feature_group
  - Add missing header for ERR_PTR()
  - Split static inline function into multiple lines

 drivers/platform/x86/intel/pmt/telemetry.c | 89 +++++++++++++++++++++-
 include/linux/intel_vsec.h                 | 18 +++++
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index 58d06749e417..a4dfca6cac19 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -9,16 +9,21 @@
  */
=20
 #include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/intel_pmt_features.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
-#include <linux/overflow.h>
+#include <linux/xarray.h>
=20
 #include "class.h"
=20
@@ -209,6 +214,87 @@ int pmt_telem_get_endpoint_info(int devid, struct tele=
m_endpoint_info *info)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, "INTEL_PMT_TELEMETRY");
=20
+static int pmt_copy_region(struct telemetry_region *region,
+			   struct intel_pmt_entry *entry)
+{
+
+	struct oobmsm_plat_info *plat_info;
+
+	plat_info =3D intel_vsec_get_mapping(entry->ep->pcidev);
+	if (IS_ERR(plat_info))
+		return PTR_ERR(plat_info);
+
+	region->plat_info =3D *plat_info;
+	region->guid =3D entry->guid;
+	region->addr =3D entry->ep->base;
+	region->size =3D entry->size;
+	region->num_rmids =3D entry->num_rmids;
+
+	return 0;
+}
+
+static void pmt_feature_group_release(struct kref *kref)
+{
+	struct pmt_feature_group *feature_group;
+
+	feature_group =3D container_of(kref, struct pmt_feature_group, kref);
+	kfree(feature_group);
+}
+
+struct pmt_feature_group *intel_pmt_get_regions_by_feature(enum pmt_featur=
e_id id)
+{
+	struct pmt_feature_group *feature_group __free(kfree) =3D NULL;
+	struct telemetry_region *region;
+	struct intel_pmt_entry *entry;
+	unsigned long idx;
+	int count =3D 0;
+	size_t size;
+
+	if (!pmt_feature_id_is_valid(id))
+		return ERR_PTR(-EINVAL);
+
+	guard(mutex)(&ep_lock);
+	xa_for_each(&telem_array, idx, entry) {
+		if (entry->feature_flags & BIT(id))
+			count++;
+	}
+
+	if (!count)
+		return ERR_PTR(-ENOENT);
+
+	size =3D struct_size(feature_group, regions, count);
+	feature_group =3D kzalloc(size, GFP_KERNEL);
+	if (!feature_group)
+		return ERR_PTR(-ENOMEM);
+
+	feature_group->count =3D count;
+
+	region =3D feature_group->regions;
+	xa_for_each(&telem_array, idx, entry) {
+		int ret;
+
+		if (!(entry->feature_flags & BIT(id)))
+			continue;
+
+		ret =3D pmt_copy_region(region, entry);
+		if (ret)
+			return ERR_PTR(ret);
+
+		region++;
+	}
+
+	kref_init(&feature_group->kref);
+
+	return no_free_ptr(feature_group);
+}
+EXPORT_SYMBOL(intel_pmt_get_regions_by_feature);
+
+void intel_pmt_put_feature_group(struct pmt_feature_group *feature_group)
+{
+	kref_put(&feature_group->kref, pmt_feature_group_release);
+}
+EXPORT_SYMBOL(intel_pmt_put_feature_group);
+
 int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 {
 	u32 offset, size;
@@ -353,3 +439,4 @@ MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.co=
m>");
 MODULE_DESCRIPTION("Intel PMT Telemetry driver");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS("INTEL_PMT");
+MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index f185e9c01c90..53f6fe88e369 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -4,6 +4,7 @@
=20
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
+#include <linux/err.h>
 #include <linux/intel_pmt_features.h>
=20
 /*
@@ -218,4 +219,21 @@ static inline struct oobmsm_plat_info *intel_vsec_get_=
mapping(struct pci_dev *pd
 	return ERR_PTR(-ENODEV);
 }
 #endif
+
+#if IS_ENABLED(CONFIG_INTEL_PMT_TELEMETRY)
+struct pmt_feature_group *
+intel_pmt_get_regions_by_feature(enum pmt_feature_id id);
+
+void intel_pmt_put_feature_group(struct pmt_feature_group *feature_group);
+#else
+static inline struct pmt_feature_group *
+intel_pmt_get_regions_by_feature(enum pmt_feature_id id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void
+intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
+#endif
+
 #endif
--=20
2.43.0

