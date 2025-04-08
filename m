Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A317A312
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122373; cv=none; b=bAc3TnhzqUSdXfx5PXiWfhzGai5MNu3kS5LXLrW5jpo2VXb74kuItX5jz0MLUfc0ANJns0MK+lUZ9Mo2clnj5BS8RM5iaL5TA9PQGbNnrpxiyczXJEexMRe4TPmQa9LXZXug7n7AUfERbyTsO6FdE2Gk/pXltV6AXC7XqjLkIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122373; c=relaxed/simple;
	bh=rwIhn26my22eL18uwMvjAcyOTv2CYeIJkDgA6t0oQVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWl+FrX840A//JE4YRApIIVPRItOL7XckhAsB2LqwwPTJX4M2dVBctuBCzgSRjiRz7dg8kBgEv16xpMI7WbSarRmW+1d6nlQkb7fsCDZQTUO1BI75kJ35ozn/MOjgWewaD1BNjgnQJbwtzxj+Y6DogY0NQWSXO4lu6gDXRLs/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWFWgk9B; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWFWgk9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122371; x=1775658371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rwIhn26my22eL18uwMvjAcyOTv2CYeIJkDgA6t0oQVU=;
  b=PWFWgk9Baci9aWf2v7rHsIIYJmm2GvXeqHRB53K5oQEWMILtxMQ7SumT
   p6DH8+o3kv79c8f69AVnepucq/8MpaBkHN+Eh4xJ3nkza5k02FhAdYM6N
   ZsLZiy67rFGeRemH8cjK1eWiTzc0xopDNiQ9lQi3/bFlXfZ9kwU9/vq4V
   JZQPUpccXG5F9uQo5dlvdsz8FwVEAp5FU1VsB4ITtLnQ4N/zR4AFSKaLJ
   Vn7kmJR+zZYmz2i0FK+d3c432vJkbQgN2DTgGkmGmhJh8/W06WDRerX/w
   3UvAwqsBAsR2j/AAZpCYmwQ1olFvN2EnQAiffr04JfJ7ieNUL5+bu7zoV
   w==;
X-CSE-ConnectionGUID: ynf5mdBqTbOXqpCTmOwuAw==
X-CSE-MsgGUID: KYUC0olHRBCLFMLSNt7uAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49403610"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49403610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:26:08 -0700
X-CSE-ConnectionGUID: k91bMzCBQyuiKV/M2KwLtg==
X-CSE-MsgGUID: L8MCvl8kTouqSF0S4HsbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151480194"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 07:26:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7E6054A3; Tue, 08 Apr 2025 17:26:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 2/2] fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'
Date: Tue,  8 Apr 2025 17:22:26 +0300
Message-ID: <20250408142554.1366319-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408142554.1366319-1-andriy.shevchenko@linux.intel.com>
References: <20250408142554.1366319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'
for the sake of deduplication.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/staging/fbtft/Kconfig | 35 ++++-------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index dcf6a70455cc..c2655768209a 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -8,160 +8,136 @@ menuconfig FB_TFT
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
 
+if FB_TFT
+
 config FB_TFT_AGM1264K_FL
 	tristate "FB driver for the AGM1264K-FL LCD display"
-	depends on FB_TFT
 	help
 	  Framebuffer support for the AGM1264K-FL LCD display (two Samsung KS0108 compatible chips)
 
 config FB_TFT_BD663474
 	tristate "FB driver for the BD663474 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for BD663474
 
 config FB_TFT_HX8340BN
 	tristate "FB driver for the HX8340BN LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for HX8340BN
 
 config FB_TFT_HX8347D
 	tristate "FB driver for the HX8347D LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for HX8347D
 
 config FB_TFT_HX8353D
 	tristate "FB driver for the HX8353D LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for HX8353D
 
 config FB_TFT_HX8357D
 	tristate "FB driver for the HX8357D LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for HX8357D
 
 config FB_TFT_ILI9163
 	tristate "FB driver for the ILI9163 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9163
 
 config FB_TFT_ILI9320
 	tristate "FB driver for the ILI9320 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9320
 
 config FB_TFT_ILI9325
 	tristate "FB driver for the ILI9325 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9325
 
 config FB_TFT_ILI9340
 	tristate "FB driver for the ILI9340 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9340
 
 config FB_TFT_ILI9341
 	tristate "FB driver for the ILI9341 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9341
 
 config FB_TFT_ILI9481
 	tristate "FB driver for the ILI9481 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9481
 
 config FB_TFT_ILI9486
 	tristate "FB driver for the ILI9486 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ILI9486
 
 config FB_TFT_PCD8544
 	tristate "FB driver for the PCD8544 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for PCD8544
 
 config FB_TFT_RA8875
 	tristate "FB driver for the RA8875 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for RA8875
 
 config FB_TFT_S6D02A1
 	tristate "FB driver for the S6D02A1 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for S6D02A1
 
 config FB_TFT_S6D1121
 	tristate "FB driver for the S6D1211 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for S6D1121
 
 config FB_TFT_SEPS525
 	tristate "FB driver for the SEPS525 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for SEPS525
 	  Say Y if you have such a display that utilizes this controller.
 
 config FB_TFT_SH1106
 	tristate "FB driver for the SH1106 OLED Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SH1106
 
 config FB_TFT_SSD1289
 	tristate "FB driver for the SSD1289 LCD Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SSD1289
 
 config FB_TFT_SSD1305
 	tristate "FB driver for the SSD1305 OLED Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SSD1305
 
 config FB_TFT_SSD1306
 	tristate "FB driver for the SSD1306 OLED Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SSD1306
 
 config FB_TFT_SSD1331
 	tristate "FB driver for the SSD1331 LCD Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SSD1331
 
 config FB_TFT_SSD1351
 	tristate "FB driver for the SSD1351 LCD Controller"
-	depends on FB_TFT
 	help
 	  Framebuffer support for SSD1351
 
 config FB_TFT_ST7735R
 	tristate "FB driver for the ST7735R LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for ST7735R
 
 config FB_TFT_ST7789V
 	tristate "FB driver for the ST7789V LCD Controller"
-	depends on FB_TFT
 	help
 	  This enables generic framebuffer support for the Sitronix ST7789V
 	  display controller. The controller is intended for small color
@@ -171,30 +147,27 @@ config FB_TFT_ST7789V
 
 config FB_TFT_TINYLCD
 	tristate "FB driver for tinylcd.com display"
-	depends on FB_TFT
 	help
 	  Custom Framebuffer support for tinylcd.com display
 
 config FB_TFT_TLS8204
 	tristate "FB driver for the TLS8204 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for TLS8204
 
 config FB_TFT_UC1611
 	tristate "FB driver for the UC1611 LCD controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for UC1611
 
 config FB_TFT_UC1701
 	tristate "FB driver for the UC1701 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for UC1701
 
 config FB_TFT_UPD161704
 	tristate "FB driver for the uPD161704 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for uPD161704
+
+endif
-- 
2.47.2

