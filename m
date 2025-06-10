Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9CD21D594;
	Tue, 10 Jun 2025 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540528; cv=none; b=Poyp4q+VZEX28puR7bXN2ZjJkGrq+LdxaMkf8+vV4G1DfrWUDIkgmYtVAX74JMJUiRcF+CIHvJVTUbInRInSlY39Eqjz2oWPOzwUKQQfLbK5H3d2ZzhfAUGGCa54G18v0SIBMlxqrDuqzBIOLU1wgQFswLprihTDdJKRMpGrinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540528; c=relaxed/simple;
	bh=vpr99udeYbw/lhI3MwERoGgDH9B7K2ESg1wMttU6hiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmsIpvX6GBEO6TdbcSnRXOwallla4yUvX/t9bF1b4oxwk6mjH7bt2mMJPX+ETlqMFGQD5y8umPT+xJLkvHLrPmPILDyPDSm49c3wV26ixnwJiJWzs57n4mLUOJlw7ooWRhM3/AcmfUiUs9YHRmSBf9/6ayIlA8Xtp/2NUjVlxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTqRiyDt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTqRiyDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540527; x=1781076527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vpr99udeYbw/lhI3MwERoGgDH9B7K2ESg1wMttU6hiQ=;
  b=GTqRiyDtzmdkrGsfonGp1PboflaL/ZiDDOo1vPn0XE+XA4TRgqpKN/gl
   FiCwbMtoUSd/NKSDtfFQY07XibbOz6s4XrMgYcfS9mUEgavB1LNSdJyvj
   FdNKTmctmsSxWJbneO424Bom03eC6UC8Q4Vh15tYql4QQ9cSO3qdVLH5O
   I/TRAiM7aHKdKpXBYIqXP4kSXAt5hA21XgmVRkufKK8vazSFVNMkx4rAF
   clzYNMpsgYD+oH+lHcemRfU5mKSIqd1ITNo5eMkRIi39lfap4cmhJ7tdJ
   eKomoHcMJnbQi9qyp6tms0/hLNbwVbPfqLEIheaK+PZ1a9vlYcE7r48fi
   A==;
X-CSE-ConnectionGUID: ir3vFABOR+2jlOWH0LaNWQ==
X-CSE-MsgGUID: iUCQ1txxSryUNPwNLfJ9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50863032"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50863032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:28:44 -0700
X-CSE-ConnectionGUID: JKNdKjBhS+y+U7uvCPMz6Q==
X-CSE-MsgGUID: nkrAWWGqR1WXBAwpZmUbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147113625"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 00:28:43 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] clk: renesas: rzv2h: use devm_kmemdup_array()
Date: Tue, 10 Jun 2025 12:58:09 +0530
Message-Id: <20250610072809.1808464-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index bcc496e8cbcd..57ba8755025c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1004,8 +1004,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	/* Adjust for CPG_BUS_m_MSTOP starting from m = 1 */
 	priv->mstop_count -= 16;
 
-	priv->resets = devm_kmemdup(dev, info->resets, sizeof(*info->resets) *
-				    info->num_resets, GFP_KERNEL);
+	priv->resets = devm_kmemdup_array(dev, info->resets, info->num_resets,
+					  sizeof(*info->resets), GFP_KERNEL);
 	if (!priv->resets)
 		return -ENOMEM;
 
-- 
2.34.1

