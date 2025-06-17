Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C551EB5FA;
	Tue, 17 Jun 2025 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124457; cv=none; b=apGwP7jYk3HqRGx/HQpfaYhBfRHjIXS+D00b4jxV2iya0wtSDd508gT9wNqxb5h0/PEeAynR6Bh21Ya4FpKpH0sKgc2aFc+M9Oq1bJRXwa9+QAqnOxuChjjsFD+UT/NBzhsq2pKEofsQl1rTeDCHR4c21vDSZ+ehPrtmyo17AHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124457; c=relaxed/simple;
	bh=TA8kNWFtovGvlFuL7Hh9AHJKB9qn9wSIdIRzu6hM2J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyYOKmtlfS9QKJ/57aBAZ3O9D1ONFxw6X5a35PcQcXT+i1+tAY9LIwax2PGfXn3jWYGITUQkD3obgQOtburIAzKXrPTNCIJyxOUXeMHzY0mAfYdDfTGzx3Cx53hUSO94lozOqfWi2sIn9zHBHQDLUBnFEPtXW3nb6lp2isjDcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inBNX3Pg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inBNX3Pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124456; x=1781660456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TA8kNWFtovGvlFuL7Hh9AHJKB9qn9wSIdIRzu6hM2J4=;
  b=inBNX3Pgg2SgDn3kq61zTBuxsTC9CMmeIdDQZFyW7SASzi9QpkmKiCb0
   5jO3M4zc+cJ0B2XBUawg3g7hXkKW5gDZ3GYOIIyoyoPnoAu1PudA5Wvfs
   rF8ralCyE23DOqAQyOEXgj1djgwafmbZ1x4xtvz4LeIOqd1VjoION5z29
   Xu3RsvU+BxtSsS0XzLNgqLDk2HbcHAm4MJ7g2vi7f16QlTOz3AemvFL4C
   e28u91Xj7RyPxyTGF6iDZ4seqIijSjqYC0JzdvRCyndAOMqZr6MhrL3n5
   +Mzqg5aN/fsWuS6s7C/pK73gAMRQ7tEhqFX+3+DUSCyqB4avNXvZo6+pe
   Q==;
X-CSE-ConnectionGUID: S+ddd9CHSYa7hZQ/1OAs6Q==
X-CSE-MsgGUID: b+CkWIJ1TG67czIcZ7Q+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556554"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:52 -0700
X-CSE-ConnectionGUID: XMMTU0tpQT+26te/FLn9Pw==
X-CSE-MsgGUID: 0MVWHaBvQa2c0ByPG5mb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989465"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:51 -0700
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
Subject: [PATCH V2 06/15] platform/x86/intel/vsec: Skip driverless features
Date: Mon, 16 Jun 2025 18:40:30 -0700
Message-ID: <20250617014041.2861032-7-david.e.box@linux.intel.com>
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

If a feature lacks a corresponding driver and that feature is also a
supplier, registering it would be prevent the consumer driver from probing.
Introduces logic to skip such features during device registration.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 8fab46ab5c79..d522b06f3f69 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -122,6 +122,26 @@ get_consumer_dependencies(struct vsec_priv *priv, int =
cap_id)
 	return NULL;
 }
=20
+static bool vsec_driver_present(int cap_id)
+{
+	unsigned long bit =3D BIT(cap_id);
+
+	switch (bit) {
+	case VSEC_CAP_TELEMETRY:
+		return IS_ENABLED(CONFIG_INTEL_PMT_TELEMETRY);
+	case VSEC_CAP_WATCHER:
+		return IS_ENABLED(CONFIG_INTEL_PMT_WATCHER);
+	case VSEC_CAP_CRASHLOG:
+		return IS_ENABLED(CONFIG_INTEL_PMT_CRASHLOG);
+	case VSEC_CAP_SDSI:
+		return IS_ENABLED(CONFIG_INTEL_SDSI);
+	case VSEC_CAP_TPMI:
+		return IS_ENABLED(CONFIG_INTEL_TPMI);
+	default:
+		return false;
+	}
+}
+
 /*
  * Although pci_device_id table is available in the pdev, this prototype is
  * necessary because the code using it can be called by an exported API th=
at
@@ -157,7 +177,8 @@ static int intel_vsec_link_devices(struct pci_dev *pdev=
, struct device *dev,
 	for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT)=
 {
 		struct device_link *link;
=20
-		if (state[supplier_id] !=3D STATE_REGISTERED)
+		if (state[supplier_id] !=3D STATE_REGISTERED ||
+		    !vsec_driver_present(supplier_id))
 			continue;
=20
 		if (!suppliers[supplier_id]) {
@@ -404,6 +425,11 @@ static int intel_vsec_register_device(struct pci_dev *=
pdev,
=20
 	priv->found_caps |=3D BIT(cap_id);
=20
+	if (!vsec_driver_present(cap_id)) {
+		priv->state[cap_id] =3D STATE_SKIP;
+		return -ENODEV;
+	}
+
 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
 		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
--=20
2.43.0

