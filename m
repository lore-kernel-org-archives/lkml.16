Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9822EAB70
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042661; cv=none; b=P0Q8mKXh6fKfrLvFi5XfW7WfOCvQZemISOqieL1uETtDn9BuBAzutS7oFCAFK93rSssErb2gWh5O9gNHqBAOBFEb0dTTcGkIAWdtAQaUKrXPbw0P+5zIjTpLayMotX+FV0LauU1r7nTB+E/I223+SItArdAiYO6Xx9nVTu5vHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042661; c=relaxed/simple;
	bh=TSgOQXH2cylh/c8/YzG1JlJ0nKvfIZhvP1Qcm1/EaFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AK6Rw00Yl70rLoRzP/hYRCgJdl+OvgbURFWcXx+vENu/kIh7P3UFSjDpvTePvfLc9ZATstaxctIAY82wxSyXBmQu+eyn4rQ//jFKwN4UdoJebvNEif8Cjhgkv364EAdBRq405ydPmWBCGL1YtQmGAawrzLCLWVNCCNN/Z+IKryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClC/ugHm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClC/ugHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042660; x=1782578660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TSgOQXH2cylh/c8/YzG1JlJ0nKvfIZhvP1Qcm1/EaFA=;
  b=ClC/ugHmtQBnH2E/osUup/TVLKjXxusApFG1fhFxQbFP7Al9YiLONGFi
   pZsWG9u6cw1zVBA3j9fcroXw3XsstgSBbuTwOsGWsG637F0y5RzKr1rbC
   EZ29zUnFx4QP/2DvBrdnvpnTJad7chAS2mpchQfRlNrJvLsF0ieeIxYsi
   IgBk6WImT/ndQ9lY446okPDxZN77FlbY9nj6FBouRU8c6j7/+ISERzLAl
   bdAi4SxdoTxUpiz2v4xnrEC6KrdAvp+64TXX08G4PX3JPqAO9hbt766/E
   kt4zGKFXKOUwgzPswNtu1bJ7uqG0WKzKkTRKoHaVpheQxeB5WGZzBFKzQ
   Q==;
X-CSE-ConnectionGUID: e/D+1XsnQ9SuGZkA+m2VyQ==
X-CSE-MsgGUID: Jm0dL+TUTJCxDS0N+I7FWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57142557"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57142557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:44:19 -0700
X-CSE-ConnectionGUID: jQNau0O0Q+O1RMMTIlbW1g==
X-CSE-MsgGUID: DBf9Q/T1RqKi6tq9M3cw5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152951937"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2025 09:44:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 11A3F2BA; Fri, 27 Jun 2025 19:44:15 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Date: Fri, 27 Jun 2025 19:43:58 +0300
Message-ID: <20250627164414.1043434-1-andriy.shevchenko@linux.intel.com>
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

v2: fixed multiple compilation errors (LKP)

 drivers/mfd/atmel-smc.c              | 9 ++++++++-
 include/linux/mfd/syscon/atmel-smc.h | 8 +++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/atmel-smc.c b/drivers/mfd/atmel-smc.c
index 4628ca14e766..0a5b42c83f17 100644
--- a/drivers/mfd/atmel-smc.c
+++ b/drivers/mfd/atmel-smc.c
@@ -8,9 +8,16 @@
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
-#include <linux/mfd/syscon/atmel-smc.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/string.h>
 
+#include <linux/mfd/syscon/atmel-smc.h>
+
 /**
  * atmel_smc_cs_conf_init - initialize a SMC CS conf
  * @conf: the SMC CS conf to initialize
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

