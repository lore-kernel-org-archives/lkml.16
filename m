Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECBD1F099F;
	Fri,  4 Apr 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774796; cv=none; b=SYB5IgpK+C+rRz94nGXcpc51asYyyAQidREDyJTATRstkA1tDJ8w+mHZwVeAoQv0Gh1riULwqIZgT42xd9ZKyfnWnKMqo0MCoaPmT0lijh46Z+gaQos0/390ZWis8GuXPZLl3KqHv4xjd0r2qcdz1Ludl8x0vD5Z2itaB+ty5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774796; c=relaxed/simple;
	bh=wHSW2yYOr4KJOJ8+TNv3Qp3Jf9vVjS0eM/3lV8YHR0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8mdOW7jlWUXRTsC0oP/OPFVZ2hRaaG97yrQVEoq0qAKNzFX8QIDnfegZz+6hOfoWyehckHjJdLso6axeQL1wXm49l8ZFrHIzqWb4UqqZdnfEGj8/YXxB1pRPjASYd0Gskuz+Kng5IwG12tusQrXrHGLlLwTX/yugVwIIlU0YGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QazsvcgN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QazsvcgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774793;
	bh=wHSW2yYOr4KJOJ8+TNv3Qp3Jf9vVjS0eM/3lV8YHR0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QazsvcgNslrT/Rv3rrW0/23ORVL5cuYxw4xkuVAs3u7eGNXUtrFdwWeM0aw2nBRFk
	 dF8gBaach/iaMQoHFjPkg1T+fIFZDjYvoL65/F+vDYfzx152kIyV/SMe0uK3u8bdcr
	 YO/LIcZwu0fKOyRzZ04oJ0Tvn67D3c6BHM6dEhyt3oCax2XSP+NsHrEYPGMItKBDJE
	 0d7u8x+m2AkT3p/N6DPk3qN87cLaSw2ZRfA3d+DD+ZUtmT0ciZxiQzzZb2MOA59/56
	 mgAfKsQwkYhAx1T76/jP1G+89T0tanEDDIC6j8PJbUzNlyAN3LpYZOqTeja007OfDi
	 OX8Gh0wbosK3w==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CFEE17E080B;
	Fri,  4 Apr 2025 15:53:12 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 04 Apr 2025 15:53:10 +0200
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp
 firmware-name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Lok <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Set the scp firmware name to the default location.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index f02c32def593a54531221ec57473a335af08a92f..2740c799ca12d7e05694f706df34335fa164aeb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -872,6 +872,7 @@ &pmic {
 
 &scp {
 	memory-region = <&scp_mem>;
+	firmware-name = "mediatek/mt8195/scp.img";
 	status = "okay";
 };
 

-- 
2.49.0

