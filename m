Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E84B1E52;
	Thu, 15 May 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315911; cv=none; b=tp5JtqAxkmOVjtQMJhyJpx6/KekR10anNuqEIkACVaQwxohdDizUMG/9XfUgU2edVMGarb3jH3d1cC8HNqYde0CNaZWEKoC1U+wgBah72Cly9N+sL41nII7sF9ugnK1GnpYF3yraUi366CXoqZ6D9I0afboaROmMZ4a1VFVxYkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315911; c=relaxed/simple;
	bh=E6HitapnSoXVXZhWdCC31t/7KXrJLpjM/uxQsFuXi7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6g/IsW+/BeGjEjg3IujX7ycptAlVMN6fUvWojVkK8j+RDFKGVUIPMft2ZIEIFUfamlUqkHa1mv+ChqFVwIsUi03vLcbbMhHO3scsV3s6aXIOUnt4XMKZkGxPNyc/0buM13UkpSZEQBk5lCB0HaXRK4QXUGWxiov1wwkx/212Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PKCo5cJV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PKCo5cJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315908;
	bh=E6HitapnSoXVXZhWdCC31t/7KXrJLpjM/uxQsFuXi7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PKCo5cJVB6wGic0dq0bZjBjpRDl9J0G2Hvb9iKGzjFJlvY+OV2uPFHZi3oan+ESwY
	 UYeGOpzVAoomdZmFj4NPIsDWyRVAZ+uVHZSXORtAvMYJ2L6PiWW8V1bi3I5He4KFrK
	 hKrwumbAWn/qsUDgJw5mwqedNIzzMk01nnk3Zd17NjK9HWn62BxrlHsVSA+BNfWqUy
	 g+Qu9ZK7fSRxhtBWA1VINdbLDUjyrLJrlvBeCGpE08tmilNo1GKzf3Gt2uny77p+Wu
	 +WCCKqXznk2Jn97OVZuH3JFsNO/flF5Qx4+nBOnqVBY5fGIpi6tK354gXpH2uSHZST
	 o+emaZ/modeGQ==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BD1F17E0630;
	Thu, 15 May 2025 15:31:47 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:44 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add missing #reset-cells
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
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

The binding now require the '#reset-cells' property but the
devicetree has not been updated which trigger dtb-check errors.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
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

