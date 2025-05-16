Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261B145B3F;
	Fri, 16 May 2025 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404764; cv=none; b=qM8uvMixkUVBKwDBDa7c2d+L+9oBhSJ+VrjI6rEyyYQUpHuv9gjqeahHHQVzclyHaWz2Td8XUmLiqGokPXLh3R1r2sq6H7zCfYuEEjFTU5+o5cX05kuTlWXZkuBG3ntvQriJGtqtMt6EdvLlQX5B9ffcor5mTgfMB+3czIj2xfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404764; c=relaxed/simple;
	bh=0CSU94FT+xS94/kzp81hGRLzb7zJ0Npr8p6nJ4MCPu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnRb7tZaYfBRrq5YPC+zqhLep4ZPF3XQRGBrY69VvZ/NMkheicc48vy/SjvTNbwoKIB95emgW+MhWL/P+zmAT5tG08DJVCUvND1pivdlAbXdU8vo/T018UoLa+zzuYmnsXfFWv9lZRKjyMd+H0IrXqK6DsnglYkQs4RG/XhBT/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m8bDrcPj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m8bDrcPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404755;
	bh=0CSU94FT+xS94/kzp81hGRLzb7zJ0Npr8p6nJ4MCPu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m8bDrcPj92fPYm2aI5X3kkNHKlsbrWcFm9FlUwlVsEyOUa+uvEY5wdByupYCOJ6+T
	 5/R4m6YpYN084Xu+owhQ1faFtnTPR8F8a/hxOMCKekPeLRD5BTUJuRid4hZ5RUrwQ+
	 KoKcdydrXaNOf3iTowJqSp1/IYgDSEnu2jVgPkOOqzRoatm5jo2VUE4JJjMAEViMjz
	 gzz7dYFdg9BL0DVjMsvsOHWmwWEiOJYZfDhCtTI9qEOeeEe0XUks6uC1G8U/FUwEsJ
	 5Ly0a32GoLQjzYMtLJ/D+mwQnvWSl0LazpoF4ci2rOYa4mlH+s2WlSTu/0hiIA9JIc
	 GktEs1pgnUCig==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600C8F85Cf092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9F8A17E05F0;
	Fri, 16 May 2025 16:12:34 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 16 May 2025 16:12:14 +0200
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Add missing
 #reset-cells property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-dtb-check-mt8188-v2-2-fb60bef1b8e1@collabora.com>
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

The binding now require the '#reset-cells' property but the
devicetree has not been updated which trigger dtb-check errors.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 296090fbaf4953db8075f72073509b731dc41e51..dec6ce3e94e92c8e1e2c3680cb3584394d9058bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2647,36 +2647,42 @@ imgsys1_dip_top: clock-controller@15110000 {
 			compatible = "mediatek,mt8188-imgsys1-dip-top";
 			reg = <0 0x15110000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys1_dip_nr: clock-controller@15130000 {
 			compatible = "mediatek,mt8188-imgsys1-dip-nr";
 			reg = <0 0x15130000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe1: clock-controller@15220000 {
 			compatible = "mediatek,mt8188-imgsys-wpe1";
 			reg = <0 0x15220000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe2: clock-controller@15520000 {
 			compatible = "mediatek,mt8188-imgsys-wpe2";
 			reg = <0 0x15520000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe3: clock-controller@15620000 {
 			compatible = "mediatek,mt8188-imgsys-wpe3";
 			reg = <0 0x15620000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys: clock-controller@16000000 {
@@ -2689,24 +2695,28 @@ camsys_rawa: clock-controller@1604f000 {
 			compatible = "mediatek,mt8188-camsys-rawa";
 			reg = <0 0x1604f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_yuva: clock-controller@1606f000 {
 			compatible = "mediatek,mt8188-camsys-yuva";
 			reg = <0 0x1606f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_rawb: clock-controller@1608f000 {
 			compatible = "mediatek,mt8188-camsys-rawb";
 			reg = <0 0x1608f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_yuvb: clock-controller@160af000 {
 			compatible = "mediatek,mt8188-camsys-yuvb";
 			reg = <0 0x160af000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		ccusys: clock-controller@17200000 {

-- 
2.49.0

