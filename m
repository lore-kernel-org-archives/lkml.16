Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620441E9B3D;
	Thu,  3 Jul 2025 02:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509727; cv=none; b=Jyr7CrVMYYKLLqnEZAny+urSg5zYWGhFsTEOQERc4XBXlZJcUSCe+e320YU68LqRWLEevujfyITrlKkIGSQDGs1+Hxoi5NT4NXX9/XhEGivzsvZwLGfksCmY+Wovo+Vdrenk2DF1heeT08wmpBWXfrOuVa2Vu7OtjWXIXmm7Ilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509727; c=relaxed/simple;
	bh=O7I8j48HlYBDhUEVb9ZCLo9KU+Zf/hvRKPdw65xL0wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqJDr874KEVLUZMKB34Bkn8gUnQ8md93nEPckbVEeMH3ahetxyLjzjvUx3PTmbwiUjQIOutxNlVOLDcireeoDxBg6vnjMX2PGPQNneaFagt+aUVMKXGZ6UQcWncNxZZe/f+twbq3eA1le8i4aOkye9zl7PRF0NpEHgDWZfKCR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1Cc7eRn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1Cc7eRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509726; x=1783045726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O7I8j48HlYBDhUEVb9ZCLo9KU+Zf/hvRKPdw65xL0wY=;
  b=V1Cc7eRnbhqgVSy+Q8p9IUvRWf/kY8PgN+yCF/G0fjZ9J+ci77Vh05qv
   anzsHVz2vR2pDYCdcoJPJ1ojIv9a8SslawLO9ejXjvYEMLgQWweCqI804
   nbgNxGALZH1EmDbf6BLVx9Z63iM/0Boc5PHymwXzNM9A+zbVOImlB31hA
   rFWMIYt8QKeQlB0O6zEi/pyb8OfSyQVpzYGcsPY8qievufLx1Piz2tEV+
   NRw4oqiQxanoHUkHWYKkkhv93WyOzIPot9tKDBo4p6TTfim6DX5+KDv1L
   Qrtjx95q4ISZSsPMdDcgDoQqYDdLQaJfBgEBiDjntMGPdk51SvzJWGXip
   A==;
X-CSE-ConnectionGUID: B6JgatueTy+8I+KOXwYGpQ==
X-CSE-MsgGUID: u0q7qVuQSf+cmaVJl+zYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450243"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:42 -0700
X-CSE-ConnectionGUID: cbWRAzWaSs6xgYHBA3K01A==
X-CSE-MsgGUID: zY2tifA5TDyy9EkeDcQqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594046"
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
Subject: [PATCH V3 07/15] platform/x86/intel/vsec: Add new Discovery feature
Date: Wed,  2 Jul 2025 19:28:22 -0700
Message-ID: <20250703022832.1302928-8-david.e.box@linux.intel.com>
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

Add the PCIe VSEC ID for new Intel Platform Monitoring Technology
Capability Discovery feature. Discovery provides detailed information for
the various Intel VSEC features. Also make the driver a supplier for
TPMI and Telemetry drivers which will use the information.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - Add missing comma in oobmsm_deps[]

 drivers/platform/x86/intel/vsec.c | 26 ++++++++++++++++++++++++--
 include/linux/intel_vsec.h        |  4 +++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 30e558af6888..4d76f1ac3c8c 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -66,6 +66,9 @@ static const char *intel_vsec_name(enum intel_vsec_id id)
 	case VSEC_ID_TPMI:
 		return "tpmi";
=20
+	case VSEC_ID_DISCOVERY:
+		return "discovery";
+
 	default:
 		return NULL;
 	}
@@ -84,6 +87,8 @@ static bool intel_vsec_supported(u16 id, unsigned long ca=
ps)
 		return !!(caps & VSEC_CAP_SDSI);
 	case VSEC_ID_TPMI:
 		return !!(caps & VSEC_CAP_TPMI);
+	case VSEC_ID_DISCOVERY:
+		return !!(caps & VSEC_CAP_DISCOVERY);
 	default:
 		return false;
 	}
@@ -138,6 +143,8 @@ static bool vsec_driver_present(int cap_id)
 		return IS_ENABLED(CONFIG_INTEL_SDSI);
 	case VSEC_CAP_TPMI:
 		return IS_ENABLED(CONFIG_INTEL_TPMI);
+	case VSEC_CAP_DISCOVERY:
+		return IS_ENABLED(CONFIG_INTEL_PMT_DISCOVERY);
 	default:
 		return false;
 	}
@@ -392,6 +399,9 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
_id)
 	case VSEC_ID_TPMI:
 		*cap_id =3D ilog2(VSEC_CAP_TPMI);
 		break;
+	case VSEC_ID_DISCOVERY:
+		*cap_id =3D ilog2(VSEC_CAP_DISCOVERY);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -681,14 +691,26 @@ static const struct intel_vsec_platform_info mtl_info=
 =3D {
 	.caps =3D VSEC_CAP_TELEMETRY,
 };
=20
+static const struct vsec_feature_dependency oobmsm_deps[] =3D {
+	{
+		.feature =3D VSEC_CAP_TELEMETRY,
+		.supplier_bitmap =3D VSEC_CAP_DISCOVERY,
+	},
+};
+
 /* OOBMSM info */
 static const struct intel_vsec_platform_info oobmsm_info =3D {
-	.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI,
+	.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_SDSI | VSEC_CAP_TPMI |
+		VSEC_CAP_DISCOVERY,
+	.deps =3D oobmsm_deps,
+	.num_deps =3D ARRAY_SIZE(oobmsm_deps),
 };
=20
 /* DMR OOBMSM info */
 static const struct intel_vsec_platform_info dmr_oobmsm_info =3D {
-	.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_TPMI,
+	.caps =3D VSEC_CAP_TELEMETRY | VSEC_CAP_TPMI | VSEC_CAP_DISCOVERY,
+	.deps =3D oobmsm_deps,
+	.num_deps =3D ARRAY_SIZE(oobmsm_deps),
 };
=20
 /* TGL info */
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 71067afaca99..a07796d7d43b 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -16,7 +16,8 @@
 #define VSEC_CAP_CRASHLOG	BIT(3)
 #define VSEC_CAP_SDSI		BIT(4)
 #define VSEC_CAP_TPMI		BIT(5)
-#define VSEC_FEATURE_COUNT	6
+#define VSEC_CAP_DISCOVERY	BIT(6)
+#define VSEC_FEATURE_COUNT	7
=20
 /* Intel DVSEC offsets */
 #define INTEL_DVSEC_ENTRIES		0xA
@@ -33,6 +34,7 @@ enum intel_vsec_id {
 	VSEC_ID_TELEMETRY	=3D 2,
 	VSEC_ID_WATCHER		=3D 3,
 	VSEC_ID_CRASHLOG	=3D 4,
+	VSEC_ID_DISCOVERY	=3D 12,
 	VSEC_ID_SDSI		=3D 65,
 	VSEC_ID_TPMI		=3D 66,
 };
--=20
2.43.0

