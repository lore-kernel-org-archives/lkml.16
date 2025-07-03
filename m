Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF9233736;
	Thu,  3 Jul 2025 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509730; cv=none; b=YxRsLerozZyCa8yrImwMeX+dHWDNHeI5oTNRYdgQzfak1sszb1jYhCbMUAvrz/HqLX7ZT6tJlQTbMR02Ec3TFwMt5udMYZbz8iIYciy0sBlk2zDusV/dP9qVutF6X/PkN4k+HcYr/vqCP7eP3tHbTVsZMqb/sMtT4+k9qFRtax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509730; c=relaxed/simple;
	bh=BKgGK23v+iRJDwxnqYfAnNAyTImPiciLAiGRoO4Hjjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgtm1JWvHF+K3F23b2d/dJu4i3o4zFBcLes3Rg+4SP73G+EjAMOPnxnneW81kt+5b/YnK63ATRDnQcIH7Y8Q7tNt22StLF4gUOucfDWMKf3VMXuUappcMcuSlO8gCp/rerQo/YEA5qXpc2af4/dPubEYvvS2KNEk9UiRuT+yDtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMVc5lJz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMVc5lJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509729; x=1783045729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BKgGK23v+iRJDwxnqYfAnNAyTImPiciLAiGRoO4Hjjw=;
  b=FMVc5lJznIsjCtFdIBrCxi+ZZmMdyZPrhXhVVwUv6DBEDLvNzOs3jJk9
   mvj+leofd3ek2HLypCAXD79dJxhc0CJ/zOgdjhvKeC6vcF1aGNEKnVoxR
   2k/en0HG3woAqWcfWH9uClH1iFEGCsQdgCjB03ML6kAABPmjeUh8ZjPfX
   jAmrrjCFcrLi/zaogbdHgjfUWQRrcvKN57lABrQjyRaQ0o2K1J5jHS5IC
   bFvbWG5uFKz6dVFkDsR/LFiWcBFBttU81qonqAWSffsjLBmLFfk8BsvyK
   nZm1BXUyljSpBBPr+Dg7Mo634HC1s2x80HWWbvwSzU8RnhuetFzvdbGgu
   w==;
X-CSE-ConnectionGUID: pNfhhXN4SP+1S/CCa/n3qw==
X-CSE-MsgGUID: VwXzSxMSS62AYUmE4bGAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450255"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:45 -0700
X-CSE-ConnectionGUID: SzFQ5Q6oQDCQdAqA6zLUnQ==
X-CSE-MsgGUID: LSOuqmNhQ/aT3jHaTUJNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594074"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:44 -0700
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
Subject: [PATCH V3 12/15] platform/x86/intel/tpmi: Get OOBMSM CPU mapping from TPMI
Date: Wed,  2 Jul 2025 19:28:27 -0700
Message-ID: <20250703022832.1302928-13-david.e.box@linux.intel.com>
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

Copy TPMI=E2=80=99s OOBMSM platform info into a common area within VSEC pri=
vate
data via intel_vsec_set_mapping(). This enables other Intel VSEC features
to access the CPU mapping without additional queries.

Additionally, designate the TPMI driver as a supplier for the Telemetry
driver, ensuring it can obtain the necessary platform information for
future feature extensions.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - Add missing comma in mtl_info

 drivers/platform/x86/intel/vsec.c      | 2 +-
 drivers/platform/x86/intel/vsec_tpmi.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 711ff4edfe21..f66f0ce8559b 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -725,7 +725,7 @@ static const struct intel_vsec_platform_info mtl_info =
=3D {
 static const struct vsec_feature_dependency oobmsm_deps[] =3D {
 	{
 		.feature =3D VSEC_CAP_TELEMETRY,
-		.supplier_bitmap =3D VSEC_CAP_DISCOVERY,
+		.supplier_bitmap =3D VSEC_CAP_DISCOVERY | VSEC_CAP_TPMI,
 	},
 };
=20
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/=
intel/vsec_tpmi.c
index d95a0d994546..7748b5557a18 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -799,6 +799,10 @@ static int intel_vsec_tpmi_init(struct auxiliary_devic=
e *auxdev)
 			ret =3D tpmi_process_info(tpmi_info, pfs);
 			if (ret)
 				return ret;
+
+			ret =3D intel_vsec_set_mapping(&tpmi_info->plat_info, vsec_dev);
+			if (ret)
+				return ret;
 		}
=20
 		if (pfs->pfs_header.tpmi_id =3D=3D TPMI_CONTROL_ID)
--=20
2.43.0

