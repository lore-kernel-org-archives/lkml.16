Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BA4A18;
	Sun, 13 Apr 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535235; cv=none; b=bUelXnw9FIPben7O9rvvNgEhYDn+WTCfLwH+MlSdpjpPELsBsHnXytCFO4dKmPCkqwPtoQA6RcF4YBdBvoGvvRfaddQmIH0IKjjqgpsqQ+N5Rfw+I/3O97KAFbOvt5RPX8mywnXUM8c9Q9vEXJiQHrJwdReCjkuyNEcp3jPf44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535235; c=relaxed/simple;
	bh=F74LX8pwmJpUJ1WcbB/uKtET0VL3fvaTNZy443SfgXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol2I1n5avJY9p4Knfe1H7hBsuEHIsVvdF2TyvIACq4rCli+OF2JhloEspfkQM5QoA7VUPUC7T8FQJLovNf1abVxTq3sFk5rN5b2NKrT5QGDV83UPuLmgHGJuA/ZjxgCN2xKZVS8VCzrkr8Q4ClOrhQuNr5ChX/T+FABqX3GiCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=nGFaGpEZ; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="nGFaGpEZ"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id CC4AD3FDF4;
	Sun, 13 Apr 2025 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKUZ1+4YVFc7xv72f1Tv2gQXBQdFJKtnqIffuvfuqJg=;
	b=nGFaGpEZr5p5AvddB7kdYZ+4ZXePpkmtqF3yJ0SJ2t5Rc+yB6CFVV+ZOGxyl0SRDRvdai/
	mW/NNHGhXvIO76jk112wzjXh35RLhve+Y+TCU8kC+n0q8J4kY2jbc3RXOjH4KvQUh8qsmT
	I/87eKRiBMIQzgSG5KhcJtn5TBWDCCo=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id EB87140089;
	Sun, 13 Apr 2025 08:58:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 1/5] dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
Date: Sun, 13 Apr 2025 10:58:01 +0200
Message-ID: <20250413085806.8544-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413085806.8544-1-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ce383be7-dddc-4262-94ec-9650b3b27f4f

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for xs-phy on mt7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index a9e3139fd421..3b5253659e6f 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - mediatek,mt3611-xsphy
           - mediatek,mt3612-xsphy
+          - mediatek,mt7988-xsphy
       - const: mediatek,xsphy
 
   reg:
-- 
2.43.0

