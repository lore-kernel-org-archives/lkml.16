Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380391F09A7;
	Tue, 17 Jun 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124457; cv=none; b=VoDK0mV3/dVNB2vb6kYHDB/CVDtUdLquOo6rgbWFLW8f8SFm9utZAPycW4LHCIy8lmD1Q0RNtZvjynyQxnn96z/4hw0My5YsnLv4nJumCqljDK2b+sXOD0h0eres9I525KZTHVCxyCxSWsUtg/X60OJeIis+nRIXypj7bIkNGHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124457; c=relaxed/simple;
	bh=r05s51ID1NVLUlv1eTX6BvNa57WzYVBgQVb102slZ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQB7p1TF233lyNcbm13K2twGDT8FAMOb3CjOkDgEIfLLtmKkv4GnsPpZtvKTPD3aeKqqgRdlfsgSV9vOxwAuGtaKEb6JHIapzx6sxnhumuzb+GFp3NSIRwsqhgsNltze1TNcyzbxouN9pL5Tt55T4VjyPMLECvMp9cfkzuDRx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLUl8VlY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLUl8VlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124456; x=1781660456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r05s51ID1NVLUlv1eTX6BvNa57WzYVBgQVb102slZ+Y=;
  b=WLUl8VlY33Pl8f15u7z4MaA1RieACJ+YGkcydeo3OxKWik+yBuHhhEYh
   uWHjS+yO4sQxQo0n05yGcfFG5Earkva2qxeLON1wMXiq3GgyonmZuJobf
   feHKuv9GfRO7nT3vpiyNijGWLolB5m50BSaHxfyOv7bFu5ylXJV6V4t+O
   FDtPWmt2613FjR4qDARmWdZcrxwVGTAIAy9GlIJFzlOL2Chx3NFKmRHRg
   RLq9h9jRBGhHUOtvRQERYYhB3wJFQvGdtkY0Pf36Nd8nJnpZMymVs78OY
   vjVOSRqRrdvX9Q/E64t0XOdWXtuzhhf3sFEIG8ZRM8YhKxIzqhhAImxiB
   w==;
X-CSE-ConnectionGUID: rFQ9ly9pS2mcf+6pv9e4HA==
X-CSE-MsgGUID: +koo1MHYStyA1HmStzrJGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556560"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:53 -0700
X-CSE-ConnectionGUID: tzjc9fHVQ3aEhlvsE81TLw==
X-CSE-MsgGUID: x+yr/F8ORzyv3MfwrwZM8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989469"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:52 -0700
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
Subject: [PATCH V2 07/15] platform/x86/intel/vsec: Add new Discovery feature
Date: Mon, 16 Jun 2025 18:40:31 -0700
Message-ID: <20250617014041.2861032-8-david.e.box@linux.intel.com>
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

Add the PCIe VSEC ID for new Intel Platform Monitoring Technology
Capability Discovery feature. Discovery provides detailed information for
the various Intel VSEC features. Also make the driver a supplier for
TPMI and Telemetry drivers which will use the information.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - Add missing comma in oobmsm_deps[]

 drivers/platform/x86/intel/vsec.c | 26 ++++++++++++++++++++++++--
 include/linux/intel_vsec.h        |  4 +++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index d522b06f3f69..98f570a389c6 100644
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
@@ -137,6 +142,8 @@ static bool vsec_driver_present(int cap_id)
 		return IS_ENABLED(CONFIG_INTEL_SDSI);
 	case VSEC_CAP_TPMI:
 		return IS_ENABLED(CONFIG_INTEL_TPMI);
+	case VSEC_CAP_DISCOVERY:
+		return IS_ENABLED(CONFIG_INTEL_PMT_DISCOVERY);
 	default:
 		return false;
 	}
@@ -391,6 +398,9 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
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
@@ -676,14 +686,26 @@ static const struct intel_vsec_platform_info mtl_info=
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

