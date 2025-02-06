Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709931DDC15;
	Thu,  6 Feb 2025 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865764; cv=none; b=oCBqZJJnK+w04ehQ51plaOVEDD/bIskMykK5UP5O4UR7VbjIfk/iHUcHoJJ0Hc3YzXtvuiHAe9vTbVliXj/CurMexa90az8+9Iep8wPC4KFBEmF4jvADO6dodfK2sA/iWYea+Q2q0/UxJxwbfRVp1tuN8mLeQhMU/6tXwWtT1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865764; c=relaxed/simple;
	bh=Jos/hi+/8kc69r3zVe5hi6bwnwOoBz55vx9UJaURjZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YK7jdmQm8w+PES4KtOCrsTToNLSAPcsfJR8eYrB0kWlcwQSlsqsVrjX3LFA3Qmca77udMXdG7ugFYU9tx73p52qvDlkLIfIGFRZ7PDkyQUqMgbvhBtnKfdH25q3I7q3VrriJ7/GA/8uOk1SOL3ql4eQkyq6VrBiY6fPSV+O+ey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=UeawXaFe; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UeawXaFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738865762; x=1770401762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jos/hi+/8kc69r3zVe5hi6bwnwOoBz55vx9UJaURjZI=;
  b=UeawXaFeccZH2i1OYVJE7t/TQiQJBxuv9SQRjKz3GWJBCZfwjT/ytsR9
   0Pi8L/tUoY8dKeHhNQmdqoTGP8W4N0fOQbbftqSwjJw/mUOev/bHmLxBf
   WZ5+1KBfQNNyjVx+r1mt8+QrFKGuLx2xS6OC1ZfsEkdQT7hIG9nxlyV3l
   8l0glpA46wLrKw+AvusjlbQy6uAA6h/6AI8ZNYRkxc7AnD5gBl37wtNrg
   IWIDuDDXw2SVHgx+z+Ch6Kg0+5VgNa3seXz6S1sbKRorY/1bNE6NQDXd2
   2B2c45acYTJyU39/F2TUiD0PrhzbqJebabCbAR96jEUhKCW4JdzCTaZnx
   g==;
X-CSE-ConnectionGUID: RUzZ0s40Rb2+hOFS2V1Qww==
X-CSE-MsgGUID: tdrkNp/4Rsed0wn4y4s5rQ==
X-IronPort-AV: E=Sophos;i="6.13,264,1732604400"; 
   d="scan'208";a="36973015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Feb 2025 11:15:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Feb 2025 11:15:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Feb 2025 11:15:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mripard@kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 2/2] clk: at91: sama7d65: Add missing clk_hw to parent_data
Date: Thu, 6 Feb 2025 11:14:43 -0700
Message-ID: <a64f5fd10b1af61dbf01d2f2839af532e25547c4.1738864727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738864727.git.Ryan.Wanner@microchip.com>
References: <cover.1738864727.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

The main_xtal clk_hw struct is not passed into parent_data.hw causing an
issue with main_osc parent. Passing the main_xtal struct into the
parent_data struct will ensure the correct parent structure.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f27..08306261c9c7e 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_data.name = main_xtal_name;
 	parent_data.fw_name = main_xtal_name;
+	parent_data.hw = main_xtal_hw;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
 						 &parent_data, bypass);
 	if (IS_ERR(main_osc_hw))
-- 
2.43.0

