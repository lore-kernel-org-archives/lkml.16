Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEBB17C77;
	Fri,  9 May 2025 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751359; cv=none; b=Fd4NqwX9YZRRg7Mq/QvZ6N/e1D7fZYqbNB7qX4VtJVT9qxCp68GxTZwLLq3n30x+KfQC3tihwr5g/ikKcOsV2hTPQr70jUgaYrXOcqlMnrxH4R7QbyAZDJeH8xS1oV2Sf1kTM6oxFMkk3mUD+XZl95GR8F7LkZoB6sYgiRBIshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751359; c=relaxed/simple;
	bh=5F0Ebypa56dkdq3mFfmHvCOR5W4vuwc/3YFGnZ8IL5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwEaq6aUJboFjlnkNs7MYpL7+TDJlMgOqkF/5y3RhNsBxAt8U75ZIA+eCODuH6+KC35EyiOJzShzNuLnGSO6z8Tb9SznDDUaxSnsTqL4V3w3/MiEjQIkAQ/fPKVf9l7P8coTa5jxFPT9uSg/MPoHdz4doMQX6rqr1IpUa1D84b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jjyc89RX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jjyc89RX"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 19AE12594D;
	Fri,  9 May 2025 02:42:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AY5mId9J0Whh; Fri,  9 May 2025 02:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746751355; bh=5F0Ebypa56dkdq3mFfmHvCOR5W4vuwc/3YFGnZ8IL5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jjyc89RXOeTWRB0jsoaTS6cfMTSfCBdbU0kicXZBpnc37RyDOGmH8CqGsYrZ1lFsp
	 hGh2HyiPEtGt98DmRJX0DYEx6pNbICSPnYh7YTwjxQde3nlviarjCuDUuRpRfV2Z1M
	 soWc/kKfu2pfaH3U6vc++VmNdI/QVB5OG+XRN2pQtv5itGufk8UJ0iKpHYYSfmA80g
	 +rRYBSi4giEJsd45AEwEYz5SAz9p4PGDZCzmFnb+JdxL3h+06uF0lY17lUq3zTQfa3
	 MC5/dPAR3fYOnRe+d3JuykNoImMK6NU7TIl848iz9w4TvOKJDxOFXP59hAnAMJTJ0N
	 SJn2Uwlr0LyoQ==
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
Date: Fri,  9 May 2025 00:41:19 +0000
Message-ID: <20250509004121.36058-4-ziyao@disroot.org>
In-Reply-To: <20250509004121.36058-2-ziyao@disroot.org>
References: <20250509004121.36058-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
or USB 3 mode. Document its compatible string.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..bd064754e537 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3528-naneng-combphy
       - rockchip,rk3562-naneng-combphy
       - rockchip,rk3568-naneng-combphy
       - rockchip,rk3576-naneng-combphy
@@ -102,7 +103,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-naneng-combphy
+            enum:
+             - rockchip,rk3528-naneng-combphy
+             - rockchip,rk3588-naneng-combphy
     then:
       properties:
         resets:
-- 
2.49.0

