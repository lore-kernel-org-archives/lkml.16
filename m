Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47FD2D29D1;
	Wed, 30 Apr 2025 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048088; cv=none; b=pi2rMfzsHa8oTgjRShGnqO9xRXfEUWFMRpBtJTA7v5qdkmZSSZxxP4vQjxwoWYhIIpIUa+dF25QP7v2nx8vLOvMKAaJTYSzZPzlJoYCWSPDanfnFkYVsXrBgsHjjp8PLGtefI0bliH7QTA0z/+A5u4+PEx52birTzgIxiZpE0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048088; c=relaxed/simple;
	bh=S7X9Lo3bhqlfGZaVzZxaMlrW5Z1rfRp6vKl8cRpde1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEgooUM8KbrsjuO27unHp2xZQAEYEHEsNcm47wlhqV/ws7xxp5jZelwxQZOoep7fo07CTg3yNK2u4z8BJmrIp28MOFXsfIPcfbRzw7umCfBvNLXStMQsjGyfebMsJqGC+2EyR8vsX6Og2e/qT04CylCj9ye3YcY37DmX83jNZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7577Lwv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7577Lwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048087; x=1777584087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S7X9Lo3bhqlfGZaVzZxaMlrW5Z1rfRp6vKl8cRpde1M=;
  b=E7577LwvtiK5u7SXt8CaNEvUdJIHwCF9kRN8JgERpGaUytVAxR2Y6DB6
   IVecKIdAbe8ZOmH0kaC6rY73AwGlGWZCb1iT0AISeZcI8vHlIuyKsZmP1
   pINtkMwa8cO1ZdqekuAyyNssqV+Qv67H2UHewPUlmLoRsHruaVTLHAXZo
   QJmeaEAznA7d+Ie5XllTo+As2tTPpvqAmTRQ1FejEuovFk6usNWGp0KMS
   0cxv9ZgeTMCHqFq/Q5WCvhTMIZymV+c/WDCeTbRtlMVxZBuQEdJLfGw5e
   0twMCgahwD/lwwkZIPPJAyFoVIpG4Y3o7TJdvnXfmGkGgXtDYJ5IdgQBu
   g==;
X-CSE-ConnectionGUID: Cp0I3vPVRgqVJZU4dSbCfg==
X-CSE-MsgGUID: i1lwGtHFTy20BTORVbFUxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257558"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:18 -0700
X-CSE-ConnectionGUID: XG/RkU3qR+G5up4fyTFQAQ==
X-CSE-MsgGUID: rutZkDxrTG+Md5jx7DReKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972313"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:18 -0700
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
Subject: [PATCH 14/15] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature
Date: Wed, 30 Apr 2025 14:21:03 -0700
Message-ID: <20250430212106.369208-15-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/pmt/telemetry.c | 89 +++++++++++++++++++++-
 include/linux/intel_vsec.h                 | 15 ++++
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index 58d06749e417..d071dca4a689 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -9,16 +9,20 @@
  */
=20
 #include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
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
@@ -209,6 +213,88 @@ int pmt_telem_get_endpoint_info(int devid, struct tele=
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
+	struct pmt_feature_group *feature_group;
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
+		if (ret) {
+			kfree(feature_group);
+			return ERR_PTR(ret);
+		}
+		region++;
+	}
+
+	kref_init(&feature_group->kref);
+
+	return feature_group;
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
index f63e67398a8e..f41d2ec974fd 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -220,4 +220,19 @@ static inline struct oobmsm_plat_info *intel_vsec_get_=
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
+{ return ERR_PTR(-ENODEV); }
+
+static inline void
+intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
+#endif
+
 #endif
--=20
2.43.0

