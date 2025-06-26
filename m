Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3E20127B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958638; cv=none; b=O6CNNpM8+ctTmQYDFuh/dlo4UcCncajU3IeyyTODtLSw0YhCu1w5Z6hfqfHY7AJZgy86aWb0fjxzzmaYtA5vARiB+/IxSJkd3afuWen13l1pS/k+I0pZc7Qm31GIxyqzISgxJAToGLIcDD4FpRlTC+C77khgkSLBz7PRhPlW5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958638; c=relaxed/simple;
	bh=kVSLceRpYBij/by0D8xxXHAgukzMQXLQRvK+pxse7H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+iVK9eh637O+QWhcDqjV5O8Et9KS5TBH77aOwbnYy/teIrf0WLz+sdBCIcRRvRSEXG5ltc8Hxl/a3OLbisrIb+i/kvgCwx+1bnvppIJSAHAYFyoQCi9W6abDADXUG97AtIxjzpJ4hMxkHYdI9h//WwC5y7sHv4hvkKwl/S1ihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBNg0FYu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBNg0FYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750958637; x=1782494637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kVSLceRpYBij/by0D8xxXHAgukzMQXLQRvK+pxse7H4=;
  b=GBNg0FYu6kvNSWVEIsGqjnNnvU7ub9QBsniAmZGJDOeDqcBLuN6WJqy5
   /8+BUEAWiFr+h+TXjHDqE4KBjjYy+Z5JB21cbp4j9xkut/DCgUT5nw52K
   03Phf+P/Lx8Bs4IHpq9vX//uQO9rRWedg49Kcr6u9GwLTDRXgGvm8aV/E
   JaDL7ma8Kx+OpWOV8aQ4eogYgAfmEgYqHnSkNR8eaWj7ODY4OdIAm5ozS
   dI2HUOIj3WlE+i15dEnM1AZyig1Lath1BOStos9L+PxVsHi0LZicnU9Z0
   Gsdcz5vtgv1rkJyceIJopO/Zvfte46XdGvsD0uf/QUETusPBx6ceZKcqJ
   w==;
X-CSE-ConnectionGUID: Qo95Udy6TXOdbe1kpyXc2A==
X-CSE-MsgGUID: 36hTSPbWQfK72o2OygHVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40882441"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="40882441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:23:57 -0700
X-CSE-ConnectionGUID: kk77XfOzT2qdnbP/01bXEA==
X-CSE-MsgGUID: TnrUiKOIRCuETUiU3ZHKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156865698"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 10:23:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5F7122AD; Thu, 26 Jun 2025 20:23:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [resend, PATCH v1 1/1] logic_pio: Use RESOURCE_SIZE_MAX definition
Date: Thu, 26 Jun 2025 20:23:28 +0300
Message-ID: <20250626172348.329297-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a predefined limit instead of hardcoding it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/logic_pio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index e29496a38d06..6d6a7498dbe5 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -175,7 +175,7 @@ resource_size_t logic_pio_to_hwaddr(unsigned long pio)
 	if (range)
 		return range->hw_start + pio - range->io_start;
 
-	return (resource_size_t)~0;
+	return RESOURCE_SIZE_MAX;
 }
 
 /**
-- 
2.47.2

