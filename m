Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F92EE965;
	Tue, 24 Jun 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777726; cv=none; b=epKXhwwtPHt5RoWQc03p2l8DJS34Sm13ULmYZYofM0Pnjnn3KqE+4GJy2y6wWZiEuPC5DO96pnG9hQy41ByQmTlJI/6HKaYj/HbMSVX6WEmXmnPtrGC+w3ZBrzzTG2xxmMUFBkMsKWQVPuDjwdHH8GzQA/sr7a0GlBaaekDplmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777726; c=relaxed/simple;
	bh=Zv0CC3WYKH/36O9O0t/SOoiKrmvlfng/rt5RJxB0L+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEeFB+vEqwEyoWL2sznSFj+qlNxg0//+5vzeQFbsQG7NDT3l1FOMjWT3b4iB4jSfRGZHWI2LMIANL4fjKx47LL7H7ypwjLOWFdP3uENa/3e1MzOwLrbUPtNnehuy9ELKvMscK9BqXvAbj6STJgZBPgVeoZYyse4hTqOuNRPo6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sVs1Pb6W; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sVs1Pb6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777724; x=1782313724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zv0CC3WYKH/36O9O0t/SOoiKrmvlfng/rt5RJxB0L+A=;
  b=sVs1Pb6Wcp/rqjcSfkgmnsgP8Y9aGPjipS+NKcVkxa8f19QsFmTVFvM9
   l6QELAUpSHBqMq5Urwa/6znPv7hC94IVcL7Alun3OkbiDci3fbukPpl+L
   s9AMlljJm+++UX/GL3uGmt0hLwz4sGXktCig1ORvPlCLoZKAQ8WVlyY/n
   GdP0Bpn5Y6M4x3egOJ7EGTA2xCeNUQrEjseU0a06un0QGVK7PmH2wMq6r
   8F6VMAb1qTbSTgpv5rdXNzmpmCuvOGjKIyiqZ1aunhSKpA+TzG8rvFKl8
   zHJ3Ufq5W4cGdg7RUrI9KgAb2We2FueFB38iKxI46Y1wI7Mtn5y6IGU24
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: 2Bnf9nTNT1y4Lw1rqdmKEQ==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688169"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:36 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:36 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 01/32] clk: at91: pmc: add macros for clk_parent_data
Date: Tue, 24 Jun 2025 08:07:58 -0700
Message-ID: <f3ef0275345578c504b41710c67bfe1238c44c21.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add helpers to set parent_data objects in platform specific drivers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: enclose complex macro with parentheses.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 4fb29ca111f7..0b721a65b77f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -15,6 +15,12 @@
 
 #include <dt-bindings/clock/at91.h>
 
+#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
+	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \
+})
+
+#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
-- 
2.43.0

