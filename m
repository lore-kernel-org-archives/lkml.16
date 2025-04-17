Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861BB22D4D0;
	Thu, 17 Apr 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885243; cv=none; b=YG/a5PnMobJOHGcGuamYFr1vmxP5zU1OtmYT+aXDdoxZGHnHR1ti0/ieg1ZdQgKE7zAD+cijGIhu2rHmfZr1ocGOUmsXmlksrnNs7i6w0s4euDV/JVBJkH1MsyJtFZpUuJ7LYjM7hqsFPT1UVyZDjC/+gsdkoHfTKAwvR6sUTuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885243; c=relaxed/simple;
	bh=WRnhoRkIr70U1V8oy6PCzLc05NirL3E4r0jVZ3vL3ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uck66V7z07mghkBQowUq4yXdBM8p1FIpiSXwsdOnptykeXRQVJQj4IlSW91aqDpsZq9O1hmOCmcjrwdLmL06QCIIKI6MMHCo/lazhfCTkRLAJHQRII9icJb6riyQ7r8ZhAK8oESOFDIDk5KgFiU1DFffxF5V/exfqA0WJfuTiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D4GS+0CN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D4GS+0CN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885239;
	bh=WRnhoRkIr70U1V8oy6PCzLc05NirL3E4r0jVZ3vL3ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D4GS+0CN41JAGoWTB4z+qdgFS1J5ek6hhXvb5S8KRKYFOQj1yahubH3wsDCLJ1wtR
	 JKJCZwngb5wYd/lI6QD1p817VdOEUHTqBCocrUZrGkQvI8sWoZSlN37X4Llo91j8Kd
	 x5t9MAVVIJD67tWeV2s6NOMH/P34i2PeUIcvPPeg8YOBnAK3EmtNCvvuMkW3Btx6r1
	 RtdTxF8l79BAzuhbgP4FRJ6H/Mq2IPI7uBTverDeoZkLu244boW1KASMG9Q0sMNqED
	 ts5NL0t7tm0CGWcSEPKH4d2JyBxreA4VspdG3i/3aG/X3vmv33jbFfk20luPzbe/ko
	 /UYWE7qD9ohTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B622917E0C4F;
	Thu, 17 Apr 2025 12:20:38 +0200 (CEST)
Message-ID: <a87a22b3-b263-4044-ab89-54c805fcc82a@collabora.com>
Date: Thu, 17 Apr 2025 12:20:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mt8395-radxa-nio-12l: Add sound node for headphone
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-6-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-6-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/25 10:44, Julien Massot ha scritto:
> - Add memory-region based on mt8390-genio-common
> - Enable adsp node
> - Enable afe node
> - Declare the required pins
> - Add sound node for headphone output routing
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Please stick with the usual prefixes.

arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card

Also, the commit description should not be a list of things, but rather
something that explains what you're doing fluently.

"Add a memory region for xyz, enable the Audio DSP and AFE nodes and
assign them to the newly enabled sound card node along with the required
pin configuration to achieve sound output to the 3.5mm headphone jack
found on this board."

Reword to your liking, that was just an example.

Cheers,
Angelo

> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index f2eb1b683eb76f783f5a13f28a78f6e33238b5f0..329c60cc6a6be0b4be8c0b8bb033b32d35302804 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -139,9 +139,21 @@ bl31_secmon_mem: memory@54600000 {
>   			no-map;
>   		};
>   
> -		afe_mem: memory@60000000 {
> +		adsp_mem: memory@60000000 {
>   			compatible = "shared-dma-pool";
> -			reg = <0 0x60000000 0 0x1100000>;
> +			reg = <0 0x60000000 0 0xf00000>;
> +			no-map;
> +		};
> +
> +		afe_dma_mem: memory@60f00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60f00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_dma_mem: memory@61000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x61000000 0 0x100000>;
>   			no-map;
>   		};
>   
> @@ -152,6 +164,16 @@ apu_mem: memory@62000000 {
>   	};
>   };
>   
> +&adsp {
> +	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
> +	status = "okay";
> +};
> +
> +&afe {
> +	memory-region = <&afe_dma_mem>;
> +	status = "okay";
> +};
> +
>   &cpu0 {
>   	cpu-supply = <&mt6359_vcore_buck_reg>;
>   };
> @@ -514,6 +536,18 @@ &mt6359_vsram_others_ldo_reg {
>   &pio {
>   	mediatek,rsel-resistance-in-si-unit;
>   
> +	audio_default_pins: audio-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI>,
> +				 <PINMUX_GPIO69__FUNC_AUD_CLK_MOSI>,
> +				 <PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0>,
> +				 <PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1>,
> +				 <PINMUX_GPIO73__FUNC_AUD_DAT_MISO0>,
> +				 <PINMUX_GPIO74__FUNC_AUD_DAT_MISO1>,
> +				 <PINMUX_GPIO75__FUNC_AUD_DAT_MISO2>;
> +		};
> +	};
> +
>   	dsi0_backlight_pins: dsi0-backlight-pins {
>   		pins-backlight-en {
>   			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
> @@ -854,6 +888,26 @@ &scp {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "mediatek,mt8195_mt6359";
> +	model = "mt8395-evk";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_default_pins>;
> +	audio-routing =
> +		"Headphone", "Headphone L",
> +		"Headphone", "Headphone R";
> +	mediatek,adsp = <&adsp>;
> +	status = "okay";
> +
> +	headphone-dai-link {
> +		link-name = "DL_SRC_BE";
> +
> +		codec {
> +			sound-dai = <&pmic 0>;
> +		};
> +	};
> +};
> +
>   &spi1 {
>   	/* Exposed at 40 pin connector */
>   	pinctrl-0 = <&spi1_pins>;
> 


