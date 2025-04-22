Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EDE284697;
	Tue, 22 Apr 2025 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328303; cv=none; b=FbdXgxcvmMinsb3l7easiTrp2et02XeK9XoteKCSW3wXoVPm6b1q7W/VLD+yQh50nrXVYcGwK9JmXLx/p94dbFKvoeFT0N8X37tAU5LOUUkRYaAopuB1aGBGAIl2CQ76XsTEvDhz/wXeer6fmbGe6utMxi/NkNLMd/2kuQJHXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328303; c=relaxed/simple;
	bh=yOgvjUarO7rmEGYIRDabwo99UOdI5BoGN3q/fBYd0P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYf7BEglzMuLBwtoLPVoPNCQqkImqa9zePpwHQa2jGqQGWUQeOI5wYuQMBBTIUlVbwTJzs+PGGCxOWiENwOBcZYVi7ynIATRe6fERFC8CWbAaRFzsm9ocmY+h2+B3dddzkN5lxVDTyGT3ihKyD44CeKsCCOUmN6DgQE2IJNSb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=t+33jZHA; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="t+33jZHA"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id BB7981005F7;
	Tue, 22 Apr 2025 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RcZIjIwx1s6Wcv16nJayJJUai7Sa7nACbdnFD1drq0=;
	b=t+33jZHAliVR9d3XvK+repuuoaox4NEdkjDkAw8/cmKob5ZBzZ6R2zsFgJDhq1ZKLaOUAf
	5HjfW0FrfQ9BqLBXEFKl2ZqIziRN/NuzCoBodkWoMYscXdN2k/tTP5NGMxGh2XaSCjlr0Y
	oVoZxw3DzF6R5Vu2Vg4L3/Rz/uNJD+c=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id D86A980318;
	Tue, 22 Apr 2025 13:24:52 +0000 (UTC)
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
Subject: [PATCH v4 4/8] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
Date: Tue, 22 Apr 2025 15:24:27 +0200
Message-ID: <20250422132438.15735-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e0e4b4d5-9fca-452c-b776-a545c7a43a4d

From: Frank Wunderlich <frank-w@public-files.de>

Add support for type switch by pericfg register between USB3/PCIe.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
- changes based on comments from Krzysztof
- change to phy type configuration controller/register
---
 .../devicetree/bindings/phy/mediatek,xsphy.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index 3b5253659e6f..0bed847bb4ad 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -151,6 +151,21 @@ patternProperties:
         minimum: 1
         maximum: 31
 
+      mediatek,syscon-type:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          A phandle to syscon used to access the register of type switch,
+          the field should always be 3 cells long.
+        items:
+          - items:
+              - description:
+                  Phandle to phy type configuration system controller
+              - description:
+                  Phy type configuration register offset
+              - description:
+                  Index of config segment
+                enum: [0, 1, 2, 3]
+
     required:
       - reg
       - clocks
-- 
2.43.0

