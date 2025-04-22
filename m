Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974642367DD;
	Tue, 22 Apr 2025 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357691; cv=none; b=tHeXZCOD4oR/gXYEsS5tWAMnREV3u2+19CmamaUWzMOwc3S9B+iHrl5tqTmPHdVv4zfLnvMBod25npjm7FmDKW5b5M0eePPWBel3HtmmQFMYBg5PhTXin7uugvipb3wnmpZO7ucGC0JvQ+Xp/GFdQYrgUF+Rzx8cYIzubO4a7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357691; c=relaxed/simple;
	bh=9GMeuB9mJ/lPm2uKvwnURLZmlBjEMNOi4xuyEYZbGaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv+Pk/DXryxOOcc+9mMqSqlp6t2oQxvEH7qn96tdNc603je4CDE0Px2Cf6j9zAT5nTl420i40DbrN1oD+fECuiFEp5GWpjNqdHpbFdGcrHLfh3zvU65rzAO2XKrhiAUeDX0QPOs673CRO8I7gRrtmb++TDo4orpAzbnMiRLXIJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m65mttTY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m65mttTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745357689; x=1776893689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9GMeuB9mJ/lPm2uKvwnURLZmlBjEMNOi4xuyEYZbGaE=;
  b=m65mttTYZRC1Dbfx4qQdBA4tPksfgygLd4WMIAm3jPJTYnt8209RAtnO
   ITPVd/LkBN+oWF2EJW6ceM/DKPEatK1dqRHKGI6c6JVt7p818jieW/rqr
   SBVJ8JYekMNxJr/VkZq6r2IeftTIsVdnt8DxIovrdDKqQmLNMiBnKfD11
   UIpkRU6kiZfnQsulaZ9buXPXSV1cYsFb3OltABKcKj4bOq84AbR7VaGJi
   bzqgpyScr8lHV7plEiPajqy1v66W6pe0ODqgtr7bLdIzYtdpHsF2LHW8k
   B6pVWNjNraU5LuCyVItFU34cbsWcwlbSR/iVBikbpAZGsk4umIPSBxpzL
   A==;
X-CSE-ConnectionGUID: hc81iJehTPa8cuhaBp0sbA==
X-CSE-MsgGUID: +Oz6jsaMTYadUwcnKRzz2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46053992"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46053992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 14:34:44 -0700
X-CSE-ConnectionGUID: 2BfDzHwyQsWlvRCFTucZmQ==
X-CSE-MsgGUID: jbaBDCRkTwCHC9TeVJ16mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="133070686"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 14:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 4/5] platform/x86/intel-uncore-freq: Add attributes to show die_id
Date: Tue, 22 Apr 2025 14:34:26 -0700
Message-ID: <20250422213427.1943328-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
References: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For domains with agents to control cores (compute dies) show matching
Linux CPU die ID. Linux CPU ID is a logical die ID, so this may not match
physical die ID or domain_id. So, a mapping is required to get Linux CPU
die ID. This attribute is only presented when CPUID enumerates die ids.

This attribute can be used by orchestration software like Kubernetes to
target specific dies for uncore frequency control.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../uncore-frequency-common.c                 |  7 +++++
 .../uncore-frequency-common.h                 |  4 ++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 28 +++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index cfa3039a0e39..3411d33e5f13 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -142,6 +142,8 @@ show_uncore_attr(elc_high_threshold_enable,
 		 UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD_ENABLE);
 show_uncore_attr(elc_floor_freq_khz, UNCORE_INDEX_EFF_LAT_CTRL_FREQ);
 
+show_uncore_attr(die_id, UNCORE_INDEX_DIE_ID);
+
 #define show_uncore_data(member_name)					\
 	static ssize_t show_##member_name(struct kobject *kobj,	\
 					   struct kobj_attribute *attr, char *buf)\
@@ -203,6 +205,11 @@ static int create_attr_group(struct uncore_data *data, char *name)
 		data->uncore_attrs[index++] = &data->package_id_kobj_attr.attr;
 		init_attribute_ro(agent_types);
 		data->uncore_attrs[index++] = &data->agent_types_kobj_attr.attr;
+		if (topology_max_dies_per_package() > 1 &&
+		    data->agent_type_mask & AGENT_TYPE_CORE) {
+			init_attribute_ro(die_id);
+			data->uncore_attrs[index++] = &data->die_id_kobj_attr.attr;
+		}
 	}
 
 	data->uncore_attrs[index++] = &data->max_freq_khz_kobj_attr.attr;
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index 197ca2ad327f..9e4d7f44a41f 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -87,7 +87,8 @@ struct uncore_data {
 	struct kobj_attribute elc_high_threshold_enable_kobj_attr;
 	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
 	struct kobj_attribute agent_types_kobj_attr;
-	struct attribute *uncore_attrs[14];
+	struct kobj_attribute die_id_kobj_attr;
+	struct attribute *uncore_attrs[15];
 };
 
 #define UNCORE_DOMAIN_ID_INVALID	-1
@@ -100,6 +101,7 @@ enum uncore_index {
 	UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD,
 	UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD_ENABLE,
 	UNCORE_INDEX_EFF_LAT_CTRL_FREQ,
+	UNCORE_INDEX_DIE_ID,
 };
 
 int uncore_freq_common_init(int (*read)(struct uncore_data *data, unsigned int *value,
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 70415d80773c..adcf992e4ff0 100644
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
@@ -376,6 +378,9 @@ static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
 /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
 static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncore_index index)
 {
+	struct tpmi_uncore_cluster_info *cluster_info;
+	int ret;
+
 	switch (index) {
 	case UNCORE_INDEX_MIN_FREQ:
 	case UNCORE_INDEX_MAX_FREQ:
@@ -390,6 +395,16 @@ static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncor
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
@@ -439,6 +454,16 @@ static void remove_cluster_entries(struct tpmi_uncore_struct *tpmi_uncore)
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
@@ -586,6 +611,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 			cluster_info->uncore_data.domain_id = i;
 			cluster_info->uncore_data.cluster_id = j;
 
+			set_cdie_id(i, cluster_info, plat_info);
+
 			cluster_info->uncore_root = tpmi_uncore;
 
 			if (TPMI_MINOR_VERSION(pd_info->ufs_header_ver) >= UNCORE_ELC_SUPPORTED_VERSION)
@@ -659,5 +686,6 @@ module_auxiliary_driver(intel_uncore_aux_driver);
 
 MODULE_IMPORT_NS("INTEL_TPMI");
 MODULE_IMPORT_NS("INTEL_UNCORE_FREQUENCY");
+MODULE_IMPORT_NS("INTEL_TPMI_POWER_DOMAIN");
 MODULE_DESCRIPTION("Intel TPMI UFS Driver");
 MODULE_LICENSE("GPL");
-- 
2.48.1

