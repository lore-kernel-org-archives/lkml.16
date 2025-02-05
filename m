Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB462288C3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758343; cv=none; b=cAXDXpmmPrLMBVmEA2Bc8kNnw5PHiGKZJoXxljkF7cPGVDtG5YKlF5GgbAgqq84qMXGkHRnOQpctlvYEDtFPr39njam+JM9MCoOnw2Wk+o/zH93/yW+ZRNoc4HjQDhIeyKSG6PfgY0fSE1vZJrod8HDt61pb71enryRc8Xvc1Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758343; c=relaxed/simple;
	bh=ooy5ncT7BqeOTnR4CZhHUxTwE8iw0Mgd5KrKs2DKXWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RI7ym+Qg167u3M+STymrz4el0XqQbSwzbkW2CaQhhNlbDzAXAnITBJ2AyeWa7UfOqQDXcnqsk7Q7053Szgc4vT6govopJwUIz1lMP/aFdIKc19GmUF6DtTVFrm/oN0FXp/Zt7f8LlhuFv0o44xdym1iueEirCc2F6qWyGoakb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VECwJkH2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VECwJkH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738758342; x=1770294342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ooy5ncT7BqeOTnR4CZhHUxTwE8iw0Mgd5KrKs2DKXWA=;
  b=VECwJkH2TkcnsYhy24raD2VW8RW4iefRxoh4IS0aNa/ny5R3K+GA1APK
   QP8HCWvLpcKJseLiI4wP/enzJOiQ+k/nSrN7vNpoAjue4mIKjLU20sWF1
   LwBG+U7I05IdRiPkB8cyUR6Hf5ymdIBPNvEHnBur5HPNhfMeJHOnblQuv
   TKRPpB4MuhOxPUvyItjV5Vj0Zp0XckCAR5XTysXzBGxtOAHXFwlf+ysDX
   g5IIDcLr53qC+QJXdyDVDrPG/7OiL8rpj1w1giDVMDODPG2f9CxDFRvId
   3cxLO+/cp9CGS2zKvMxA0RdcGThDzv4OS5V8tUd/GytV2W2ypIFjw9T+t
   w==;
X-CSE-ConnectionGUID: Bb7p80/6R3OtnrXjj+yKCA==
X-CSE-MsgGUID: lcfKIEgwSjiettDGz/HrXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43073354"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="43073354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 04:25:41 -0800
X-CSE-ConnectionGUID: MRIsGiLRTYiSUmLXcnoFkQ==
X-CSE-MsgGUID: WW9r/ZqaQTajraDwFK5rmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111071574"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 04:25:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 18D79399; Wed, 05 Feb 2025 14:25:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/1] mfd: upboard-fpga: Remove ACPI_PTR() annotation
Date: Wed,  5 Feb 2025 14:25:36 +0200
Message-ID: <20250205122536.631252-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI ID table is defined globally without an #ifdef check for CONFIG_ACPI,
so ACPI_PTR() makes no sense here. Also note, driver depends on ACPI anyway.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/upboard-fpga.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 1f6131126547..6696c82ca4dd 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -11,7 +11,6 @@
  * Author: Thomas Richard <thomas.richard@bootlin.com>
  */
 
-#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -311,7 +310,7 @@ MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 static struct platform_driver upboard_fpga_driver = {
 	.driver = {
 		.name = "upboard-fpga",
-		.acpi_match_table = ACPI_PTR(upboard_fpga_acpi_match),
+		.acpi_match_table = upboard_fpga_acpi_match,
 		.dev_groups	= upboard_fpga_groups,
 	},
 	.probe = upboard_fpga_probe,
-- 
2.43.0.rc1.1336.g36b5255a03ac

