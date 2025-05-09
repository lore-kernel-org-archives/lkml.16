Received: from mail-m32122.qiye.163.com (mail-m32122.qiye.163.com [220.197.32.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586F22AE68;
	Fri,  9 May 2025 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790732; cv=none; b=oCS+BHdcM7xEEODVhPtDUFZ0yH3mMQGIPyE9dMuK4GcEKFQxwVr7U5gGcEeER9oVZlTr7j6qac3XXPX0nQkGGj7UxWIaGPqbx46NttnuYYvh/54qTYZx8IOoXPAxFI60JRCDIZ67k+Jb+l+BczLPhap3jKzi3vqN5/2C2qcrVQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790732; c=relaxed/simple;
	bh=DJR3eFCyzjUjZ3oWHHgp8vQrcBC3ctmP33bMKnnn/Gw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uSIRoePi0J/mc+fh3Pd/qbg+0KlnyDeu+JCdDdD2i3ROOEIPBQK1+BJAukYs3nGXNP6FLLOZzJrOCBEUjWLRi48p5nEXG2ZKn563QYYUyKzqe2y9B5FwbwNzJv4HDOK1MPmAfvlQi7GJ5LQeqjKIZT9rRscnPv8tXCEjQRV2EsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WWJjVbXv; arc=none smtp.client-ip=220.197.32.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WWJjVbXv"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1483147cb;
	Fri, 9 May 2025 18:23:11 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Rob Herring <robh@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 0/5] rockchip: Add rk3562 SoC and evb support
Date: Fri,  9 May 2025 18:23:03 +0800
Message-Id: <20250509102308.761424-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0weTVYZQxoeTxlNTkkeHRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96b492097d03afkunm1483147cb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6NBw4CDICQgEuFUkPMCIY
	TUswCz9VSlVKTE9NTENNSkJITEpJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPS0lONwY+
DKIM-Signature:a=rsa-sha256;
	b=WWJjVbXvavx4WZJgAvQ5PpWXYuytRa7c0y0UK+ZLln61JYfXa0iW95dVokF9XBlciZ93nmGVICTykpOzRkm2WxXSYTf9C3GccZEzr/E0rvsgito3By9+4vVkR/QV9zdWRQeZ/vtuW7Egj713TTewUg0yDHj6TRU9pvxcm2SQXsY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hNsCUG7hJCtfNGZx6jKpw5OFKEQ5Blj2M3hqO1EINGw=;
	h=date:mime-version:subject:message-id:from;


Patch series v6 remove USB and watchdog nodes, for relate patches not
land recently although they have got review tag. Let's make the main dts
get land first and then add relate dts node back when the driver patches
get land.

Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
scmi-shmem from soc node to reserved memory.

Patch series V4 remove patches already landed, and remove dts nodes for
modules still under review.

This patch set adds rk3562 SoC and its evb support.

I have split out patches need driver change for different subsystem.
And all the modules with dt-binding document update in this patch set
do not need any driver change. I put them together to make it clear we
have a new SoC and board to use the new compatible. Please pick up the
patch for your subsystem, or please let me know if the patch has to
send separate.

Test with USB, PCIe, EMMC, SD Card.

V3:
https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
V2:
https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/


Changes in v7:
- update regulator names, and re-order some properties in dts node.

Changes in v6:
- Remove USB and watchdog nodes
- Remove USB relate nodes

Changes in v5:
- Update scmi-shmem from soc to reserved memory

Changes in v4:
- Collect ack tag
- Collect ack tag
- remove gmac and otp nodes
- remove gmac nodes

Changes in v3:
- Collect the Acked-by tag
- remove i2c/serial/spi alias
- add soc node

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (3):
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  456 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1187 +++++++++
 7 files changed, 4010 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1

