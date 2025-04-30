Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95382D0AAF;
	Wed, 30 Apr 2025 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048083; cv=none; b=Ip6Sf/B6Auzv0ySzMLJbgUzk+9jmYU3YuE0X/vXB9PRoW9s66rS4gFXrnDzJJmvo4whC6Gyh4Lo7JnZXRxypKpPC2iyhDxVQE0hJ59jPS0a7ocV7ROTbJPNgM15nCBf+th0E3S1rFXRLgq05vz9MZMu9+uMjC36tlDg+42QLTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048083; c=relaxed/simple;
	bh=lQynjfEUFMsRgZwVQUMWpLz7QknE3Nr/dZm2t33ZTTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7v817WcW8uM0Eul7Y67TDIL82fHEDXAeiKOmFAJPkVJMY4GrzGSOssCEHQyjxS2kc4O83HEJB6pF9qJS47ET4bfYxSsyjoVLt1eU0LXy6rAJFQt/2yL6yPT7IFmZadQAUJVwDewEt31dwmTX6MJRwU72cNA1B28GBKB/Sry+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgoG/R3Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgoG/R3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048082; x=1777584082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lQynjfEUFMsRgZwVQUMWpLz7QknE3Nr/dZm2t33ZTTM=;
  b=mgoG/R3ZdxY+wtV9A1IBamZwZ9HzdpyMR5iJN0C+kGbVuOnmPrCm8e7U
   k1UNagWE5qTFUM1hCPqm9nBZztHAZ88+z7rrZiAgQZ0euo7Wr/XuYpGSz
   /haamcTBSOMLMO/1oWy1mHUDXg8+B5YY3A2+b7Xf8Ajarn9XcQ+nrdspA
   D/LtY7JCN6A0n+DA46A1DMUTM0+YYp5xQmD+7l68D404vkOM4O989T014
   LLNrpxP0+qwal8Nw+ZkPTtdKVHaarGf0Yzab0aYWkbd0+ajIpNbMCjB2C
   2zVR4yUfT11m9JLg15WQZUR0a5BePkdCq65dIBVEtEYxO4308DGAljr5+
   w==;
X-CSE-ConnectionGUID: 39WUMSLcRmylb+9yspYnFA==
X-CSE-MsgGUID: yrC0Ev58QVSwUAG1Ic5WTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257543"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
X-CSE-ConnectionGUID: b5Bb5t8BRGSIzGDrDej2zg==
X-CSE-MsgGUID: RguZRgUJRuOqzCXRUXNtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972288"
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
Subject: [PATCH 07/15] platform/x86/intel/vsec: Add new Discovery feature
Date: Wed, 30 Apr 2025 14:20:56 -0700
Message-ID: <20250430212106.369208-8-david.e.box@linux.intel.com>
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

Add the PCIe VSEC ID for new Intel Platform Monitoring Technology
Capability Discovery feature. Discovery provides detailed information for
the various Intel VSEC features. Also make the driver a supplier for
TPMI and Telemetry drivers which will use the information.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 26 ++++++++++++++++++++++++--
 include/linux/intel_vsec.h        |  4 +++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 5374abef0b48..e3ec17a53e62 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -65,6 +65,9 @@ static const char *intel_vsec_name(enum intel_vsec_id id)
 	case VSEC_ID_TPMI:
 		return "tpmi";
=20
+	case VSEC_ID_DISCOVERY:
+		return "discovery";
+
 	default:
 		return NULL;
 	}
@@ -83,6 +86,8 @@ static bool intel_vsec_supported(u16 id, unsigned long ca=
ps)
 		return !!(caps & VSEC_CAP_SDSI);
 	case VSEC_ID_TPMI:
 		return !!(caps & VSEC_CAP_TPMI);
+	case VSEC_ID_DISCOVERY:
+		return !!(caps & VSEC_CAP_DISCOVERY);
 	default:
 		return false;
 	}
@@ -140,6 +145,8 @@ static bool vsec_driver_present(int cap_id)
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
@@ -677,14 +687,26 @@ static const struct intel_vsec_platform_info mtl_info=
 =3D {
 	.caps =3D VSEC_CAP_TELEMETRY,
 };
=20
+static const struct vsec_feature_dependency oobmsm_deps[] =3D {
+	{
+		.feature =3D VSEC_CAP_TELEMETRY,
+		.supplier_bitmap =3D VSEC_CAP_DISCOVERY
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

