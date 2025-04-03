Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDFC1FC0E3;
	Thu,  3 Apr 2025 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663043; cv=none; b=ucHI5tVoINZPOra5A5xeUI7zLjWOFJ6Ux+ew1tj7dplIZ2bY+6qe01SnhDloopJld5IFddL9wRG6Gc2XuADXvfWVzFUKtvT8J0Kxq3xtTirpcLuc2T38tYcTfdT9mCMrqw22LXdp988dRH9bQ9EA03u2Uf5nj0Y4hhpd2aTaXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663043; c=relaxed/simple;
	bh=dISGsuvWoy4nucKXb3vajiwE8lGz6a1qQN6HyAeEtiE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bG4Odf6Cot4JO8j/O5rGXpSk3F3rVykB/WkFsfkR/CGlUL5Sr4WkvilNrmEdnJ1DAtUr8eCiAaLqjw9gjIAym9dqC65+FdK4nYZcOde070zskYzupvhVvx/IpbHeY/Iyqu8eQ94GJlK0Ax6PKDyDJpzD7EDZpSgYbb1Qo4PqAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eR+RL3yi; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eR+RL3yi"
X-UUID: f1feef66105711f0aae1fd9735fae912-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LTZofUX6Jv/8yJIenVhAoWh1nNKDtqpvFcNBJxTaRao=;
	b=eR+RL3yi5DShQCFKQr80qgSyh3xBnrE0D04BOawx8nuVQS+iq54xn7sMfDKUKbBnRzA778wmeeVyA60YnNY1BahcFXTwXhF9Bbj7GwOZPH4Kj5zWzRC77rxnFZeHIWExMSgQXl/cXz0j32WvmvP8tjGf37hwjtzY+jVPEAuF1UY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f1543aa0-2593-4c8f-899e-6f81ce786d56,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:217024c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f1feef66105711f0aae1fd9735fae912-20250403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1888648647; Thu, 03 Apr 2025 14:50:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 14:50:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 14:50:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek DRAM controller interface
Date: Thu, 3 Apr 2025 14:48:47 +0800
Message-ID: <20250403065030.22761-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250403065030.22761-1-crystal.guo@mediatek.com>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

A MediaTek DRAM controller interface to provide the current DDR
data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 .../mediatek,mt8196-dramc.yaml                | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml
new file mode 100644
index 000000000000..c0b3e7166a87
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,mt8196-dramc.yaml#
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

