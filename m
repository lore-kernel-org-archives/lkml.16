Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3D79C8;
	Tue, 11 Feb 2025 00:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232659; cv=none; b=AHy1BwQzM/qRHGlvd4W8iGja8QcmTkvg/xsBQgyFpFKev1+hLBQaXKrKqW2NVmjsAmtXVe2DwNRNVnSsEdBnd0ODud1DrK9bjcgPZtppMvtjPk2ZFycSUaBTNf5SwQZcWZISd/CL7+BECdlpnE22Z5z/ycjK7Y0UXJ4sFqPVkVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232659; c=relaxed/simple;
	bh=Sp1oSx+SumT2w0Ph6TCS3iJkcnssGSZqf8MrbZyf9cY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=efrTbcurTm4KfqZN73CI6gEVYgg6qwF9siSHBlyciKUgDMrtjslbGtemCG3EHP/Yt8wh+rlv3lBioN0SAMjczt0IV61INg+hUn3JUHcJl/8r0OuNNnf99IyYDPB1sBqEIOiRi2p0mqgWlDHVCYpvJZ6UJwqEQc1W7uXKefUdL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1StL1MD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1StL1MD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB906C4CEE9;
	Tue, 11 Feb 2025 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739232658;
	bh=Sp1oSx+SumT2w0Ph6TCS3iJkcnssGSZqf8MrbZyf9cY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k1StL1MDMJNDhsxB3AGmGS371JqIo9suu850R50X2ZgKThHN238Gx0O4f3+A/a6yC
	 GEVwlmTqzV9vtKYd347TP9AwCuJ+MvJl2s3FPpAria6DOjZnmscaP0SKsrmveUkhFa
	 Gi8KzUNN7byhJ11ZlgqZdAHeubi8i1Kfr70pKqs+KIQaOmS/ApUgg0vSAoCO4h8lt3
	 fkwwmNU/i31Zi7cgKw9WxCJH7UfGx5gEi4XfEQDxniO6IAsL2ToMB4FLN5AJ5uYnCM
	 R+0cNVQH01ZsSkoqcq8Bu+BdBiFlUeAbOOOd2DQBaW+Ubwf1FKYIxvrC/J+hHstNGp
	 MLjdaOOzboKpg==
Date: Mon, 10 Feb 2025 18:10:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: martin.blumenstingl@googlemail.com, neil.armstrong@linaro.org, 
 jbrunet@baylibre.com, linux-sound@vger.kernel.org, khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Message-Id: <173923232962.304484.3474753599811601913.robh@kernel.org>
Subject: Re: [PATCH RFC 0/6] Add support for AUDIN driver in Amlogic GXBB


On Mon, 10 Feb 2025 16:01:23 +0100, Valerio Setti wrote:
> This series adds support for audio input (AUDIN) on the Amlogic GXBB platform.
> 
> It starts with a HACK commit which is necessary to make AIU (audio output)
> export its clocks. These clocks are necessary also for AUDIN, but they are
> already owned and controlled by AIU. Therefore in order to avoid direct
> dependencies between AIU and AUDIN drivers, we let AIU export its clocks.
> This export is done through the clk-regmap interface which is not public yet,
> so that's why the commit is marked as HACK.
> 
> The series then continues with adding dt-bindings, driver and DTS support
> for AUDIN. As of now only I2S input is supported, because it's the only one
> I could physically test in my setup, but other input sources (ex: SPDIF) are
> also allowed according to the SOC's manual and can be added in the future.
> 
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
> NXP SGTL5000 codec connected to its I2S input port. It was tested on tag
> v6.14-rc1.
> 
> Valerio Setti (6):
>   ASoC: meson: [HACK] let AIU export its clocks through clk-regmap
>   ASoC: meson: audin: add audio input dt-bindings
>   ASoC: meson: add AUDIN driver
>   ASoC: meson: add support for AUDIN in gx-card
>   arm64: dts: meson-gx: add audin support
>   arm64: dts: meson-gx: enable audin on odroidc2 platform
> 
>  .../bindings/sound/amlogic,audin.yaml         | 104 +++++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |   9 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  39 +-
>  include/dt-bindings/sound/meson-aiu.h         |   5 +
>  include/dt-bindings/sound/meson-audin.h       |  10 +
>  sound/soc/meson/Kconfig                       |   6 +
>  sound/soc/meson/Makefile                      |   5 +
>  sound/soc/meson/aiu-clocks.c                  | 123 ++++++
>  sound/soc/meson/aiu-encoder-i2s.c             | 119 +++---
>  sound/soc/meson/aiu.c                         |  22 +
>  sound/soc/meson/aiu.h                         |  10 +
>  sound/soc/meson/audin-decoder-i2s.c           | 247 +++++++++++
>  sound/soc/meson/audin-toddr.c                 | 403 ++++++++++++++++++
>  sound/soc/meson/audin.c                       | 321 ++++++++++++++
>  sound/soc/meson/audin.h                       | 119 ++++++
>  sound/soc/meson/gx-card.c                     |  12 +-
>  17 files changed, 1509 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,audin.yaml
>  create mode 100644 include/dt-bindings/sound/meson-audin.h
>  create mode 100644 sound/soc/meson/aiu-clocks.c
>  create mode 100644 sound/soc/meson/audin-decoder-i2s.c
>  create mode 100644 sound/soc/meson/audin-toddr.c
>  create mode 100644 sound/soc/meson/audin.c
>  create mode 100644 sound/soc/meson/audin.h
> 
> --
> 2.39.5
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250210150129.40248-1-vsetti@baylibre.com:

arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: audio-controller@5400: clocks: [[3, 38], [3, 40], [3, 80], [3, 107], [3, 44], [3, 39], [3, 81], [3, 110], [3, 113], [17, 0], [17, 1], [17, 2], [17, 3]] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: audio-controller@5400: clock-names: ['pclk', 'i2s_pclk', 'i2s_aoclk', 'i2s_mclk', 'i2s_mixer', 'spdif_pclk', 'spdif_aoclk', 'spdif_mclk', 'spdif_mclk_sel', 'i2s_aoclk_div_gate', 'i2s_aoclk_basic_div', 'i2s_aoclk_more_div', 'i2s_lrclk_div'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: audio-controller@5400: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: /soc/bus@c1100000/audio-input-controller@a000: failed to match any schema with compatible: ['amlogic,audin-gxbb', 'amlogic,audin']





