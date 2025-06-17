Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D861D61AA;
	Tue, 17 Jun 2025 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124456; cv=none; b=oRjEycxMBS405dqHu5oFq6vAVZtTCWdS8lVOqo2qe2Z2SSAr9JDMTN78S4dEexEqdSU+Ohdmv853qW5fF5+efHT5efezs1HhF8MnzpHtoboHLGhj5dsTYewVq14BiPW6dNXFnB0qtITg8vUrDXI/hX2WD6VKgIMNzqB9XYZRNEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124456; c=relaxed/simple;
	bh=ZkTo50vGqG/vHlerLepO9uBtaWmZ265yMRfMhT7xuus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/Sl+LWtxERZM92QwkCMn8+iz6s87Mo9p4PUwJd5R1yI5Kvmz55Hyq7N36M6beO5qsrelQ/SQssOYd0c5eOw1EsHnnPRxQPWNcNqlAik8nZFOCyYzTjxLVauoF6OOZQ4ixLjRtvCFE9kAi9PpJngNfVxmHssXCnkoeutk34u7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlYhNIuP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlYhNIuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124455; x=1781660455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkTo50vGqG/vHlerLepO9uBtaWmZ265yMRfMhT7xuus=;
  b=TlYhNIuP9G+G03civd2os0apeNHt9mTb0qeyCWjuHFgIk+7Rq7yB2XCT
   NMaBWEP4aDPv1bIvGpOFUkD8oTTOU96H/TA78b+a9cGka7akakZEquAP7
   GVHWksF71iYt0NwtjrDx8j9EBmsKTsgmzlFUVnCfINnseZ6XO2xd1/Rnt
   Zlmjd/GyRdAxJXdEi7Z/ioVJv2bMKUEGztqWLMpwRHx6QXznoemH53DcP
   9NzUK7t0wbm3FaxsHEqHvonZJNDsaRgBsdEL7wMoj5ElBRRrs0lP7sqUk
   zXtOSuRrwtjgr1Bn0KADsDl+X9Z4PsWlPg9yELRPWBj+tp0/2NOeNWu8y
   g==;
X-CSE-ConnectionGUID: aBSiU/mkRlOauKs1/AwUqQ==
X-CSE-MsgGUID: Nio7Qzi0R1Sgh7ibSgCOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556547"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:52 -0700
X-CSE-ConnectionGUID: azcVNfX6Tcy+mgI1+1ohyA==
X-CSE-MsgGUID: 0ZMYTlhORWOAMt4dCXyPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989459"
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
Subject: [PATCH V2 05/15] platform/x86/intel/vsec: Skip absent features during initialization
Date: Mon, 16 Jun 2025 18:40:29 -0700
Message-ID: <20250617014041.2861032-6-david.e.box@linux.intel.com>
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

Some VSEC features depend on the presence of supplier features that may not
always be present. To prevent unnecessary retries and device linking during
initialization, introduce logic to skip attempts to link consumers to
missing suppliers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index e497b570f814..8fab46ab5c79 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -563,12 +563,31 @@ static void intel_vsec_feature_walk(struct pci_dev *p=
dev, bool *have_devices,
 		*have_devices =3D true;
 }
=20
+static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
+{
+	struct vsec_priv *priv =3D pci_get_drvdata(pdev);
+	const struct vsec_feature_dependency *deps =3D priv->info->deps;
+	int consumer_id =3D priv->info->num_deps;
+
+	while (consumer_id--) {
+		int supplier_id;
+
+		deps =3D &priv->info->deps[consumer_id];
+
+		for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT=
) {
+			if (!(BIT(supplier_id) & priv->found_caps))
+				priv->state[supplier_id] =3D STATE_SKIP;
+		}
+	}
+}
+
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
 	bool have_devices =3D false;
 	int num_caps, ret;
+	int run_once =3D 0;
=20
 	ret =3D pcim_enable_device(pdev);
 	if (ret)
@@ -592,6 +611,11 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
=20
 		if (priv->found_caps =3D=3D info->caps)
 			break;
+
+		if (!run_once) {
+			intel_vsec_skip_missing_dependencies(pdev);
+			run_once =3D 1;
+		}
 	}
=20
 	if (!have_devices)
--=20
2.43.0

