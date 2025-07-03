Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4DD20E005;
	Thu,  3 Jul 2025 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509725; cv=none; b=QyzfwG73Btbd9Tn/0lD2EgY6K01yMPnymuwe1pjByApZ/pAk82o7xcwNGPLY0F7e+M1fcQ8gpsY0A13kD2wA/yfv/TclIxCxv0Bixm1mHcHgI7bvY4HBNmzTLpqZnRaadmR6O61rw+Wv5xNxUE1n/iJMa/HdEwwDgGnNIB4VUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509725; c=relaxed/simple;
	bh=ZQl30xsbntyPL5vlvW6ub1Xr1A6jiy/+3VnOR/srZhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T98FK9dkw+crP6uLjpdN1JWABzic9WLQGrPdFRGugCrmzDsvJHxuHTs63sCRvF0OElOdHYNqa7k0XEGIEP3LXr6XUeG4cElmJ+VU3r1ScL8vAN3eTvIqPr8dsiqn401Q0DLGcDFfsd3hocqB80R1UeGl1Nx2O4NqBKTB/VEsMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0cZBMuP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0cZBMuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509724; x=1783045724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQl30xsbntyPL5vlvW6ub1Xr1A6jiy/+3VnOR/srZhY=;
  b=Q0cZBMuPZ4oJ/Lu3Fgd7/hMCIJFLHWsLnpx665LJFNKppwtc7J2bqbuZ
   ik7Qo1JLLFzjXI+bLVJx96y4qnwxmbwJzzYoUP2VTgyFO8N7B7JqEU5Qe
   OkEYMRU3upMZjSaB77QxTlMr/KaVVO+bmWN5Fo9yUPK1vADdNogWI8qVU
   zQdrbMWJRC42dlvyJms0JwlHe4+96nTq1h7SrTuP9zaqIVv3Lgm9HXu4e
   jyS2puyZcsy3kMaq6RgnGNJ0vxCzRAiRVsqRhNwktMDw/CrFb4s+Per9H
   SunK4tRNxS1hCkGr/t5LyDYEYNGNED791DmG0VkoqfBjyRHLiZJeifSu+
   g==;
X-CSE-ConnectionGUID: 8qjLN6JYS9aVxoLs0HEgag==
X-CSE-MsgGUID: hq0E1aqdToO1Lv6dgXyASg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450238"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:41 -0700
X-CSE-ConnectionGUID: UH/GibPkTjq/pk1CC6MnRQ==
X-CSE-MsgGUID: r61pRgkpSIiTlSzVXNtlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594034"
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
Subject: [PATCH V3 05/15] platform/x86/intel/vsec: Skip absent features during initialization
Date: Wed,  2 Jul 2025 19:28:20 -0700
Message-ID: <20250703022832.1302928-6-david.e.box@linux.intel.com>
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

Some VSEC features depend on the presence of supplier features that may not
always be present. To prevent unnecessary retries and device linking during
initialization, introduce logic to skip attempts to link consumers to
missing suppliers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index aa1f7e63039d..32f777b41b33 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -568,11 +568,30 @@ static bool intel_vsec_get_features(struct pci_dev *p=
dev,
 	return found;
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
 	int num_caps, ret;
+	int run_once =3D 0;
 	bool found_any =3D false;
=20
 	ret =3D pcim_enable_device(pdev);
@@ -597,6 +616,11 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
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
 	if (!found_any)
--=20
2.43.0

