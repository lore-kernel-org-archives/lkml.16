Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E839232392;
	Thu,  3 Jul 2025 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509730; cv=none; b=KNEXQ2EwT/DKM4jtqwTCvA5ac7dUmpj21I1KZD7QwkyWvGjnSuSnCbkw8tkWR+QNZ+6MKNQnFwDf2+NMVbHHMjJU2brXJ2Mc1/SPL8ZyCyKxSqO/wuHHHyM/iY1oXBF4/50N3CZqeyDJFdl9EYJ/44716r9oLIfN6XF28Ee2svY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509730; c=relaxed/simple;
	bh=2D97srwo7zQTvNSnuNzD7kqH9vJKPQFyl9T6jQTpeLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deK82NC4HBNyKlIrw9ChzHMHlt+sNBM9cE0EAE0GB4y2HOU4aQBCNzPnhEysDWu1JQYx5IAwJeVFLLtSgovu0vx1QxiHPOjCxb+Nta/J+VzT6eeqLmVdOY64SXyihsRQI73D2wtExL2ELCC6KVbLF0JV5FqUyufOk6gN05yUEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bohOfPQa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bohOfPQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509729; x=1783045729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2D97srwo7zQTvNSnuNzD7kqH9vJKPQFyl9T6jQTpeLU=;
  b=bohOfPQaZPN5qSYTN8DrxU3MHf83RhK+KZhga/NB2Sg1rYymq+juMPfv
   rMUeMcOLHttdmdUNl3/pK8NthUnRjgHBvGOWl2J5/SYS9uipUNQbfaaEw
   yPztF2WeIXG3fY5VCtQmBlpCqgFRH5+62PGkRKL3/L08zNGt2YkrCO4pu
   ft1+kzpqvLWKAUu6lr3MlXKXk5w+wP1LStdgry7K1obhrQpws/0ambYQ3
   9jI9hiaSmzTi4m/1Oq9xorluMN5TeWlRmTMReMpOX0HwHoVAof8gVoyiE
   c5KhliSIOlI1Z3TRca25N2Kzt9ppjJqKTw5Inn5L+FiJ12ZcreajtwqzX
   Q==;
X-CSE-ConnectionGUID: u63zE0KsS0eJYRbsHRPwTw==
X-CSE-MsgGUID: n37Fx7jgTtmds+YXThFfcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450252"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:44 -0700
X-CSE-ConnectionGUID: jVTARoUDR7+RitBMZuqV3A==
X-CSE-MsgGUID: 5s8n7ROHSdel0ILFV1bjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594069"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:43 -0700
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
Subject: [PATCH V3 11/15] platform/x86/intel/vsec: Set OOBMSM to CPU mapping
Date: Wed,  2 Jul 2025 19:28:26 -0700
Message-ID: <20250703022832.1302928-12-david.e.box@linux.intel.com>
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

Add functions, intel_vsec_set/get_mapping(), to set and retrieve the
OOBMSM-to-CPU mapping data in the private data of the parent Intel VSEC
driver. With this mapping information available, other Intel VSEC features
on the same OOBMSM device can easily access and use the mapping data,
allowing each of the OOBMSM features to map to the CPUs they provides data
for.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v3:
  - Drop unused intel_vsec_suppliers_read() declaration from
    intel_vsec.h.

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 31 +++++++++++++++++++++++++++++++
 include/linux/intel_vsec.h        | 12 ++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 4d76f1ac3c8c..711ff4edfe21 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -44,6 +44,7 @@ enum vsec_device_state {
 struct vsec_priv {
 	struct intel_vsec_platform_info *info;
 	struct device *suppliers[VSEC_FEATURE_COUNT];
+	struct oobmsm_plat_info plat_info;
 	enum vsec_device_state state[VSEC_FEATURE_COUNT];
 	unsigned long found_caps;
 };
@@ -665,6 +666,36 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	return 0;
 }
=20
+int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
+			   struct intel_vsec_device *vsec_dev)
+{
+	struct vsec_priv *priv;
+
+	priv =3D pci_get_drvdata(vsec_dev->pcidev);
+	if (!priv)
+		return -EINVAL;
+
+	priv->plat_info =3D *plat_info;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(intel_vsec_set_mapping, "INTEL_VSEC");
+
+struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev)
+{
+	struct vsec_priv *priv;
+
+	if (!pci_match_id(intel_vsec_pci_ids, pdev))
+		return ERR_PTR(-EINVAL);
+
+	priv =3D pci_get_drvdata(pdev);
+	if (!priv)
+		return ERR_PTR(-EINVAL);
+
+	return &priv->plat_info;
+}
+EXPORT_SYMBOL_NS_GPL(intel_vsec_get_mapping, "INTEL_VSEC");
+
 /* DG1 info */
 static struct intel_vsec_header dg1_header =3D {
 	.length =3D 0x10,
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index cd78d0b2e623..4bd0c6e7857c 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -183,11 +183,23 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
ev(struct auxiliary_device
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
 int intel_vsec_register(struct pci_dev *pdev,
 			 struct intel_vsec_platform_info *info);
+int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
+			   struct intel_vsec_device *vsec_dev);
+struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
 static inline int intel_vsec_register(struct pci_dev *pdev,
 				       struct intel_vsec_platform_info *info)
 {
 	return -ENODEV;
 }
+static inline int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_inf=
o,
+					 struct intel_vsec_device *vsec_dev)
+{
+	return -ENODEV;
+}
+static inline struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_d=
ev *pdev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 #endif
--=20
2.43.0

