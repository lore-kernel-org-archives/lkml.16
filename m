Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349223FC64;
	Fri,  7 Feb 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941699; cv=none; b=KTwfqCtLsxAYqS1ZOuySxwuORi2A8y0Axmh5sE7jQGbuIkuAcpvC1U4WBh3fi+dfjxoHtV/klPNMZZaKubvQE7m29luAiDemWA942RN+wxluWPmMzmoTQHVNs78wrnbC8zG7VY1/nRF2idGe0q4POXeBj2Ala327WC1bN3PkzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941699; c=relaxed/simple;
	bh=BcaIGD1WwgtYK/3UX6TqGEgv5jNlncxbn2IW0AxOsfo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fosU6lBBK4jNynLPh/Coaz1XQ1uQFtqwtpE/ohtERBqOmTrTJgmFSFaFZerepwKg9M2C2a4JH4SGDKnyBZd/zUaP0c/+zIVARVE7XmdOwZYOKq8aVAQVUtFS5oW01BjqM5TxNzqcpQIhtVTNDQQc4ZYiWGpWjAm8G8PkZTYmCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNirZF3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNirZF3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54999C4CEE7;
	Fri,  7 Feb 2025 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941698;
	bh=BcaIGD1WwgtYK/3UX6TqGEgv5jNlncxbn2IW0AxOsfo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WNirZF3Uc/QsUCNhuzr9RMbWlPSjcImb9wTl6ZQ2stdTTSAmakYsbMZj5itB0GC1o
	 4h5m0tLmMggkNXSSI+SZ5GFtDqnb1LcO7TW/uNlbkMvg/n74J3E56DZS/71GXpaaVO
	 uBuhCJtpnfCTzgqeNiMNaSA+D/kf+SCjuiP1WKcp8UDklRWKWxXb15KMv5rSFzjz9Y
	 wJjGmbI5AXOlRI+xHN48Zc+NpJtr4ZeJJ7wkmWXJzHgqLP3IHVR87VL3jD0HGn8O/B
	 lzxvzwRnXoexFWgE37+Sxdd4UU/jc1O2oLzPgj39ScQ/RuUaqhiZbdS75tUiwkDeUD
	 g6GeTxYfB2cdg==
Date: Fri, 07 Feb 2025 09:21:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, kernel@collabora.com
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
Message-Id: <173894150906.331293.4896725763364735044.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Add support for Mediatek Genio 510 EVK board


On Thu, 06 Feb 2025 11:38:07 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the basic support of the Mediatek Genio 510 EVK
> board, based on the Mediatek MT8370 SoC.
> 
> It adds a device-tree file for the board (mt8370-genio-510-evk.dtb)
> and an include file for the SoC (mt8370.dtsi), in order to be able to
> boot. As the board is very close to the Genio 700 EVK board, an include file
> (mt8390-genio-common.dtsi) is also created to factorize the common
> definitions.
> 
> The Genio 510 EVK has following features:
> - MT8370 SoC
> - MT6365 PMIC
> - MT6319 Buck IC
> - 4GB LPDDR4X
> - 64GB eMMC 5.1
> - 12V DC Jack
> - Micro SD card slot
> - Push Button x 4 (Power, Reset, Download and Home Key)
> - LED x 4 (Power, Reset, System on and Charging Status)
> - USB Device Port x 1 (Micro USB Connector)
> - USB Host Port x 1 (Type-C USB Connector)
> - 3.5mm Earphone Jack x 1 (with Microphone Input)
> - 3.5mm Line Out Audio Jack x 1
> - Analog Microphone x 1
> - Digital Microphone x 2
> - Gigabit Ethernet with RJ45 connector
> - HDMI 2.0 TX port with Type A HDMI connector
> - eDP port
> - 3x UART with serial-to-usb converters and micro USB connectors
> - M.2 Slot x 2
> - I2C Capacitive Touch Pad
> - 4-Lane DSI x 2
> - 4-Data Lane CSI x 2
> - I2S Pin header
> - 40-Pin 2.54mm Pin Header x 1
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v3:
> - Reword commit messages to use imperative mood
> - Add missing code-review trailers in commit messages
> - Link to v2: https://lore.kernel.org/r/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com
> 
> Changes in v2:
> - Reword "dt-bindings: arm: mediatek: add mt8370-evk board" commit
>   message to add details on MT8370 SoC and links to MT8188 and MT8390
> - Add note about gpu support in "arm64: dts: mediatek: add support for
>   MT8370 SoC" commit message
> - Split "arm64: dts: mediatek: add device-tree for Genio 510 EVK board"
>   commit in two, as requested by AngeloGioacchino Del Regno
> - Link to v1: https://lore.kernel.org/r/20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com
> 
> ---
> Louis-Alexis Eyraud (4):
>       dt-bindings: arm: mediatek: add mt8370-evk board
>       arm64: dts: mediatek: add support for MT8370 SoC
>       arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
>       arm64: dts: mediatek: add device-tree for Genio 510 EVK board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |    5 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    8 +-
>  .../boot/dts/mediatek/mt8370-genio-510-evk.dts     |   19 +
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi           |   64 ++
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 1033 +------------------
>  .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 1040 ++++++++++++++++++++
>  7 files changed, 1134 insertions(+), 1036 deletions(-)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9
> 
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com:

arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#





