Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E428468D;
	Tue,  6 May 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549340; cv=none; b=NpcrUJFo6njXPGzTS/of2vIarY0ciZcoVS5g3S4RRrodojvsv1fGLcVSUh5aCmi9eQyTo068WFf4tnN4oaFZDDCLOW/KXRL27hP++Szd4kvKvN8gR1xv7r5jWpk5/zAZvoevmHk+un1rPz1I0hU9WGU4CBXCtmQ/ShugQz+uRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549340; c=relaxed/simple;
	bh=xEyDh7R3iimg8qhthUTNDtfy2HRx25zYMJ0fSuF7Gik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4HqySK1zXSsy8RFO+f+uOSfsAhUaDIU3G5LAcB/28fI2ZOnHUuUBEvrVU4AoYKx4cq7zHVdVCpC0sfto5iPYz34ZJ9RdaISk0wL+GrjUFVmNJNxjwIYkibMVipWphkkO1zv3ETXoKRIcPYz+/xcHcYYZpaw7mdTOi0m2YiY+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjHm8GHG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjHm8GHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746549339; x=1778085339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xEyDh7R3iimg8qhthUTNDtfy2HRx25zYMJ0fSuF7Gik=;
  b=AjHm8GHGsfP6wWZyyX4CTUvlgRUl5ZHTUjqk+WuxAoSq5k9oGw6B4IFC
   24WfF/Nzo9y/1Hw90S+5abGJenM2HO5EePIZFRgVNDp0t891YcGMOQfPN
   snKM8XQBSJm/dJxi4/SbtAacFuSdVIAhAQ0k00qiei73mQF/i4YvTi8ld
   8YOcfydwnYzX28qrfKa6aN7jMVavQBuQ5d7FLlNn/4vKEWx4FWUfC5x8f
   i8RFVhFNL25h3BzOtgaxcqxOPprALyUtmsA73lO8DukAmp7CkWaN+rAzY
   KWTYBUVh46s2dugieWO/sH8LKmQcWPGJdCirDRR9qgfXkNBOmiGZ1AQG9
   A==;
X-CSE-ConnectionGUID: Zh4si/zKQmyJ92EPYVQYkA==
X-CSE-MsgGUID: CGPzo5OFThe9XKV7i3Xjtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70736095"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70736095"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:35:36 -0700
X-CSE-ConnectionGUID: WNtvefjmQfO9T+rsuqFH/g==
X-CSE-MsgGUID: M+9K9x6STu+PYVCkFBLRxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136636284"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2025 09:35:35 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 3/3] platform/x86: ISST: Update minor version
Date: Tue,  6 May 2025 09:35:31 -0700
Message-ID: <20250506163531.1061185-4-srinivas.pandruvada@linux.intel.com>
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

Update SST minor version after supporting SST-PP and SST-TF version 2.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
New patch in this series.

 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index f56bb63f7947..f08d78536839 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -34,7 +34,7 @@
 
 /* Supported SST hardware version by this driver */
 #define ISST_MAJOR_VERSION	0
-#define ISST_MINOR_VERSION	1
+#define ISST_MINOR_VERSION	2
 
 /*
  * Used to indicate if value read from MMIO needs to get multiplied
@@ -380,7 +380,7 @@ static int sst_main(struct auxiliary_device *auxdev, struct tpmi_per_power_domai
 		return -ENODEV;
 	}
 
-	if (TPMI_MINOR_VERSION(pd_info->sst_header.interface_version) != ISST_MINOR_VERSION)
+	if (TPMI_MINOR_VERSION(pd_info->sst_header.interface_version) > ISST_MINOR_VERSION)
 		dev_info(dev, "SST: Ignore: Unsupported minor version:%lx\n",
 			 TPMI_MINOR_VERSION(pd_info->sst_header.interface_version));
 
-- 
2.49.0

