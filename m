Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9AF278777;
	Tue,  6 May 2025 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528219; cv=pass; b=EVwpEN54FnjjA9KtutZTSFYiIIobHkWrbfGdIbyYhdK8cJnCRZQLg+5LIJ6XQ52RoW5c+UD7AWIQUYMWFSpUE/9Mnv+raLbyE0/Lc+B1FVQhalhsNW0bJC0xVvVmu7Jy0z0gH35oo9yCiKbfhzqYpzu6Y2oGTw12bGY8Ihcx/jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528219; c=relaxed/simple;
	bh=IAyRN4R8QR7Ds5/pgBhdkREZPL1v56h1YmoOgOkEybg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oySgZp3dFlePusc1scdoSvXcJMdLmXokh9jEsjUZijEwkX3hIXMrnYkJPZwv5VsdK2HeqJmJg16VZgNrswLdXXKGgLTyK4WhAKyfWTiBMK156z9rVSd9fSuEgy0wernj5oZ/dqRN0dUQW3mKwTlEduXGvTNb1dyTdxTGqACb38E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=fKZpePs/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fKZpePs/"
ARC-Seal: i=1; a=rsa-sha256; t=1746528190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C76y26vKwaGzejYv5+YKfGJ+Fa6w0TyeuU0Y+GpH4blBlSe0Tg+7gA3GpFCRRHvMgKCw9lolyd8E2gSqrv9MTkhuE2VES70/2YmlobnEXvrE85WgkWT3sTKVUjUnB7HDYhjzuSbVjMGSWhftoi6HcCJBvOdd6Y3PJaeKo6eEDxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VxT8cr+193Obv8GfGr35buihctxekuhGDSXKGKcSfq8=; 
	b=laTJFK2K21pkc9+17acb5I5nVw6ELAIAqIRhlnDWq4P1pYwZ21jts28VbrvCaTu+fqEA8EJUO8tpxXGr3A+khwSKHgNo8/KpbGrbxFeXWDWYT++hvsoWVWC9B8t6yBsggc6wC/wo80YhFNwSwM7yx1TvV0COrjp2FDYaFN2jH7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528190;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VxT8cr+193Obv8GfGr35buihctxekuhGDSXKGKcSfq8=;
	b=fKZpePs/wbVR5qQ40+w/8djFfrySApNY+ACkxu2bqKFLYUzMkUirrjdqmtG25Ev5
	xBnmn69OPg0NFwYI9GN2BPf9GJeGlbievAV3NRbZQIAw86wtHbXLRuBH6RfurdS9tMw
	2XOkWASjd3ZPFoDB2W7L5peIQaEyvCoCq5xfIQtY=
Received: by mx.zohomail.com with SMTPS id 1746528189233583.4256418746694;
	Tue, 6 May 2025 03:43:09 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:41 +0200
Subject: [PATCH v4 2/5] arm64: dts: rockchip: Add RK3576 HDMI audio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-2-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RK3576 SoC now has upstream support for HDMI.

Add an HDMI audio node, which uses SAI6 as its audio controller
according to downstream.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 335a868a1200493d60d08983281fe5637a20ec61..79800959b7976950fb3655289076de70b5814283 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -413,6 +413,22 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai6>;
+		};
+	};
+
 	pmu_a53: pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -1069,6 +1085,7 @@ hdmi: hdmi@27da0000 {
 			reset-names = "ref", "hdp";
 			rockchip,grf = <&ioc_grf>;
 			rockchip,vo-grf = <&vo0_grf>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 
 			ports {

-- 
2.49.0

