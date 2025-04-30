Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A72D2687;
	Wed, 30 Apr 2025 21:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048086; cv=none; b=LnmAOAdNvo2LzEBxCmGXbD37n9Vu9CjHikM2HUlcp44C9cjJDWG6JC+B89kzS4eZtJatyEJOAYGPo9Tja2qHUcXfrVYhTS5qVGTFOpeA2EzfT9OeDRQ3XOg4QISPP/+feijc4tkpnu+4Cxshm1M6UFmu8uP1DnV8cRdN82mPk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048086; c=relaxed/simple;
	bh=biM2KwZXhRd3Jnu8i2FWmq2vjFBr9n7dovXYw1BViGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiQIkytvg29behsHh+jc+XIqrWncZbhFK9ZeM+hQ5HDt43ewUqhkyUnRBwRqVvoXCrSlaKZHpCoYPBUPfgoqJQgLccg6HY360+8Ev6+qHKO5bpgwNUmaui23rKnakY7KR28oMhIaxCAuc++Zb9FgVV6lUS+WKtXwsruX47+S2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8iML6UI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8iML6UI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048085; x=1777584085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=biM2KwZXhRd3Jnu8i2FWmq2vjFBr9n7dovXYw1BViGU=;
  b=J8iML6UI+NTtd1QjOs7nrUPD+MnA0aN5UjVCPc2LRVPXG3aFGpd88LZ8
   F5ZfiPzXuHXHclmfHohXlLbBvMSLdOhHH+46Obnf3VYfhEJ9JKPbsfSlU
   gm/HLQVme1FHh2Hiy2KaZNP/H1G2EEAUFEJSZN1k/+/HC7migbuK5KgNn
   zA500WmuXORMIdZvKYgQTISzykavxzt7iDyeIQV1M0IZ7HXTqOaY49Sgj
   KPIdaJuq71G2aL0hC8o3FQ1/JHBNFdnlBo7DkJ9M2zUXKBqlVLAj8keEK
   orTvW6ODnLCK6m2wUtTY01k+Fnw2ha3oIb0qmQzxQCfwjcf6pcUIf4vfv
   A==;
X-CSE-ConnectionGUID: 75yQ5gm4STyGmHPu0Yklnw==
X-CSE-MsgGUID: xxWUA7T/ReG3+jfKSERlpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257551"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
X-CSE-ConnectionGUID: D/Km7aaATP+jwEjwYqddxQ==
X-CSE-MsgGUID: nEoJkaoATCWuEJ/lDqgxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972303"
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
Subject: [PATCH 11/15] platform/x86/intel/vsec: Set OOBMSM to CPU mapping
Date: Wed, 30 Apr 2025 14:21:00 -0700
Message-ID: <20250430212106.369208-12-david.e.box@linux.intel.com>
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

Add functions, intel_vsec_set/get_mapping(), to set and retrieve the
OOBMSM-to-CPU mapping data in the private data of the parent Intel VSEC
driver. With this mapping information available, other Intel VSEC features
on the same OOBMSM device can easily access and use the mapping data,
allowing each of the OOBMSM features to map to the CPUs they provides data
for.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 31 +++++++++++++++++++++++++++++++
 include/linux/intel_vsec.h        | 14 ++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index e3ec17a53e62..989d79d71db1 100644
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
@@ -661,6 +662,36 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
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

