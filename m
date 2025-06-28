Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739902222C4;
	Sat, 28 Jun 2025 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094911; cv=none; b=D2xTQuqLDLPtszEiYyt57Fin9jkxWDAO8KbykdzKMtR0dvGGsaOqpCv9CRc3IcqfZ8YQUikJeHbIlybSm2ahl9Rn8/NwHrfXKiO//YQR55Ghl1n2Z+w5bt77UE0egwe8WiM1QJjV7WddDdYrhiaxaim6q2Jj+qWsl+JDPC+o408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094911; c=relaxed/simple;
	bh=dO8TyEeQketmXDO9wMJaVHN74Nx/WX7837+8Dn/518I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeCGqjYXcfyfR9nN/YZZCtiPZ5csHNMSgn/CJulQjS6Yj1/zxjz9jV5odcF/mTFAdQRI1BJaFEKlxjTq+JNavl4zYOd8A+PK7WSpCRE4v54cpyFk5Q1qgQuA9bw6djoExlSxIIkf7CT/IoPdLr5/MyWxGzeRwVPUBI3T0eRtAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a6jhdcQV; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a6jhdcQV"
X-UUID: 9c52c02a53ef11f0b33aeb1e7f16c2b6-20250628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PBAECyRU9rZHpz4l0ZgTE0/stNWQm9UrWF2YPYi2omA=;
	b=a6jhdcQVw5jlajBJIpRvdtfAhC+y4lFh3i6wcxwquEywiLjgKX+kEe/pkneQdPVAIm9rOsGpuEPGPq/JZgYe00z26bu+yvGa83WzD7OJUk3wqJ5CZzzd/BJHx5vpksQK/L8bVN0yrW6npUhxXIFlRBL4pksDDlyVZdPHV60ILXs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:6dc8411a-0a38-4636-9738-7614279d0675,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:9eb4ff7,CLOUDID:740ba714-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9c52c02a53ef11f0b33aeb1e7f16c2b6-20250628
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 339936038; Sat, 28 Jun 2025 15:15:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 28 Jun 2025 15:15:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 28 Jun 2025 15:15:01 +0800
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
Subject: [PATCH 08/10] ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
Date: Sat, 28 Jun 2025 15:14:16 +0800
Message-ID: <20250628071442.31155-9-Cyril.Chao@mediatek.com>
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

Add mt8189 audio afe document.

Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../sound/mediatek,mt8189-afe-pcm.yaml        | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
new file mode 100644
index 000000000..f0bfc3bcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8189-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8189
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+  - Cyril Chao <cyril.chao@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8189-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  mediatek,apmixedsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: To set up the apll12 tuner
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: mux for audio intbus
+      - description: mux for audio engen1
+      - description: mux for audio engen2
+      - description: mux for audio h
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll1 divide4
+      - description: audio apll2 divide4
+      - description: audio apll12 divide for i2sin0
+      - description: audio apll12 divide for i2sin1
+      - description: audio apll12 divide for fmi2s
+      - description: audio apll12 divide for tdmout mck
+      - description: audio apll12 divide for tdmout bck
+      - description: mux for audio apll1
+      - description: mux for audio apll2
+      - description: mux for i2sin0 mck
+      - description: mux for i2sin1 mck
+      - description: mux for fmi2s mck
+      - description: mux for tdmout mck
+      - description: 26m clock
+      - description: audio slv clock
+      - description: audio mst clock
+      - description: audio intbus clock
+
+  clock-names:
+    items:
+      - const: top_aud_intbus
+      - const: top_aud_eng1
+      - const: top_aud_eng2
+      - const: top_aud_h
+      - const: apll1
+      - const: apll2
+      - const: apll1_d4
+      - const: apll2_d4
+      - const: apll12_div_i2sin0
+      - const: apll12_div_i2sin1
+      - const: apll12_div_fmi2s
+      - const: apll12_div_tdmout_m
+      - const: apll12_div_tdmout_b
+      - const: top_apll1
+      - const: top_apll2
+      - const: top_i2sin0
+      - const: top_i2sin1
+      - const: top_fmi2s
+      - const: top_dptx
+      - const: clk26m
+      - const: aud_slv_ck_peri
+      - const: aud_mst_ck_peri
+      - const: aud_intbus_ck_peri
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - memory-region
+  - mediatek,apmixedsys
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe@11050000 {
+            compatible = "mediatek,mt8189-afe-pcm";
+            reg = <0 0x11050000 0 0x10000>;
+            interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH 0>;
+            memory-region = <&afe_dma_mem_reserved>;
+            mediatek,apmixedsys = <&apmixedsys_clk>;
+            power-domains = <&scpsys 1>; //MT8189_POWER_DOMAIN_AUDIO
+            clocks = <&topckgen_clk 23>, //CLK_TOP_AUD_INTBUS_SEL
+                     <&topckgen_clk 39>, //CLK_TOP_AUD_ENGEN1_SEL
+                     <&topckgen_clk 40>, //CLK_TOP_AUD_ENGEN2_SEL
+                     <&topckgen_clk 49>, //CLK_TOP_AUDIO_H_SEL
+                     <&topckgen_clk 146>, //CLK_TOP_APLL1
+                     <&topckgen_clk 151>, //CLK_TOP_APLL2
+                     <&topckgen_clk 148>, //CLK_TOP_APLL1_D4
+                     <&topckgen_clk 153>, //CLK_TOP_APLL2_D4
+                     <&topckgen_clk 93>, //CLK_TOP_APLL12_CK_DIV_I2SIN0
+                     <&topckgen_clk 94>, //CLK_TOP_APLL12_CK_DIV_I2SIN1
+                     <&topckgen_clk 97>, //CLK_TOP_APLL12_CK_DIV_FMI2S
+                     <&topckgen_clk 98>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_M
+                     <&topckgen_clk 99>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_B
+                     <&topckgen_clk 44>, //CLK_TOP_AUD_1_SEL
+                     <&topckgen_clk 45>, //CLK_TOP_AUD_2_SEL
+                     <&topckgen_clk 78>, //CLK_TOP_APLL_I2SIN0_MCK_SEL
+                     <&topckgen_clk 79>, //CLK_TOP_APLL_I2SIN1_MCK_SEL
+                     <&topckgen_clk 90>, //CLK_TOP_APLL_FMI2S_MCK_SEL
+                     <&topckgen_clk 91>, //CLK_TOP_APLL_TDMOUT_MCK_SEL
+                     <&topckgen_clk 191>, //CLK_TOP_TCK_26M_MX9
+                     <&pericfg_ao_clk 77>, //CLK_PERAO_AUDIO0
+                     <&pericfg_ao_clk 78>, //CLK_PERAO_AUDIO1
+                     <&pericfg_ao_clk 79>; //CLK_PERAO_AUDIO2
+            clock-names = "top_aud_intbus",
+                          "top_aud_eng1",
+                          "top_aud_eng2",
+                          "top_aud_h",
+                          "apll1",
+                          "apll2",
+                          "apll1_d4",
+                          "apll2_d4",
+                          "apll12_div_i2sin0",
+                          "apll12_div_i2sin1",
+                          "apll12_div_fmi2s",
+                          "apll12_div_tdmout_m",
+                          "apll12_div_tdmout_b",
+                          "top_apll1",
+                          "top_apll2",
+                          "top_i2sin0",
+                          "top_i2sin1",
+                          "top_fmi2s",
+                          "top_dptx",
+                          "clk26m",
+                          "aud_slv_ck_peri",
+                          "aud_mst_ck_peri",
+                          "aud_intbus_ck_peri";
+        };
+    };
+
+...
-- 
2.46.0

