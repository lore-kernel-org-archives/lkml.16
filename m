Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4727604B;
	Tue,  1 Jul 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382722; cv=none; b=g0KgyeFXH6CTqDh1VPfPuKnlwkSl934j9byEcJbHwAgRv/yFL64+T81XPuHP2ZORZJZX9it4x7I2TiinWJugs/ChUG/nf0WCZd4FHeyED8tnSu7ZIFg5nCmayg1Mmcbid4DdvE6p7IILq3+JvA8giWXDzv4PBcMh+Ba1UXLmrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382722; c=relaxed/simple;
	bh=6txTiD2AyRmqoHCYxbM4ZdaNUVF5YvLjBexLwl7V0VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0KQNm09zw25Ep7uKB8KYlqQlnyqc0G3ZeAUanodk+ORdHboJlz58gxVzaeM/2wpDnYZ7rAc37Wre8+vpIzVQ+B/cAA9B5XOtsBbCCP831b8QmFoXZQe4kSfbYLLTZmL7Sih/H/3sQIGlGdyIpBXPBzWETgUoHC+wu4X3QC8kxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NSrmJhYm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NSrmJhYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751382718;
	bh=6txTiD2AyRmqoHCYxbM4ZdaNUVF5YvLjBexLwl7V0VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSrmJhYmpSjO8ICnCSznoFE0fP08fy0Myz3r6LBMqvtOqhke1eUYtn6+RGOHww5Hb
	 MhkFecnO1JRvmfcKPzk7Qhgpll6jY/DSlsSj51cGLDL74JAJZ42c3LaacIBzjRBt3d
	 2jkjqVIqAby4yGSzikc2WgK/TmyrJw7bTQ/Iqw/JxTOoRNixErkGfC7/JlvBKfgwhK
	 Ryiv3b3aR3vW8wotuoIltmY2DKiVHbaU0KCt6aq5v9istkArIQWKZrtZ+XNL/3BHPJ
	 qKQ5f1elYeB2u1Pgz+XrT8WRSiR4Nrv43TeFW1mc+P71pBhnDxthnQwQVL4lcRSCGT
	 NuWUJDMbzzDhA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 616C017E0676;
	Tue,  1 Jul 2025 17:11:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	m.wilczynski@samsung.com,
	nm@ti.com,
	khilman@baylibre.com,
	kabel@kernel.org,
	quic_hyiwei@quicinc.com,
	pjp@fedoraproject.org,
	tudor.ambarus@linaro.org,
	drew@pdp7.com,
	u.kleine-koenig@baylibre.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	laura.nao@collabora.com,
	kernel@collabora.com
Subject: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek Hardware Voter (HWV)
Date: Tue,  1 Jul 2025 17:11:48 +0200
Message-ID: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the new MediaTek Hardware Voter, found in
MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
the MT6991 Dimensity 9400 for Smartphones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
new file mode 100644
index 000000000000..173b74c23a91
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Collabora Ltd
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Hardware Voter (HWV)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-function MCU
+  used to collect votes from both the Application Processor and from the
+  various other remote processors present in the SoC, and transparently
+  turn on or off various hardware resources (for example, power domains
+  or system clocks) based on aggregation of votes done in the HWV MCU's
+  internal state machine, therefore guaranteeing synchronization of the
+  hardware resource requests between all components of the SoC and hence
+  avoiding, for example, unclocked or unpowered access to the hardware.
+
+properties:
+  $nodename:
+    pattern: "^system-controller@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt6991-hardware-voter
+
+  reg:
+    items:
+      - description: Address and size of the Hardware Voter MMIO
+
+  power-controller:
+    $ref: /schemas/power/mediatek,power-controller.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+ - |
+   scp_hwv: system-controller@14500000 {
+     compatible = "mediatek,mt6991-hardware-voter";
+     reg = <0 0x14500000 0 0x3000>;
+
+     power-controller {
+       compatible = "mediatek,mt8196-hwv-scp-power-controller";
+       #address-cells = <1>;
+       #size-cells = <0>;
+       #power-domain-cells = <1>;
+     };
+   };
+
+   /*
+    * For RFC patch only, this will be removed at patch v1
+    * Note 1: Clock controllers have more than 90 registers in HWV
+    * Note 2: The HWV integrates the power controller, so that's why
+    *         that is a child node of HWV, but the clock controllers
+    *         are completely separated (in hardware) from the HWV's
+    *         physical location (other than address space)... so it
+    *         would be wrong to place those as children of HWV I think.
+    */
+   clock-controller@16640000 {
+     comaptible = "mediatek,mt8196-pericfg-ao";
+     mediatek,hardware-voter = <&scp_hwv>;
+     #clock-cells = <1>;
+   };
-- 
2.49.0

