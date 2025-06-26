Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD82063F3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953597; cv=none; b=qxlvAfw7o3GKanKves1+AiteElhn7aac2/N15+ZeMwFlq0o8vD2ZsxNxjVShOIZhgclrPXeLT5JzavwHzGKK+ojBxBRviAesMXzsIGLRF1F7KxzOl80gqr1L7RJpCxMKmkyVBh+sJCmXNJY2WXrw8dFsuZyZniktyxnXw5nrObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953597; c=relaxed/simple;
	bh=i+PnXgZHUy1dh1KadTWyaeBxUpB76/YggpM37ia6WM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERa/gX2u47FYVNfqf1O8T3ivD/YgYp2rtoiM9tba3cTQnToVT5seTG4Gz0hrCLXobbhpt6WFEtAE8Dav/bCpy5DX+Ai2QYycUM0MonV2Oc0qRILOdVgH58pfJ2LiPfCb1T90++X7z0nLKQL4Q9HIbPWAUpvth0WDP1znYb7/4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhS463ZI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhS463ZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750953596; x=1782489596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i+PnXgZHUy1dh1KadTWyaeBxUpB76/YggpM37ia6WM0=;
  b=bhS463ZIU1o0RW6bjWEk1BxN7zNgiOwTDC/If+khoU+tSPq2/po/vY5N
   /FcnFSPGVD/gJ4YWrTjl5HYs9y9K5i+Ni6ufH/mR7nyIgD8kvb1psllK+
   7vLg33fwq9+qcNv0u+jRCYlgYhpdoQJufL7C0uQxBS71pDdeXMlJ1og6o
   jFVOOVTw6tPmR7P5akpARZo/Qnjcxr/hw/0nsjjdzzmHF9/9gsR/tcO2X
   kUnDNbEyTuyI62oQ0u4AmrbsLp/50viVHYaZPLFOcIELNVzuQIo6h7+Lj
   KPRecV86GuyMR7YI/4DRMIBinxP17025smQriVrUbJmYOYB4ruvxgoaas
   A==;
X-CSE-ConnectionGUID: g8vIj1AiS1uIqEHvmGiftw==
X-CSE-MsgGUID: DzGXy/mtRsOWfOOJDjAfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53223989"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53223989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:59:55 -0700
X-CSE-ConnectionGUID: 4E1GHJ0jQYWWetKCp+/kvg==
X-CSE-MsgGUID: yQxunmKhR+G6Wh/r9mabLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="176218889"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2025 08:59:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 656852AD; Thu, 26 Jun 2025 18:59:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/1] mfd: wm8350-core: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:59:51 +0300
Message-ID: <20250626155951.325683-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mfd/wm8350/core.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/wm8350/core.h b/include/linux/mfd/wm8350/core.h
index a3241e4d7548..5f70d3b5d1b1 100644
--- a/include/linux/mfd/wm8350/core.h
+++ b/include/linux/mfd/wm8350/core.h
@@ -8,11 +8,12 @@
 #ifndef __LINUX_MFD_WM8350_CORE_H_
 #define __LINUX_MFD_WM8350_CORE_H_
 
-#include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/interrupt.h>
 #include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include <linux/mfd/wm8350/audio.h>
 #include <linux/mfd/wm8350/gpio.h>
@@ -21,6 +22,9 @@
 #include <linux/mfd/wm8350/supply.h>
 #include <linux/mfd/wm8350/wdt.h>
 
+struct device;
+struct platform_device;
+
 /*
  * Register values.
  */
-- 
2.47.2

