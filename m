Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55044A33;
	Thu, 26 Jun 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952751; cv=none; b=noH4D5dK4csjkzFSenRqEoTw08eP4Hz4ED9vF8iiP+EOKbn60Rv0v5sQRSZE9wYugjNb89BHHLzujLegYKFGub4PZj0wnbLXhlTOZwkdH3jTAIeyIE5P8LT6CdSsbiNo3NTbJYY3S/6yzjTSc7GFMYY2Vnn+d93cnE4d2yUoN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952751; c=relaxed/simple;
	bh=lWecqGE0ZqUlI8R9J48Q6f79uZrYRpTG9U7FhQ/dYUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j54tBy9huSk01w8Mc7qf/YYoWr8TpjnDrlYgf2/H3f3K3zldNXMf9vn3SI2W6x3D7YxJFj9fRxgX/L/j8cePVY3csvdBlzp8jFSkAmoJU+CBLmIbKylNQqfWQfjc6W0YeebwZ9pT/5zqMgiSbV3BgzUiHZcshEs8SotE29Eqzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGWs5ViX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGWs5ViX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952750; x=1782488750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lWecqGE0ZqUlI8R9J48Q6f79uZrYRpTG9U7FhQ/dYUM=;
  b=JGWs5ViXelEU/l1eLDEr/tuP9/StRXwv5sV9zNqH/M7G9FZAnDGNRMPq
   HVEylKtOxR4aHQlglN7BYlRy/8m+yUgBsSHhB4lajfBcuDEFJPIM6fBZ1
   ovO+m8d7nGaXYbRWjpZiwmm+eFaHkyJyKqdd9EtLrMmrwfBpMQYoS+NQA
   LAeWZGRRoLxFafkZnG7Scz1LJf23jE8U/kpObHiLRZUqavo+lGZ4YQZqp
   d2Hgpc+owHrruDBoYkitdSrd32b32fg/Ac+y3HLAw2q5GDFWRBJD7bL9G
   bHK7YDso13/KkcOOUzSTdNOb+ypEaP8IfggAB6Uq69Ryko9AWuiUoXuhM
   w==;
X-CSE-ConnectionGUID: 5Soi1IDnRZ6RMP+5jjlGdQ==
X-CSE-MsgGUID: VPswh1BQTtGHuEE+PcgROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64691307"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="64691307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:45:49 -0700
X-CSE-ConnectionGUID: dRwG9I1oTZOJoZXKLKAAFg==
X-CSE-MsgGUID: WCwabfHxQbGlbP0wu7JYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152307520"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2025 08:45:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 28EE82AD; Thu, 26 Jun 2025 18:45:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/1] mfd: madera: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:45:44 +0300
Message-ID: <20250626154544.324724-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/mfd/madera/pdata.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pdata.h
index 32e3470708ed..7e84738cbb20 100644
--- a/include/linux/mfd/madera/pdata.h
+++ b/include/linux/mfd/madera/pdata.h
@@ -8,10 +8,11 @@
 #ifndef MADERA_PDATA_H
 #define MADERA_PDATA_H
 
-#include <linux/kernel.h>
 #include <linux/regulator/arizona-ldo1.h>
 #include <linux/regulator/arizona-micsupp.h>
 #include <linux/regulator/machine.h>
+#include <linux/types.h>
+
 #include <sound/madera-pdata.h>
 
 #define MADERA_MAX_MICBIAS		4
-- 
2.47.2

