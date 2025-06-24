Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362B18C937;
	Tue, 24 Jun 2025 03:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736336; cv=none; b=tMM/KMqwfPkQyU5+SUh0u8kOaRhBkphW6C0epfI0HoaVqSCR+KIEAC2kHnWwInMqDR2HoOCOBbuQmaE22k/0mMS1usU2VRnHchnOAYqiv3J4RIwhfCJun+vCPch6K46FVvM5Qejh6asZEQhJw/RS+0ogljSHhxoO9AHrbAd5D0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736336; c=relaxed/simple;
	bh=yODzzaf9Fz4zDNnq6RmSVB/x6hfsM2gZLYhXaaV9Fc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBNt9dVKm1uKPzvjIUZVrdNSkhgxqBppdpy+nBECrfTQ0PbT5jKH6DRuU2afqfTQUetl0N1IrWsd1irlxIdTP9+25gSHgoGMwLmEqYPIitsBxSzNN6c2uU5mLeG+6g7OdJRJdrWFTzUw/lzrtYuvo3t9uvOYudXt8TMYg42fvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Nfh7JAAD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Nfh7JAAD"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6DA7825E27;
	Tue, 24 Jun 2025 05:38:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFgsdalLs7_F; Tue, 24 Jun 2025 05:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736332; bh=yODzzaf9Fz4zDNnq6RmSVB/x6hfsM2gZLYhXaaV9Fc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nfh7JAADztLWQODlkPoldvQSDqPRmIYLBqWG0Gmj7CKFNAhLcztG/ZlgX/O//39or
	 oqOHrrJiy3R4LDUvhVExr5ke6E7LCVTGFVkVZs7JbFNYJeOwJgY0URA80F7i5Poab4
	 C9ETlWWVjFfwBLOkD5T+b4hHcIGkwGqTw5p7mPuroUhdQAvzctL5Azc/ZbK/AS6/AE
	 vU0jvLh9BjkZ45q68OArFjO2gGrzTNgPdkqSLdHPqfglW03IUgnTreQUxgTJN/23CN
	 0vValTcbSTuewKqC9x3ahxxn08vuNHQnY+ucldNdynsJh06gUtZe4liCnJAyGy73Sr
	 fqmhfRvYSAh6A==
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
Subject: [PATCH v4 3/6] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
Date: Tue, 24 Jun 2025 03:37:30 +0000
Message-ID: <20250624033733.50197-4-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
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
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index db293d2fbf1a..379b08bd9e97 100644
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
@@ -108,7 +109,9 @@ allOf:
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

