Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138423814F;
	Wed, 16 Apr 2025 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797270; cv=none; b=XMYUrbOVrSQtSYMBziJ8E/XDpM1sBwKLTj+PrcGTd02Eu966ms5fIx3tQmGt4+k1v3QGYsIRnegZPY2TmFZUTli/Gmv47WmWRD35xNXo2cYDurLJaYm/8QbkmvK5zbXsXDA9Y2jovxzGFgJR/AqmCe9eWSwK7xCjguRo1CH1usc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797270; c=relaxed/simple;
	bh=em2nW4ErSe6f1DWXJFh6zTOm6m54qnj8AM0omgkBVdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLBK63yBJcC8vruMNsqsL0ru2W+K5/RVzgQDghSrpr1SLy1NPqUV/y+pexc4h/opBDSjLigwlBJ99HZTcw1uQ8Ea/ZgO60xOYzdllAz2Za+TEzPZ2ZWmG5DeHspVUzPQZ37YfSymGspiAJArSpzbcAr+Df2f8eyldf4VUH++uuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=oxckEjGQ; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="oxckEjGQ"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 83C66100D7B;
	Wed, 16 Apr 2025 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk944o+t28fwTlX6o9Q4U3/0SH31rFieSB+B7TGU3R0=;
	b=oxckEjGQ55ln5RAA8KeA5PKqqQZXNmwZ0fLAbi7+fhNmAl47tcsVq+TCjXx2bDWlnIkIur
	uoZ5Tm4mlNx9OAn12bs7bxkgZo1veF3Uxw6O5fWS1jmCeqs8+O1HOfWHCdVhl/o+YH4qKx
	TwY4ZkGW1bc/CWKPqJsV6KQV9Bq/FLw=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4A675360528;
	Wed, 16 Apr 2025 09:54:19 +0000 (UTC)
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
Subject: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
Date: Wed, 16 Apr 2025 11:53:56 +0200
Message-ID: <20250416095402.90543-5-linux@fw-web.de>
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
X-Mail-ID: 5a7bdc89-6d2f-403a-9e25-48950e628308

From: Frank Wunderlich <frank-w@public-files.de>

Add support for type switch by pericfg register between USB3/PCIe.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/phy/mediatek,xsphy.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index 3b5253659e6f..5033d77c1239 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -151,6 +151,22 @@ patternProperties:
         minimum: 1
         maximum: 31
 
+      mediatek,syscon-type:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        maxItems: 1
+        description:
+          A phandle to syscon used to access the register of type switch,
+          the field should always be 3 cells long.
+        items:
+          items:
+            - description:
+                The first cell represents a phandle to syscon
+            - description:
+                The second cell represents the register offset
+            - description:
+                The third cell represents the index of config segment
+              enum: [0, 1, 2, 3]
+
     required:
       - reg
       - clocks
-- 
2.43.0

