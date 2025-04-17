Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466BA254840;
	Thu, 17 Apr 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909227; cv=none; b=sPZhwiBryjLoDaeQXI6b8QDuKVUrq2zFd1hAEbNpPe52bWmJGY1Eub46x+Noa/9f0UA1EeTiWlHzDLOKouaGaTYFZDVe1lQGZYls6PzLTT8Wg6vw5gte2zIWnh8/2bYgZn2nqvaBJl3sw6pX2IHjeGF6ogGEyd1qms0muXljQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909227; c=relaxed/simple;
	bh=j59LvdPcdSSaggSdypS7MpNAXq5tHl3BNvsDiB/3LXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoskCqkEvBDfXZ0Lt9ltAZyoqV17JAP9cBV315bc8btF0Q457BQjHTbt3B0OC3Cx9mvCdHQrZIeQhyJO7bHpMeNU84AB1PFb8wDsceTl9qLoPsBfU9yxlk99LmXKbWycen9f8cdM53yDgZVwyoWvwXKT63DDx2fcxAxgqVIaNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IE4aIZQD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IE4aIZQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744909225; x=1776445225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j59LvdPcdSSaggSdypS7MpNAXq5tHl3BNvsDiB/3LXc=;
  b=IE4aIZQDlMwO13jmDxB8P60R4aVfoDavdr0cOEGOTfcFB7IQOB94Rb/Q
   s9Pw+S67YpqEs7PkJUeDZ/n1yKsQ2bBmNmIaqANpbUyF+Nr7h+RxHZlXF
   lLrzlKNAbvNZJd+wgGF0R/NcF+qj5o6IU6t9Hf6bPtxovpVyjFbub4g1z
   xnsBETDNLRaxHMFuije76eiYfNfi2ekIu+8qalPnawyw7snNcRVWa5/8O
   GT/qDalrK0gnEVl24kcAQYYgAatd4pxY6v4UhNrNvRyQlUxSjirYbh5Nf
   ap2fk4fETiM7PjQF+nCLMmNhJV32UTv8grwWqZo4THJcd2OWkhl4JOH3z
   g==;
X-CSE-ConnectionGUID: ZmSQE6q2QF2qDrm0Wf32JA==
X-CSE-MsgGUID: cYzOk0IHR4Oqertzcj+e9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57896208"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57896208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:00:23 -0700
X-CSE-ConnectionGUID: mCYYlD+rRRuSrMfT5j8iyw==
X-CSE-MsgGUID: 7M/wPTY4QCmxxS3R/NjNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131411700"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 10:00:23 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: ISST: Support SST-PP revision 2
Date: Thu, 17 Apr 2025 10:00:11 -0700
Message-ID: <20250417170011.1243858-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417170011.1243858-1-srinivas.pandruvada@linux.intel.com>
References: <20250417170011.1243858-1-srinivas.pandruvada@linux.intel.com>
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
 .../intel/speed_select_if/isst_tpmi_core.c    | 66 +++++++++++++++++++
 include/uapi/linux/isst_if.h                  | 26 ++++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index bc4089d3d421..b868ea0ce8f6 100644
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
+		start = 0;
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
2.48.1

