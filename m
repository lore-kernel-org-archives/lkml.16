Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29622FF4C;
	Thu,  8 May 2025 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745379; cv=none; b=IKN8xkXsoFSH1+K8cS7hRHkFS7reKvPibfUABhBAG+20XmW109oW86CBcRsBQRK2FOGBNagZSU6motDJ1IGFu3nAGdUHpfhOxtIU7rIoR4XOaz9rg6JU/PfGQCCqbxQdG0+iVYglkoJcVW4blJh4grDQWhyX1hKVJJiEDDZE2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745379; c=relaxed/simple;
	bh=4qK/frdCH57U9Wibhz8TB2+p4aPXke5o+NGhRsLFic8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fid0r7VzN5+04FadOUqO45rCNmpiqL0YMx3FNwrcfgL5hwWcCbP8JcZ62TlBZtKPvfyAZj8TM382s1KVpNdadx8tcvM5m71Ugo/QRUaKUU8nNSNubyrd0OM9sNS4P9mGhso6fYRKS6Z1vfmR7H1FXUfgfn3LTHDtsbvw91IwWnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URwhau8z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URwhau8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745378; x=1778281378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qK/frdCH57U9Wibhz8TB2+p4aPXke5o+NGhRsLFic8=;
  b=URwhau8z80OOgKKL6Wig3SRVTr+IgIctnjESz+XzFoEHBjepX6Em1hud
   ErWUwMPiTcZODWtduUKM6P/kjqJDO0mvWC9FPENdDKLpxSGZtF0eAp+eT
   uaCFqhKoNrc/iO/L41hS7Wh3UBH8PjEEeIQ7jarvEbwKbL8I3jGeE2xPR
   1yoNQYlClrjb60xEDxGsHnxOITOPM4kRqyu53wG0SOShQy+Uwp5K6N7Tw
   BIcIVuz4BsLlAWyQINZbXxNcCrPYmWIi9R+XslT4CUkO+uK2SRuPulIRd
   BVS0V1gcAriXWGfb2H+wViDj6SFdGF/s7BW7vx7Ulw0tqsGu0qEc/vu4F
   Q==;
X-CSE-ConnectionGUID: cHwI4F2hQr24LapPzEW/uQ==
X-CSE-MsgGUID: hd1lKFP1TWumOAvb35HEQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552601"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: s3CjzUTaSIaF6qEjGo32tw==
X-CSE-MsgGUID: jAeDtiOcRCel3uyevpL5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931258"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:54 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 4/5] platform/x86/intel-uncore-freq: Add attributes to show die_id
Date: Thu,  8 May 2025 16:02:41 -0700
Message-ID: <20250508230250.1186619-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For domains with agents to control cores (compute dies) show matching
Linux CPU die ID. Linux CPU ID is a logical die ID, so this may not match
physical die ID or domain_id. So, a mapping is required to get Linux CPU
die ID. This attribute is only presented when CPUID enumerates die ids.

This attribute can be used by orchestration software like Kubernetes to
target specific dies for uncore frequency control.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3:
Rebased
v2:
No change

 .../uncore-frequency-common.c                 |  7 +++++
 .../uncore-frequency-common.h                 |  4 ++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 28 +++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 9bc84962e2d5..0f8aea18275b 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -143,6 +143,8 @@ show_uncore_attr(elc_high_threshold_enable,
 		 UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD_ENABLE);
 show_uncore_attr(elc_floor_freq_khz, UNCORE_INDEX_EFF_LAT_CTRL_FREQ);
 
+show_uncore_attr(die_id, UNCORE_INDEX_DIE_ID);
+
 #define show_uncore_data(member_name)					\
 	static ssize_t show_##member_name(struct kobject *kobj,	\
 					   struct kobj_attribute *attr, char *buf)\
@@ -206,6 +208,11 @@ static int create_attr_group(struct uncore_data *data, char *name)
 			init_attribute_ro(agent_types);
 			data->uncore_attrs[index++] = &data->agent_types_kobj_attr.attr;
 		}
+		if (topology_max_dies_per_package() > 1 &&
+		    data->agent_type_mask & AGENT_TYPE_CORE) {
+			init_attribute_ro(die_id);
+			data->uncore_attrs[index++] = &data->die_id_kobj_attr.attr;
+		}
 	}
 
 	data->uncore_attrs[index++] = &data->max_freq_khz_kobj_attr.attr;
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index a638d2e1e83a..70ae11519837 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -88,7 +88,8 @@ struct uncore_data {
 	struct kobj_attribute elc_high_threshold_enable_kobj_attr;
 	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
 	struct kobj_attribute agent_types_kobj_attr;
-	struct attribute *uncore_attrs[14];
+	struct kobj_attribute die_id_kobj_attr;
+	struct attribute *uncore_attrs[15];
 };
 
 #define UNCORE_DOMAIN_ID_INVALID	-1
@@ -101,6 +102,7 @@ enum uncore_index {
 	UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD,
 	UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD_ENABLE,
 	UNCORE_INDEX_EFF_LAT_CTRL_FREQ,
+	UNCORE_INDEX_DIE_ID,
 };
 
 int uncore_freq_common_init(int (*read)(struct uncore_data *data, unsigned int *value,
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 8ebf6856fa7d..1c7b2f2716ca 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/intel_tpmi.h>
 
+#include "../tpmi_power_domains.h"
 #include "uncore-frequency-common.h"
 
 #define	UNCORE_MAJOR_VERSION		0
@@ -49,6 +50,7 @@ struct tpmi_uncore_cluster_info {
 	bool root_domain;
 	bool elc_supported;
 	u8 __iomem *cluster_base;
+	u16 cdie_id;
 	struct uncore_data uncore_data;
 	struct tpmi_uncore_struct *uncore_root;
 };
@@ -369,6 +371,9 @@ static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
 /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
 static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncore_index index)
 {
+	struct tpmi_uncore_cluster_info *cluster_info;
+	int ret;
+
 	switch (index) {
 	case UNCORE_INDEX_MIN_FREQ:
 	case UNCORE_INDEX_MAX_FREQ:
@@ -383,6 +388,16 @@ static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncor
 	case UNCORE_INDEX_EFF_LAT_CTRL_FREQ:
 		return read_eff_lat_ctrl(data, value, index);
 
+	case UNCORE_INDEX_DIE_ID:
+		cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
+		ret = tpmi_get_linux_die_id(cluster_info->uncore_data.package_id,
+					    cluster_info->cdie_id);
+		if (ret < 0)
+			return ret;
+
+		*value = ret;
+		return 0;
+
 	default:
 		break;
 	}
@@ -432,6 +447,16 @@ static void remove_cluster_entries(struct tpmi_uncore_struct *tpmi_uncore)
 	}
 }
 
+static void set_cdie_id(int domain_id, struct tpmi_uncore_cluster_info *cluster_info,
+		       struct intel_tpmi_plat_info *plat_info)
+{
+
+	cluster_info->cdie_id = domain_id;
+
+	if (plat_info->cdie_mask && cluster_info->uncore_data.agent_type_mask & AGENT_TYPE_CORE)
+		cluster_info->cdie_id = domain_id + ffs(plat_info->cdie_mask) - 1;
+}
+
 #define UNCORE_VERSION_MASK			GENMASK_ULL(7, 0)
 #define UNCORE_LOCAL_FABRIC_CLUSTER_ID_MASK	GENMASK_ULL(15, 8)
 #define UNCORE_CLUSTER_OFF_MASK			GENMASK_ULL(7, 0)
@@ -579,6 +604,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 			cluster_info->uncore_data.domain_id = i;
 			cluster_info->uncore_data.cluster_id = j;
 
+			set_cdie_id(i, cluster_info, plat_info);
+
 			cluster_info->uncore_root = tpmi_uncore;
 
 			if (TPMI_MINOR_VERSION(pd_info->ufs_header_ver) >= UNCORE_ELC_SUPPORTED_VERSION)
@@ -652,5 +679,6 @@ module_auxiliary_driver(intel_uncore_aux_driver);
 
 MODULE_IMPORT_NS("INTEL_TPMI");
 MODULE_IMPORT_NS("INTEL_UNCORE_FREQUENCY");
+MODULE_IMPORT_NS("INTEL_TPMI_POWER_DOMAIN");
 MODULE_DESCRIPTION("Intel TPMI UFS Driver");
 MODULE_LICENSE("GPL");
-- 
2.49.0

