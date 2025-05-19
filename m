Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077B199931;
	Mon, 19 May 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671419; cv=none; b=Dq0xubB1WfWBknUIzd0OGIOqPpKf1NiMIQAbdyGo/vvsb9HjeethW379Rxp39SA3BKf7nd7f8GEnB90PUQ3d9q9Y/IyaKpN+alw7DQN1f5YInhF7s9Jld1xdEOjG2xYTFJjccssQ65/1vWFLIct8DVrKU1p/qvIVfeYgk+RwDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671419; c=relaxed/simple;
	bh=lT/2TVU79Eq0CtQzKDd0Ae/XoBUehu0Gy8Vm3nVIo4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMa4kUzy4q57f8Qgdd8udb4eRMmDwFeUl70uMEbd2R4HFxiKamHWzXVz+LSGhEIDs32bUl2edS6m08ShYdU4izBGCCKnD4hryP7uwN4k45qMZSeXG6E9Tlvg7cLpGuPuJWgVBUiKmBMZXgCc3hCkoFZoq2qmrVjhsF9ay2Vu5JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ArDpzlqn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ArDpzlqn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E7F3226167;
	Mon, 19 May 2025 18:16:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM8I0yIIg5E6; Mon, 19 May 2025 18:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671413; bh=lT/2TVU79Eq0CtQzKDd0Ae/XoBUehu0Gy8Vm3nVIo4w=;
	h=From:To:Cc:Subject:Date;
	b=ArDpzlqnsQr3udpIrq3IgfFL8zr1jS4TucuEi1lqmYWQ93uZ2FxnXvJ58CzOsplEK
	 IkOANXb8F/1/OqcujleRAeNmcayow9Ji3iZNwkjIeWBEFNb6jNi+RvI6pOD/2DhILI
	 wqZZsT3hwrqXgu3ao/JAtYz3+t9LtzluRB9l84TaALwiUDC0qserFQRikFrh9ezpXl
	 5sz9Bh0BjzK8tn3fzLYF7537xDBLyIk6QOgfRCYompeGeLrW6dJbM7sMO9iCKll4VC
	 24yyT69FoI42xLmEHT3Kv1YxWbfUorP4/ju2bg+iH0cYIc03tVGSTtmPgMG9XvEi5a
	 SvRqwgW3fhTxQ==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Support RK3528 variant of Rockchip naneng-combphy
Date: Mon, 19 May 2025 16:16:06 +0000
Message-ID: <20250519161612.14261-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 ships a naneng-combphy that operates in either PCIe or
USB 3.0 mode. It has a similar control logic to previous generations of
naneng-combphy but an apparently different register layout.

This series prepares phy-rockchip-naneng-combphy.c for variants with a
different register layout and add RK3528 support.

Testing is done on both Radxa E20C and Radxa Rock 2A with downstream
devicetree changes, both USB 3 and PCIe modes are verified with mainline
driver and achives a reasonable link speed.

- Changed from v2
  - phy binding patch
    - Fix format issue
    - drop review tags
- Link to v2: https://lore.kernel.org/all/20250509004121.36058-2-ziyao@disroot.org/
- Changed from v1
  - Collect review tags
  - Restyle RK3528 register definitions in the combphy driver
  - Drop unused include of phy.h in SoC devicetree
  - Link to v1: https://lore.kernel.org/all/20250508134332.14668-2-ziyao@disroot.org/

Yao Zi (5):
  dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
  dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
  phy: rockchip: naneng-combphy: Add SoC prefix to register definitions
  phy: rockchip: naneng-combphy: Add RK3528 support
  arm64: dts: rockchip: Add naneng-combphy for RK3528

 .../phy/phy-rockchip-naneng-combphy.yaml      |   5 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  22 +
 .../rockchip/phy-rockchip-naneng-combphy.c    | 746 +++++++++++-------
 4 files changed, 500 insertions(+), 274 deletions(-)

-- 
2.49.0

