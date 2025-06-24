Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04B1C5D46;
	Tue, 24 Jun 2025 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736284; cv=none; b=T++wg9+GG9vfRMd6V4olDPyypK1nAf4EHfa6LRbAB+xvN427rrBnbPPFOrxYsRJ9fR5bFwJQmD+s/mWX4CBRoKKOobgYlwSrANygJwH+Nw8DYk+ivNG9ouS52BgQD8V/u37nO7KFRxYQ8syDBfsTLzCULVdTvc0GtWdABfH4geU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736284; c=relaxed/simple;
	bh=d+V7TBTT7wJrr7gsE8yUz9MFL39onShxcUURX4hS+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqGx9Rvrcar6LYsgzgWccU7is0JnbpX00yhZHzaD9IvSAz57PQJEW5xCighkPoJdQsRgkVhMcq9vlVw1BYn+iooHahcoBZRP9bLI1cQeeO3eZrw1bmiraiAB5sPheep2uvtnRBSSL9eiNN1lreGHwVgyr35YZCTDPU0aAsmUrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=edNjQeyB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="edNjQeyB"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6075D25A48;
	Tue, 24 Jun 2025 05:38:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtQydR2Gl-zu; Tue, 24 Jun 2025 05:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736280; bh=d+V7TBTT7wJrr7gsE8yUz9MFL39onShxcUURX4hS+s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=edNjQeyBjh/kZEAZkXTpAcuLponkhnf2jL0XQBXfbBH0pYTGCVlHIHOYb+xnoHuys
	 DQSs/7cQYdJqePqr6OeBth0iyLSn1VStEtLHwzC5F8LSI0lld8lRr4I7A3MXWjJtXV
	 yjCXAlzyD0VoLa16BLEn9eTvMwMidvkDASJy5X5SvtUALctDrAN8nC24PRxtrRMuFy
	 TWgNld4PzHh/fRVI020Ksmy+DfJHS9awMwSOZjvm2YmNbAW59HiEVpAU+qY6SDQhdn
	 CQQtIXQuoDb04TepS9zDemUMafiZ9+5F/24QrD7qP49TVISvILQ+TOs4tr+XdB/wyx
	 y8aZD7KkSqTdQ==
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
Subject: [PATCH v4 2/6] dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
Date: Tue, 24 Jun 2025 03:37:29 +0000
Message-ID: <20250624033733.50197-3-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Though isn't described in existing devicetrees, most Rockchip combphys
belong to a specific power-domain of the SoC. Taking RK3588 as example,
combphy 0 and combphy 2 belong to the PD_BUS domain. Document the
power-domains property to allow describing the information correctly
in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 3e101c3c5ea9..db293d2fbf1a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -45,6 +45,9 @@ properties:
   phy-supply:
     description: Single PHY regulator
 
+  power-domains:
+    maxItems: 1
+
   rockchip,enable-ssc:
     type: boolean
     description:
-- 
2.49.0

