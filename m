Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8A1F03E0;
	Tue,  1 Apr 2025 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501940; cv=none; b=fcF2GRPA1lkXWlx1VS0XyD8enuigP4npkgQFeZuCeg7Kr+J6+67hfdSLKrrR/AzJf2JUMWpNCayWbzfxz6//0VXfeocV7Z3/xtolJGvqSwVAVHqHSEYbV0DGsGKwGStJCPZyKuq/uyEUtyh+HnqTN2ciWSpQlOXxstx2HubuacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501940; c=relaxed/simple;
	bh=PtcGNtn7tm00DKNPAGREcUoOVl9b/U54L2SsdfxEG4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TmlO19l2QXA64AjKdIMryvJZ1w5QXWQtNLYs1tYUaQbb6Cjxeexag5wIBqxvoZBqZ+FosyNb9q+ztoG/QSm1h9IklcJUbs1hTDBROs9VQX7PuEcCrHTss0pfpfbXvg6adorXxpjCOSJLSsygRcB1gM9HUVbzeRZBa3Cq66rJfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10501cafb;
	Tue, 1 Apr 2025 18:00:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add DMA controller for RK3528
Date: Tue,  1 Apr 2025 18:00:17 +0800
Message-Id: <20250401100020.944658-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU1KVh9NQxgeGhkeQ0weTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f0cb8c4e03a2kunm10501cafb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Aio6CTJMDwo9FSwcFEJL
	IywKCT5VSlVKTE9ITktKTUlMSU5MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSk5MTjcG

First commit adds missing uart3 interrupt for uart3 node.
The next commit adds the DMA controller that can be used
for spi and uart. And add DMA description for uart nodes.

~# dmesg | grep dma
[    0.103466] dma-pl330 ffd60000.dma-controller: Loaded driver for PL330 DMAC-241330
[    0.104212] dma-pl330 ffd60000.dma-controller:       DBUFF-128x8bytes Num_Chans-8 Num_Peri-32 Num_Events-16

Changes in v2:
  Adjust props order
  Collect Reviewed-by

Chukun Pan (3):
  arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
  arm64: dts: rockchip: Add DMA controller for RK3528
  arm64: dts: rockchip: Add UART DMA support for RK3528

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.25.1

