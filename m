Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7AC38DE1;
	Fri,  9 May 2025 00:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751354; cv=none; b=UZQj7J4A5qZi1Z39tl/AE2mulCE8/laBp5PGJi1U8FQh+eyx6jAxF79cy2HkX+X+k/R2UR3uBrp6fvW2uU5c+SpSx1Aj+zV27/SlJp/M0w8UstCqGi0TtXu7wn/ll7jx3nzQoNdCvmN5wha6avydl9mkPZ0ic5yOWznaul19+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751354; c=relaxed/simple;
	bh=R+IC1SCvxx356jqj5bqy53vEVEdZC6a8kUA28zCXPGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPkOosdNbEGNfEGdAxTEOm9tKpJrcftcOzyzEuG8sTUq1k1xx+9IEkGyUzgkqEy1X3ggYkVuBh8y0d03zGIv5oKR20BKlZ6QK6YsMK2dl9TgB4zuYsWEvI4rF6zVrAG5MOzSSkkz1PJ7BEHUwgw5fe12MsA4rllkHuNQ2rZMF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HFn+2qo+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HFn+2qo+"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6FA0A234ED;
	Fri,  9 May 2025 02:42:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK8D_ypDRo6u; Fri,  9 May 2025 02:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746751349; bh=R+IC1SCvxx356jqj5bqy53vEVEdZC6a8kUA28zCXPGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HFn+2qo+yH+H+mZfogdOhoocRulrzyRxQw0Ut55j9oNYtGxtT5NpHjSGPwkqUytlB
	 /fCh3x8M/nEoyxxVp5P16mSEF6fmvoEmJ/RPk5UMmWP9oLqWbQByiw8WRdseRIe8lQ
	 mkkLZz+Gd4u+tgT/o2xuHGtVLOvv32V46JgdlkhPxUfvknEEAiMQTerZ58xqjjjG3n
	 GvnEuiQEq05j0Vk2IhxrV7GCV1fYkKgSEbAhJVeCmHMDkcYDQ1gWTBInUl3zQTyumF
	 PbIoMvmCPdchByM07wpl+uUq9S3LUaHVZbFPYCQJKYB0uPr+VwPE/zKVnfbBNJjc4k
	 SNf04Oz/rcnLA==
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
Subject: [PATCH v2 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Fri,  9 May 2025 00:41:18 +0000
Message-ID: <20250509004121.36058-3-ziyao@disroot.org>
In-Reply-To: <20250509004121.36058-2-ziyao@disroot.org>
References: <20250509004121.36058-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for pipe-phy GRF found on RK3528 SoC, which
controls misc settings for the integrated naneng-combphy.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..7e9321999435 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - rockchip,rk3288-sgrf
               - rockchip,rk3528-ioc-grf
+              - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
               - rockchip,rk3566-pipe-grf
-- 
2.49.0

