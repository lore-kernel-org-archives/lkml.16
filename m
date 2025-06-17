Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE10227E8A;
	Tue, 17 Jun 2025 01:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124463; cv=none; b=mB4pS4xuGfe0jwrrPAFeCW8D5F0Yk6lGCBLnM2w+DuB+HzMPl5iJlytOsP0QoswKBXMRIbDHzQIBJsxcrnchkQZgvL52GZMnmtaMb8HtJEK69ayCIpxCttxUzmeNFZKaaGSkox6xgpLgLQo/XveWomh/mk0FC8T2MUAPF88T6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124463; c=relaxed/simple;
	bh=m2l8Mvkwxol2XII3TQEDDK6eSVi4a5JUS9SmoO9xPoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiiymdSytObygqBIMivdGVkYuqVuWjMa5MpAAkhKx3XhktIyWgOp+FyIpW7ixcLVjPcjNnod9peJV5fr7eqvIyfJqxLOamQD1WekbGdHa16s89iZeWgE6u0sLNCRbSMk55qBpQWk7lFN2aaUtT6dinJIBgDaozK+C62MsPbl204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFMfQgn4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFMfQgn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124462; x=1781660462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m2l8Mvkwxol2XII3TQEDDK6eSVi4a5JUS9SmoO9xPoY=;
  b=gFMfQgn4SiVdfHK1wIP6eFyBAWkYOdBJBDOFTfy0bgYscD6I02K7dhbs
   x2aFA9dIC/9e2C0+ALABLzKSmPLldfpMIacPyb25BvtEn/sTMpQRKNPpQ
   H54wG90XZOA7jM7I+kLRzqXx1m3JBRaeFsEbmqX2FtjcRG1oMnByXKi20
   qt3xZNILVHKCm1qzZic+WLHW7Uapw3YBLwIFFMd5M8kOT61eJyswuPgCH
   UdD/+GFZy/j+crE8rp4eMUibKZN5nmeDt+ZqBn5kNb9lPAhUJS2cBJQpU
   ENQekGyyaYy8HfDXLQR45pFHlFj+cH4jxrHZI3NogLAs4AJXe0ZdrhWzX
   g==;
X-CSE-ConnectionGUID: 6SjKKy84SfGJkCbytLZn8g==
X-CSE-MsgGUID: FNWaC9JvQRuUc3zq/r1TSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556594"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:56 -0700
X-CSE-ConnectionGUID: BjtvJm0ESDCV/k6ux+LbNQ==
X-CSE-MsgGUID: xslwwxxnRNyOb2MWKzs0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989517"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:55 -0700
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
Subject: [PATCH V2] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature
Date: Mon, 16 Jun 2025 18:40:38 -0700
Message-ID: <20250617014041.2861032-15-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
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
index f63e67398a8e..0d127d3a18b3 100644
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
@@ -220,4 +221,21 @@ static inline struct oobmsm_plat_info *intel_vsec_get_=
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

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: b38c42e1e0ad4a9d7c2bad26bafc44e4710b221e
prerequisite-patch-id: 8c78f389183292e444aea2450bbd9c49cbd2b276
prerequisite-patch-id: cde36b6a28c7c6b8fce58aecfef7f442ff6d1e50
prerequisite-patch-id: 0657fb342c016c1aa47501c17a69e78178371c02
prerequisite-patch-id: a9d8e0500e5eda1146a3203d70375ae2b2b25a9d
prerequisite-patch-id: c8b1a9d4e48c13353cc41b815b69141118b3d457
prerequisite-patch-id: 6f676b5e6d90b87fb8e39154998cc06f0cd99914
prerequisite-patch-id: 4aa05c3ad0e61fe133ee82d84831a451ec551f5d
prerequisite-patch-id: d92f2986c580d720420a371923f788265d22dc02
prerequisite-patch-id: f281f452c8cdc2545abc881f4761a79b633b2847
prerequisite-patch-id: 01215266d8d3e0450ed991feb1d17a9b54ed771b
prerequisite-patch-id: ee9f8ca9f1357aebd5f240a1b089be1f0e3258e9
prerequisite-patch-id: 82ee7c3801bca82569d1cf8febcab7ded56e5bd1
--=20
2.43.0

