Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3B19DF41;
	Tue, 10 Jun 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545155; cv=none; b=AsFTrQDp/AO65dx89GGCyBAdhkQqFdUUI4OTt5I50ZEtuh7v6/A3TgJxL1TXluu+PbHVgFBU0gZnjkwUbmngtT0v4v6mnDIJStcJy7a34q9donaGYNqixW6XdUmY/xjmyLE588L7tqZlxoTtjyiBxI9OvA8t+7X/9dW3jUaCt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545155; c=relaxed/simple;
	bh=CBoEIbibXehI8+FpDHDg4a7tKFvTVVVf5mh6WK6oyMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vv0dZZrg9BjNhsB2Jp6uYLLm+5dFNEghLoS5izuXBeBIFiWOIjgYXbgVMnJWQvgW5IuB6UdH87GMX8PY1kZVYrO8wjHWhbSWUDXVBPJzQVLdNYgcLzR6V44Sp7zPQs/esgOMrhtI5R5Ua73iVCjpobbnte/0xtHw1voDeWF/3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xFI8j0N1; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xFI8j0N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749545150; x=1781081150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CBoEIbibXehI8+FpDHDg4a7tKFvTVVVf5mh6WK6oyMs=;
  b=xFI8j0N1k3UnvM2JsZBpYYIwa2G/w14iVYDfi534oJruvtWjLdlhsEHR
   fjpY915jZHFURs0uFhOIoeAE1kpo5eBdBQItiKXEWyIbslvZBYfbPv8gN
   Kq5+g5Kj5TeZzblrRdnCv7x0WabNgUR6HI9AVTf+8sP6Zj2TBAdHirk/j
   iT9F1uyz4vgh0R5SsQO1+YL5ykFTPxha1368Cp8LK8E2Nb2IPAvEurcph
   ZZL9UzV5bOF0u5DRxCOEM6Z8L96jenVKBPEFLsw26chEOmX0CwQBVFCxK
   4Tm6lQYa/do1ALt9h6X6N68ymUblaBHJ2nXl6zJfUJl0now07001z1WEf
   A==;
X-CSE-ConnectionGUID: sMirRGKoSbKszKIj10evvQ==
X-CSE-MsgGUID: BC6P4IJZRNmtkQ3xmqVQbw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="210101719"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2025 01:45:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 10 Jun 2025 01:45:10 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 10 Jun 2025 01:45:06 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Subject: [PATCH] clk: at91: sam9x7: update pll clk ranges
Date: Tue, 10 Jun 2025 14:15:03 +0530
Message-ID: <20250610084503.69749-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the min, max ranges of the PLL clocks according to the latest
datasheet to be coherent in the driver. This patch apparently solves
issues in obtaining the right sdio frequency.

Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index cbb8b220f16b..ffab32b047a0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
 
 /* Fractional PLL core output range. */
 static const struct clk_range plla_core_outputs[] = {
-	{ .min = 375000000, .max = 1600000000 },
+	{ .min = 800000000, .max = 1600000000 },
 };
 
 static const struct clk_range upll_core_outputs[] = {
-	{ .min = 600000000, .max = 1200000000 },
+	{ .min = 600000000, .max = 960000000 },
 };
 
 static const struct clk_range lvdspll_core_outputs[] = {
-	{ .min = 400000000, .max = 800000000 },
+	{ .min = 600000000, .max = 1200000000 },
 };
 
 static const struct clk_range audiopll_core_outputs[] = {
-	{ .min = 400000000, .max = 800000000 },
+	{ .min = 600000000, .max = 1200000000 },
 };
 
 static const struct clk_range plladiv2_core_outputs[] = {
-	{ .min = 375000000, .max = 1600000000 },
+	{ .min = 800000000, .max = 1600000000 },
 };
 
 /* Fractional PLL output range. */
 static const struct clk_range plla_outputs[] = {
-	{ .min = 732421, .max = 800000000 },
+	{ .min = 400000000, .max = 800000000 },
 };
 
 static const struct clk_range upll_outputs[] = {
-	{ .min = 300000000, .max = 600000000 },
+	{ .min = 300000000, .max = 480000000 },
 };
 
 static const struct clk_range lvdspll_outputs[] = {
-	{ .min = 10000000, .max = 800000000 },
+	{ .min = 175000000, .max = 550000000 },
 };
 
 static const struct clk_range audiopll_outputs[] = {
-	{ .min = 10000000, .max = 800000000 },
+	{ .min = 0, .max = 300000000 },
 };
 
 static const struct clk_range plladiv2_outputs[] = {
-	{ .min = 366210, .max = 400000000 },
+	{ .min = 200000000, .max = 400000000 },
 };
 
 /* PLL characteristics. */
-- 
2.45.2

