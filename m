Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A913B284;
	Fri, 16 May 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404763; cv=none; b=f4Xm/0i/3bhlIpOGPyTiqvu++jUUDD3U7iIzXsum8TS6OoCIAb0EyLnvVlhE0rbl+z2pzs03j05Cp6OKvtzcTGjtaVmICHwIzyrb8bCbN0ghpojE0tRXYLzWPem1PnqOvxqJe+MxNbs9YDMktR3tsiHqEQU9HQHyf+aoDFhqetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404763; c=relaxed/simple;
	bh=tASrtAWlxRnbRRu8X1Omf+YcuIOtQV8Chp1OjDdP3Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfqXlF2SlfIawy5jM8C+PrVD1tSk7xJJQo2m/WACb+UT8NvV835OjPztHyHqyfv4qBvDkImXY0Ab5Co1YlPc+MA2TwzY1Fk5OIO/VHcL2+wHIQ4OuwNuxl8zfMkztBuGJzGw4/6h18uRbFHOXfty60szbPgVqb36rraPNg7im+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YX+H/h0C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YX+H/h0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404754;
	bh=tASrtAWlxRnbRRu8X1Omf+YcuIOtQV8Chp1OjDdP3Jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YX+H/h0Cz/cb7Pt6kxO0uyXrguWbs+zzB//6WAmD4pu1M1IAYm0PoJxdFtVtpOH6x
	 enXQrGiwzQr24VizDpfOWszxxw81D6H+meYmI+8OdSKW+F9Ay74//2tyq27ztR6enz
	 EY+vPzTD6f4bWu7fU6fLD/9z0xofJu2iwx8htiww66BxyqfqYCzYQjLg0Fd5apqW+4
	 0JluDARpO3YWsR2sc+hPAZ5hY35dtg/ZaM2vHP8m/RFIABqbZjvi2espQCnb4OQhH8
	 myLuYeJzLwEaefb8ufJ2CJHgmsap9GcKdZnQHhpGjsQtANWzOMvtViKz9rFOQf0z8E
	 9YxdNn0WrvwLg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600C8F85Cf092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF38417E049F;
	Fri, 16 May 2025 16:12:33 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 16 May 2025 16:12:13 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
In-Reply-To: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
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

The '#reset-cells' property is permitted for some of the MT8188
clock controllers, but not listed as a valid property.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

