Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE5288C2B;
	Mon, 19 May 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671432; cv=none; b=uObleabqxNNrRCNlE7QlVxQwnlwiBTn3Sfmq7qxf7xcbQ7Ybz9AyjPbNAh0v60r1phpZu70ZkujYKHoX3vPjIX3SjLOggqo/ekyTDQzdMgN2vfkHriv3lE2iZbB5MHbRlUyd2QE7omWkdfV0zKtv5TOAtsHqGLgpJdnVUTLr23k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671432; c=relaxed/simple;
	bh=qix+OvYYBGYJs/RdxED7CyEKdjy+sVGm+qlAvrdCj9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpCiXeSS+C/xg9YU9QSa4LDn0kE0cp+pkB8VcIhmC2UvgVYd3smF4AoEbFGdOLP4jvH8nrEg5FmleacpGv/PecCcIGtc5JG3bx+1Q4zMtfD2hepgrjZ1O/sBGn56kBv2kfdHCdBMUqxsCOyPjbCjzbCJ+qJBKNin9HQyGMkUZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=L/AQeyLY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="L/AQeyLY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2A38525DD1;
	Mon, 19 May 2025 18:17:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQj-dnGyjT1V; Mon, 19 May 2025 18:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671428; bh=qix+OvYYBGYJs/RdxED7CyEKdjy+sVGm+qlAvrdCj9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L/AQeyLYCkkrWa7u/SJbNROUccMT7dUmBlJ3vi97jgMgoz2r934Brf0ee6cxTcuol
	 d3lcZVG0am3Q8hiVVJkhJMyawxX90pyyLoncAstVu8qxFqnfmLRKvXyDnaVMhqEEza
	 3pief1R4xM/aZhP6qbv0hPZgX1fQ+U0N0WSCK7SzCpexZzK2bK/HVUUO3JRbXSab4C
	 2V1KtEwVvx83YX/iCzs9fSotCsXrsiyLg0qQJkcgmX8vUoAPlg0+JgLxib8FMuTAj3
	 0kWU59YRoAhGTC7ZGzr+FAp7PHIAiI3J7lWaMHboBbmjIcy7/K37KS4XBZLQvQVrG8
	 PnfivGNA8Iz+w==
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
Subject: [PATCH v3 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
Date: Mon, 19 May 2025 16:16:08 +0000
Message-ID: <20250519161612.14261-3-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
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
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..969d7b1850d6 100644
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
+              - rockchip,rk3528-naneng-combphy
+              - rockchip,rk3588-naneng-combphy
     then:
       properties:
         resets:
-- 
2.49.0

