Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B72820D4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707129; cv=none; b=aLtQop1gB77RX1QbGjBD+MHTpyyIEquELllEu+izUbFD2e5vD55Ny9VHJvyMoJk3cUsbwDgDGkPLxKW4+rO2wSkk4LRLIqOtpT1yc9aYRwGpTtgrH+CIt6kTEd5hwVgQHXnxIlmOEou7GL8FojK+HADOf1Ugd9FQMZ6w22lIAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707129; c=relaxed/simple;
	bh=BeQA07rWAq2VXgsT6pVbTPlGkpKB8k/93dQmrF4ZzOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcHNqvL2VW3e/vG1L75I7k6R2PXXIVlN6XFbxiXPv2c8f1wKgfsMmHrjYPsi1fhUbB85JZrUDafTdFhTbRC78MPVjLKOC4o4YUvXf0gGHj+QqrqZKuAedUehM3FSKjbLFwEBwYfKjITrNJhQ9k1oWIvtFMXn1tSUsau+UvzLYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOExYCDy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOExYCDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744707127; x=1776243127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BeQA07rWAq2VXgsT6pVbTPlGkpKB8k/93dQmrF4ZzOw=;
  b=cOExYCDycjvpY2J9AV6u9OOwVTnbEOZnztzmFjRnJcXfRPg3E+6W9S2J
   TaGGfOfLZeXQY24PCsi689htuGhkjjvPeYBA+jmiyEu6SBXpQSvNdw7jn
   85IdIEDp8q2oAOc+TjuAWc/zsBN5bqDjz6pEU0sHPGXWPcX7vNGdK3gKp
   aTuBShkuq34STHAclxcdu77S2RF1go7d/558KMqrcmV/rAtHzETve+kIl
   /sihpQjivagQCNbHF1PgghAxpQTyoZ/WLd/+OTKtQ9iHeno1SMhDLIvuP
   zaGkAcy+9HUjlEJV1YeGlkGhOzQ7VJPeM/k7Yc3sinT60t3Ukwkqwr+OK
   g==;
X-CSE-ConnectionGUID: wwt0/kgKRsOV00zlM1OmJA==
X-CSE-MsgGUID: 709EX54hRCuuyc2tMDAq3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63745974"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="63745974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:52:07 -0700
X-CSE-ConnectionGUID: FyNUypTFSeiyoq4rfHLfSw==
X-CSE-MsgGUID: ALl81ON2TbKPQjQo4yJMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134855335"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2025 01:52:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 849DB17B; Tue, 15 Apr 2025 11:52:03 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Corey Minyard <corey@minyard.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without warning
Date: Tue, 15 Apr 2025 11:51:56 +0300
Message-ID: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Debian clang version 19.1.7 is not happy when compiled with
`make W=1` (note, CONFIG_WERROR=y is the default):

ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
  268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);

Fix this by intermediate cast to the uintptr_t, that makes compiler happy.

Fixes: 5be50eb5ae99 ("ipmi: si: Use device_get_match_data()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/char/ipmi/ipmi_si_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
index 550cabd43ae6..47d3cbeb3fa0 100644
--- a/drivers/char/ipmi/ipmi_si_platform.c
+++ b/drivers/char/ipmi/ipmi_si_platform.c
@@ -265,7 +265,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
 	}
 
 	memset(&io, 0, sizeof(io));
-	io.si_type	= (enum si_type)device_get_match_data(&pdev->dev);
+	io.si_type	= (enum si_type)(uintptr_t)device_get_match_data(&pdev->dev);
 	io.addr_source	= SI_DEVICETREE;
 	io.irq_setup	= ipmi_std_irq_setup;
 
-- 
2.47.2

