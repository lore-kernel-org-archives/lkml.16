Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12DF12DD95;
	Thu, 22 May 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926287; cv=none; b=cWncB7xu4doJFdvpiBDvbL4HL67aiXtKo9T7Z8ezj4nQzGmUdEzLW2n6oDnFxLpy48T+gJZW6matbxARTugwhZX9wHwUv7wYAzk0XBTqFQrloGiCmNFE+0rCEPv1KWSq7DjgE9cgeLoZMKX3njldl71L/S3rBu12txNtqrBpXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926287; c=relaxed/simple;
	bh=LMtau+XdoITPB92eaK1PSJlsbfD6qUb1ujIvd9/k8AM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmPIMKJkOIt2WTTZZJNWlN5fUrRpEC3gnJgD09fHEyq3HiD35s0HC7CzeA9xfbsOFnjqs+KkqY1lmN18f2LRBcA80fhlbZ4lVgwZ6uEAstOe/ajRsud08ebmADqKeFlcrUZ4Im7M1XID9hDgaToteklliUYHc2kQbVwunfd2qQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ld9u9aJj; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ld9u9aJj"
X-UUID: 13bfa022371e11f0813e4fe1310efc19-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NARwVylGfizLd3XVx9Ze8dRNa153/I6PhonXyOONLqg=;
	b=ld9u9aJjMxI2CVXUVYm4mBW9+b3zVKs4kSnIJ0t6W14rHqyYikUuJ960eirnxE5SdXAGE5aLBT2dfBRLaxuIGLVMImeTCiWcgO90ru+NIZ91vuvQbQNFUfnjDiXbGUYVf9vyVhPFJ30vIpGu0HpcvhFbylDsnWWF5zktgInD3HU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f2a5528f-6965-4ae8-9df5-518e4133de7d,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:e1e09d47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 13bfa022371e11f0813e4fe1310efc19-20250522
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 751470213; Thu, 22 May 2025 23:04:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 23:04:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 23:04:34 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm controller
Date: Thu, 22 May 2025 23:03:33 +0800
Message-ID: <20250522150426.3418225-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250522150426.3418225-1-nancy.lin@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Nancy Lin <nancy.lin@mediatek.com>

Add a device tree binding document for the MediaTek MT8196 VMM (Vcore
for MultiMedia) regulator controller. The VMM controller acts as the
main power supplier for multimedia power domains, such as those used
by display, video encode and decode subsystems. It provides virtual
regulators that serve as the power sources for various multimedia IPs,
and coordinates with the hardware common clock framework (hwccf) and
the Video Companion Processor (VCP) to manage the power domains of
these components. The regulator is controlled by the VCP firmware,
and the operating system signals its requirement through a voting
hardware block (hwccf).

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
---
 .../mediatek,mt8196-vmm-regulator.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
new file mode 100644
index 000000000000..a50e35c2e238
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#"
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 VMM (Vcore for MultiMedia) Regulator Controller
+
+maintainers:
+  - Nancy Lin <nancy.lin@mediatek.com>
+
+description: |
+  The MediaTek MT8196 VMM (Vcore for Multi Media) controller acts as the
+  main power supplier for multimedia power domains, such as those used by
+  display, video encode and decode subsystems. The VMM hardware block
+  provides virtual regulators that serve as the power sources (suppliers)
+  for various multimedia IPs. It coordinates with the MediaTek hardware
+  common clock framework (HWCCF) and the Video Companion Processor (VCP)
+  to manage the power domains of these multimedia components.
+
+  Each child node under the VMM node represents a virtual regulator
+  (e.g., vdisp, vdec-vcore) and must specify a 'regulator-name'.
+
+properties:
+  compatible:
+    const: "mediatek,mt8196-vmm"
+
+  mediatek,hw-ccf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the hardware common clock framework syscon controller.
+
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Video Co-Processor (VCP) node.
+
+patternProperties:
+  "^(vdisp|vdec-vcore)$":
+    type: object
+    description: |
+      Virtual regulator for a specific multimedia domain.
+      The node name should match the supported regulator (e.g., vdisp, vdec-vcore).
+    properties:
+      regulator-name:
+        type: string
+        description: The name of the virtual regulator.
+    required:
+      - regulator-name
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,hw-ccf
+  - mediatek,vcp
+
+additionalProperties: false
+
+examples:
+  - |
+    vmm: vmm {
+      compatible = "mediatek,mt8196-vmm";
+      mediatek,hw-ccf = <&mm_hwv>;
+      mediatek,vcp = <&vcp>;
+
+      vdisp: vdisp {
+        regulator-name = "vdisp";
+      };
+      vdec_vcore: vdec-vcore {
+        regulator-name = "vdec-vcore";
+      };
+    };
-- 
2.45.2

