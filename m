Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B1212B0A;
	Tue, 17 Jun 2025 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124461; cv=none; b=Hz6XF++u9dDOaBXEW+/CB2Kvnhys+RsrQapsRhtdLh31FhD/wbpvGqjJrDcZLgd0AkWiskI2OFJM0pjzuy+qUtX93+Fevzkj8RxoWMDkvxJSYf41oQ4bjEV43xcnR6Rnkvd0880Ud1Ey71VZlpyX1SvER2v8fn+2GT62S24LaG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124461; c=relaxed/simple;
	bh=u03g1QF8vlE8P0p3HURWg5DdY5uYgZ7AT9aZJATUpfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIgZPJ5UCMGZulMGP4lPJBjWoBcwRWim01aD85lBX9ZIr7lqlP1nEkr3kEkldS32NPaMfcx1VIKI3UqUhWdKV45pvPbo/zOsK496sDU7vio0UZi2km/nMxNkvnYSFQB1dg7DmchxIT+eRYgtmCczEAsMVdYnxw9jkAGPVkVtvmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTA8BRkv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTA8BRkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124460; x=1781660460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u03g1QF8vlE8P0p3HURWg5DdY5uYgZ7AT9aZJATUpfI=;
  b=GTA8BRkvOmXvry6bEZABOFCmdeFkT1C0uuOkF7xxvhK72efzCcbgf5Oo
   5BIq34mOYTTlzZYCp4owH/Dg6fDCuuhoHwgDueFPvYAgAWuxDrdKudwfG
   Z+cy2X+q8E2XfCNjr9K4m76IH+CMN2ng40pGHlqmaMTl7H7nNuBgMDbfY
   Y67S540em1ruvfKj1q9NKDY0l12eCkmltdkFZFwDIO5Kqxa3ZYjSErTGX
   tMwKUuf8dlWkAc5mDhxP3avSG78PLHG8zJzhN2txrlFUt0qUW7jmYWs+h
   Z61bskWvyy1FJNf7YUysTTwJEHsRj+ZXHvbIOuHDvwOnNRgmb0y88RFHk
   A==;
X-CSE-ConnectionGUID: 5ZL3RQyMQ7OXfu9xe7uXFQ==
X-CSE-MsgGUID: 9B76va7ESj2UoGdEpNyE4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556580"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:55 -0700
X-CSE-ConnectionGUID: SmGOr9BASY+EuTgaPKXsQw==
X-CSE-MsgGUID: Cirqfy02Rxi2ogwWXKq0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989493"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:54 -0700
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
Subject: [PATCH V2 12/15] platform/x86/intel/tpmi: Get OOBMSM CPU mapping from TPMI
Date: Mon, 16 Jun 2025 18:40:36 -0700
Message-ID: <20250617014041.2861032-13-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
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

Changes in v2:
  - Add missing comma in mtl_info

 drivers/platform/x86/intel/vsec.c      | 2 +-
 drivers/platform/x86/intel/vsec_tpmi.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 8c330b57e4d4..eaab313037d2 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -720,7 +720,7 @@ static const struct intel_vsec_platform_info mtl_info =
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

