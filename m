Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8051A072A;
	Mon, 31 Mar 2025 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404767; cv=none; b=LHgBQ+ZEnUlqf6DWPxLFzzE+ryj/eb/vE+xKnffpPnjiNUBeMVYBUm6VjJ3wTyJCOW642R/NxfclIA8iByMNQgh1Knq7SNoaAd8rOUOeHSblosmJ5SBnJ4kXWTFwA0O13CoD9x6J/Y+6tMeMAEan7MBjFgCkziuD+Yz/J8HeJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404767; c=relaxed/simple;
	bh=6Ron3b3sOiKcfou1FWJB1BDJ2tnGmDZARFBWRoBdKO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENzCs5PzghdfEA/yRIylL4u/MkDy5sWKgMKK3+l/xIVHOvfpdDmK5NNu4e6nhxSGEjrxNB1jAaaCP5UhMJT3d7TN2iZFkFqZcGksWtoocqWZZXxQGH03G2V7sn3dtZhF4eqf+BlSQbqMAVhh+FOElBgBWD7LDFglhSiFq30xqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsxVssDT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsxVssDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404765; x=1774940765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Ron3b3sOiKcfou1FWJB1BDJ2tnGmDZARFBWRoBdKO0=;
  b=HsxVssDTf8IAAdV3MReci4LRrGuQA4eJ0JCPItdxsFnHywwEe/i0bqEw
   TwoKiUof8tfNswBUpsNRzuqZPM/u60ni4aq/azKnCVqez0EHD98FltM7w
   ac9FlSLvyw3m3l45c/2a0aEyMA1RvdeDudJ2488r+MZjyFEOyJV57npLs
   +aELslLP/dTFJrl6Mklo83WSF9K0XSEUOWKS4ydC2cHQEJ+6KBtLW+86+
   bf0X5ZT4LIurUazXgMTj6oRoKn4BlCD3LK5h/190QvALv0jCirnf6prrY
   UovHhhRKo3sGa6JdBVSOOcMIcLFuWJM6OJiSLJaYJm/fwhAkHiM835y3Z
   Q==;
X-CSE-ConnectionGUID: 69gD+ziGQeW3VxHcV1mykw==
X-CSE-MsgGUID: ChgfrcR8TmeBnIN40r8Yug==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44856912"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44856912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:06:05 -0700
X-CSE-ConnectionGUID: XgLZBuLUSACTOJfjS8s4Nw==
X-CSE-MsgGUID: wf2xv5rpT5yCXxwi+Ctb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125762836"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2025 00:06:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EE73D1B4; Mon, 31 Mar 2025 10:06:01 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 1/1] hwmon: (qnap-mcu) Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:06:00 +0300
Message-ID: <20250331070600.3985850-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Note, that fwnode API for drivers is provided in property.h
which is included here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/qnap-mcu-hwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
index 29057514739c..e86e64c4d391 100644
--- a/drivers/hwmon/qnap-mcu-hwmon.c
+++ b/drivers/hwmon/qnap-mcu-hwmon.c
@@ -6,7 +6,6 @@
  * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
  */
 
-#include <linux/fwnode.h>
 #include <linux/hwmon.h>
 #include <linux/mfd/qnap-mcu.h>
 #include <linux/module.h>
-- 
2.47.2

