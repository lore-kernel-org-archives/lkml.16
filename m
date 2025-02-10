Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68454264633;
	Mon, 10 Feb 2025 20:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220715; cv=none; b=ojsV5VP34Dg94JTySgJTJxx2DWY/x8tgHEse/tIQvWlgY+9bpo2WJzNxaYVHlMaLHI4wdCt4SuUQ1moRiT8yNqgEjOcAPxzJVZ8/TOC7T7+GcqKOtxVJZdVC4df+VQNOCmGL42b+cYnhBqsn0QqxDEbE4vwThkVkdWBw5/2YeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220715; c=relaxed/simple;
	bh=AEC/n6UMLTgxvYhra0Lu18sFgG+uUSn61lp9sXCW/40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlGalOAK0h7nwI5caZ+BB5V3Wm04vlf2m/j7dDX31UPmAapwzB6KHYcBV85mfneVsfI6bHjYarfAmtSfD79NV50vMNq/KBXQVYuz7ENVZIljPnK27KMyfk30FJ9Zar+01eLzQx8jOKlARLaKQlw3Sfsj5INqvl2rks5Bxc1oaXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xqaIEgok; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xqaIEgok"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xaDZZ3S+Vjprvw3VoZJyJ+LtDoigFQjXYIj4Wx2Yy4Y=; b=xqaIEgokoVRUiW1SZglA7fZNJd
	YHo+F/BTbdqXrteNgfOVhLwG5ZyZZ4uvy3F9flDomG1YFoMS+nXlsr5r3rdIb2xLtUr7zG3HXOHdr
	m28tKOzjDdsd1mqw89YK3nwVUJoc/9DA4RLp2/iM9ouYBfcg/Bms3FNoXpnDvFkidOjpPIs48Mv1h
	4TL+7uUUxaTbR2W7kd+c9EoEOKVyVMCR0urLn0+HMqpMvgY2/LAheqI8AHzwX41t9NZ60WWSSACjm
	p/U2C1eS/+NLSQbtB3zDlsFq4COEnSBXDhlWt2FktvtvB8EKqMkPWKh5Lj4ZPcHW9hP4nkawsVnxw
	oklbeRUQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thakm-0007Ka-1a; Mon, 10 Feb 2025 21:51:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
Date: Mon, 10 Feb 2025 21:51:25 +0100
Message-ID: <20250210205126.1173631-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210205126.1173631-1-heiko@sntech.de>
References: <20250210205126.1173631-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding for the ROC-RK3576-PC SBC.

The board is based on the RK3576 SoC (4*Cortex-A72 + 4*Cortex-A53).

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..0f4ca08d9ae9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -236,6 +236,11 @@ properties:
               - firefly,roc-rk3399-pc-plus
           - const: rockchip,rk3399
 
+      - description: Firefly ROC-RK3576-PC
+        items:
+          - const: firefly,roc-rk3576-pc
+          - const: rockchip,rk3576
+
       - description: Firefly Station M2
         items:
           - const: firefly,rk3566-roc-pc
-- 
2.47.2

