Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4741C1C6FE5;
	Mon, 21 Apr 2025 03:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745207914; cv=none; b=I3C2sOoRI1tyA1Pfh/VXbcCfYmGRma+9J82OadWA5qZOiYjq6iYPv19k8ibfDvZNa1fL6zTJaQ0t0/1Ka8veoApSI6DPSL+Su4cNEaD1lHNeCIUQd7Ht86gWgxKmui+yhrfX/8fodBtEku7oDH7ZVa0ReeNwsmUbN3iOxPK4iYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745207914; c=relaxed/simple;
	bh=NkaxfKqaA0p8lcKslxsH+Igb9BpefV+P8KTPsvttPZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mhUvrCNt6txwV/aT3p3oEzAy4nkxHyTT7jS8ETrWKgtPkWdRDJj7OnV210dyiL0jvgQKtsrmMq6MQFHiiyBKqDShN6wdm9zg4YsuRSshwRLtsA41/yAUZhS6e4vYnX3dvsE+Qn1pjKRpWb3OjlS5wsRwAUokBOOHB9uEa1gTZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIk0dLVA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIk0dLVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745207912; x=1776743912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NkaxfKqaA0p8lcKslxsH+Igb9BpefV+P8KTPsvttPZc=;
  b=NIk0dLVAHqFYM4QY5mPbTo3/L1lG2nk6bbGKK/eomEeVY8JSKAc+D5K1
   MzAm2igVLy0ok28IxWhNFdw6b9jMsFovE6QMiUHT3ijfXB+vfAzAAKEg8
   wrQrUurUb96zbs70C+AMIQCkkTOHY7425o/xUzssfjsxeXrGlyr3AyZnq
   2klTeWx14E4BJIZ9LkJ9P/rzZvHwtHwvLep4pz8YQCJZCATYqlZluEJJX
   hVTLCirBUrsBRqV7h2KmrzD4Ole49A9z+Gmr7NFlsl5ClpbMny+FWXlT7
   DsV5grEEBLP0e8Ykf02mh+ywvssk4eUUVSoycDF5A0cH7ksY0b4mXYkCr
   g==;
X-CSE-ConnectionGUID: h2I2z6bxQNmQ06ABD44KzQ==
X-CSE-MsgGUID: WlA7HVmaToK+2LhganCB8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="64145380"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="64145380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:58:25 -0700
X-CSE-ConnectionGUID: FpNN5sNZTUyIW96QErOquw==
X-CSE-MsgGUID: IcM8LLWyTYWZGHq71HhCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136471875"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.163.83])
  by orviesa003.jf.intel.com with ESMTP; 20 Apr 2025 20:58:22 -0700
From: Saranya Gopal <saranya.gopal@intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Saranya Gopal <saranya.gopal@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] platform/x86/intel: hid: Add Pantherlake support
Date: Mon, 21 Apr 2025 09:43:32 +0530
Message-Id: <20250421041332.830136-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Pantherlake ACPI device ID to the Intel HID driver.
While there, clean up the device ID table to remove the ", 0" parts.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/platform/x86/intel/hid.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 88a1a9ff2f34..0b5e43444ed6 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -44,16 +44,17 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
 
 static const struct acpi_device_id intel_hid_ids[] = {
-	{"INT33D5", 0},
-	{"INTC1051", 0},
-	{"INTC1054", 0},
-	{"INTC1070", 0},
-	{"INTC1076", 0},
-	{"INTC1077", 0},
-	{"INTC1078", 0},
-	{"INTC107B", 0},
-	{"INTC10CB", 0},
-	{"", 0},
+	{ "INT33D5" },
+	{ "INTC1051" },
+	{ "INTC1054" },
+	{ "INTC1070" },
+	{ "INTC1076" },
+	{ "INTC1077" },
+	{ "INTC1078" },
+	{ "INTC107B" },
+	{ "INTC10CB" },
+	{ "INTC10CC" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
 
-- 
2.34.1

