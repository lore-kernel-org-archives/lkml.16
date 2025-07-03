Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB029B8DD;
	Thu,  3 Jul 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529411; cv=none; b=TDqUIdnEQeR6MpRaGVJ+SVL9h+tzU3XK+4Ht50X9e2tq34A/dWAxVDH+mDjIfdkP1DEJUyRNod+0bgFuwGkMWF43kVcpWNz+xDvMkDT//6XrWnI+qIDXmEU6MmFaK8pZy42+Y8g2KrIg6av9Q66jmSMBA4av+oh0/WQWdewxay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529411; c=relaxed/simple;
	bh=4ivabyd5o/Dos17DfqeOFP53mUd3SNrGWjnzc59bipU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNRDJH3ZAcmWVRDET0t9h2lqsl+H36Z8k8ckGY0W95WZAeeK4FWefmyojDZpJgMKl8X1qaGUj0htMPBiQvDIAzLGPCnrRTUzgEQKc0UzYMRhPFk3TOmKlXuMai9jeZhLfxS5x6jxLJTT9GrblF6sWtfZHcXpJLfkhGT9DQlFNBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kvzSC+1l; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kvzSC+1l"
X-UUID: 42f751ec57e311f0b33aeb1e7f16c2b6-20250703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WIxxg2tWRKs+PEyIXsPMMsfp/Rpds/hN3CHriCriw4Y=;
	b=kvzSC+1lWZBpxOgBQ5vhgO+CZoAzV9LejzuY3jCkoAzM8NhQXmlSMBDm90wYpTTPFEqG9QNQL88fVwKV3b8D2llOczacr//6Tbcl1Q4GnIcCUTIxp1E7mLUW/WiWptTkPKlPx6G4HcB2PGfFtkDxjOEM5pKh+QU0bp0dHsyOshI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:0705d7ff-0787-4d01-98b2-503e045ca630,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d4977882-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 42f751ec57e311f0b33aeb1e7f16c2b6-20250703
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 163513193; Thu, 03 Jul 2025 15:56:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Jul 2025 15:56:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Jul 2025 15:56:39 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<hailong.fan@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp document
Date: Thu, 3 Jul 2025 15:56:23 +0800
Message-ID: <20250703075632.20758-2-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250703075632.20758-1-hailong.fan@mediatek.com>
References: <20250703075632.20758-1-hailong.fan@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Hailong Fan <hailong.fan@mediatek.com>

This patch adds mt8196 dsp document. The dsp is used for Sound Open
Firmware driver node. It includes registers,  clocks, memory regions,
and mailbox for dsp.

Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
---
 .../bindings/sound/mediatek,mt8196-dsp.yaml   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
new file mode 100644
index 000000000000..68f594f476e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek mt8196 DSP core
+
+maintainers:
+  - Hailong Fan <hailong.fan@mediatek.com>
+
+description: The MediaTek mt8196 SoC mt8196 contain a DSP core used for advanced
+  pre- and post- audio processing.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-dsp
+
+  reg:
+    items:
+      - description: DSP configuration registers
+      - description: DSP SRAM
+      - description: DSP secure registers
+      - description: DSP bus registers
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram
+      - const: sec
+      - const: bus
+
+  clocks:
+    items:
+      - description: mux for dsp clock
+      - description: 26M clock
+      - description: ADSP PLL clock
+
+  clock-names:
+    items:
+      - const: adsp_sel
+      - const: clk26m
+      - const: adsppll
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    items:
+      - description: mailbox for receiving audio DSP requests.
+      - description: mailbox for transmitting requests to audio DSP.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  memory-region:
+    items:
+      - description: dma buffer between host and DSP.
+      - description: DSP system memory.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/power/mt8196-power.h>
+    adsp@1a000000 {
+        compatible = "mediatek,mt8196-dsp";
+        reg = <0x1a000000 0x5000>,
+              <0x1a210000 0x80000>,
+              <0x1a345000 0x300>,
+              <0x1a00f000 0x1000>;
+        reg-names = "cfg", "sram", "sec", "bus";
+        clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
+                 <&cksys_clk CLK_CK_TCK_26M_MX9>,
+                 <&cksys_clk CLK_CK_ADSPPLL>;
+        clock-names = "adsp_sel",
+                      "clk26m",
+                      "adsppll";
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
+        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+        mbox-names = "rx", "tx";
+    };
-- 
2.45.2

