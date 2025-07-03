Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423721B9C8;
	Thu,  3 Jul 2025 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509724; cv=none; b=L1juKtV61LnLMU9y8MK+zie4JaH25Hvk9Wf7HIIXGl7oSdLFTuHjDch7Pnm6fQZZbSZP8hk5UL13lTdhSvSy7yB5NXn78ai7rxYWxzgSIHwp7T+VuPvCz14z2FPzNHI9q75aaFRpjAoqkntdI/0/ggvvBzBYNiUUhGPKXVqzMK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509724; c=relaxed/simple;
	bh=I5OKf7VIM7eXFLPLkT+t9O6Lx6JdPb+/HTM/bWUG9Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gO219HJ989uuq36A5z+/xPwtKwCXJ0qGADcbxlcmoLHNqoDHa7a+gd4mjT1kvrV4Il5EKpfKsrAJjCAK6M4X6cCD/LF6jNTBgVpfvArt6BJkHcHipV1uqMMFDMCPD3SowBX44IRXbPnt27PrVy+J+2K0KN1vOFArN2FySRLJawY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SX+TLuIp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX+TLuIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509723; x=1783045723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I5OKf7VIM7eXFLPLkT+t9O6Lx6JdPb+/HTM/bWUG9Ws=;
  b=SX+TLuIpxA2IfaJX9YLs4+rzWNITKAs7NXk9khV8BJKefu6rEAdafNK+
   9r2UxCu7AeTgoz4BMMrkMAq+daDLxsgGPIm1viuusqWTgoblvP1pnRTBB
   QySbZ3ahGrZYfCJ8INRS2BponlVLp3OESKYOGugU7mQv7QzIXwG8YCCrT
   YDv5p58HZG4+4gsf8RwaWQXgzliO+vI2UXYC5pdf6a438CveqBpp+BBHi
   A9GS601wDAvYzybkdiCUH1Pzk9pDH/UADpcxryerj1uEv1N9rCNb47ro9
   aopXwm+wtxDrktcJAGjq/RAM0zl21bKTTP3jCS/XDNMPpkrjcVPguH6zS
   g==;
X-CSE-ConnectionGUID: 8nk8pm9jTgmt1o5dW6GGWg==
X-CSE-MsgGUID: vKeXQXHxTNeyS6GL4ZNwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450233"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:41 -0700
X-CSE-ConnectionGUID: 65Uw9ljOTY+drqj2yc8Czg==
X-CSE-MsgGUID: RkeXMS6IR82rhdvM+WY8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594022"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:40 -0700
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
Subject: [PATCH V3 03/15] platform/x86/intel/vsec: Create wrapper to walk PCI config space
Date: Wed,  2 Jul 2025 19:28:18 -0700
Message-ID: <20250703022832.1302928-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Combine three PCI config space walkers =E2=80=94 intel_vsec_walk_dvsec(),
intel_vsec_walk_vsec(), and intel_vsec_walk_header() =E2=80=94 into a new w=
rapper
function, intel_vsec_feature_walk().  This refactoring simplifies the probe
logic and lays the groundwork for future patches that will loop over these
calls. No functional changes.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - Rename intel_vsec_feature_walk() to intel_vsec_get_features() and
    have it return bool instead of passing as an argument

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 38 +++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 59fb6568a855..8bdb74d86f24 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -349,11 +349,35 @@ int intel_vsec_register(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
+static bool intel_vsec_get_features(struct pci_dev *pdev,
+				    struct intel_vsec_platform_info *info)
+{
+	bool found =3D false;
+
+	/*
+	 * Both DVSEC and VSEC capabilities can exist on the same device,
+	 * so both intel_vsec_walk_dvsec() and intel_vsec_walk_vsec() must be
+	 * called independently. Additionally, intel_vsec_walk_header() is
+	 * needed for devices that do not have VSEC/DVSEC but provide the
+	 * information via device_data.
+	 */
+	if (intel_vsec_walk_dvsec(pdev, info))
+		found =3D true;
+
+	if (intel_vsec_walk_vsec(pdev, info))
+		found =3D true;
+
+	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
+	    intel_vsec_walk_header(pdev, info))
+		found =3D true;
+
+	return found;
+}
+
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
-	bool have_devices =3D false;
 	int ret;
=20
 	ret =3D pcim_enable_device(pdev);
@@ -372,17 +396,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	priv->info =3D info;
 	pci_set_drvdata(pdev, priv);
=20
-	if (intel_vsec_walk_dvsec(pdev, info))
-		have_devices =3D true;
-
-	if (intel_vsec_walk_vsec(pdev, info))
-		have_devices =3D true;
-
-	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
-	    intel_vsec_walk_header(pdev, info))
-		have_devices =3D true;
-
-	if (!have_devices)
+	if (!intel_vsec_get_features(pdev, info))
 		return -ENODEV;
=20
 	return 0;
--=20
2.43.0

