Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC202063F0;
	Thu,  3 Jul 2025 02:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509723; cv=none; b=S4LGKw4hCeyuBM5ZGp4/EZEzW4bq3DeWohBNi0KS1rD5sMosQX8pKSbWwPP2BgmPTUGRdgpxLsFSuWRm39NoB1TNRPlcbU8IammxE02nmY9ylLA5DFzh1MC56enzMzrhHkVSn741ryOSdKE0S7o8dEmsbUyNCi3MTKH4AEs5JP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509723; c=relaxed/simple;
	bh=m40kZKgvje0OtU9KQn2wWl1QYsAvftc7QARI4Yq0Pi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlnIMepoQ9Eu1QbcXV8ZT3PCo2i85lBKKpCAuXKCXb6obz5Btzh8hfJJPMuCe3FyBK1ZQkMrrk/QJXDkGkfUoMM4QLPQCNxLMWomjPdx/xw8Lm2teLw3cdCe2Xvy3uWHInike1L2LICikoyYNcsar+I+i9j5JPaGEbeVT/db7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwReJbus; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwReJbus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509722; x=1783045722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m40kZKgvje0OtU9KQn2wWl1QYsAvftc7QARI4Yq0Pi4=;
  b=cwReJbusP9vnND0l44dXrVHrBEpgcZy7TtKPrqw48dTDKRvxyoIHbKaZ
   RovLCXiQNg1vOxiqNyCv9Xm0LSvbWpdvg1ebjT05dV+8FcK36fYfuF239
   jJrrFEGyvRwSzc6RIv+2EtoxQ2K/Vw6AfuuwHoLmv+4/jTEsIiNL8tCEa
   hsmtwkNXisVYkQIPwKxx0e5DuTVR6FYBsH06EJso0NWGMuD7j1Uk5IO69
   Z0a/i5zj+5g9SRGbnS7HaWgJza+8Bsiz/JSRgLmpslE+WrgW60iDwnHgV
   /zdQxxyh4zwiiI4WKR48x64UTxls+IutJUhZoZWh/ArnaqlCeflp8ghcZ
   g==;
X-CSE-ConnectionGUID: GeLWV9O0SuCW40ZufB0Vig==
X-CSE-MsgGUID: AZwv7kyYQaedX+xfzShOKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450230"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:40 -0700
X-CSE-ConnectionGUID: V8UQhgocR+aLmvn7xLTsqQ==
X-CSE-MsgGUID: 779AaL4BR22SjdnsAtk/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594018"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:39 -0700
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
Subject: [PATCH V3 02/15] platform/x86/intel/vsec: Add private data for per-device data
Date: Wed,  2 Jul 2025 19:28:17 -0700
Message-ID: <20250703022832.1302928-3-david.e.box@linux.intel.com>
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

Introduce a new private structure, struct vsec_priv, to hold a pointer to
the platform-specific information. Although the driver didn=E2=80=99t previ=
ously
require this per-device data, adding it now lays the groundwork for
upcoming patches that will manage such data. No functional changes.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

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

