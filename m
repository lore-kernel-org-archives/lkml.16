Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09811EA91;
	Tue, 27 May 2025 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347297; cv=none; b=FEE3+wBaLL4iiJInvXXVP2+noaXbhqPgY6QEz9oxZZlcgmokOkTgHA0qMTWIIhAB8r58UOgMujoHFLA4w3s5UAwguyPAnagzYIQzV0WzBuFd0g0dGAXItVZe7MxigTtL7lXV4e1B/cW2f1/zRnc0LtDsnASE5ClceP5ZQBXMW7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347297; c=relaxed/simple;
	bh=SLIbpdBPLAqb/54sjGm0rka8fMCLwCtOyD5tlCd6OnY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y6SV53xROVn+iaQt/+6gjTo/aRr2hKX7W4WubDpSYdqUKK3SzI2ON4E4cYVPeDaiY86kVFca/4x8AGIuCSI6y1WUBmjYldYcyP/+KzJLrv7rAz1DOM7RLiDqiqpEb7GplJHltd84YWNtVkVW1ATzMq5YS5SsK1fh7igopBgdYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 169309524;
	Tue, 27 May 2025 20:01:25 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v5 0/4] Add USB2.0 PHY and USB3.0 PHY support for SpacemiT
 K1
Date: Tue, 27 May 2025 20:01:14 +0800
Message-Id: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqpNWgC/23OzU7DMAwH8FepcsZVPk27E+8x7ZCkLo3Q2pG0g
 Wnqu5N1SICo5Mvfsn/2jSWKgRI7VDcWKYcUprEE81QxP9jxlSB0JTPJpeFaPIPT8CZgSU7BZbh
 CltA7QVo0uuW6ZWXvEqkPn5t5PD1ypPel0POjyZxNBH46n8N8qDLWwkD0gt2Hh5DmKV63f7Lcp
 r9PNzunS3Fw2BKXnW00uZePYZlr6pbaj5uX1Y9hdt/PqhjE0RgUygpU/w39y5C4Z+i74S1i03u
 BVv411nX9AsNrsIppAQAA
X-Change-ID: 20250417-b4-k1-usb3-phy-v2-fb1e41849049
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748347285; l=2936;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=SLIbpdBPLAqb/54sjGm0rka8fMCLwCtOyD5tlCd6OnY=;
 b=erMhzmXgAgrdDShcZphQGvZ0V3vXC8JPL39vXOUUO/u7Es5nkVCQfiD50M6pSSMHSHqMlccLu
 0UHKtwXozOcC0inSKJvH6IaLVLSxh0VvABY8zEHmZS5T7M4FhCayyPg
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE0eVk1OSRkfGh5IHhgfTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a97119e6f2b03a1kunm8e523759adeeb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogw6PTo6KjExHFYvUT0NPzYz
	E1ZPCVZVSlVKTE9DSE9MSUJKQ0JIVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPTUhDNwY+

This patch series introduces support for the USB2.0 PHY and PCIe/USB3.0
Combo PHY on the SpacemiT K1 SoC. The implementation has been tested on the
Milk-V Jupiter and BananaPi-f3.

K1 includes three USB ports as follows[1]:
- A USB2.0 OTG Port
- A USB2.0 Host Only Port
- A USB3.0 Port with a USB2.0 DRD interface

USB3.0 PHY for USB3.0 Port is shared with PCIe port A, meaning that only one of
these interfaces (PCIe or USB3.0) can be active at a given time.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v5:
- phy driver for usb2:
  - convert readl/writel to regmap
  - fix typo: sentinal -> sentinel
- Link to v4: https://lore.kernel.org/r/20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn

Changes in v4:
- combphy driver:
  - add in-code comments to indicate that PCIe mode is not yet supported.
  - replace custom spacemit_reg_update() with standard regmap API.
  - drop spacemit_combphy_wait_ready helper function as only used once.
  - Fix PHY init timeout handling: ensure proper error reporting when PLL
    lock fails during USB3 PHY initialization
- Link to v3: https://lore.kernel.org/r/20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn

Changes in v3:
- improve commit message, provide more info about phy hardware
- drop superfluous local variable in `spacemit_combphy_wait_ready`
- replace devm_reset_control_get with devm_reset_control_get_exclusive
- Link to v2: https://lore.kernel.org/r/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn

Changes in v2:
- combphy dt-bindings:
  - fix reg-names
  - describe reg
  - describe #phy-cells argument
- drop stale ".owner" in driver struct
- add support for usb lfps_thres in combphy
- fix Kconfig depends on
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (4):
      dt-bindings: phy: spacemit: add K1 USB2 PHY
      dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo PHY
      phy: spacemit: support K1 USB2.0 PHY controller
      phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY

 .../bindings/phy/spacemit,k1-combphy.yaml          |  72 ++++++
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 ++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/spacemit/Kconfig                       |  21 ++
 drivers/phy/spacemit/Makefile                      |   3 +
 drivers/phy/spacemit/phy-k1-combphy.c              | 266 +++++++++++++++++++++
 drivers/phy/spacemit/phy-k1-usb2.c                 | 144 +++++++++++
 8 files changed, 548 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250417-b4-k1-usb3-phy-v2-fb1e41849049

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

