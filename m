Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FB21767C;
	Tue, 17 Jun 2025 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124462; cv=none; b=aCy6M6sCTnIymjupfn1Rp4yxj2nREyHhH0OT5ZPJyEJjrGcmUXNTB+2UA798OaPoqxd0haBVRFjTjKKtSQlFHpcFvjs/M/CFmmsEmQ0bc6VkDW4JdsUK5/U1c3WyCGKcnmC3PJphFIFyEM5gYpwctyTrz1cd0PDiaZ1QpcrwZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124462; c=relaxed/simple;
	bh=WnK/bfoBO3V6+J6sdU9qMKv36VDH3owLsmPDmAh1PFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhAp/FVsLF/enRyS2JGvIiNDpsHXEAxZrPUVec6Nsvr7t69mb5xuec9dMNdRCRmLVGZqy1CZwhGa6uRlM9vBXfkFOo+N0BIejbvZVvvoIQHy694+v9gfwe6gfREhz5GpevMerI/9KqNMTa7/MhCaV3TKAkXJDa1csSZbz/oXCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj2GsrQ1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj2GsrQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124460; x=1781660460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WnK/bfoBO3V6+J6sdU9qMKv36VDH3owLsmPDmAh1PFc=;
  b=Tj2GsrQ1o17ifrb6z1PYd69jYkEpCbM04jDVnCbx50MiJuippI4R5Orm
   OQCAGWJqKb02VYrIShPM+KVory1TkQ/HbgOCGdWAD8sT82rh1El+VfvQU
   z72bbRha53Ri9V3vCr/UbAQAdUoLuMCzDci09kRQZA8rvgSnaxaIWo29e
   iJuaF6ILrpGwtRvdXpDYrXny6kaX1vEqu5N6bq9xfuvMDjQHpdfHC8/7H
   HhveKN+cJ03LZCTMlRT9yf9oGTc9On9fQeJTUeckl0fCXQEI+CNfZWQrz
   rm65d9zetcQOkjySBaRiJMlfNHokg1ylTGDKMX7eBdR3ZcHuh6cCt4ume
   w==;
X-CSE-ConnectionGUID: f7wC/QhWT6GJz1mdUIBCYQ==
X-CSE-MsgGUID: TWmfXyCUTL6UnKkSrv4jaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556592"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:55 -0700
X-CSE-ConnectionGUID: aoioVic4Rtaezpy1AMOodg==
X-CSE-MsgGUID: y8Ptu3nvRW+PIWoK/UBotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989507"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:54 -0700
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
Subject: [PATCH V2 13/15] platform/x86/intel/pmt/discovery: Get telemetry attributes
Date: Mon, 16 Jun 2025 18:40:37 -0700
Message-ID: <20250617014041.2861032-14-david.e.box@linux.intel.com>
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

Add intel_pmt_get_features() in PMT Discovery to enable the PMT Telemetry
driver to obtain attributes of the aggregated telemetry spaces it
enumerates. The function gathers feature flags and associated data (like
the number of RMIDs) from each PMT entry, laying the groundwork for a
future kernel interface that will allow direct access to telemetry regions
based on their capabilities.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/pmt/Kconfig     |  1 +
 drivers/platform/x86/intel/pmt/class.h     |  7 +++++
 drivers/platform/x86/intel/pmt/discovery.c | 33 ++++++++++++++++++++++
 drivers/platform/x86/intel/pmt/telemetry.c |  5 ++++
 include/linux/intel_vsec.h                 | 16 +++++++++++
 5 files changed, 62 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/Kconfig b/drivers/platform/x86/=
intel/pmt/Kconfig
index 0ad91b5112e9..83ae17eab462 100644
--- a/drivers/platform/x86/intel/pmt/Kconfig
+++ b/drivers/platform/x86/intel/pmt/Kconfig
@@ -18,6 +18,7 @@ config INTEL_PMT_CLASS
 config INTEL_PMT_TELEMETRY
 	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
 	depends on INTEL_VSEC
+	select INTEL_PMT_DISCOVERY
 	select INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitory Technology (PMT) Telemetry driver provides
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 39c32357ee2c..fdf7e79d8c0d 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -48,6 +48,7 @@ struct intel_pmt_entry {
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
+	u64			feature_flags;
 	u32			guid;
 	u32			num_rmids; /* Number of Resource Monitoring IDs */
 	int			devid;
@@ -71,4 +72,10 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_vsec_device *dev, int idx);
 void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 			   struct intel_pmt_namespace *ns);
+#if IS_ENABLED(CONFIG_INTEL_PMT_DISCOVERY)
+void intel_pmt_get_features(struct intel_pmt_entry *entry);
+#else
+static inline void intel_pmt_get_features(struct intel_pmt_entry *entry) {}
+#endif
+
 #endif
diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index 4b4fa3137ad2..e72d43b675b4 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -583,6 +583,39 @@ static int pmt_features_probe(struct auxiliary_device =
*auxdev, const struct auxi
 	return ret;
 }
=20
+static void pmt_get_features(struct intel_pmt_entry *entry, struct feature=
 *f)
+{
+	int num_guids =3D f->table.header.num_guids;
+	int i;
+
+	for (i =3D 0; i < num_guids; i++) {
+		if (f->table.guids[i] !=3D entry->guid)
+			continue;
+
+		entry->feature_flags |=3D BIT(f->id);
+
+		if (feature_layout[f->id] =3D=3D LAYOUT_RMID)
+			entry->num_rmids =3D f->table.rmid.num_rmids;
+		else
+			entry->num_rmids =3D 0; /* entry is kzalloc but set anyway */
+	}
+}
+
+void intel_pmt_get_features(struct intel_pmt_entry *entry)
+{
+	struct feature *feature;
+
+	mutex_lock(&feature_list_lock);
+	list_for_each_entry(feature, &pmt_feature_list, list) {
+		if (feature->priv->parent !=3D &entry->ep->pcidev->dev)
+			continue;
+
+		pmt_get_features(entry, feature);
+	}
+	mutex_unlock(&feature_list_lock);
+}
+EXPORT_SYMBOL_NS_GPL(intel_pmt_get_features, "INTEL_PMT");
+
 static const struct auxiliary_device_id pmt_features_id_table[] =3D {
 	{ .name =3D "intel_vsec.discovery" },
 	{}
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index ac3a9bdf5601..58d06749e417 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -9,11 +9,14 @@
  */
=20
 #include <linux/auxiliary_bus.h>
+#include <linux/intel_pmt_features.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
+#include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
=20
@@ -311,6 +314,8 @@ static int pmt_telem_probe(struct auxiliary_device *aux=
dev, const struct auxilia
 			continue;
=20
 		priv->num_entries++;
+
+		intel_pmt_get_features(entry);
 	}
=20
 	return 0;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index b15155ff1154..f63e67398a8e 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -4,6 +4,7 @@
=20
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
+#include <linux/intel_pmt_features.h>
=20
 /*
  * VSEC_CAP_UNUSED is reserved. It exists to prevent zero initialized
@@ -166,6 +167,21 @@ struct oobmsm_plat_info {
 	u8 function_number;
 };
=20
+struct telemetry_region {
+	struct oobmsm_plat_info	plat_info;
+	void __iomem		*addr;
+	size_t			size;
+	u32			guid;
+	u32			num_rmids;
+};
+
+struct pmt_feature_group {
+	enum pmt_feature_id	id;
+	int			count;
+	struct kref		kref;
+	struct telemetry_region	regions[];
+};
+
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
--=20
2.43.0

