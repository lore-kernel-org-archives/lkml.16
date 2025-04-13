Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364418DB1E;
	Sun, 13 Apr 2025 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535285; cv=none; b=jNWdjYJjylRULunMHeFNlUTz9S5ToVf0Dd0F+6/GwFNA6r1xr2UAAvZyixoacjPAGIqF5CVwz90enS9UVRm+CTxJRiD3tecECmr7MYdf2s18aegbu7Hq/WcrpxVW9bbxKIAx598IpclvW4ynCsBie1nW9AeQ2TNfMCAWzcmkVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535285; c=relaxed/simple;
	bh=eSLMz35AjEzSf8TLTQG8UVrKNvYDGRG7qwmV+iw77AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXG0z5d9LzVBKns4ENkbyd1P+Zqh/dyiPipg0qExK4vL8AUAW2/9bekaluoW6U9dkBpGzhuZy18AIaVfDkUqIryLmcVhCZacAHZKMKfeJlFsyXZyXlIQ3hM2wRAxuD+l1EZOXZOM6MiYAzaeg5pV5Qyo/AAsC2Z5e+uwqhFpq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=g8PR66PE; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="g8PR66PE"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 9D2E11000DE;
	Sun, 13 Apr 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W28WfcAJpST8Dtovpq8Ep5E0UnnAP29jza5E8k0zwUc=;
	b=g8PR66PEcKXygMIAAD/6t9416lGPgK0YiQiT1lftZJct9EmT40dbwrcbJxVpa0O2wSvmYx
	rjtkJpbfqdLE2Qz+VbwWR6E34ycKsz4stgR3uWXnA3fTRgn4pjQFokikcQWx3QaxtAPUa1
	u6iefurH9/HxO56PMPeGvkyT/R8lcbE=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B7EE84006C;
	Sun, 13 Apr 2025 08:58:12 +0000 (UTC)
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
Subject: [RFC 2/5] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
Date: Sun, 13 Apr 2025 10:58:02 +0200
Message-ID: <20250413085806.8544-3-linux@fw-web.de>
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
X-Mail-ID: 79785311-ffeb-47ff-b83e-a442f86500dc

From: Frank Wunderlich <frank-w@public-files.de>

Add support for type switch by pericfg register between USB3, PCIe, ...

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

