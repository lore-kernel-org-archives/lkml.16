Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F27299506;
	Wed, 30 Apr 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048081; cv=none; b=YpiyNu5m8KNl7UZCYJ4UsVhzI9dKkInK3WunBjHLZIw2BMQ8EjEVXUto5LKx99O8ng1fsT4/BRr7PSGg2VlGStIJCoUjEH7Y0qNbGF17q14tSthFvSiOeFL/srgz65h0TM2pykD353lRba2IwmhwrnllaPJe2IfpGYiTZ+noFR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048081; c=relaxed/simple;
	bh=YKlUt4V0D51gsfSfgDQX0NK2LDnnc+H+McaVVJ99AVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKlWnjfVgyGBjQGBg1zTH/fX6+MqLPK43eLfCi2mTh77kbsncVDOZLuqtpxGyAScc2+4OdJ0cTdRufjXtmqodmGsBWZVVx6L0uU3palgkMvptD7t+miQ9ZlqpuMl4k+esZ2sG0kjU+8AX8jq0IIYNuSCGFAzBWFQoAciZALIuMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhXfMA8R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhXfMA8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048079; x=1777584079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YKlUt4V0D51gsfSfgDQX0NK2LDnnc+H+McaVVJ99AVw=;
  b=UhXfMA8RbupNVP8htfGsaBlCBiMHQkmwQrLhFlhcW/v1mW4LZ2tNrwBp
   yUXD1+y7sOGjySmFlivTHJSJ6s7JzGpLMk0Bv5ZUENyNwWhqSXGIcS8sV
   Avb7070j8mMwq6Q/YpaUz0roqm9MQX+lEBLgKwRjwyNDAmh2G+ffpz98h
   3ddqZ4mnjTiyh9iDdx1RO0DksTe5heaoTjpWZNk5HbOVDSrWni4JO/XGZ
   Z1BAR4NujtGx1z/KkyL1WEBcPELZTURFzLcge72yYPQZa9nWU4vVr36Vh
   qm1/+RFFNQ9UvOcfsA6lOEETzyw6abHmHvoT7nvxTLkNNIrvd3v9F0/Ts
   w==;
X-CSE-ConnectionGUID: pVTIkRLhTGiCCywRdtr7dw==
X-CSE-MsgGUID: g+4vyS6ARISqmE47nIVKDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257535"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
X-CSE-ConnectionGUID: mRII4pAqQHK+nJU7AGV+xw==
X-CSE-MsgGUID: caMQxxOjQkWqc734ToBPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972274"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
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
Subject: [PATCH 03/15] platform/x86/intel/vsec: Create wrapper to walk PCI config space
Date: Wed, 30 Apr 2025 14:20:52 -0700
Message-ID: <20250430212106.369208-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/vsec.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 59fb6568a855..f01651f498ca 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -349,6 +349,27 @@ int intel_vsec_register(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
+static void intel_vsec_feature_walk(struct pci_dev *pdev, bool *have_devic=
es,
+				    struct intel_vsec_platform_info *info)
+{
+	/*
+	 * Both DVSEC and VSEC capabilities can exist on the same device,
+	 * so both intel_vsec_walk_dvsec() and intel_vsec_walk_vsec() must be
+	 * called independently. Additionally, intel_vsec_walk_header() is
+	 * needed for devices that do not have VSEC/DVSEC but provide the
+	 * information via device_data.
+	 */
+	if (intel_vsec_walk_dvsec(pdev, info))
+		*have_devices =3D true;
+
+	if (intel_vsec_walk_vsec(pdev, info))
+		*have_devices =3D true;
+
+	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
+	    intel_vsec_walk_header(pdev, info))
+		*have_devices =3D true;
+}
+
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
@@ -372,15 +393,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
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
+	intel_vsec_feature_walk(pdev, &have_devices, info);
=20
 	if (!have_devices)
 		return -ENODEV;
--=20
2.43.0

