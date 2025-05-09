Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com [220.197.31.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8638FA3;
	Fri,  9 May 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787629; cv=none; b=guZrGe1GmzuIQcFHasi14MmOJ0N7pzYLSinydXoL3uXL8tRwneC7qU4RNeSh2yLGeQH1dnvABMdt8yC4S9NU28YJ5Mdjhpc2x1SCRtPrLWnBmDEfNmEmwnArh2ya5qnL7CioOJ07N4ps/kQkqemEK8plTJdHTdhimZtrI4P58mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787629; c=relaxed/simple;
	bh=LcmBMXyNMZgbYzLO+VnNAkcoxEr0vxi/qOLZq58bBpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l47RMhfx/6ekHuk/dyRNVEVaLtgyH2SvD2ZYDJV23uhyWYat7Nt6R/fqvH+XFhq/rIUBKuwesBatxdW61F2bXhWVrxHZw92RMkqKlGeyqXbnhyrwEV1Vv+7mx326E/DSauXLKeO2qLdHYcfndlllDN6J168AvWwaoQ6DB2nrrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IkWzPTke; arc=none smtp.client-ip=220.197.31.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IkWzPTke"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147bfe059;
	Fri, 9 May 2025 15:17:46 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 0/5] rockchip: Add rk3562 SoC and evb support
Date: Fri,  9 May 2025 15:17:39 +0800
Message-Id: <20250509071744.732412-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE1DVh9KHRpDGEsZS0tPSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96b3e847a003afkunm147bfe059
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxg6PTo*DzJCDQIQFykyTE0N
	TSwaChdVSlVKTE9NTExOS01CSExLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhCSE03Bg++
DKIM-Signature:a=rsa-sha256;
	b=IkWzPTkebX6Fze2/KqozB8z4QjcDSONOtF2h0go0X03o+lfmkbToC0XS7Jlnpwn6jOSOwFbdtKYlDDjE+DPXyBgL3E03Qa5K3XwWyCoPSLYgLWauKfLe/N/lpj86d24PGVWSdnd21Cz/fyLcUPHq7zGocvITXpUO15q/9vIbD08=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=VPSGPkK5ZMCFmDxL0qp9plqTEWD8XrvlwesQZtajotc=;
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


Changes in v6:
- Remove USB and watchdog nodes

Changes in v5:
- Update scmi-shmem from soc to reserved memory

Changes in v4:
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
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  455 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1187 +++++++++
 7 files changed, 4009 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1

