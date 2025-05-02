Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D757D253F19;
	Fri,  2 May 2025 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183868; cv=pass; b=tUXVsft6ZRcDoEPhcnijvORzusGQSWJK4+B3tadfkL+4SnY0tqzyAC+OOBcPBcKolcNziRWFdIJdH2Se2erZtE9ODmaoTvToXtlwDKR7/EbpzWC5xLUzS+UM3cV7uLOiffE1xeQVgBRuQhHb57MX+A3AR0SUHYVCVxchp2Ws2xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183868; c=relaxed/simple;
	bh=G5r+8wSTeKXYh5sogPC17TVylYXUxT/jT/+f1KJr0NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N10AZx5NKglTSKF4Fc2fVvX8nEP2UlTm6NtixKCdA7uo7bM+zCjxHuuLunkovwd0MG0lTKjxu93XGZbwBTP6zj6/yIUHZVy+3qaM3/fIcA6+MgYOEJ6qQselz/77sv9CkSWCAyqmOp+r8z2ottzd+HEPGI1OIQuR0Kz4QLZY0VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ZnrHWtIo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ZnrHWtIo"
ARC-Seal: i=1; a=rsa-sha256; t=1746183839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IGDBiVr+XbI3WMm93tqKREzyyTsjqqgjNFWqoYIgTDiig1NYqOiVzgqVRQkiScCnTMWFdPLipvqAvVIA9kVKHS2n9QI9+qzks13DzdEbTvQh7sHx94B6oGU3/a0w+6oaOegA/PCi5lYA+c7AHIYHdItHa7htbCbcGadyeD+wViM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aYTdTPo7gdfIod3VXco89+GzTJbHnShql4UCGhP3aKM=; 
	b=QVugQTjc/saGp/cYW1Npm3DDUDI5wdjWVc9rTMssQOW2X80coJu4tksGkj/k/cVCrzr9Xhf0WKvqgWF2DfTLYo1LmOYe8+43viKvCrQPzECuGraPXYYIq7r33SXfGLlI+OyftJG5RC7yzqGKeWyLSZLxS/BXPU0a/xVenxVLAZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183839;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aYTdTPo7gdfIod3VXco89+GzTJbHnShql4UCGhP3aKM=;
	b=ZnrHWtIol75xCy5ZulgNFrCG7HlQeZbeCiyb3iWQMGUHtKokaIjoocLZ8oUUIUu/
	wfp3UjcGqfZPMqYZZ3HH9JtgpEy2lHHHKbKkSY//GuerR8qt8RMI6SUgGtbJ+r438TC
	7FvYk5f15QwGW0X7eB/RWOm0IobMk6/JlLgVYZ2s=
Received: by mx.zohomail.com with SMTPS id 1746183837415802.8243954889812;
	Fri, 2 May 2025 04:03:57 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:12 +0200
Subject: [PATCH v3 06/10] arm64: dts: rockchip: Add RK3576 HDMI audio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-6-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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
index 7bb906c3cb4e80691abf39d0e57888f79370bc75..cb53561f55f3dfb913f40eaab7b0c8e090d23c31 100644
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

