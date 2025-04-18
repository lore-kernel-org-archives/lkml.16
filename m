Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7572C1A2;
	Fri, 18 Apr 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982462; cv=none; b=ugnECP7W9MsZoJ0/EMjxkwx36NMTYJQUUsVB8tkrV9+/nsTUEcK6oHAqFKyUEBWemF6Ef434REV3kQqSDEdkkgYwEMPMBeiFzZUBElyEesWlyVcgBfSMMxVbPFNb3Rj7+5r5USuTs/ify4WH+JsJrvX1sN5M2IvFlupqcM7RHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982462; c=relaxed/simple;
	bh=Hb/aiNAu0w7LHL/2ZZsWq3IRTJh3NmFxda3Izyu8pb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=miPqJxtmS9bJpX5u4eXKE3qIjcR0m4CB9lYmByNBkJvz1XZ4XWC7GvbxUALWbfE4oAOpX+KascrvdHxPuFhNK5er5PgDlPRFaSqV9fOn0mHQPsB9o1qbHr8T0M0m+ns9oUVYhIqMuU+XR63hMONF/+vRJOJJ4athoAp5/sEIZ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 125ec8780;
	Fri, 18 Apr 2025 21:20:42 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v2 0/4] Add USB2.0 PHY and USB3.0 PHY support for SpacemiT
 K1
Date: Fri, 18 Apr 2025 21:19:49 +0800
Message-Id: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVRAmgC/3WO3Y6CQAyFX4XM9ZbQscNfjPE9Nl4MUGWyAtoiW
 WJ8d0fd2738Tvqd07tRlsBq6uRuhJegYRoj2K/EtL0fTwyhi2xsZl1GWEBD8INw02YDl36FxcK
 xQSYsqcqoMtG7CB/D77vz+/Bh4estVs+f0DReGdppGMJcJ0ueogNp8eUOrOrfo3Wy/dvMceMoi
 1e5LQkQel7PPPp1T51NJznt/hMJKyzQpdbmVLgyqnzuWPYStNXZSxpf2JnD4/EETSN5IwYBAAA
 =
X-Change-ID: 20250417-b4-k1-usb3-phy-v2-fb1e41849049
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744982442; l=2916;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Hb/aiNAu0w7LHL/2ZZsWq3IRTJh3NmFxda3Izyu8pb0=;
 b=NXT0rPNES/7G050TaJYJZTD9dEqbLiK6Za+goYuUk3ogIETwWyzTrxTFQcuPXVSP9jUluMk1Y
 zStiKMijLIdD13FNm6XF1h7He1fOzVNo5MQGZbdgUJ/Tyd0nyYKb1Lc
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQklNVkhPGUkYGh8YHkIfS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a96490f023e03a1kunm125ec8780
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pjo6Cyo4TTJPOAkQERQQEQE9
	MzMwCghVSlVKTE9PQkNJT09MTk5DVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBT05OSTcG

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
 drivers/phy/spacemit/phy-k1-combphy.c              | 251 +++++++++++++++++++++
 drivers/phy/spacemit/phy-k1-usb2.c                 | 131 +++++++++++
 8 files changed, 520 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250417-b4-k1-usb3-phy-v2-fb1e41849049
prerequisite-message-id: <20250416135406.16284-1-heylenay@4d2.org>
prerequisite-patch-id: 19b7f061557b184b9565e10ccfc0aab5754dfa73
prerequisite-patch-id: a56183c8b71a141ca6f5d401b67a5456f40d4a9c
prerequisite-patch-id: a4a3c44d4c3e44f5209bff2b2bd0b49cd5a9eebe
prerequisite-patch-id: 471fe02daa5297e85e9cee8dfef873375a348e9f
prerequisite-patch-id: 717bc3d50f0924f7697312cb78280b15a029ce2c
prerequisite-patch-id: 585a2a9ce37a5e2a036f7351ff8ff4ed859bbe3e
prerequisite-message-id: <20250414191715.2264758-1-elder@riscstar.com>
prerequisite-patch-id: a7769b6451bfd80d5e5366013753c5fc870b2255
prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
prerequisite-patch-id: db30b8a180a5f04f499d851384d4a7f95ccb00b3
prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

