Received: from mail-m15589.qiye.163.com (mail-m15589.qiye.163.com [101.71.155.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987952F88
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565211; cv=none; b=bW6Eb/U6n5xcjEJ8hI+xom/1T/W4pN9ouiRztunHyjGf3sOqTwEnRWPzox4f8qAFvppN35Ox69FwxlEgqsiVxUoJtjA2B2+stSLMdObD67zMeTbMf+wX//zSrC/nthjPC9ZmGVy+ttNks2Qgci3Z1+oKE73OmMKpS49CmGgja74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565211; c=relaxed/simple;
	bh=LFPokmpR/Ewf1rymDE5+F6Z0gE3r6mnvAuxxLdpVf7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cofZbRZzQ/rg6WMTYUc0nY1VuWoWO5QuxzM0YPo7CrdQMwha4FxbAbL7V2ZPL8oLZtWwTOF2mIHVbQxomLle5CEIa0vIXY1Bcyp8hO+zi82oQJ+oUrcJjvjJ2rTdGB3PyxDyUk+52pc3nuHcB/qlcOlaFLm3r9cONWKDFyyFQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZxTdw2oQ; arc=none smtp.client-ip=101.71.155.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZxTdw2oQ"
Received: from crj-HP.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13112a5bc;
	Fri, 25 Apr 2025 10:37:23 +0800 (GMT+08:00)
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
Subject: [PATCH] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error
Date: Fri, 25 Apr 2025 10:37:20 +0800
Message-ID: <20250425023720.3296069-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhCHlYaSR4ZSU9CTRkeS0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJMTU
	xVSktLVUtZBg++
X-HM-Tid: 0a966ace8e4b09dakunm13112a5bc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pz46Ogw5GDJPNzg6DQIOIU8O
	Hg4wCUJVSlVKTE9OTk9DTU9OS0pLVTMWGhIXVRoXHB4aVRgaFDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlLQ0w3Bg++
DKIM-Signature:a=rsa-sha256;
	b=ZxTdw2oQjErLaB1LCUnnvx8Jv0MePVT41slrasjLOGTRSxGTerajB/sjbSw4aSAVC7zICXzLYwfwAubMuGKcQymGqBh0XQj1hszkBbLK+snKHsV3VoDWF5eBfYK2cBHhnmgZOd748GaKMTzGMOFdi3rt1MEsbGO9/PTxl6Upt3c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wzcaSWol41pI08NDxtqKY2YqU38iBEqEtGi1EuR4uKI=;
	h=date:mime-version:subject:message-id:from;

When using HDMI PLL frequency division coefficient at 50.25MHz
that calculated by rk_hdptx_phy_clk_pll_calc(), it is failed to
get PHY LANE lock. Although the calculated values are within the
allowable range of PHY PLL configuration.

So we manually calculated PHY PLL frequency division coefficient
at 50.25Mhz and added it to ropll_tmds_cfg. Manually calculated
value  can make PHY LANE lock normally and output 50.25MHz normally.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
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

