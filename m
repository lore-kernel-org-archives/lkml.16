Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3912264C0;
	Sat, 28 Jun 2025 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094917; cv=none; b=ZaSI/XsH6uMAHdWplzqJ0VPrFFB1hRWTDyE6UCytuVeYhZ38phDbcN3q7B5wZ8XQ8D4VyhvOLGl+xqpOcBrasB74Dxb0Hd4sX7IWcP8u+Z45/pZKfF9/ZT43bZZ3gQzIkp9rByhdj9vjw8Awca341S+D4JVcG1r63YtUHehEPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094917; c=relaxed/simple;
	bh=VpvLMmbfGxEDemtW6i1q+vF+MgNLFtoxSVr0cX91Mxo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYkGXgsjnDrJ2cG9GvioolleVDqMFHYvnxMjl3pe9sdIVmVuUwZpXfaazSfh3+NySkNckrj8yuitZGR20Ygr74TKSFASHw2oj2InGZmTG8Ke9MAIGIssftNsE+hYUP+64hCEJJZEzqkZKD4obJW2oHOoQ0zh+1t6byxAWb/hB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lRv14ZMR; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lRv14ZMR"
X-UUID: a11f8ac053ef11f0b33aeb1e7f16c2b6-20250628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4HIU85Yy2e+CYw02jinJZswzu1zwtkrsURZ+1818GHw=;
	b=lRv14ZMRnd141LLvIqbXwC4SHh1+gWq+bfcN/RII+2qLPz997Z5atxP4iCkbzCFPmAeK622MCBQhB6IdSLR8YvO30jxeEej4o13zQ0WvwBNV9U5i21Yg14zn5k0DAoDK3AXDk7jgvR+5SD3OE9itEfX46ROcO+8swxWOR1tQONw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:2653ab0b-852f-4859-a661-5c1a0a5718f7,IP:0,UR
	L:25,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:63
X-CID-META: VersionHash:9eb4ff7,CLOUDID:950ba714-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:3|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a11f8ac053ef11f0b33aeb1e7f16c2b6-20250628
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 320294885; Sat, 28 Jun 2025 15:15:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 28 Jun 2025 15:15:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 28 Jun 2025 15:15:04 +0800
From: Cyril <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cyril.chao@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH 10/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825 document
Date: Sat, 28 Jun 2025 15:14:18 +0800
Message-ID: <20250628071442.31155-11-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
References: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Cyril Chao <Cyril.Chao@mediatek.com>

Add document for mt8189 board with nau8825.

Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../sound/mediatek,mt8189-nau8825.yaml        | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
new file mode 100644
index 000000000..331c537d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8189-nau8825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8189 ASoC sound card
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+  - Cyril Chao <cyril.chao@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8189-nau8825-sound
+      - mediatek,mt8189-rt5650-sound
+      - mediatek,mt8189-rt5682s-sound
+      - mediatek,mt8189-rt5682i-sound
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8189 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          enum:
+            - TDM_DPTX_BE
+            - I2SOUT0_BE
+            - I2SIN0_BE
+            - I2SOUT1_BE
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        enum:
+          - cpu
+          - codec
+
+    additionalProperties: false
+
+    required:
+      - link-name
+
+required:
+  - compatible
+  - mediatek,platform
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8189-nau8825-sound";
+        model = "mt8189_rt9123_8825";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+        dai-link-0 {
+            link-name = "I2SOUT1_BE";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&nau8825>;
+            };
+        };
+    };
+
+...
-- 
2.46.0

