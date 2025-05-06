Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE2281363;
	Tue,  6 May 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549339; cv=none; b=ki5JACqIFLFwGnP6SXwB45vt3Y8prLmU/rZHWk0e3gJPpgS8hib+9jcBVeXsCBJeEg8DmYqSKwN1xHtHup2H+RAnpSuPhcNM0bzIgdwkzwAtIN7zczz93bXdMdMIrBzZwPiF2OeRkZQF2LtX7Ng+mGniASfao7XAyHBxoABUYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549339; c=relaxed/simple;
	bh=44Kzf9WsQdp8YAamcIfTxe4YrEPSD5seY1piCpwhivk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVhklhmkfUzbcs8NoGtrujqpOM0kXiImhjYYRkuxsfWH/TkbKAbgEUXg6GAwKhuz/gt17wfB+gG/cuOOmtECOJjYupCRduHfsnvO0N4joBxSQNkSgo2luhCGG9D+cooXTeYWtr3Fg7EovLmhyYWOAo6P1jhJlK4rpKZFOgU0tYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YITMBSs7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YITMBSs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746549337; x=1778085337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=44Kzf9WsQdp8YAamcIfTxe4YrEPSD5seY1piCpwhivk=;
  b=YITMBSs7f9S1JD/o//YIvFizmMBwnbgRdZHit50vz2rrPnRztl3x0/4q
   KufrYCs4vATIZhQKdOR3KhQEkOJetFBof7V1ce1Uoh2SCT4irRCOXlOBe
   OlezRjinwriCKEy1OIETbxKYSaOIE9Cb5iauXdAH5YO618EqmG3GMYOuh
   ZxpD2mZrJmttF1d71ZpzkLl88oZUFsUQMv7RzWrcSGsIrCpwG7iYsss7k
   i/drTsJoFaclSTct///YGM/y/3HVnXfG4b4hCtkeju996nqMRRzS1pRFn
   Br5aYk4sFN42BhgMB1xvIsjurfTN3tQZKllEL6kaCo0F3BaqYBkR9nPI6
   g==;
X-CSE-ConnectionGUID: Be+rBDAJR62mbUHQrL/aOg==
X-CSE-MsgGUID: F534pe18SIChEAjeGzNWhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70736091"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70736091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:35:35 -0700
X-CSE-ConnectionGUID: MNjl9KsxTjuyNaisJigJRQ==
X-CSE-MsgGUID: gL7lLV9QRVa+3cB1QYDvWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136636281"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2025 09:35:35 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 1/3] platform/x86: ISST: Support SST-TF revision 2
Date: Tue,  6 May 2025 09:35:29 -0700
Message-ID: <20250506163531.1061185-2-srinivas.pandruvada@linux.intel.com>
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

SST-TF revision 2 supports a higher number of cores per bucket, as the
current limit of 256 cores may be insufficient. To accommodate this, a
new offset, "SST_TF_INFO-8," is introduced, allowing for a higher core
count. Utilize this offset instead of the current "SST_TF_INFO-1" offset,
based on SST-TF revision 2 or higher, and if there is a non-zero core
count in any bucket.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
- Change variable "valid" to "has_tf_info_8"

 .../intel/speed_select_if/isst_tpmi_core.c    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 9978cdd19851..a52fc2f5ea89 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1328,9 +1328,14 @@ static int isst_if_get_tpmi_instance_count(void __user *argp)
 #define SST_TF_INFO_0_OFFSET	0
 #define SST_TF_INFO_1_OFFSET	8
 #define SST_TF_INFO_2_OFFSET	16
+#define SST_TF_INFO_8_OFFSET	64
+#define SST_TF_INFO_8_BUCKETS	3
 
 #define SST_TF_MAX_LP_CLIP_RATIOS	TRL_MAX_LEVELS
 
+#define SST_TF_FEATURE_REV_START	4
+#define SST_TF_FEATURE_REV_WIDTH	8
+
 #define SST_TF_LP_CLIP_RATIO_0_START	16
 #define SST_TF_LP_CLIP_RATIO_0_WIDTH	8
 
@@ -1340,10 +1345,14 @@ static int isst_if_get_tpmi_instance_count(void __user *argp)
 #define SST_TF_NUM_CORE_0_START 0
 #define SST_TF_NUM_CORE_0_WIDTH 8
 
+#define SST_TF_NUM_MOD_0_START	0
+#define SST_TF_NUM_MOD_0_WIDTH	16
+
 static int isst_if_get_turbo_freq_info(void __user *argp)
 {
 	static struct isst_turbo_freq_info turbo_freq;
 	struct tpmi_per_power_domain_info *power_domain_info;
+	u8 feature_rev;
 	int i, j;
 
 	if (copy_from_user(&turbo_freq, argp, sizeof(turbo_freq)))
@@ -1360,6 +1369,10 @@ static int isst_if_get_turbo_freq_info(void __user *argp)
 	turbo_freq.max_trl_levels = TRL_MAX_LEVELS;
 	turbo_freq.max_clip_freqs = SST_TF_MAX_LP_CLIP_RATIOS;
 
+	_read_tf_level_info("feature_rev", feature_rev, turbo_freq.level,
+			    SST_TF_INFO_0_OFFSET, SST_TF_FEATURE_REV_START,
+			    SST_TF_FEATURE_REV_WIDTH, SST_MUL_FACTOR_NONE);
+
 	for (i = 0; i < turbo_freq.max_clip_freqs; ++i)
 		_read_tf_level_info("lp_clip*", turbo_freq.lp_clip_freq_mhz[i],
 				    turbo_freq.level, SST_TF_INFO_0_OFFSET,
@@ -1376,12 +1389,32 @@ static int isst_if_get_turbo_freq_info(void __user *argp)
 					    SST_MUL_FACTOR_FREQ)
 	}
 
+	if (feature_rev >= 2) {
+		bool has_tf_info_8 = false;
+
+		for (i = 0; i < SST_TF_INFO_8_BUCKETS; ++i) {
+			_read_tf_level_info("bucket_*_mod_count", turbo_freq.bucket_core_counts[i],
+					    turbo_freq.level, SST_TF_INFO_8_OFFSET,
+					    SST_TF_NUM_MOD_0_WIDTH * i, SST_TF_NUM_MOD_0_WIDTH,
+					    SST_MUL_FACTOR_NONE)
+
+			if (turbo_freq.bucket_core_counts[i])
+				has_tf_info_8 = true;
+		}
+
+		if (has_tf_info_8)
+			goto done_core_count;
+	}
+
 	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
 		_read_tf_level_info("bucket_*_core_count", turbo_freq.bucket_core_counts[i],
 				    turbo_freq.level, SST_TF_INFO_1_OFFSET,
 				    SST_TF_NUM_CORE_0_WIDTH * i, SST_TF_NUM_CORE_0_WIDTH,
 				    SST_MUL_FACTOR_NONE)
 
+
+done_core_count:
+
 	if (copy_to_user(argp, &turbo_freq, sizeof(turbo_freq)))
 		return -EFAULT;
 
-- 
2.49.0

