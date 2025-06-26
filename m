Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B84202F83
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954098; cv=none; b=tzW7X7vePD+xFvPCUN27iRDtgZAvw5WPgcY38fgz1T+tVdW/x/URykJY3Er1IiD40DzJWJAjSUf7xSvQUBJ/42GN0Zfq2KebRfx5b5ZyNpzA+E75Y4YTISYLncjGO2//fX1l3i4Nswd5yDbUEqU//txQbxLeSisYmPZOso4bRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954098; c=relaxed/simple;
	bh=Hs/476mhcCpv+gaONl8TV/ZYzZ1wj/qme9tA+4SJZ0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PtVQmffh002aZRfxyVREmM/kiKKj/icSzbUpVXBCqZ0UQtjvSs1y0TpwE2pCxiCozlQVT6NQnQ7Hitr9InjxkAwh6jXQ6ZJgq5k37xsB2TP8RuOOwxyYlDbK6lCl4jzZ03ZAPZMViXb/HPYi0dN8XKDLZnk/X1TwyxoNO+XueMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFtYjSGJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFtYjSGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750954097; x=1782490097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hs/476mhcCpv+gaONl8TV/ZYzZ1wj/qme9tA+4SJZ0M=;
  b=fFtYjSGJ6ztmQPME5tOHmcN2R65hFwePmn9GmKBjaPLixqSZ39MQb0r0
   qqHVWsmumm+m2dhT8+vezCEgBh8XZtzJScF5qeZAZlQMMz+y/gisoN2FO
   EdIYWBf5Sks+/zVquksANn8+zI5t7PRU8LuxDJIFCV5orZhkfSk22e4ac
   9owSCd2RjrDFgExO4fkeIFd4mVx8jnN5d1or6/xpIM3k3FKl6F62IhEMg
   CykByDWmg0uSKxGHvQ1ZaTR7m6yzeEA8lK2P2MBpPTOekg7TGIPZdvgVc
   VBHht4RfeltIPUJMqlMFEWd4BcO93CJaPKNo9WleWiWJwjLBTQQmB3nZB
   w==;
X-CSE-ConnectionGUID: EoDbluOTQ5CHTKXZ+HkUkg==
X-CSE-MsgGUID: pRlUGa25SDe6SZ73/IBOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="56938809"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="56938809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:08:16 -0700
X-CSE-ConnectionGUID: SmwA0tmeTIOFTS3Y66ijMQ==
X-CSE-MsgGUID: rh0dcOWMRXSj1pRBTdkfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156845298"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 09:08:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EA2022AD; Thu, 26 Jun 2025 19:08:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: map: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 19:08:12 +0300
Message-ID: <20250626160812.325940-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/mtd/map.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 1b56796f6cb3..288ef765a44e 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -8,15 +8,15 @@
 #ifndef __LINUX_MTD_MAP_H__
 #define __LINUX_MTD_MAP_H__
 
-#include <linux/types.h>
-#include <linux/list.h>
-#include <linux/string.h>
 #include <linux/bug.h>
-#include <linux/kernel.h>
 #include <linux/io.h>
-
+#include <linux/ioport.h>
+#include <linux/string.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
-#include <asm/barrier.h>
+
+struct device_node;
+struct module;
 
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_1
 #define map_bankwidth(map) 1
@@ -188,6 +188,7 @@ typedef union {
    of living.
 */
 
+struct mtd_chip_driver;
 struct map_info {
 	const char *name;
 	unsigned long size;
-- 
2.47.2

