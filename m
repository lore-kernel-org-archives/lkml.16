Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870821D5AD3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879399; cv=none; b=qQmEpg5RkX5rlenZ8YVKG0NzknO4szihXqR52RLAfHs4FrkXiVGCJK9wTpEx9HWENdtdpNuDzTQm85sFFc0W5AYnt2gw/FoL/C48XOVivn62yvj9dReKS1xXtwa1i0PawapAFdEU076ztjcm+Ei7Ll45BzMXv+WH02xQlZUFocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879399; c=relaxed/simple;
	bh=EpQ2y+Hp3CnOJ/dtUdnCQaoWc11gH1V1aVqpL3pPsG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKGjtgZa9TdIHPCZLdFtfFq5TWnga8W6qhbhFN3itmbNQxPxSMK8M1IWoV4YPpUlFo2K4w4pFFr06vYwYOv2KfFqQp6UtdzkRemROxkWXA5vqYOMeEWvmrKIHOlVPUH3SujVgHTK8FOlNhpaVea68n29xATvv8+1+jcj8XSLOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSR3taQZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSR3taQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738879398; x=1770415398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EpQ2y+Hp3CnOJ/dtUdnCQaoWc11gH1V1aVqpL3pPsG8=;
  b=gSR3taQZ/U2f7jMzBOC+/ulv5AWlwsdot8ghohy5JV2LZGg5tlkDU7AV
   0TjWu+mnhowUtv/V7z/K08SXpY1YNv81aRDvMz0vOhX0B7zqqfiRllsEp
   fccFNx6a//oXmXV3G3BrwmP4WOEstgvRq7cGpEvhXXzKiuLWdLqW+wBk1
   Zyu4N2a9cjdQdbSOA46EwZzZUt4MgJpAcRrx5CV+TxuJjK31zMFb6p6kk
   LYjW573bfwPaE5Ok/T/9L5j7aNz5HSis8Db+QdAcMg4wbF94c9VIftnPa
   SMm4O8BMFM6H/5eGIQAUzOmC7EsqKjO6p3XVaMX8XeGhzCgX2Svpl4S/o
   Q==;
X-CSE-ConnectionGUID: cMjX+A0uRPumR7DC56H9bw==
X-CSE-MsgGUID: vy4PyoAwS42cvvyqFiqqCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39204589"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39204589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 14:03:16 -0800
X-CSE-ConnectionGUID: 4STsGXlsSPOTXN0FCidtEQ==
X-CSE-MsgGUID: xNuqhQ9kRKSYEfdFdVMoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112237487"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2025 14:03:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8EC93125; Fri, 07 Feb 2025 00:03:13 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] eeprom: digsy_mtc: Make GPIO lookup table match the device
Date: Fri,  7 Feb 2025 00:03:11 +0200
Message-ID: <20250206220311.1554075-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_id value in the GPIO lookup table must match to
the device instance name, which in this case is combined
of name and platform device ID, i.e. "spi_gpio.1". But
the table assumed that there was no platform device ID
defined, which is wrong. Fix the dev_id value accordingly.

Fixes: 9b00bc7b901f ("spi: spi-gpio: Rewrite to use GPIO descriptors")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/misc/eeprom/digsy_mtc_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/digsy_mtc_eeprom.c b/drivers/misc/eeprom/digsy_mtc_eeprom.c
index 88888485e6f8..ee58f7ce5bfa 100644
--- a/drivers/misc/eeprom/digsy_mtc_eeprom.c
+++ b/drivers/misc/eeprom/digsy_mtc_eeprom.c
@@ -50,7 +50,7 @@ static struct platform_device digsy_mtc_eeprom = {
 };
 
 static struct gpiod_lookup_table eeprom_spi_gpiod_table = {
-	.dev_id         = "spi_gpio",
+	.dev_id         = "spi_gpio.1",
 	.table          = {
 		GPIO_LOOKUP("gpio@b00", GPIO_EEPROM_CLK,
 			    "sck", GPIO_ACTIVE_HIGH),
-- 
2.43.0.rc1.1336.g36b5255a03ac

