Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716A293B46;
	Thu, 10 Apr 2025 19:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314093; cv=pass; b=X6sB6gMvj1/+r6Dq2+hgk0q9v+xWu/k42wVkLsrZJus2pKJVRvzdtzizVpakzG9vmk6XgaUSjDC09pDPEXV2bAa2vy/D+wPt0AjTmSysaF97ACbPWvQ5jjV29UN+2kdHmIvENIE003TueM7CNIAE1Zl1+m4JfqN8sljXs0ePG7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314093; c=relaxed/simple;
	bh=hLHVUco3wXLFe0qDvcH8iFslh25oWJ9EJVIsFzigd+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hU0BFdkM47j7fEcyWpyf1Mj1NW3bLNG2qh4BfJXHBZ7PnDoy8PqGZNOs5Bwyy97lOyMKAEPisWd30+78mWtgkdHCLjiMEOxdJGUyRaFpkQD6u+VO7dh2nHb/Nw6jcTOArXWSJDsP7CP7A9aKyICeKL3tfXshlKz2wh+HAkeZkLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=K+He45Zj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="K+He45Zj"
ARC-Seal: i=1; a=rsa-sha256; t=1744314061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cRZ2Ck5pBqgNgLgGu28B0MvBLx73bnrH+fK0Ge9fVINgj03PM+Uq2QeaNg9BSpWqZpVag2HutUc6PndJiV1djAfZIyjapB6xVt+eHA+5KYKDLWqpX05/IpMM/HG9NJRILrCxfPlmBUrYMsQymL7jeioNU5iyKpynofWxpujtsZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314061; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VzU4tcRCWe90x9VFz0X/4AwrQIW/Skbx2gkRjFmqwGI=; 
	b=LjloAADxOwGupJcizyX/ibUtkQb3Jj4MS3DWDs4SeInWAk8XHedxUfWlmQTYfXjxqwl+Tx0b3k4LSs74w0di5bhtzuaXBnlLXvt+OrAQfCi1Gv6zm0yJKMrskBNfK3nrUTm4qro87bjypA1hku6nr3sqND9N0cJt2FlGUPiQDbI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314061;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VzU4tcRCWe90x9VFz0X/4AwrQIW/Skbx2gkRjFmqwGI=;
	b=K+He45ZjszeLtl5y6bIX21FaEzPrL2HQ3iS8/uIZ44rJ/xQEGr73SRhdU6Z9fDeP
	E4AAkEbvXXdEGB5A3sykPGnJs7Cwc8WPcQeGGeEMmSGi0cMYGDJm70X8S6bjB/nDbWZ
	FOhEXz82sws6ne+xVcrN5BSP+MO1+5X5S1PZtJ/w=
Received: by mx.zohomail.com with SMTPS id 1744314058339686.5403179777842;
	Thu, 10 Apr 2025 12:40:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:00 +0200
Subject: [PATCH v2 08/11] arm64: dts: rockchip: Add RK3576 HDMI audio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-8-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
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
index 91aaba3b2b7c6d208254025cfb9ab711e0d424f5..848c82d70a076ee48049de1818245767133ed95f 100644
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

