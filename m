Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE433223DFF;
	Thu,  3 Jul 2025 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509726; cv=none; b=E8ompN0Z+GpUaNRvAqmTOYky6Vs6eg9UO5Khzx0b6JVXLVe+q4HyE8Vh9VVxRJ7P3ZHFxXKp8oB/A0Vk3xP1DgHL6ItOFCjmuvGqaBXXaSrWlh8y7CZRFOnX4phY9ot7lObKG5DnGwPaU3amDjTpg0ZZGiawiU7ZDVVWLAv6Tes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509726; c=relaxed/simple;
	bh=nRnQhh7nDi+Df5/AGH5meL5V0fuXNlm1CoOICjXIAUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGiS2THL56og4BBf79MPPOslWFAABcrGjaSkMdxoz01qsiUMb/usTV/JUxkT7OkZ1qlwLdFc3WNrjawxq/qlCoL7Eh3CzQWZvP1X+qDebvvcCIxUYQ8VAHsoLaac6seHpfQumr51HO/BD+g7gwSo/qRtamUuYuidc5s+X93O6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC/yPbDP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC/yPbDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509725; x=1783045725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRnQhh7nDi+Df5/AGH5meL5V0fuXNlm1CoOICjXIAUo=;
  b=LC/yPbDPiIsBaiEwtF5w8v53J2+wSaHdzm5e4WRV8xa3h4ZPtrNkv7X+
   SNlMYIyhGa7TvxQRROiNAm5NFpToYEnyAKd9xR3C1u3SEAvJ8oSZ71hvA
   Zl5hW70LezfzWM5m8ayP2MofuakJZ2jO+APC67iRj3TRK22eVOPrB/2gU
   c4VJJAyL1eiE01kiAizzUFec5yrePxH0XJtoLU64XX1xdB/maPuiUYoMS
   viucwloE/01kh4gcEYhVK4HRnHORzKOmGKz5a2p/YqcQEoUmGFK6rfgmZ
   /M49We+tbVykAcCzHp+xdB34fD29V42uSmXpuWVMmpGApCxkdcsq27Ei4
   g==;
X-CSE-ConnectionGUID: DV2AM8JnTBymfg0XY3N5Ng==
X-CSE-MsgGUID: yzkUOMKFRh+/ubK9AMdGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450241"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450241"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:42 -0700
X-CSE-ConnectionGUID: IMZB+mNJTRu3Z4OFO1+aXw==
X-CSE-MsgGUID: VSgD3NKYTRubhTBdT9iANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594041"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:41 -0700
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
Subject: [PATCH V3 06/15] platform/x86/intel/vsec: Skip driverless features
Date: Wed,  2 Jul 2025 19:28:21 -0700
Message-ID: <20250703022832.1302928-7-david.e.box@linux.intel.com>
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

If a feature lacks a corresponding driver and that feature is also a
supplier, registering it would be prevent the consumer driver from probing.
Introduces logic to skip such features during device registration.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 32f777b41b33..30e558af6888 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -123,6 +123,26 @@ get_consumer_dependencies(struct vsec_priv *priv, int =
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
@@ -158,7 +178,8 @@ static int intel_vsec_link_devices(struct pci_dev *pdev=
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

