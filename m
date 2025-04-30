Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2C2D26BA;
	Wed, 30 Apr 2025 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048087; cv=none; b=aKIf1CR74sKugySSvwj/I6ln1Cd4A6DxZa78mpDT2mcBlDHpEy/wwLwN8hpXPgQ4SF6qlgvR/2Zx+WgVHg5yfHjjNIDCewsgZ57fiW6BbPJH7EMi+VqxgOG93FAahFaH6h5WJZ8hDR5AiYKawqQgV8PcnLIpk/SihmC13oY3sOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048087; c=relaxed/simple;
	bh=hlhiJKH7Iq/LRzTZtmpQkDUN4Gvdy/F2RT/YcQ7xsco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7D1iqjGa/zzSBgSx2mMywsdvTspCAtRgpJc7syTun8zIzo4MKIvSIFEhiq2EtW5UaGeYSoDDYLtdMRUkWKDIedUCKpxHy2Hnf5Ov3Py+BKb5iMa8MhJft184935xX3BM9wFlh4prwhZ3RZQaOc/UvwKjMRde1jSnf6QxDDNFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLGqz5Ai; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLGqz5Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048086; x=1777584086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hlhiJKH7Iq/LRzTZtmpQkDUN4Gvdy/F2RT/YcQ7xsco=;
  b=SLGqz5AiUA78GZORkbFc5EBRtkfEg4slpNrg2bev5TtqP47rwp4hpGO3
   NiU8t/CypcFLRzwmojn/jzFEXwG7Yj5bRxFxuTefMeu/mZgtVq10MSCFH
   Zf1MMGAkyuEfOklKtWj3nbCyRNPSP1pNxpd0Flj0K4r9qRtoFd//7zqTt
   Bs3HDQsBHTcvO/XN8BHJrWgHQ8bZYlYhps9BoKAg6dt5noPkrY34cVgik
   +sKAMsoxEPNbXM4zh8leTs6WUCfQkbb0F/qN5r7OgqXaR1lciI8p6TXv3
   ofVuz8DQ9Q6wgKF+PJYokbRnyIdOmCFFCdI0ejlpahhCsLUjXuJLgG+dD
   A==;
X-CSE-ConnectionGUID: rggbRnE8TIGPQc3V6WUOpA==
X-CSE-MsgGUID: 6pLroSSVSsS9K/Fe12Zx3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257556"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
X-CSE-ConnectionGUID: +U8L+60nQDO+RS4zsFyvXQ==
X-CSE-MsgGUID: FY0Xf6LeSz+yJfN3vNoAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972309"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
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
Subject: [PATCH 13/15] platform/x86/intel/pmt/discovery: Get telemetry attributes
Date: Wed, 30 Apr 2025 14:21:02 -0700
Message-ID: <20250430212106.369208-14-david.e.box@linux.intel.com>
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

Add intel_pmt_get_features() in PMT Discovery to enable the PMT Telemetry
driver to obtain attributes of the aggregated telemetry spaces it
enumerates. The function gathers feature flags and associated data (like
the number of RMIDs) from each PMT entry, laying the groundwork for a
future kernel interface that will allow direct access to telemetry regions
based on their capabilities.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
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
index ba276231ce74..e337f19b95d6 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -48,6 +48,7 @@ struct intel_pmt_entry {
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
+	u64			feature_flags;
 	u32			guid;
 	u32			num_rmids;
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
index 8124a5bcbb12..39df65a795eb 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -581,6 +581,39 @@ static int pmt_features_probe(struct auxiliary_device =
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

