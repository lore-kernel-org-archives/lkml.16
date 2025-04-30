Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F102D26A7;
	Wed, 30 Apr 2025 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048087; cv=none; b=VQOTbi8MMoVrn++/1du3bQudFK7EZ70xmyLrgw9RQ/YorhzeNAuNA3zV/+1dbBo9dv2C7j657R0JXHht3yXjL7RZqolEOolXNqATGfKrr38MOduxnPl5BNc0x/5if3kNyKt0RAb0Q1BjWqEuNkFziRnl0r7ELM/98MCaIQzRjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048087; c=relaxed/simple;
	bh=DR5v0uNmras0SbTcRKTY41VV6ZfhPU7oenqTtDiM7rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/feme566Wd9CUUGSNE8aiqTeXCbio/JrphLttBXxgRJDubeUnzk1Bl+FxI/68dTtsC+FGQbUvAtU719x39FkniWnCRlhRtW72CNoo8a4WfKtdOxINKm/MOEyNOWypA30NUWk+0L9Tuc/baSQkxArRcxGnAWfehWWpsg9mocqGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPWuWyrn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPWuWyrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048086; x=1777584086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DR5v0uNmras0SbTcRKTY41VV6ZfhPU7oenqTtDiM7rY=;
  b=iPWuWyrn0JCn6plJK2yp3Jm/drzdKfncEmbaSfnkBksv4cgTXYYY71Tl
   kmwbBvQP6r7ijdzgwnlEYnBx/fnMO2e8wZb2Xl4Xdx17tddkUjqWbWi1e
   dMcx5r1CtNa1sBJ9OoK6AADbYQCzMV3DdbxWxn9bB2EU6s+jb7hp1uyBM
   gVvV1LtVLFrGrmGvZbPUNIh1DEJgiiGzpUhWEeSrfpOI3PgLD8AKqCO1G
   j7PXaYFxguK8jpgHP0A/zCOZH5PegOCvsKMH2IdKfoq15RIUhDA0009dz
   hnI4VY2o+Lfy/fWr4mfljdSVIYIHa03xPWfeKYBUyyWE/NmRmbXG8VRQh
   A==;
X-CSE-ConnectionGUID: C81cbS+ZR2CL/mRdHRXbpg==
X-CSE-MsgGUID: UlhSmIbRSUqoBC345aIBow==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257554"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
X-CSE-ConnectionGUID: 5MGd9Q07Roy4jM2qZcL1fw==
X-CSE-MsgGUID: 34+dsDeQQkiBOHlRCGOIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972306"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
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
Subject: [PATCH 12/15] platform/x86/intel/tpmi: Get OOBMSM CPU mapping from TPMI
Date: Wed, 30 Apr 2025 14:21:01 -0700
Message-ID: <20250430212106.369208-13-david.e.box@linux.intel.com>
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

Copy TPMI=E2=80=99s OOBMSM platform info into a common area within VSEC pri=
vate
data via intel_vsec_set_mapping(). This enables other Intel VSEC features
to access the CPU mapping without additional queries.

Additionally, designate the TPMI driver as a supplier for the Telemetry
driver, ensuring it can obtain the necessary platform information for
future feature extensions.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c      | 2 +-
 drivers/platform/x86/intel/vsec_tpmi.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 989d79d71db1..151f87fe928d 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -721,7 +721,7 @@ static const struct intel_vsec_platform_info mtl_info =
=3D {
 static const struct vsec_feature_dependency oobmsm_deps[] =3D {
 	{
 		.feature =3D VSEC_CAP_TELEMETRY,
-		.supplier_bitmap =3D VSEC_CAP_DISCOVERY
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

