Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D423770B;
	Wed, 16 Apr 2025 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797267; cv=none; b=Ew0qiLiuv111ec8GEokWie6pwCAdh87yRJTZOhi89IAAB76Buy1eMHFXQA92knmpCJM6xk9Tg2wNJWQm4hVtfDZLBNV6BUr1C3M5RL4AH/7HHBIbzp+Xgc5sTdGK0pjO26OJQDiwmdCFLOG9mp38IRlxDj7XBbbzQBOuD6Ajscg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797267; c=relaxed/simple;
	bh=u7PWWpWnN+JCQGAkrXpy7x5BE2/HL8HUyp74PolVQSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owA2h/7S151RYKQwOtEi0oPZ00aReVk8ohiI0gjx68QbwXUy/SfBSjxDr12+lZJMbf7kB2aPtHd3sAAyJXVMRLKNKQMnHmTYuR+L+SSkkSeZtD3EyzMVF7m9Q/fSfCgEUL/V8bD1jl/z8zDPYh+Xox+jvKAqezdfy5XhgPkpaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=OmBywSVI; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="OmBywSVI"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 95BC4400C5;
	Wed, 16 Apr 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRgDtNzjWlmBlKxgWUbFr0kAVAlRPqY5m6T9fKKPW3o=;
	b=OmBywSVI08bANUw30P1zxMuoqkXaEnsNmPoatNF3mjYe+OHVuSlvjVvEFVVG+kRmERsSlv
	p6Oa/bP5uNHAHOkAf/Iun0bGPINkyREaAZ8S6K56BcjLAiSuERJgC8piHNpqwlGqJloq/Z
	q5hZISy2B077ed8J7iPq7TF16YB3xak=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 8DB6D3600F2;
	Wed, 16 Apr 2025 09:54:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
Date: Wed, 16 Apr 2025 11:53:53 +0200
Message-ID: <20250416095402.90543-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b70a6ed7-f168-47b1-8fc9-816fd0c482a2

From: Frank Wunderlich <frank-w@public-files.de>

Add new compatible for Bananapi R4 with 2.5G phy.
Base board is compatible with existing BPI-R4 only 1 SFP is replaced
by RJ45 port and use mt7988 internal phy.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- new patch adding compatible for 2.5g variant
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..3aed03df0e3c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -104,6 +104,10 @@ properties:
           - enum:
               - bananapi,bpi-r4
           - const: mediatek,mt7988a
+      - items:
+          - const: bananapi,bpi-r4-2g5
+          - const: bananapi,bpi-r4
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.43.0

