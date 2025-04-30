Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062182C376A;
	Wed, 30 Apr 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048082; cv=none; b=gstWSUG+AohnOeugW9T3BECWCycmv/QUdjtCYLIedabFmAExqi8I+FyfQvR4+iTWgxbPdi2RKe+MvWtAk03LSkmsAIL59dJwDvsaRTjbQXF4UnmUrtBS0+IRFDoY0Z2Dd5Bsd8e02eoC4Tt1QrLOTOxep+HEbx6tCINxf/KnEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048082; c=relaxed/simple;
	bh=Go2nKlOrRArHLeU4r3n6NCmarnBmukAXwr0c20fcGp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpBAdBctZGadrV4QjZgJx9WqNJVcuXaMKLzkRkLk4/pVeIvGj48APxQOPDY/y2WsTTqi6LR5hKcSWLEO0/BQ2exRbumRKyxcPZmoqcPYpt3qQBApkob6pJB8fzdSN3iM1vMtAuibZA3QHJHO8db8WNZm3c/PMugtAGUnE5Uv/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naSu7kKb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naSu7kKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048081; x=1777584081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Go2nKlOrRArHLeU4r3n6NCmarnBmukAXwr0c20fcGp0=;
  b=naSu7kKbdXHBbRFW4cvX3pG68bCWN5bT1qIpjHdLgIoBOchztRCJMNMQ
   8o5jXx/XTxnxIQh7G+c0M5emtYF6il++WxMstCK5+wT+1rlucGYUX6015
   lpQr7tRUY4TEjPdUhl/Xf7Vs104FNu6WPFongU5xjD7g1WQr2hhlgAg9p
   CmyJn9ImU8gG7Vhe8UkCEVEhNnaE6eKTXuAD+QJXK/iwHH6M6oXN/MoOQ
   0DYsvOwB1i9XJVt1ibdmZpCsSHInHdkdQWkDrw8nCTdfAIlx75ovi+yTF
   XJ3YIEODLmP9YGrBVbGGIlr++W//GLezVtn+9ZnQliwwl1Bte/LMxvg97
   g==;
X-CSE-ConnectionGUID: mujuHREvQVWaWe/igJS2aw==
X-CSE-MsgGUID: FhIqWxQYTvqCxhrEIzFfEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257541"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
X-CSE-ConnectionGUID: f8zszJDLTxS8Zr3Xt98ePw==
X-CSE-MsgGUID: e8jj/SxTSPeyfMo+3JLlWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972285"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
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
Subject: [PATCH 06/15] platform/x86/intel/vsec: Skip driverless features
Date: Wed, 30 Apr 2025 14:20:55 -0700
Message-ID: <20250430212106.369208-7-david.e.box@linux.intel.com>
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

If a feature lacks a corresponding driver and that feature is also a
supplier, registering it would be prevent the consumer driver from probing.
Introduces logic to skip such features during device registration.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index dc3f36afcd09..5374abef0b48 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -125,6 +125,26 @@ get_consumer_dependencies(struct vsec_priv *priv, int =
cap_id)
 	return &deps[consumer_id];
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
@@ -158,7 +178,8 @@ static int intel_vsec_link_devices(struct pci_dev *pdev=
, struct device *dev,
 		return 0;
=20
 	for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT)=
 {
-		if (state[supplier_id] !=3D STATE_REGISTERED)
+		if (state[supplier_id] !=3D STATE_REGISTERED ||
+		    !vsec_driver_present(supplier_id))
 			continue;
=20
 		if (!suppliers[supplier_id]) {
@@ -405,6 +426,11 @@ static int intel_vsec_register_device(struct pci_dev *=
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

