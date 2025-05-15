Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A028C2C7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299326; cv=none; b=GEXoktphW1Nao7Af2o0PldeXyXoAhqtwidVcEJbqiTADrjvSvDGYzulsS395XxXUDcB6lLJnNdc7Jzfi3g73Y7DJ96LYEbizLiyT8J6lZF4A6sEZE7ZRe1xAi932D+y8TW93OyXHCzsFnRnFPqRiVued5iC7v8xRPEISuJC1/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299326; c=relaxed/simple;
	bh=DGNuWaape+/tQRhHkH8Z3oeB8XdeWACmaRgfc9MlPYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGl0sxDoROZsXOEqfQbC2awkYtPshu+Nh5JFfpM8PLUgrEefeBS5arnJa025EolJAbVYvYh7ytcsQGHIUwaadbOqk/0ZhBWwGzuILxanhraEpctLwBLlY5Xx0sgJmSOKyb7I8W/sGGVvbPrE4QL/NmUQYIvtxNpBGUdxeTqEOH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKADJbUe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKADJbUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747299325; x=1778835325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DGNuWaape+/tQRhHkH8Z3oeB8XdeWACmaRgfc9MlPYI=;
  b=TKADJbUeLjqgH7LoYiT2uqTJoUu3hVI9ESHLOoZHOQ0/Qv4+vrWSJClH
   0T63mBNJMSxlefJgQtyArpBiKkJ1TfXQWd6Apr+NWX0Zntctix1Kwfjwr
   QzblzFG/SmT0ODhStGRnr9Sv56299Ura9wVKAmuHeaRrkCm1fDzYtTK0y
   1a3Oi5dmpOtbgXBB73Em6qG2cyrIseFfEe5yYlLUuR9edtHtwDw+05EgH
   InVgiCzXZoKzxb6UlJ38yQsWnVgLporlEctqtns/3q6F1OTHJc4E6BBvY
   m9orK8oAKu9hQcrAWCBBO0tSMg5Yrsyz8MAjxlkD3gbmdRcszTSWI/uJj
   Q==;
X-CSE-ConnectionGUID: 2x9D0rJ4Qlqh5xilEA7siA==
X-CSE-MsgGUID: lO2ea1U7RAKtnnJ+yiOaUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49338544"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="49338544"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:55:24 -0700
X-CSE-ConnectionGUID: 2qNOOQOdTEOluViTCmZ5hg==
X-CSE-MsgGUID: Mt38Xo1eSLqEx2JkL0XYlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138719717"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 01:55:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 648B523F; Thu, 15 May 2025 11:55:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] genirq: Bump the size of the local variable for sprintf()
Date: Thu, 15 May 2025 11:55:16 +0300
Message-ID: <20250515085516.2913290-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC is not happy about sprintf() call on a buffer that might be too small for
the given formatting string.

kernel/irq/debugfs.c:233:26: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]

Fix this by bumping the size of the local variable for sprintf().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505151057.xbyXAbEn-lkp@intel.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index 3d6a5b3cfaf3..3527defd2890 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -225,7 +225,7 @@ void irq_debugfs_copy_devname(int irq, struct device *dev)
 
 void irq_add_debugfs_entry(unsigned int irq, struct irq_desc *desc)
 {
-	char name [10];
+	char name [12];
 
 	if (!irq_dir || !desc || desc->debugfs_file)
 		return;
-- 
2.47.2

