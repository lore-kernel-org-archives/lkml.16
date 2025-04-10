Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05796290BAC;
	Thu, 10 Apr 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314099; cv=pass; b=dxjptf2IdaK/vaxXyhvmHGIIYTdeNONWOZPVhui9eyaiToQ63Js/Fpx07OyrfNwxfRYQ2B7BoE5AJs2C+ViwsPSt2ELQ1RU/r7HDXK5gWvkmaDtSeDcXogx6QiPK1uACkwq5upKkKzQE/rceZZkbAXFARlFf1+65l2QrH3gjbwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314099; c=relaxed/simple;
	bh=LIWhSkztsHdtiQJOWm9kFgxrhEX36ZKVJlpfWa6/0XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/2dPKpzEVuKtaTgwCxJMEbLhQ26EhY1ir4/e8fuWouf0/FfecpB5IGveK5WY+HWjmiTfgbmGF22tliwPyVxlNh68Fa0U8LvwIA1bzWBdXhsJaligjkXjqOmhgXPfZL0a8KiDvBW3I4HPOMOP+jPThDtfSp117+/uOSqJGKECFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=EPCUcNGL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EPCUcNGL"
ARC-Seal: i=1; a=rsa-sha256; t=1744314065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A1CKbZtIJUzRTJlzsQ/kya6yBho1WzuQO+SwhhKLWuTVxGQ+jbkdoEMYS4YP2IGWOna1fjgVRILyfz7h9hqMuegaPTdZM2v05PMxvt/geTDG3WkVmYJc67Y2WbKKPMzLdBCuXyvzWQMOetzYRFPjiUxWM8i2H0SN5AebJ3Ex6ZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C9kRJjrJf/qsICsGCMHWFKhYH7GKP7YwXiHqeUICU6g=; 
	b=dXFH3VM2oKO8a973NWG5Ds8WLZAy1bv2V8yuPSaSHhd5fGn0JFFmkBVrKB9MDgxZovcQ94ktGj3PoAzKbZHIMlZ7r/947oId5U1/Q8u2lwXVeeySfr/8MVlKrCJ8jtWzzMhI4jSvF55fSbQCa1jv913szgG386dDNA6eMhq5x5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314065;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=C9kRJjrJf/qsICsGCMHWFKhYH7GKP7YwXiHqeUICU6g=;
	b=EPCUcNGLFqSg7tsdV9XvUe3H48HXDhF75P6nOMDzOGTAxjv/WoDCgvydK12URhf0
	/IGF7/TdFUrJ5ys2D/JuVNG5Y97+pboOBrhMvl1qTJInfIYSqfHSMsrM5SQlWQwZb+b
	CXgoDhuF9cVqYj+wNNFZA1rDVXo3G0vTkdfBtbnQ=
Received: by mx.zohomail.com with SMTPS id 1744314064280299.56447684337707;
	Thu, 10 Apr 2025 12:41:04 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:01 +0200
Subject: [PATCH v2 09/11] arm64: dts: rockchip: Add analog audio on RK3576
 Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-9-c64608346be3@collabora.com>
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

The ArmSoM Sige5 board features an Everest ES8388 codec to provide
analog stereo audio output, as well as analog audio input. The codec
hangs off the i2c2 bus and responds to address 0x10. It is connected to
the SAI1 audio controller of the RK3576, with one SDO (output) lane and
one SDI (input) lane.

The codec has two sets of outputs. One set, LOUT1/ROUT1, is connected
through a set of 22uF non-polarised coupling capacitors to a 3-position
connector that appears to be a clone of the JST BM03B-SURS-TF header,
and is capable of mating with a JST 03SUR-32S (or JST 03SUR-36L if you
prefer lemon-lime) or compatible clone connector. The right headphone
output is the one closest to the Type-C DC input connector, the left
headphone output is the one in the middle, and the third position, the
one closest to the USB3 Type-A host connector, is puzzingly labelled as
"HP_GND" in the schematic but is in fact connected to the codecs RIN1
input through a 1uF non-plarised coupling capacitor.

LOUT2 and ROUT2 are routed to 1mm test pads T36 and T37 respectively.
These are located on the bottom of the board, and do not go through any
coupling capacitor. For use as line out, the ES8388 datasheet recommends
adding 1uF coupling capacitor if one wishes to use it as a line-level
output.

There is also a pair of inputs for a stereo microphone, going from two
1mm testpads T34 and T35, which are decoupled with a 100pF capacitor and
pulled to 3.3v and ground respectively. These inputs then go through 1uF
capacitors each and end up in the LINPUT2 and RINPUT2 pins of the
ES8388 codec.

The codec's power inputs are routed to receive 3.3V for both its analog
and digital inputs, though from different supplies.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 828bde7fab68dc6bcbd13d75c8a72540b3666071..0979d1e0cee7a18a6bcbd08ed19cc835f2186960 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -56,6 +56,34 @@ red_led: red-led {
 		};
 	};
 
+	es8388_sound: es8388-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "On-board Analog ES8388";
+		simple-audio-card,widgets = "Microphone", "Headphone Mic",
+					    "Microphone", "Mic Pads",
+					    "Headphone", "Headphone",
+					    "Line Out", "Line Out";
+		simple-audio-card,routing = "Headphone", "LOUT1",
+					    "Headphone", "ROUT1",
+					    "Line Out", "LOUT2",
+					    "Line Out", "ROUT2",
+					    "RINPUT1", "Headphone Mic",
+					    "LINPUT2", "Mic Pads",
+					    "RINPUT2", "Mic Pads";
+		simple-audio-card,pin-switches = "Headphone", "Line Out";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
 	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_12v0_dcin";
@@ -618,6 +646,25 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcc_3v3_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sai1m0_mclk>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -657,6 +704,15 @@ led_rgb_g: led-green-en {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai1m0_lrck
+		     &sai1m0_sclk
+		     &sai1m0_sdi0
+		     &sai1m0_sdo0>;
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;

-- 
2.49.0

