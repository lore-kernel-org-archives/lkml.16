Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D463F283CBE;
	Tue,  6 May 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549340; cv=none; b=COSY1s4kT0igpQlllAzviN3PoOPclUHOHrmq6lmR+ihdkhHuGIPua70oepeJggqfus7Sr5VZkDF2yRZdW0Db4RIFO9tv+JzcLldHzMDISPbk+xwoQA3Zu3czTTAly0/8Xt4pw78aiFP+zFO28TwCy0kLkdyCM9yF6gA2lIRDYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549340; c=relaxed/simple;
	bh=uQ3J85liHmh/uiy98ssXT8SKO89/wTyHtgqYzNyKZio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QT9f+aS4dB+bGgR8ml2bYmyLboM5C50D3KhQA5S9we3Of7BotxxvBsWDNAgayYscgV0kaPeGmDUizuGwA5s7+V/keAY0l293SuogQI4aV5Gh10LVegSIRGRfvtHyx0WGFL2hlC8Mxqun0sqv1e9CaQbfL7L8XaJMOUdEmTCng5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8d/s8NG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8d/s8NG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746549338; x=1778085338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uQ3J85liHmh/uiy98ssXT8SKO89/wTyHtgqYzNyKZio=;
  b=Y8d/s8NGaLnrkbdHSRo83NFn2ZnrCoBdS9+/2XfLcnZLO+2OPrd32itU
   G8wkw9OZi9WcioJEMBTcfM+o4EiqOu64bC85hdib4U7SL8oZPSYjro6R0
   perckud99Pg8Y/5Re7BtWXSPpi4dpi+HvBMqeT3MA51WdSl+L6381QrhC
   cudrzuB3A+/xGNalMiZpXW5k0pITsNXf89cjA/kq/1aBQFYNroOv9d2ni
   98+YeM4qcmhEoI76ThMsBqF5xq2xw4CQjapYd7t4cfzMzbvQfy+jspJPa
   ZrRsMKKgMjWRoskQa4h90QMoeprmK03oiIvqtolUbymIEV1+MVgSP3yU0
   A==;
X-CSE-ConnectionGUID: jrjayTgkTY+b0qitiiIgZA==
X-CSE-MsgGUID: nAO944jMS+WEfTqdyEwL3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70736093"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70736093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:35:36 -0700
X-CSE-ConnectionGUID: 4RiFN45nR6e21rx06Ad1ow==
X-CSE-MsgGUID: I+3a7n14RSiQZLLondivsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136636283"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2025 09:35:35 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 2/3] platform/x86: ISST: Support SST-PP revision 2
Date: Tue,  6 May 2025 09:35:30 -0700
Message-ID: <20250506163531.1061185-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506163531.1061185-1-srinivas.pandruvada@linux.intel.com>
References: <20250506163531.1061185-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SST PP revision 2 added fabric 1 P0, P1 and Pm frequencies. Export them
by using a new IOCTL ISST_IF_GET_PERF_LEVEL_FABRIC_INFO. This IOCTL
requires platforms with SST PP revision 2 or higher.

To accommodate potential future increases in fabric count and avoid ABI
changes, support is extended for up to 8 fabrics.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
- Change start = 0 to a define SST_PP_CORE_RATIO_P0_FABRIC_1_START

 .../intel/speed_select_if/isst_tpmi_core.c    | 66 +++++++++++++++++++
 include/uapi/linux/isst_if.h                  | 26 ++++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index a52fc2f5ea89..f56bb63f7947 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1016,6 +1016,7 @@ static int isst_if_set_perf_feature(void __user *argp)
 
 #define SST_PP_INFO_10_OFFSET	80
 #define SST_PP_INFO_11_OFFSET	88
+#define SST_PP_INFO_12_OFFSET	96
 
 #define SST_PP_P1_SSE_START	0
 #define SST_PP_P1_SSE_WIDTH	8
@@ -1068,6 +1069,15 @@ static int isst_if_set_perf_feature(void __user *argp)
 #define SST_PP_CORE_RATIO_PM_FABRIC_START	48
 #define SST_PP_CORE_RATIO_PM_FABRIC_WIDTH	8
 
+#define SST_PP_CORE_RATIO_P0_FABRIC_1_START	0
+#define SST_PP_CORE_RATIO_P0_FABRIC_1_WIDTH	8
+
+#define SST_PP_CORE_RATIO_P1_FABRIC_1_START	8
+#define SST_PP_CORE_RATIO_P1_FABRIC_1_WIDTH	8
+
+#define SST_PP_CORE_RATIO_PM_FABRIC_1_START	16
+#define SST_PP_CORE_RATIO_PM_FABRIC_1_WIDTH	8
+
 static int isst_if_get_perf_level_info(void __user *argp)
 {
 	struct isst_perf_level_data_info perf_level;
@@ -1167,6 +1177,59 @@ static int isst_if_get_perf_level_info(void __user *argp)
 	return 0;
 }
 
+static int isst_if_get_perf_level_fabric_info(void __user *argp)
+{
+	struct isst_perf_level_fabric_info perf_level_fabric;
+	struct tpmi_per_power_domain_info *power_domain_info;
+	int start = SST_PP_CORE_RATIO_P0_FABRIC_START;
+	int width = SST_PP_CORE_RATIO_P0_FABRIC_WIDTH;
+	int offset = SST_PP_INFO_11_OFFSET;
+	int i;
+
+	if (copy_from_user(&perf_level_fabric, argp, sizeof(perf_level_fabric)))
+		return -EFAULT;
+
+	power_domain_info = get_instance(perf_level_fabric.socket_id,
+					 perf_level_fabric.power_domain_id);
+	if (!power_domain_info)
+		return -EINVAL;
+
+	if (perf_level_fabric.level > power_domain_info->max_level)
+		return -EINVAL;
+
+	if (power_domain_info->pp_header.feature_rev < 2)
+		return -EINVAL;
+
+	if (!(power_domain_info->pp_header.level_en_mask & BIT(perf_level_fabric.level)))
+		return -EINVAL;
+
+	/* For revision 2, maximum number of fabrics is 2 */
+	perf_level_fabric.max_fabrics = 2;
+
+	for (i = 0; i < perf_level_fabric.max_fabrics; i++) {
+		_read_pp_level_info("p0_fabric_freq_mhz", perf_level_fabric.p0_fabric_freq_mhz[i],
+				    perf_level_fabric.level, offset, start, width,
+				    SST_MUL_FACTOR_FREQ)
+		start += width;
+
+		_read_pp_level_info("p1_fabric_freq_mhz", perf_level_fabric.p1_fabric_freq_mhz[i],
+				    perf_level_fabric.level, offset, start, width,
+				    SST_MUL_FACTOR_FREQ)
+		start += width;
+
+		_read_pp_level_info("pm_fabric_freq_mhz", perf_level_fabric.pm_fabric_freq_mhz[i],
+				    perf_level_fabric.level, offset, start, width,
+				    SST_MUL_FACTOR_FREQ)
+		offset = SST_PP_INFO_12_OFFSET;
+		start = SST_PP_CORE_RATIO_P0_FABRIC_1_START;
+	}
+
+	if (copy_to_user(argp, &perf_level_fabric, sizeof(perf_level_fabric)))
+		return -EFAULT;
+
+	return 0;
+}
+
 #define SST_PP_FUSED_CORE_COUNT_START	0
 #define SST_PP_FUSED_CORE_COUNT_WIDTH	8
 
@@ -1453,6 +1516,9 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 	case ISST_IF_GET_PERF_LEVEL_INFO:
 		ret = isst_if_get_perf_level_info(argp);
 		break;
+	case ISST_IF_GET_PERF_LEVEL_FABRIC_INFO:
+		ret = isst_if_get_perf_level_fabric_info(argp);
+		break;
 	case ISST_IF_GET_PERF_LEVEL_CPU_MASK:
 		ret = isst_if_get_perf_level_mask(argp);
 		break;
diff --git a/include/uapi/linux/isst_if.h b/include/uapi/linux/isst_if.h
index 0df1a1c3caf4..8197a4800604 100644
--- a/include/uapi/linux/isst_if.h
+++ b/include/uapi/linux/isst_if.h
@@ -375,6 +375,30 @@ struct isst_perf_level_data_info {
 	__u16 trl_freq_mhz[TRL_MAX_LEVELS][TRL_MAX_BUCKETS];
 };
 
+#define MAX_FABRIC_COUNT	8
+
+/**
+ * struct isst_perf_level_fabric_info - Structure to get SST-PP fabric details
+ * @socket_id:		Socket/package id
+ * @power_domain_id:	Power Domain id
+ * @level:		SST-PP level for which caller wants to get information
+ * @max_fabrics:	Count of fabrics in resonse
+ * @p0_fabric_freq_mhz: Fabric (Uncore) maximum frequency
+ * @p1_fabric_freq_mhz: Fabric (Uncore) TDP frequency
+ * @pm_fabric_freq_mhz: Fabric (Uncore) minimum frequency
+ *
+ * Structure used to get information on frequencies for fabrics.
+ */
+struct isst_perf_level_fabric_info {
+	__u8 socket_id;
+	__u8 power_domain_id;
+	__u16 level;
+	__u16 max_fabrics;
+	__u16 p0_fabric_freq_mhz[MAX_FABRIC_COUNT];
+	__u16 p1_fabric_freq_mhz[MAX_FABRIC_COUNT];
+	__u16 pm_fabric_freq_mhz[MAX_FABRIC_COUNT];
+};
+
 /**
  * struct isst_perf_level_cpu_mask - Structure to get SST-PP level CPU mask
  * @socket_id:	Socket/package id
@@ -471,5 +495,7 @@ struct isst_turbo_freq_info {
 #define ISST_IF_GET_BASE_FREQ_INFO	_IOR(ISST_IF_MAGIC, 14, struct isst_base_freq_info *)
 #define ISST_IF_GET_BASE_FREQ_CPU_MASK	_IOR(ISST_IF_MAGIC, 15, struct isst_perf_level_cpu_mask *)
 #define ISST_IF_GET_TURBO_FREQ_INFO	_IOR(ISST_IF_MAGIC, 16, struct isst_turbo_freq_info *)
+#define ISST_IF_GET_PERF_LEVEL_FABRIC_INFO _IOR(ISST_IF_MAGIC, 17,\
+						struct isst_perf_level_fabric_info *)
 
 #endif
-- 
2.49.0

