Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0DE19A298
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746156923; cv=none; b=uTInn98iNOmsXGX0morspoLBF/dtybDfBI4iCbpRPoEgA6zcBaKFrYkK3Ly4i3u0hq/8Cy0CFJRbm/1YRpQX44e+mPDK0+Tjp9q+XLuE0t8UHv+tfy+rIdTPiNjHuS8M+KCVNWpgAIFbkgOFhXTkvSoIaZaKoYXAhbCXuMtAPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746156923; c=relaxed/simple;
	bh=3pqxnDd0wiWjKQ8tgXkTad2HoxDq5oBkl1gCQk0eiA0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwE/u9n6WzBPEb2qWER/lDfVuSDzBkFwtCTqTUQAcUbXZz51TzgD2MoeCW4zOVHnaHEmuE9j3haP6UWm9R9BTucXQLVqMfVieUu++DNP9FIIb7phWZpPY9JdeHM9C+WC6olYb5YhxFxC8seQ/mZuN+IHxZRQkE5bF0RlZ+6xx8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VXToTxlb; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VXToTxlb"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5423Yt6O321202
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 22:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746156895;
	bh=cEgO4eAPfutv/3K+LNFMnA8RlsrtrLzPkE7YS2j0A3I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VXToTxlbZO3RwHHQQHoWZ3QhDkynaJ5pVciRQiwR2suit5ii/vGiuUb2Nk6ab15Yz
	 jje0XRgSj+P6Baw4SaUY0YmpDw3VhCGK8/JoltPlwyZ4eYI1lhh3H/cmLpdaXWSOcq
	 cmsR45j9dCzbXlnViHWNka9jUQucXpEA4sfN+VFI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5423YtC1024701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 22:34:55 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 22:34:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 22:34:55 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5423YshE061455;
	Thu, 1 May 2025 22:34:54 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <tomi.valkeinen@ideasonboard.com>,
        <devarsht@ti.com>
Subject: [PATCH v3 2/2] phy: cadence: cdns-dphy: Update calibration wait time for startup state machine
Date: Fri, 2 May 2025 09:04:51 +0530
Message-ID: <20250502033451.2291330-3-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250502033451.2291330-1-devarsht@ti.com>
References: <20250502033451.2291330-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Do read-modify-write so that we re-use the characterized reset value as
specified in TRM [1] to program calibration wait time which defines number
of cycles to wait for after startup state machine is in bandgap enable
state.

This fixes PLL lock timeout error faced while using RPi DSI Panel on TI's
AM62L and J721E SoC [2].

[1] AM62P TRM (Section ): https://www.ti.com/lit/pdf/spruj83

[2]: Link:
https://gist.github.com/devarsht/89e4830e886774fcd50aa6e29cce3a79

Cc: stable@vger.kernel.org
Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V3: Do read-modify-write to preserve reset value for calibration wait time
V2: Introduced this as as separate patch

 drivers/phy/cadence/cdns-dphy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index a94109a63788..2e28c56c4bdd 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -30,6 +30,7 @@
 
 #define DPHY_CMN_SSM			DPHY_PMA_CMN(0x20)
 #define DPHY_CMN_SSM_EN			BIT(0)
+#define DPHY_CMN_SSM_CAL_WAIT_TIME	GENMASK(8, 1)
 #define DPHY_CMN_TX_MODE_EN		BIT(9)
 
 #define DPHY_CMN_PWM			DPHY_PMA_CMN(0x40)
@@ -421,7 +422,8 @@ static int cdns_dphy_power_on(struct phy *phy)
 	writel(reg, dphy->regs + DPHY_BAND_CFG);
 
 	/* Start TX state machine. */
-	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
+	reg = readl(dphy->regs + DPHY_CMN_SSM);
+	writel((reg & DPHY_CMN_SSM_CAL_WAIT_TIME) | DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
 	       dphy->regs + DPHY_CMN_SSM);
 
 	ret = cdns_dphy_wait_for_pll_lock(dphy);
-- 
2.39.1

