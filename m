Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0EA28BAAE;
	Tue, 15 Apr 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713814; cv=none; b=D/0fRuGTL2iF+WflJJG5bw+tOoOHrenTiwA530t1JIUUU/QwU4rlQ5BwXmGl4Uqe/c9C/ICzuAJAdpXDvyFTd5nagkUTAd3m2Wq44G4ArHc0Ic+RaqORGjZWfng+ZjEptgVDcs0LLnx+FrErBLBzW9W6LSeFfZu56EgBtZfLftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713814; c=relaxed/simple;
	bh=DATJrZaH9JfWeAmD0tPnwt88xNWYRlg12xEesQvyvlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S707/136LcqI4SU5zRCmZSlTXA4OGBSeMqrB0qAcUVOVLHtJQWVRbfwfdGEXZmazUIfhfwWCwBxafikQ9l5+9DHt5wnYzUPH3bwRIKhbNa7jeV/Ar02pfxjo6DTtBlVI27CsNCKWB/KIrWbLbIRRYNaejnIJ54U/ciXFfpJl9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=elc5dkwU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="elc5dkwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713810;
	bh=DATJrZaH9JfWeAmD0tPnwt88xNWYRlg12xEesQvyvlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elc5dkwUVx36A1qPf/35pOPe9VYvan+B8uUR5KGyTA0Pz2CW5eRvNTF56oAYfwKPH
	 PuEUDBhush353x0BXwR2ta0GqmwcEjM1++ZKZ3yeLvoJI8obSzZpmGfbzvnreyS/4H
	 pE9nvcchL2efHztMI20cFPfZtT8bSoP8Dme3tDDE+wPGpkcFbHPxycMiEt0W5D+pib
	 i51EC/Qso0K4xVHzzkefKbmkM5LxrBDyfouticZDSsnIDefcns9kiPwhOwe0bguWG+
	 9PAZdSZXldAJfdBusS5SmPYREON0PB9fMOampJhKxVlG8+z4a2vuBO/y/k6R1C9/Vr
	 VkuNmlfiPKXCw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42E8617E1022;
	Tue, 15 Apr 2025 12:43:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 01/23] dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
Date: Tue, 15 Apr 2025 12:42:59 +0200
Message-ID: <20250415104321.51149-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the Display Data Channel (DDC) IP in MediaTek
SoCs with version 2 HDMI TX IP.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..bde4dc556d4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI MT8195 series HDMI Display Data Channel (DDC)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt8195-hdmi-ddc
+      - items:
+          - const: mediatek,mt8188-hdmi-ddc
+          - const: mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi {
+        hdmi_ddc: i2c {
+            compatible = "mediatek,mt8195-hdmi-ddc";
+            clocks = <&clk26m>;
+        };
+    };
+...
-- 
2.49.0

