Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B9253329;
	Thu, 17 Apr 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909226; cv=none; b=kq+T+RQJVnusbtfjxKnsd72fKx4wwvQ0LWBQei7n/4noqEbS6lmBaCKC4Xfsy6cTHkLOW8RlfEEWvOOp7p3MpScKTt4H0A4zFzxBAjLcwPiMtd9W8J0sPJIDwyp0l0W7sfRVE9PYE2sI+o0rjPdBUGTzTj6elYFkJqm5of3alWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909226; c=relaxed/simple;
	bh=JLgK9+nY1vCjbvflNygPDXg0ccB+OawZkKOhP1y56kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcgPYlKDvEl5mpS0Ai7YV2sajxqs377jjhpv5ZDcbeGkJpnhEFKXuV8TEEmUCCbzM8EJdkkaPqltMai6sWUokjQ2KDrWv8VfOj9z7KhbguRnlKZ2HXvlYL7NY8kvnXcTrHw5IcGTnIGKYEaIHSA1tC9i7UIO/YGRmLC/J8CiuK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndZi0pln; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndZi0pln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744909225; x=1776445225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JLgK9+nY1vCjbvflNygPDXg0ccB+OawZkKOhP1y56kE=;
  b=ndZi0plnxx0Yh5YFQNgIO5WfO5kC+tGSE3z15+JyjhPX1mBXnm6UmaRp
   P9tPiarKVXFSUJDM0nIqpTkXWDQ+1BXmjCJ4f5eP1H+0vMHTDEadKUm5u
   NMkOGDZjjOOuzLxYz5n+pvBBQUDe/bjY/+k0CtGXqzarWsbl5qUzaWCIo
   AVTB8bni0K+LbPeBi4EEMIdgUmitvpjUZkhllox5BElJ74emLUXdFviF4
   kpAnwaw2MieCks66MKfzcx9Mo4tyMlhzZidPebFhDNgE5019QmSEEGMVt
   clxhn2O0NGTfWTkFk7l0ourVBJ68P99cssMbWxtbB6d+aCXzAoeJoiRRo
   w==;
X-CSE-ConnectionGUID: il7bO7o4TE6Bd8SIy9SVUA==
X-CSE-MsgGUID: rt+4iNaZR5CvCVwhrVzuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57896201"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57896201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:00:23 -0700
X-CSE-ConnectionGUID: YxOQGs4cRMichYL+ubehKQ==
X-CSE-MsgGUID: 6vbxRKq5S4usfu2I4EfDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131411694"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 10:00:23 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: ISST: Support SST-TF revision 2
Date: Thu, 17 Apr 2025 10:00:10 -0700
Message-ID: <20250417170011.1243858-2-srinivas.pandruvada@linux.intel.com>
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

SST-TF revision 2 supports a higher number of cores per bucket, as the
current limit of 256 cores may be insufficient. To accommodate this, a
new offset, "SST_TF_INFO-8," is introduced, allowing for a higher core
count. Utilize this offset instead of the current "SST_TF_INFO-1" offset,
based on SST-TF revision 2 or higher, and if there is a non-zero core
count in any bucket.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel/speed_select_if/isst_tpmi_core.c    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 9978cdd19851..bc4089d3d421 100644
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
+		bool valid = false;
+
+		for (i = 0; i < SST_TF_INFO_8_BUCKETS; ++i) {
+			_read_tf_level_info("bucket_*_mod_count", turbo_freq.bucket_core_counts[i],
+					    turbo_freq.level, SST_TF_INFO_8_OFFSET,
+					    SST_TF_NUM_MOD_0_WIDTH * i, SST_TF_NUM_MOD_0_WIDTH,
+					    SST_MUL_FACTOR_NONE)
+
+			if (!valid && turbo_freq.bucket_core_counts[i])
+				valid = true;
+		}
+
+		if (valid)
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
2.48.1

