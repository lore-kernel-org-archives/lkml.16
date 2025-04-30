Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966B297A7F;
	Wed, 30 Apr 2025 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048080; cv=none; b=tmNMAKiSK698U+rlcr/fxftcN1tWfYrGPC2nrusvbHnA6Nkx8aajU/ht+BcFN8OdelZDWATV4RonFEOFwLUIWoxd+f/hv/XdteMY+ZeEff3J8CQO5kS4aKLiAxNAgkHnTlvwUb2caH4XXVaFihG6NrPbnkwG/0LinY+2hsISZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048080; c=relaxed/simple;
	bh=Bb4t4NZhxy2mpayz8DSDhl4k1CNEmUQcxFsZdVoxU/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R0YpZjkNaMuRODYw1qKcds07ao6oXLhEKlyn7SozJqFETTa9EaIchvfzXFdSQjZXauVurHRlx3RwrjoTI8dwJWIwGyMQrDLstgKfHwKx5j6YuObqV7mXvdD4J3GuWWoImENeLuvdPJSUOkwWB8BNH39SHIecCPkaNxUYnUhbLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJqCpRpB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJqCpRpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048079; x=1777584079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bb4t4NZhxy2mpayz8DSDhl4k1CNEmUQcxFsZdVoxU/E=;
  b=MJqCpRpB6Gk/zWGDKMy54H4LjIi1wFPCuAVz3jHjICTtNWI1fjOQ6DyZ
   bLqG71YATQmDge5zbWIm5gTFzcffavkiFXrWmQGQxRy8Oq5orzsNSoxMO
   rsRLOGTfNwELhw56Sk1Wk7Pp+ac3/Phat6EB2UNCmEkH2GN/NimVX0Rhe
   aBK6t+1WCWVXXRkpqTLcUUYmD8KdKIdIzelzuU584/3pbsbCWawyLpnxH
   WN3C8/qW+XAt3u6ee52FY1xkQJwhsUwmkGHNOHGlgARSmRqrvQUvuILnM
   JJcIfg+NNV9TFZgsa55wNL/cx/n/naO9r4yJhBFxorHVlC0GpgScCkdT5
   g==;
X-CSE-ConnectionGUID: aQzvIKkAQEuk0y+YxG8d8w==
X-CSE-MsgGUID: RVIbj2xdRLmECulayos8rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257533"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
X-CSE-ConnectionGUID: OA6N/eS3Tb2KahUTSiN6Xw==
X-CSE-MsgGUID: uK7VRa/qQMi3vKQTDcdpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972271"
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
Subject: [PATCH 02/15] platform/x86/intel/vsec: Add private data for per-device data
Date: Wed, 30 Apr 2025 14:20:51 -0700
Message-ID: <20250430212106.369208-3-david.e.box@linux.intel.com>
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

Introduce a new private structure, struct vsec_priv, to hold a pointer to
the platform-specific information. Although the driver didn=E2=80=99t previ=
ously
require this per-device data, adding it now lays the groundwork for
upcoming patches that will manage such data. No functional changes
intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
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

