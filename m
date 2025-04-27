Received: from mail-m93197.xmail.ntesmail.com (mail-m93197.xmail.ntesmail.com [103.126.93.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899CD1A3145
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745748409; cv=none; b=fsfoPEY8zxKIZBn/6ICEmr5FrhRUHNKoCKYOUQeTw6OnuWAeXNogXlnkM4Ml1JiTbh0uJ38rG9VwII4TmwbwrYCr3fhgq0TJJ5ewCtjoH9nYPoI09DKMkwZAxAxwxsRkBBWawtyyRuDmrnu05cFUBN/6wVtOxCbqTJBQ7Hky+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745748409; c=relaxed/simple;
	bh=asQztV10Eu4C1KXhcgwNRdm6QTg2lik5SZm7MbwcNuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSrBpdCzW50SMja4iEgMDCANLsAADUeAj1Fs1n3cj9NgmTXDIP9IIhYCjVZkzdzu8Tr0SncH40k3exTWf1/BIVkg1PkoXiDYf9LQpMeuB5Kc2WiTKvO1SaY7MK9d7dqMMI83bGLJk2phjCFvYRkYPpbGF8QASRkPwP6npl65d0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KrV+/+4C; arc=none smtp.client-ip=103.126.93.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KrV+/+4C"
Received: from crj-HP.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13467afd3;
	Sun, 27 Apr 2025 17:51:26 +0800 (GMT+08:00)
From: Algea Cao <algea.cao@rock-chips.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de,
	cristian.ciocaltea@collabora.com,
	andy.yan@rock-chips.com
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Algea Cao <algea.cao@rock-chips.com>
Subject: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error
Date: Sun, 27 Apr 2025 17:51:24 +0800
Message-ID: <20250427095124.3354439-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhoeHlZCQkoeQh1OGExOHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9676a8a62a09dakunm13467afd3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohw6TAw5EDJKNzAjIiEXAg88
	IR4wFE5VSlVKTE9OTE9MT0NMSUNMVTMWGhIXVRoXHB4aVRgaFDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlJSEg3Bg++
DKIM-Signature:a=rsa-sha256;
	b=KrV+/+4CPUARt4u7JXOYH09ZtCg74JjPajJcsbOdnLlHIU6yfpJARmdeDu3KozYLYmuQKiI1t1YmH9sjIf+oQ9Ahi9Jkw9SngZpIOvbLyE4kPq3/jojUMZA82LpTUlQ854nhYhE73BThCJqbG1Am1I2zSLCezAdhfbqs5dkvyq0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SoYz/XFXV7qWYJpDDDScC20wyuaAqrciDeZizEc1w4E=;
	h=date:mime-version:subject:message-id:from;

When using HDMI PLL frequency division coefficient at 50.25MHz
that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
get PHY LANE lock. Although the calculated values are within the
allowable range of PHY PLL configuration.

In order to fix the PHY LANE lock error and provide the expected
50.25MHz output, manually compute the required PHY PLL frequency
division coefficient and add it to ropll_tmds_cfg configuration
table.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

---

Changes in v2:
- Modify some descriptions in commit message.
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index fe7c05748356..77236f012a1f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] = {
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
+	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
+	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
 	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
-- 
2.43.0

