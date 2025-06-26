Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F72ECD0B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953281; cv=none; b=BamAGWMDQ605rJBopcwGiwqHKEIJRFPkOBDF2FL4DR/DDRqqP1mKVDpZa2vX/4qkn1ik/i4C3zj+pJkmXq1XnCC2zDcJsdSon73c9qIK31g9G84MjELoftfkOQTg1MxPKhwQ+VmqNjoLw+OptFPVIGe6aCCXLX70lv7+MgKaaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953281; c=relaxed/simple;
	bh=rr7naJ8D39trASGJNx8p2aZIXHv/0lnvvY69U2XEs1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FbXGA7D/VOgcuG/PIkjTBUlb+HIrHECtGeBRZX0QnrWVwbNnJJac34hbcqWLOf/nhZ4e/xrE3vbNOE9eZ5NKBwKXsdAHtqJGLHivNYySK7eEifVOJyfbzzur+Uh6ky/EnzHZxZ1iD1XHWBID3wA/OKgWNwBf5G95TsI0F+otwiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ql60f1od; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ql60f1od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750953280; x=1782489280;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rr7naJ8D39trASGJNx8p2aZIXHv/0lnvvY69U2XEs1U=;
  b=Ql60f1odU1P/wV3lurad6hqKWAAosprtt1q3WSnYo4Q+Y0Tu6qqB7kdu
   Nbi5vrXWnFAWajMr7plbNv8My8b5/VByQAuqPRBY5u0jL239XTYvlBOaR
   mBaoSLQA/6pgRednCX8+ndYAepMWLAPbvQeesjqCpofd3HMNDsOh5/Cja
   xa5H7cG+qlxnfIQusRJJUc3kYlIgnPYjqO42gXk+f7sfZOZX54LqmLBT+
   yRWBAi1lzF/dKxBDAJmAJiwyw+LDv4apZ/cPxxQhTUSyyhm0n5p1R26YA
   HHPFovykKbz8qHT5U9sJ1F8JIq1PwO1iE06FyFdnbphcJKwdiOjVcmzPm
   A==;
X-CSE-ConnectionGUID: 1yZmv0bnRkKmjl10yPT0mA==
X-CSE-MsgGUID: uH5a8HnQQuSwVjH1XCr7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40873555"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="40873555"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:54:39 -0700
X-CSE-ConnectionGUID: Bez/RQZwRBqXF5dnB4L9lg==
X-CSE-MsgGUID: Rkbpn1nCTKqqvzB7pds8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153085029"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 08:54:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 29AE32AD; Thu, 26 Jun 2025 18:54:36 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:54:35 +0300
Message-ID: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/mfd/syscon/atmel-smc.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/syscon/atmel-smc.h b/include/linux/mfd/syscon/atmel-smc.h
index e9e24f4c4578..9b9119c742a2 100644
--- a/include/linux/mfd/syscon/atmel-smc.h
+++ b/include/linux/mfd/syscon/atmel-smc.h
@@ -11,9 +11,11 @@
 #ifndef _LINUX_MFD_SYSCON_ATMEL_SMC_H_
 #define _LINUX_MFD_SYSCON_ATMEL_SMC_H_
 
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/regmap.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct device_node;
+struct regmap;
 
 #define ATMEL_SMC_SETUP(cs)			(((cs) * 0x10))
 #define ATMEL_HSMC_SETUP(layout, cs)		\
-- 
2.47.2

