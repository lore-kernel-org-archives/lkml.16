Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBD2EF2A7;
	Tue, 24 Jun 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777727; cv=none; b=FMQEFx7qQkFNg9pyEGsSFF4W3AqIPE9Th0GpNJfAMFtDGrxZAIHcvUvP0lu9x9jQgO/YMdDLqZkAvXw02pUUSa6gzD4i+IcUCLMPIdbzkjUko6qFCZlLfm+p4MJiMMPZEI4GHdokfrUsSEMhz5WbrBSn+24imUXVt4E17pJRBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777727; c=relaxed/simple;
	bh=9aK4jdZmF1ToqNiZetoB/6dP7GUhww2O/JrrrKTukA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDseSk3WDGUXgCyYPWxWEuuaWqp49y9y/u7RdKBdwYGr7j2TjnVzj0cZAXcImAiuNfaJPWcexnJWoJKsH/2M5CCOHrCrWGRUbpFuGP7pvn+Wx1XV1qOAFNtk5NbjhUxEmSROJcWl/vixsSTJLDBMdBRfsm+LbZFs7gHjxqOAR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=12fYov7U; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="12fYov7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777726; x=1782313726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9aK4jdZmF1ToqNiZetoB/6dP7GUhww2O/JrrrKTukA8=;
  b=12fYov7UljcZsOG60zJDOXfrcShAf+jLD0a7DnBgjkdtCV6PVeaRyPkE
   TV9/wd6Vc0oOhIzLuuWZU1t1kWkbjVFVr+VIJgOLCezpwBEIV+Mlzk5EG
   mUaU87SHCctUIQQc5Tzxb9D3boNGovpapCKsSnMGON0IhcAAE7hwym8Bz
   SNYsLP0+iCFgV3Bw+HOa8uSoJRvmJ1dbqUOCR6z95gqhqXOjnowzf9qdv
   gE7whJ4DDcu/wDIlUz6LC04PRSPDA5y+Afr0CM6ZMUgH1x4zRBQxbG4Wt
   2jrPN0VxmILKljoR+eLeTpM6O7wkBG7L/Xp1wn0og/gaeVvwfGIiNF03K
   w==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: IpZZg6yqQlO1SSuE50+wlA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688171"
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
	<varshini.rajendran@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 02/32] clk: at91: pmc: Move macro to header file
Date: Tue, 24 Jun 2025 08:07:59 -0700
Message-ID: <6776f06473d3be71882ef938a4314947f565e26f.1750182562.git.Ryan.Wanner@microchip.com>
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Move this macro to the header file as it is used by more than one driver
file.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h      | 3 +++
 drivers/clk/at91/sama7d65.c | 3 ---
 drivers/clk/at91/sama7g5.c  | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0b721a65b77f..63d4c425bed5 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -21,6 +21,9 @@
 
 #define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })
 
+/* Used to create an array entry identifying a PLL by its components. */
+#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..b74813a288a8 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -428,9 +428,6 @@ static struct sama7d65_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[0..9]) description
  * @n:			clock name
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 8385badc1c70..bf6092fea217 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -341,9 +341,6 @@ static struct sama7g5_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[1..4]) description
  * @n:			clock name
-- 
2.43.0

