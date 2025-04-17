Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69B210180;
	Thu, 17 Apr 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879486; cv=none; b=VCwI/jmqbst832WLPqFCANjHoWksdUCr+1ccrmA3GcktIjOTD0ngRO+u8QIu2HI2uYBvYf30hnAE9efqBetG3dmqr6IQ747INWtEJ5f1qTRnEMNoM/FJcfdmJ4b3OB2K/62fnXXfBJmc0Z6fP/MdGk4FlT+0MxPvkoLBIJ7ehGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879486; c=relaxed/simple;
	bh=VVe96Sxh4UjB+6wWfJmCsejUrl/4lubhEpkWMcF5TxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeG3RLORXFfaBI85URBkYayMzXn+SdN9oMLEcN+sLGppaCKmIsF8bc9/DZAWz0ysQiBlQdncE/8wdz9pT6K9KD0LptvashIIEcJzybL1cHuSKK4o0Ih3yPvjstkPmh1wK2SwD7+UJ/xMCEP68AW5xUweBAx/OADvkE8LZ89XhQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h2covrb2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h2covrb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879480;
	bh=VVe96Sxh4UjB+6wWfJmCsejUrl/4lubhEpkWMcF5TxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h2covrb2IhbfW59GvSoOFxkmnZvmdOyCqEgVB9EilghDYKRaF9/4A3wHrTKFTjdnS
	 B4I3PWS+mVqD3po1lpLjwK1SpnHUsv2/vffyylgdncBUOTmh4NQMjDY8piZjpVVP5u
	 WsdDwvvamTaYvMdYCAj+pobs6txy8rtoEcjDDR+HzVDXE7TrAjCfTDVIlm1FKAj9HT
	 L7s1ydd+r7hnISFYwSJMHQCuM6puGXZ7KZmRp3IT1R8+SjaX51mRqgIOQQ5TX5i1HC
	 wbOy85UgIWEGRa6D23OMqjYO7G0L/4Yn6amGpHzRvjUDUX/T1smeo4Z1IInRpfy8bg
	 SadijCsK+DJNQ==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26F0B17E0FA7;
	Thu, 17 Apr 2025 10:44:40 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:37 +0200
Subject: [PATCH 6/6] mt8395-radxa-nio-12l: Add sound node for headphone
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-6-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

- Add memory-region based on mt8390-genio-common
- Enable adsp node
- Enable afe node
- Declare the required pins
- Add sound node for headphone output routing

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index f2eb1b683eb76f783f5a13f28a78f6e33238b5f0..329c60cc6a6be0b4be8c0b8bb033b32d35302804 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -139,9 +139,21 @@ bl31_secmon_mem: memory@54600000 {
 			no-map;
 		};
 
-		afe_mem: memory@60000000 {
+		adsp_mem: memory@60000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0x1100000>;
+			reg = <0 0x60000000 0 0xf00000>;
+			no-map;
+		};
+
+		afe_dma_mem: memory@60f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60f00000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_dma_mem: memory@61000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x61000000 0 0x100000>;
 			no-map;
 		};
 
@@ -152,6 +164,16 @@ apu_mem: memory@62000000 {
 	};
 };
 
+&adsp {
+	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
+	status = "okay";
+};
+
+&afe {
+	memory-region = <&afe_dma_mem>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
@@ -514,6 +536,18 @@ &mt6359_vsram_others_ldo_reg {
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 
+	audio_default_pins: audio-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI>,
+				 <PINMUX_GPIO69__FUNC_AUD_CLK_MOSI>,
+				 <PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0>,
+				 <PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1>,
+				 <PINMUX_GPIO73__FUNC_AUD_DAT_MISO0>,
+				 <PINMUX_GPIO74__FUNC_AUD_DAT_MISO1>,
+				 <PINMUX_GPIO75__FUNC_AUD_DAT_MISO2>;
+		};
+	};
+
 	dsi0_backlight_pins: dsi0-backlight-pins {
 		pins-backlight-en {
 			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
@@ -854,6 +888,26 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359";
+	model = "mt8395-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	status = "okay";
+
+	headphone-dai-link {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi1 {
 	/* Exposed at 40 pin connector */
 	pinctrl-0 = <&spi1_pins>;

-- 
2.49.0

