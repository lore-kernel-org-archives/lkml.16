Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE9238D5B;
	Wed, 16 Apr 2025 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804953; cv=none; b=Z0q6uN0XRAgnfQ2K1y+NdS/mfErIZrzRH2bFW3snHBQtm9BwFiRbeP1KRXOPKsZ1vK6kZr27zk0YlPmgwyGP96W4QxE305kVDnh3c+9OOAo7p+WTpF7Hy/+zQ4Y2n1yZ9SiDcjpxL23PMdub9b0BQPVLNf50K6byAOatL1cwwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804953; c=relaxed/simple;
	bh=a6g2jhRqirUv8h05NZlOBx0HRIGjQJAVOh82JJL1Qg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i79KEs6fUZm7nALcDQnaaOkxxEKoW1nWqjpD6aB3JbuOYkZtlx57MqQmhRgTf10M0x+8FgZw0mgXSmsTpEMjWvZXmr9DWEpx5tOzrcZwUbhL3DCyFebT32RYrSHj/Wwqz+Xvo8toQBeEa3w6lQBMZVwp3MrjX7n0IA5nss1Y9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hgXHFWTh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hgXHFWTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804944;
	bh=a6g2jhRqirUv8h05NZlOBx0HRIGjQJAVOh82JJL1Qg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgXHFWThh+GCcKfxosMPMmHs1KxZUdhd4w02g5UEGgrhfRzYu+yOHU/uBnsozMd+3
	 xJM3GmOsV4vu0P+MA8B3tU6Bs5wbuyJZhE5TUkZfAt06wRCq3Q/NaPfWOGVmZzDsCn
	 +hP/uh+Ln30e5UfU2j/nrOG2agQdfqPinMv91Kt85OWBCRJaU2O99UdtMv8ItBBUMj
	 3DLtP8DtUyHHIMALF6oCn1XeD1BrqOISrEobZutGZTBAzbcdKsVtzWXbynbWF4W23Q
	 dTvdsINDxp58GpBnpbTuxSHF7ujbr140BRr4n+y0khN632sJJMLbRB3HPmtbPhRvE3
	 mptyseJOVpWPQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74C0717E3624;
	Wed, 16 Apr 2025 14:02:23 +0200 (CEST)
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
Subject: [PATCH 2/2] dt-bindings: phy: mediatek,tphy: Add support for MT6893
Date: Wed, 16 Apr 2025 14:02:20 +0200
Message-ID: <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
SoC: this chip integrates a MediaTek generic T-PHY version 2.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 6be3aa4557e5..b2218c151939 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -78,6 +78,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-tphy
+              - mediatek,mt6893-tphy
               - mediatek,mt7629-tphy
               - mediatek,mt7986-tphy
               - mediatek,mt8183-tphy
-- 
2.49.0

