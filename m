Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32E236A70;
	Wed, 16 Apr 2025 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804952; cv=none; b=PiKq1/HhEToeyNZeAM78Jbr8Uguuk4ArSNTcJAJOpj+lQSDjtYVRCtpWYPhJnkZkR8t0TbEuKQ6qFQCpb8touIGN9ahirBW1CqdXa1NVdPXqt/mi51SeptMnzXRkY4m1N4CTbURoHR/KxsdsSrcboxCOElTH3MPJ7Q20eAoQsQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804952; c=relaxed/simple;
	bh=sHNaG5FwaoJr2EsT3BMvvyYUM4RyedYboD9i3EOOPtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMlQpD+Y66UAVR6emmz2nJgdIwx4INHXQkr1TiWZlbrzdUivN1cdiiAMxfoCbkKmutURQy/L+qiHkiDlwQHsEhNErsj/l9wtfwzH90HLEcxD8BgyuqtBCTO1diZ4dp3rXVuxK03S5sVVoTEzMTBam6W5fSxzqzFDW8NRmQgll58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a+tQiH6Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a+tQiH6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804943;
	bh=sHNaG5FwaoJr2EsT3BMvvyYUM4RyedYboD9i3EOOPtA=;
	h=From:To:Cc:Subject:Date:From;
	b=a+tQiH6QhgNo0Gjgwa5imwKxjwHYMVK9O6E3UtmlP/qQqarWsxbhvjPfedyOAh9Xv
	 FkGo6679ER2B4fxxkxI1rSG0Cx+umoqrTAQ2IUjGgxpFvajDz4kJfpqewHzT4bFScR
	 gv8irIVt3Ga6OtfSwgupYQYLxWxgjxZp9lmMq2hC/sAkFR0qjqwNd+vWNQJIiTIHbm
	 nUSwb9BPor4HcN0dkqiPnxlzUm7pLdH49ZsQnJxDXwXaI/3sFsXMHn5VEAboz/2m1e
	 twEeeaUga5/OIBKEYxcMpn8OEyEdF++hV9Uu2G4P2SNirpyEDTe2Zp9xqIMYJAX8Sg
	 dIPoaqrWhCmRg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6914C17E35EB;
	Wed, 16 Apr 2025 14:02:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT6893
Date: Wed, 16 Apr 2025 14:02:19 +0200
Message-ID: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MediaTek Dimensity 1200 (MT6893) SoC: the DSI
PHY found in this chip is fully compatible with the one found in
the MT8183 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index f6e494d0d89b..acdbce937b0a 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -30,6 +30,7 @@ properties:
           - const: mediatek,mt8173-mipi-tx
       - items:
           - enum:
+              - mediatek,mt6893-mipi-tx
               - mediatek,mt8188-mipi-tx
               - mediatek,mt8195-mipi-tx
               - mediatek,mt8365-mipi-tx
-- 
2.49.0

