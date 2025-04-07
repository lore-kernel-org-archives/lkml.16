Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF1423AE64;
	Mon,  7 Apr 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029587; cv=none; b=C7qy4qS6qtLS5oSsDg3Y/nS8LKQ/wX85CGnT5yPkm7+LF4/4ckKfGmUEmUa+tJIyTndhgN+Ofu0ru2OmeWqkmcehZKwW9b6XX8bUc9W6Fq8jZxlSY9WVEf+TxY9dxtzZtLaC1zPLAHhAroZ278SNeoqHQAlN+sAk6sq2Shw1eHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029587; c=relaxed/simple;
	bh=guydDGrxtfiF0QxuG+IbBP1EBPIlelU7O0fNN/qWZUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JuffQdnJOzfpv1k5sPMgyfP/GC4UEQs6vQJIFIKF/1gc0NQQprb9itneTY2SEnTiMEPybQCQUiri15PN7JMybXK/x0nzrLQCe8XXUD9CL6SuEmqD1khb8T5CBHfCrVO+CFt9ZNf3HST4paBnBfVjnZZHDOmYz7moFpAd2siNV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10ef566e5;
	Mon, 7 Apr 2025 20:39:25 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH 0/7] Add USB3.0 PHY and host controller support for
 SpacemiT K1 SoC
Date: Mon, 07 Apr 2025 20:38:45 +0800
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbH82cC/3WOQW6DMBBFr4K87iB77MGAqoiseoaqysLAlFgJ0
 NgENYpy97pkneUb6f03dxE5eI6izu4i8Oqjn6cE6i0T3dFNA4PvEwuUSNJIC62Bk4JrbDWsGhB
 UUaJzpkKiSiTrJ/C3/90Wvw5PDny5puHleRStiwzdPI5+qbO1yBVB6NS/O3KMbkvW2ftW1LJQl
 izJHNGUMvWOfDvz5G6N6TGfw7B7IWKJSqLWuZLWSk2ggM89hyb42MXFhTy98EJGLJSiiix8fO4
 NkSybgadlnnfi8Hj8AT3ztXI0AQAA
X-Change-ID: 20250407-b4-k1-usb3-v3-2-1682aa492559
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huangze@whut.edu.cn>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=3284;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=guydDGrxtfiF0QxuG+IbBP1EBPIlelU7O0fNN/qWZUY=;
 b=Ghi1yoX13LsL5SLUgC8pQHW4O7dQb14bN9AeNv91Q+HWvOJWXFbLeEsB2kpBYQQlEISEzAiFr
 zTTHHmy28hhD9VK+mM5N7b4F11BN+cuWUUXYa2rT4UkbdGbiiSbzdB+
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR4dVh0fGBpNQkNOQkhMGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a961043447103a1kunm10ef566e5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6Aww5HzIMIUwtOBU3GjQt
	KBwwChJVSlVKTE9PS0lCTkxJQk9CVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU5KQ0M3Bg++

This patch series introduces support for the USB on the SpacemiT K1 SoC,
including DWC3 host controller, PCIe/USB3.0 combo PHY and the USB2.0 PHY.
The implementation has been tested on the Milk-V Jupiter and BananaPi-f3.

USB3.0 PHY for usb2 is shared with PCIe port A, meaning that only one of
these interfaces (PCIe or USB3.0) can be active at a given time.

Overview of USB controllers on K1 SoC[1]:

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]
---
Ze Huang (7):
      dt-bindings: phy: spacemit: add K1 USB2 PHY
      dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo PHY
      dt-bindings: usb: add SpacemiT K1 DWC3 glue
      phy: spacemit: support K1 USB2.0 PHY controller
      phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY
      usb: dwc3: add spacemit dwc3 glue layer driver
      riscv: dts: spacemit: add usb3.0 support for K1

 .../bindings/phy/spacemit,k1-combphy.yaml          |  53 +++++
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 ++++
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  |  78 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  55 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  52 +++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/spacemit/Kconfig                       |  20 ++
 drivers/phy/spacemit/Makefile                      |   3 +
 drivers/phy/spacemit/phy-k1-combphy.c              | 229 +++++++++++++++++++++
 drivers/phy/spacemit/phy-k1-usb2.c                 | 132 ++++++++++++
 drivers/usb/dwc3/Kconfig                           |   7 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-spacemit.c                   | 127 ++++++++++++
 14 files changed, 799 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250407-b4-k1-usb3-v3-2-1682aa492559
prerequisite-message-id: <20250306175750.22480-2-heylenay@4d2.org>
prerequisite-patch-id: e0f9037d659502b7f10588f15b80505724eb9e35
prerequisite-patch-id: 4414e37b16b1bc0039239f07da8c35935efb1601
prerequisite-patch-id: 1e65bc4c0c0d41baef743819c311ad53f6696094
prerequisite-patch-id: 43ef72522e30620f0244e0e22bd844884d89b0cd
prerequisite-patch-id: 73008ee7c04e90cd4e825a3f5bd2e44ec24d8ad3
prerequisite-message-id: <20250328210233.1077035-1-elder@riscstar.com>
prerequisite-patch-id: 9b026005eb6ee1430ab7ca67edfc21de85a19dd2
prerequisite-patch-id: 8ee238181e50c76d92458b149b72fa4909e0fede
prerequisite-patch-id: 66f3ee8eb1cc016112dace699bce292b617a3186
prerequisite-patch-id: c2deec49fc0308a08908fd9badadc10f921af348
prerequisite-patch-id: 99afc2efdffc0fffe47a31e7b07b72af9d1d2e18
prerequisite-patch-id: d06e8cd0fae4c405dbb56832a1fe48bfaa4e0fab
prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
prerequisite-message-id: <20250226115957-GYA45508@gentoo>
prerequisite-patch-id: 82dd2631d36c3fafb82768d3d89022ed956020c6
prerequisite-patch-id: 5cc63738ba2d463e1840a91a94357f43199bd68f
prerequisite-patch-id: f44247679d46a51c242703eca370ce0e3db2e61f
prerequisite-patch-id: 9d4cd8be42a37798815d0aaae21d3c022f815414

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

