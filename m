Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2580078F2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958448; cv=none; b=Kwb4MGLHd1ZprhfYwPRWLkrTi97/qddNibVxb4lWFlk6jKWw4g90Mfp6y79jHSjfwGxt7n3YJ3Z5lOH/KAa5ZDiXHt5fELTD/bPBBECfQOxdKTDuINUzwXBy06VCi2N8gQPWXxhDoW+77DoOF2+/TPHKini0EDBwP2eD7Ru/p2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958448; c=relaxed/simple;
	bh=FwSp1hIralzZz9Gl3ECBPbfrrWrGPsrVZIMRNQJ9Bgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW21K9cRMaHCdDlzO9fhK7Iao8Ce+I6+xmMnXJ5tBfPcP7ML32N9tLSMC+cE9jTpMCjLaaLv79ghnug96y0u3fm+bfvzRgsnNQkY4zV+Yy24Dbz/qK4RCKZitUopgrd5equPcPpjjIhkmwKKPXUSjOjUnuu5rbQ4brb7gs43WW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haKBfUFg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haKBfUFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750958447; x=1782494447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FwSp1hIralzZz9Gl3ECBPbfrrWrGPsrVZIMRNQJ9Bgs=;
  b=haKBfUFgXEQeLSwUQIc7ZJYAlxsDzJCFIp+zBTotc+jbWZYLMhzpsXgv
   MXwehibeNK2dhKDeCLXxTSKje8Yy+Yti5Zht6dCEgFlFOyneyqgR/1ucJ
   Id+6INjuhIxdHKy5+1l0xhchK1WiF4IW6UQj4Hu0YIYFlK8ABlRkB8xkh
   eCnm0CncApkk/mHIa/ue8Xa/Rrx2uxbBipuSJ//OZWOub7Hn4yvBtvytL
   q5Knv5H+ES7QBqqWfT2pPT56hpbu6n16n4OKwp3xf3BjokghquFUdy6w6
   RG6GQ3MJldPQAbe0hbGqcYn6yXEI8XDW+PDAiWpWOk7JFW4ETxUeif2QK
   Q==;
X-CSE-ConnectionGUID: Rt32/QIjSNKDztngWKAJtw==
X-CSE-MsgGUID: HyG0s6QoS3a8n3adsTQTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55890573"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="55890573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:20:45 -0700
X-CSE-ConnectionGUID: 1ThpD108RYCdf3M6h7aR8g==
X-CSE-MsgGUID: qC/D7bpaSyi07P5n7yDAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="158068525"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 10:20:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5850C345; Thu, 26 Jun 2025 20:20:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] firmware: sysfb: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 20:19:01 +0300
Message-ID: <20250626172039.329052-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/sysfb.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 07cbab516942..b449665c686a 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -7,9 +7,13 @@
  * Copyright (c) 2012-2013 David Herrmann <dh.herrmann@gmail.com>
  */
 
-#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
 #include <linux/platform_data/simplefb.h>
 
+struct device;
+struct platform_device;
 struct screen_info;
 
 enum {
-- 
2.47.2

