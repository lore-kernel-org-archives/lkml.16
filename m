Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0E2116E7;
	Tue, 17 Jun 2025 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124461; cv=none; b=GQ25XCXa941r5+unmXPZEiPqzzDW+377L7C/R2h3Lyd2gT5uGJQ1aVcJpyNMtObSwmaA32Uwz7KMRT6f6w1dOtSzMAcmXV1opgwNBh8jBCvHncpoGSIXb1PyUJH8r6/QvbXqKj69W0xvbHF8upAfzMVJs70qM8tUGKRc3brogU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124461; c=relaxed/simple;
	bh=fGbdrxAaONlZiaOrjVnN4TypmoS2RgA7X0pJloUFfVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTw9lHM8o1soS+fyTkBrsiOdVCfD2kO/yzHAKJVlfbhlyZUMBQj73k/Wq76B1nwowVj0yXqx2KuMt5uXlH7tfBiPvlGhHIBHRKJB2OWydCxJrauFKIw+ygCGYQhbqNhqHCIY8JODMCljfLFqmGB9JOEj6uMYnmQHwI4ar5Jo9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQ2TGFcQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQ2TGFcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124460; x=1781660460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fGbdrxAaONlZiaOrjVnN4TypmoS2RgA7X0pJloUFfVw=;
  b=cQ2TGFcQaAdyNwGdFjRXHB0DkhJ07Gcv7ehhfIfQ+M+Zn6WZbQEcriuH
   vJzOTLAlFukm/o2TsuM75WfUysctzSJlzL1H6OQmlX3rkkiw6fd3cNWkL
   dRaNLbQDpvaMFzORI7OlBDuTAbtjXksVpeR9EyVKaVPljHPhR2IsOO/ql
   6ejHZc+aAA/nmR9vDruX2bs3g8tOYl845P/NfjV/69/khU8pAkmb9YYiU
   6qm+Bk8G2wTOFCCPJT1qyOsLEwgCmRTZF1fQlpB7ARQd7gOYUnHPypPEF
   VZ45vkiU+c+LsRc44zm/LNjhf/F/5JBXJUgTu5ihKgYLTjcbj6DP26EyD
   g==;
X-CSE-ConnectionGUID: 1fI7SsgzRKafteSOVgurWw==
X-CSE-MsgGUID: +UzklWoHTMOx8Uhv9zf0QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556577"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:54 -0700
X-CSE-ConnectionGUID: aJkASlCxR5aQLlzZN9IFgw==
X-CSE-MsgGUID: 37e01yKwQvSXxpSd4YDJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989489"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:53 -0700
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
Subject: [PATCH V2 11/15] platform/x86/intel/vsec: Set OOBMSM to CPU mapping
Date: Mon, 16 Jun 2025 18:40:35 -0700
Message-ID: <20250617014041.2861032-12-david.e.box@linux.intel.com>
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

Add functions, intel_vsec_set/get_mapping(), to set and retrieve the
OOBMSM-to-CPU mapping data in the private data of the parent Intel VSEC
driver. With this mapping information available, other Intel VSEC features
on the same OOBMSM device can easily access and use the mapping data,
allowing each of the OOBMSM features to map to the CPUs they provides data
for.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 31 +++++++++++++++++++++++++++++++
 include/linux/intel_vsec.h        | 14 ++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 98f570a389c6..8c330b57e4d4 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -43,6 +43,7 @@ enum vsec_device_state {
 struct vsec_priv {
 	struct intel_vsec_platform_info *info;
 	struct device *suppliers[VSEC_FEATURE_COUNT];
+	struct oobmsm_plat_info plat_info;
 	enum vsec_device_state state[VSEC_FEATURE_COUNT];
 	unsigned long found_caps;
 };
@@ -660,6 +661,36 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
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
index cd78d0b2e623..b15155ff1154 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -170,6 +170,8 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
=20
+int intel_vsec_suppliers_ready(struct intel_vsec_device *vsec_dev,
+			       unsigned long needs);
 static inline struct intel_vsec_device *dev_to_ivdev(struct device *dev)
 {
 	return container_of(dev, struct intel_vsec_device, auxdev.dev);
@@ -183,11 +185,23 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
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

