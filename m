Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5428CF48;
	Mon, 28 Apr 2025 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859817; cv=none; b=WnudGDVgfHUzPV5APURU5xOTzQBW9fasYLOtO8RT9A58ZMeZNyX3Q1R0chZrbh7lNa0uxq/teqLlVlSblkS11AfMqwfwgy3jTuQ4/HomrTxYP3/ysrfVPE4cwKSBVA/buulQBf8nf4fBOtUZryrNcS20guVniPvAzz1QMF6zZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859817; c=relaxed/simple;
	bh=m0yNZjkWK+pi5FdffxFuoukY8tmYxk3yYK7fKKlbkbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWQcd0lJ0eNc2pEcxHxIuoc1p1zcPaJad8SCeC/AgY8bIpoXGpg+SPclcmvAtFQTKcbL92E8K+y/jsE7CrITEMX03FMm5oSy/WKG7Ifm0OlB8Zif0BNUWJ9xLkL4RWzHK0BGGoJgutV+HZX98xt1/tD7bpaYWoXD5SrlSnTbnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfBzr98p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfBzr98p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859816; x=1777395816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m0yNZjkWK+pi5FdffxFuoukY8tmYxk3yYK7fKKlbkbI=;
  b=nfBzr98pkKu/NRoFxmlEBpkv+FjrFAjlmWZt0YKJiQsjv39vdZadwyl+
   3fLQ8B9vo5f45nXRhxdKkM9XQ1vjH4v+yEELHTzWjkjgb7O+xYXUp6Mx/
   4BJN8N8cyB5oouHEmF4Ll5Hxs3mN8KOJ0GJc/Mteeuh9fJvnJ7irq1GzZ
   tHTZyEylZJlV3u8M8z0nerF4LOoNYFzwKRX5a+Ke7O/4dASe5piredqBL
   T7qL/PZ4P61X8ayK6xH3zJMR4o6NHRs7HEgZlI5JFf2yy4CLLGMKM7EBt
   fOFqBhumVxlIl3kyE11PZzvq5DHZk68iAVdHSswIopV6sY7ISFOuop6lJ
   A==;
X-CSE-ConnectionGUID: YUlOkjl5T72oxSn5G66Iug==
X-CSE-MsgGUID: 3TEUoLeNQlyNvEqEJByNig==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111445"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111445"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:27 -0700
X-CSE-ConnectionGUID: /vKLEp5MSrOAFsZrDL+fZQ==
X-CSE-MsgGUID: SpwU7FGKQ1SZfJriXyjT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309601"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 4/5] platform/x86/intel-uncore-freq: Add attributes to show die_id
Date: Mon, 28 Apr 2025 10:03:15 -0700
Message-ID: <20250428170316.231353-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
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
v2:
No change

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

