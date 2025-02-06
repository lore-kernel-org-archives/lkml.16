Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F1A59;
	Thu,  6 Feb 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845111; cv=none; b=f5DpxI95ePeUbihLGPa1TjtiesHouw7oaaBXJ64V7/fePFkDUg2fX9I/nnNQB+d0TlHp1cNGID/FRJ5sQKBxJDVC7WK8yIusKM9vdo+nHBl0rNUnqU6rmD5u0d+qeIpizIOeZSsOwC8T8+RIWXDpJf4fRljiAuTV4owFDb42/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845111; c=relaxed/simple;
	bh=RHq4zNhVO6lB6n0CQ02IGujt9TA62akRjENsTArkuG4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7byE0cVf3wpRUHoDIOA8QEgLfTzyaIjh4pHwdOoC0vbh4TOJhKqjaOy63//gz0TkX/D4yfBLkf11IywCsMKdRoIgiDc3yeaSF8jiG/U/aWiY3bKSRnEuaeuyu1kO4eIuqaUTdwBVbn6+qa5IDmlxeXDSlt5dRVUYEgoRFdD01U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=evF1VNiY; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="evF1VNiY"
X-UUID: 3518f184e48411efbd192953cf12861f-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xRnnqccViHY7/lghQF8XBSkl+CSYtWIn8P+USXrKzcc=;
	b=evF1VNiYvi7/7ZTNV9HxDthbEnLebT1Gh6AXoG7yn1eLDRCQ6WJaiyNKnlmflnQVJMnwCB8gzPbur8GnUFX4HwxgAWZsGdfaKzIxZ0OkipBW/c22FA1LtLPhcrjRVEFRSbuSxCL4AOEEOF/IHU2htRYt1QJWJRZ5cYF0DmqHHFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:95c3a380-be86-4cc3-bb84-fc8c21bcd617,IP:0,U
	RL:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:b3022b7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3518f184e48411efbd192953cf12861f-20250206
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1232163745; Thu, 06 Feb 2025 20:16:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Feb 2025 20:16:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Feb 2025 20:16:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2,2/2] dt-bindings: memory-controllers: Add MediaTek DRAM controller interface
Date: Thu, 6 Feb 2025 20:16:09 +0800
Message-ID: <20250206121629.12186-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206121629.12186-1-crystal.guo@mediatek.com>
References: <20250206121629.12186-1-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

A MediaTek DRAM controller interface to provide the current DDR data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../mediatek,common-dramc.yaml                | 129 ------------------
 .../memory-controllers/mediatek,dramc.yaml    |  44 ++++++
 2 files changed, 44 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
deleted file mode 100644
index c9e608c7f183..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
+++ /dev/null
@@ -1,129 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-# Copyright (c) 2024 MediaTek Inc.
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/memory-controllers/mediatek,common-dramc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek Common DRAMC (DRAM Controller)
-
-maintainers:
-  - Crystal Guo <crystal.guo@mediatek.com>
-
-description: |
-  The DRAM controller of MediaTek SoC provides an interface to
-  get the current data rate of DRAM.
-
-properties:
-  compatible:
-    const: mediatek,common-dramc
-
-  reg:
-    minItems: 9
-    items:
-      - description: DRAMC_AO_CHA_BASE
-      - description: DRAMC_AO_CHB_BASE
-      - description: DRAMC_AO_CHC_BASE
-      - description: DRAMC_AO_CHD_BASE
-      - description: DRAMC_NAO_CHA_BASE
-      - description: DRAMC_NAO_CHB_BASE
-      - description: DRAMC_NAO_CHC_BASE
-      - description: DRAMC_NAO_CHD_BASE
-      - description: DDRPHY_AO_CHA_BASE
-      - description: DDRPHY_AO_CHB_BASE
-      - description: DDRPHY_AO_CHC_BASE
-      - description: DDRPHY_AO_CHD_BASE
-      - description: DDRPHY_NAO_CHA_BASE
-      - description: DDRPHY_NAO_CHB_BASE
-      - description: DDRPHY_NAO_CHC_BASE
-      - description: DDRPHY_NAO_CHD_BASE
-      - description: SLEEP_BASE
-
-  support-ch-cnt:
-    maxItems: 1
-
-  fmeter-version:
-    maxItems: 1
-    description:
-      Fmeter version for calculating dram data rate
-
-  crystal-freq:
-    maxItems: 1
-    description:
-      Reference clock rate in MHz
-
-  shu-of:
-    maxItems: 1
-
-  pll-id: true
-  shu-lv: true
-  sdmpcw: true
-  posdiv: true
-  fbksel: true
-  dqsopen: true
-  async-ca: true
-  dq-ser-mode: true
-
-required:
-  - compatible
-  - reg
-  - support-ch-cnt
-  - fmeter-version
-  - crystal-freq
-  - pll-id
-  - shu-lv
-  - shu-of
-  - sdmpcw
-  - posdiv
-  - fbksel
-  - dqsopen
-  - async-ca
-  - dq-ser-mode
-
-additionalProperties: false
-
-examples:
-  - |
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        dramc: dramc@10230000 {
-            compatible = "mediatek,common-dramc";
-            reg = <0 0x10230000 0 0x2000>, /* DRAMC_AO_CHA_BASE */
-                <0 0x10240000 0 0x2000>, /* DRAMC_AO_CHB_BASE */
-                <0 0x10250000 0 0x2000>, /* DRAMC_AO_CHC_BASE */
-                <0 0x10260000 0 0x2000>, /* DRAMC_AO_CHD_BASE */
-                <0 0x10234000 0 0x1000>, /* DRAMC_NAO_CHA_BASE */
-                <0 0x10244000 0 0x1000>, /* DRAMC_NAO_CHB_BASE */
-                <0 0x10254000 0 0x1000>, /* DRAMC_NAO_CHC_BASE */
-                <0 0x10264000 0 0x1000>, /* DRAMC_NAO_CHD_BASE */
-                <0 0x10238000 0 0x2000>, /* DDRPHY_AO_CHA_BASE */
-                <0 0x10248000 0 0x2000>, /* DDRPHY_AO_CHB_BASE */
-                <0 0x10258000 0 0x2000>, /* DDRPHY_AO_CHC_BASE */
-                <0 0x10268000 0 0x2000>, /* DDRPHY_AO_CHD_BASE */
-                <0 0x10236000 0 0x2000>, /* DDRPHY_NAO_CHA_BASE */
-                <0 0x10246000 0 0x2000>, /* DDRPHY_NAO_CHB_BASE */
-                <0 0x10256000 0 0x2000>, /* DDRPHY_NAO_CHC_BASE */
-                <0 0x10266000 0 0x2000>, /* DDRPHY_NAO_CHD_BASE */
-                <0 0x10006000 0 0x1000>; /* SLEEP_BASE */
-            support-ch-cnt = <4>;
-            fmeter-version = <1>;
-            crystal-freq = <26>;
-            pll-id = <0x0e98 0x02000000 25>;
-            shu-lv = <0x0e98 0x0000c000 14>;
-            shu-of = <0x700>;
-            sdmpcw = <0x0908 0x0007fff8 3>,
-                <0x0928 0x0007fff8 3>;
-            posdiv = <0x090c 0x00003800 11>,
-                <0x092c 0x00003800 11>;
-            fbksel = <0x0910 0x00000040 6>,
-                <0x0910 0x00000040 6>;
-            dqsopen = <0x0d94 0x04000000 26>,
-                <0x0d94 0x04000000 26>;
-            async-ca = <0x0d08 0x00000001 0>,
-                <0x0d08 0x00000001 0>;
-            dq-ser-mode = <0x0dc4 0x00000018 3>,
-                <0x0dc4 0x00000018 3>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
new file mode 100644
index 000000000000..8bdacfc36cb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DRAM Controller (DRAMC)
+
+maintainers:
+  - Crystal Guo <crystal.guo@mediatek.com>
+
+description:
+  A MediaTek DRAM controller interface to provide the current data rate of DRAM.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8196-dramc
+
+  reg:
+    items:
+      - description: anaphy registers
+      - description: ddrphy registers
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        memory-controller@10236000 {
+            compatible = "mediatek,mt8196-dramc";
+            reg = <0 0x10236000 0 0x2000>,
+                  <0 0x10238000 0 0x2000>;
+        };
+    };
-- 
2.18.0

