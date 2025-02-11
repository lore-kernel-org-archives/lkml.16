Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE131E3DFD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242413; cv=none; b=Fp987IoPc9s+L5gMj569nTKPq8Lc0oHmJfYejRJOhiwoEGKy1IZa/p1VqEU7MgkjDapFn3A/DDRJmiC7ZmW1qvvj6iO1b5r+gxax7+huYo+ZIoqi5ehqOfRKklCPKtE8PEnWGh51LUbphYMOGf6zEyudaoftlf3F+A0scuj347I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242413; c=relaxed/simple;
	bh=vgYucEPj+3aobo+lbrfLANKWBq8tmCQXIv7lUpYWoPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZWPZqfhHbht6Od/ecvo9BOPuRjvoh4p1I8+hMrhHU7LDou5yWIg74QBMv76yQo5pSLIxDfUdgcVXSDdTbABoem+rqMo7zSaubKbi76DzLkYKbTbzQb6GnLVv9oH11HoVfP4QoXHx2TYoY8/dSAlMmfU5vqwwwxppGdVKC+QjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=scj4I0q8; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="scj4I0q8"
X-UUID: 5ddedaf0e82311efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uIyrTTeXw+C4BCHVXGUIGZGr+s1+Cv96AxvzOxDoOWg=;
	b=scj4I0q8ajkCM7GKjoRHQ9Rs8dsZ9LaLxwOtorLzzev38j5rb7Cy1/yaclSd+mUWpW8KIrfP8avf8EGy6zKtIWMPfdE1KPTmdLNI8gSVx7ykNocHywePp+QwaGS+JMoCK0fqosiRuy0jlGjP5wcnSJu0glYjBCesVXZLCGLhkzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b457304c-cdf0-475d-8d30-df13efc26819,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:ffc9627f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5ddedaf0e82311efb8f9918b5fc74e19-20250211
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 963153032; Tue, 11 Feb 2025 10:53:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:25 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
Date: Tue, 11 Feb 2025 10:52:50 +0800
Message-ID: <20250211025317.399534-2-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211025317.399534-1-sunny.shen@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add MDP-RSZ hardware description for MediaTek MT8196 SoC

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml
new file mode 100644
index 000000000000..6642b9aa651a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display multimedia data path resizer
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  MediaTek display multimedia data path resizer, namely MDP-RSZ,
+  can do scaling up/down to the picture.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-mdp-rsz
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MDP-RSZ Clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_mdp_rsz0: disp-mdp-rsz0@321a0000 {
+            compatible = "mediatek,mt8196-disp-mdp-rsz";
+            reg = <0 0x321a0000 0 0x1000>;
+            clocks = <&dispsys_config_clk 101>;
+        };
+    };
-- 
2.34.1

