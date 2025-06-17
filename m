Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7C1AAE28;
	Tue, 17 Jun 2025 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124456; cv=none; b=GcuJVOAy1f5LFoX95cu/1yTgJt9cQtZ++UczqNxilf4SLnJurH07DL4uSXMSwfWY6DNGykkXjSSNqbcKM6ME/oNw3dJo+GgMZoMdLMkwdQ4zvxoCioGIpxtl01b2+HKDlGGZ0cUAhCOWJCtUCFX5z4mPkkIY6Y8ciUdB/hjkS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124456; c=relaxed/simple;
	bh=/Ku3TWzldVp5WnY1hn7KSGDKfB7WyO09oblg2SxFtuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwE9alKS8sdm+1BNMboMYWbgNwpVV42jKPOk/vEajg2vzNfYsD2PzGM57jetMQypW7NuWfF6ZYGK8XFOklxTEWmAZGQ3yel5B3QbbkqrhbLRVm8ZKnUhRNSHQ8zSF6inmnMUva/dZQ57rp1HCHb50aX58kE0EB3uaJxL+1ACLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC4c1cpu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC4c1cpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124453; x=1781660453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Ku3TWzldVp5WnY1hn7KSGDKfB7WyO09oblg2SxFtuc=;
  b=iC4c1cpuuFkM7ONb8AGfoS9SC+QfFLWWczXfNop0lpcAS5PZLgQDuvPO
   6oXfCM60WjWed4T4UpxLxFWj26AGgTT0kVCLZCKANli8qrs/6WHrtRObt
   XLUpIRkRoZ/GLiOp5EB6aQdeejNqYKUnMEFYOAuxoj0H5nMu8jqNlqjbP
   s6qEU0uOfiHL7iyQVGhRH9rJKNMUxuVsWM/GFL+mSi47CgznfCM3XBXYQ
   Dlqd0OyT3MPeA6dM/gFSXOcNacwG14DcdMB5g9yqcpTLKLghxN4Ou1eBs
   MXKy/Rde6SvL2yk8/exjw7/RBpGaUljfXD2Uy4RXCGzs7cj3vYymRaO5V
   g==;
X-CSE-ConnectionGUID: 6BDiCWqOR/+AqbD6C8oiWA==
X-CSE-MsgGUID: /AE7yHJJR0SZ/WExnzK/og==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556531"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:51 -0700
X-CSE-ConnectionGUID: rkR4FrdFQP+72BuTrXK32w==
X-CSE-MsgGUID: SBp7cebKR0m9xpx/oaG7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989443"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:49 -0700
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
Subject: [PATCH V2 02/15] platform/x86/intel/vsec: Add private data for per-device data
Date: Mon, 16 Jun 2025 18:40:26 -0700
Message-ID: <20250617014041.2861032-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Introduce a new private structure, struct vsec_priv, to hold a pointer to
the platform-specific information. Although the driver didn=E2=80=99t previ=
ously
require this per-device data, adding it now lays the groundwork for
upcoming patches that will manage such data. No functional changes.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 055ca9f48fb4..59fb6568a855 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -32,6 +32,10 @@ static DEFINE_IDA(intel_vsec_ida);
 static DEFINE_IDA(intel_vsec_sdsi_ida);
 static DEFINE_XARRAY_ALLOC(auxdev_array);
=20
+struct vsec_priv {
+	struct intel_vsec_platform_info *info;
+};
+
 static const char *intel_vsec_name(enum intel_vsec_id id)
 {
 	switch (id) {
@@ -348,6 +352,7 @@ EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
+	struct vsec_priv *priv;
 	bool have_devices =3D false;
 	int ret;
=20
@@ -360,6 +365,13 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	if (!info)
 		return -EINVAL;
=20
+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->info =3D info;
+	pci_set_drvdata(pdev, priv);
+
 	if (intel_vsec_walk_dvsec(pdev, info))
 		have_devices =3D true;
=20
--=20
2.43.0

