Received: from mail-m32106.qiye.163.com (mail-m32106.qiye.163.com [220.197.32.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D622E3EC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753084; cv=none; b=K0yewoja6OFgQLKhmHl3/v7r2Eehl+0+iBUrzH9vhgPj8lfbVmXMKMPPJhtbhsaLq1HYwrnd5r1HfjdFJc0AI9jMTO3JAQRim2HttniOpW82+lEqIRrtnUnAlSfv3YJIExArQsmRMMKDSbbLfkzAwokUIUFrb5ndgwLTm41Oa1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753084; c=relaxed/simple;
	bh=uYVX31WQvKbJf5Vv9FAqP25Z+20t/h4HS7NDrI4cczE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QqgqKksxix+9sTvLEsfc8g25EHxGe2KOPx9Qv7ACZcaAOr1YBpvKr8+Xf/Si7JNVYq5N0tsmQqmsIAYtEBXruKuqCS93/D5kHqUe0Yu/kFkq8bPFH9VesleTOfwUdJCJMHAxvzeAH3zX3zQ3N9uXT0rtj1Jy76c99AAkJmiESjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UIDU7maV; arc=none smtp.client-ip=220.197.32.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UIDU7maV"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a3bebbab;
	Wed, 5 Feb 2025 18:52:51 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de
Cc: dmitry.baryshkov@linaro.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 1/4] phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and ROPLL_REF
Date: Wed,  5 Feb 2025 18:51:54 +0800
Message-Id: <20250205105157.580060-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205105157.580060-1-damon.ding@rock-chips.com>
References: <20250205105157.580060-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh8eH1YZHU5MQx9KSE5DH0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d5bdc52c03a3kunma3bebbab
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogw6STo4EDISAgoZKUwRGUIR
	CC8wCQJVSlVKTEhDTE5JTExJT0hLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCQkw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=UIDU7maVigBPE8Z3/TzUN8rZm0SILBPcOVatowgldNVpXtAVY27e88ogbhwu/QwJSthGAV7NNuv2uVGbA5v5jv63W/2eT+f/yjoS9dYy9bT8l/NYdgiBXb5XM6Cegsfr2UQ6277QwqFb+pp64AHvGePrVv/fXxkhMnpbkFlRacI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=nhjzsZ5DuSkGPzq8vUSDqW2fpa7f+NUoENjEMTPrzW0=;
	h=date:mime-version:subject:message-id:from;

According to the datasheet, setting the dig_clk_sel bit of CMN_REG(0097)
to 1'b1 selects LCPLL as the reference clock, while setting it to 1'b0
selects the ROPLL.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 0965b9d4f9cf..efbea5b67c89 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -94,8 +94,8 @@
 #define LCPLL_ALONE_MODE		BIT(1)
 /* CMN_REG(0097) */
 #define DIG_CLK_SEL			BIT(1)
-#define ROPLL_REF			BIT(1)
-#define LCPLL_REF			0
+#define LCPLL_REF			BIT(1)
+#define ROPLL_REF			0
 /* CMN_REG(0099) */
 #define CMN_ROPLL_ALONE_MODE		BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
-- 
2.34.1

