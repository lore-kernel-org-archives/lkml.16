Received: from mail-m19731107.qiye.163.com (mail-m19731107.qiye.163.com [220.197.31.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCD22B582
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752783; cv=none; b=jI3Om1bHHO10832mO2kvUJ2RwxfEsY+RYB80DFwt9Xg+BQeeo9bMej680KjcDLbcxbLnMjbw0XPqtdmi75kF6O3Y5ZjvbYe8Wlw6QO7LgJQE9PN2UhHLVJk7EfnN+HxrpobmFWw7pRlMZW4caYgkJdVb46lugavmS5OLFpZmawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752783; c=relaxed/simple;
	bh=xzMYKRIrmJrGhaWjfxw3Y/3PpqrQP69M16M/10uTILM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RDu9ceXxiFJs3d2sVWqx2KUcH1ruJw0YLOpgyMO0ojMag8IcxX9lGMCr4bIxMKoELGtZ97hH7jA/C81XXtLnN/1TroOJZDlbHk3dkAAyeqyJB0GvjsFECZcyc8w+5d5yUGsIKhKRG+bbBGuALQx+A72BpgIAJcGZr7MF9jPhXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=A3TYAGzc; arc=none smtp.client-ip=220.197.31.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="A3TYAGzc"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a3bebbb7;
	Wed, 5 Feb 2025 18:52:55 +0800 (GMT+08:00)
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
Subject: [PATCH v7 2/4] phy: phy-rockchip-samsung-hdptx: Supplement some register names with their full version
Date: Wed,  5 Feb 2025 18:51:55 +0800
Message-Id: <20250205105157.580060-3-damon.ding@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU8eH1YdSRhDGEIdSEseTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d5bdd49e03a3kunma3bebbb7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6Njo6TTIRTwoNA00tGU1K
	SUIKChhVSlVKTEhDTE5JTExNT0pKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSU5KNwY+
DKIM-Signature:a=rsa-sha256;
	b=A3TYAGzc26JSkaKi22fJKpUQxOI9vj25o7m6BmV/wPrtGEsofdWqczCwTGdZrCYPIl2mvFx6LXrjwI4pXQqa+Y8sAm/jlqeeB9JltYIcZKwCCpZcu9AOryfL9hsl53O79RgMgbp4q9++rBgTWSlUY4ufM0SpbFXbIFqRMfn1NDk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tywO7xGB2da8iEsHnvmYHdfB6wpe6ItXRYSerKfpSzc=;
	h=date:mime-version:subject:message-id:from;

Complete the register names of CMN_REG(0081) and CMN_REG(0087) to their
full version, and it can help to better match the datasheet.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index efbea5b67c89..423c61b7469f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -82,14 +82,14 @@
 #define ROPLL_SSC_EN			BIT(0)
 /* CMN_REG(0081) */
 #define OVRD_PLL_CD_CLK_EN		BIT(8)
-#define PLL_CD_HSCLK_EAST_EN		BIT(0)
+#define ANA_PLL_CD_HSCLK_EAST_EN	BIT(0)
 /* CMN_REG(0086) */
 #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
 #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
 #define PLL_PCG_CLK_EN			BIT(0)
 /* CMN_REG(0087) */
-#define PLL_FRL_MODE_EN			BIT(3)
-#define PLL_TX_HS_CLK_EN		BIT(2)
+#define ANA_PLL_FRL_MODE_EN		BIT(3)
+#define ANA_PLL_TX_HS_CLK_EN		BIT(2)
 /* CMN_REG(0089) */
 #define LCPLL_ALONE_MODE		BIT(1)
 /* CMN_REG(0097) */
-- 
2.34.1

