Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2525776;
	Thu, 15 May 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315911; cv=none; b=omhu/aakJk1s0avv58Ny0uk67xt0bQzZrx4bIR3MZn1j+6GpoY17Nog67qDfmHJVDj/ewWtXJP+k75+ES7V2Wa/GNTds3WeqMmdlDtZ0L2AMdhZLjXN5brwi9/L/VB+I0x8PYLgJPC4y/3avhqNv+010WGRF0cUW0/dk9/C2y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315911; c=relaxed/simple;
	bh=hOoucmqjAQsX1VnPMKLKkiL8fmtNljrRShY1zXOVkLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ss2bcQO+XpyyvnmJIyto1MO3RSQRhebgijMFmx24eJMWu+q/A+dAgjN0yHLaYMO4s2k8zqiAPVzXPCuluNQobA5MK0iKodW6CMb6wqdRKCsTSQDOkii5yF/cspwMXj+ptT9In5L8zrwpItk9XO2m4qh0unpUfSyexZwOo5oAx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CjjPGbwS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CjjPGbwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315907;
	bh=hOoucmqjAQsX1VnPMKLKkiL8fmtNljrRShY1zXOVkLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CjjPGbwSPRkPNMHQCaBbdgwRMVp2yOdmNZ8QAKHNGy/oybxy0TPhezCT+KHc2LtfB
	 gKbfjOL/ck6YNdiE9TGz9A+xf3LYQDH66V3A920xr0S67Zyed3tGZb5KmNp6Hs4fNY
	 CpvmWYIXS1ZdD7JcOsVqKQA7JHza8aaTUDwSSDMTn5wL4qNQq10znjH/6E9fNPb/og
	 Aie75sZVt2VUKtNVy7Amqzk9CyrzKCJYUyX8t1iXs7YxZNpL1hNORKtaABaYZOZ8pU
	 MisLiCzrtD32tVnnJpIetln6PpPFWIDy9Ea7WzpgmtT8KHz6mAtU/5VpN1s4m2XVWQ
	 oGVXcydqUFnSg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C1A717E05F0;
	Thu, 15 May 2025 15:31:46 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:43 +0200
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
In-Reply-To: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The '#reset-cells' property is required for some of the MT8188
clock controllers, but not listed as a valid property.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -52,6 +52,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg

-- 
2.49.0

