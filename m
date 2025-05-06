Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806C286430;
	Tue,  6 May 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555832; cv=none; b=uSS2m1BOxCA+6MFesxB1E6sNxg2JsVJhBJDuInZ9PkwUJwmHwxUkcLuiRQ57LZLN3FqJEpQAIkDDUn+jqQCTDF5hiLC6Gn6IdEcKNG9SuDB1OYmwYHJ2EAFLHC9TovtbXRKODlLLrwFT8ZaxRpQAp5PtcG2lTA6VB4YlkHL+bWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555832; c=relaxed/simple;
	bh=k+mZaSBaKRCfObPQ+dsbeXUoUesj23G8rm5vuy4hQkg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B82iAVugDrwM5Fyak+nHthpyICFVqa42O0auE4jmGUiefX4PisvyBsv4iKnqBkgHW+zMnPz5EHt7BT4wKDVLCBWtOF+4IatPoldKHiy3lb0Tk0xQsvfF8TgJ+H91DKf/08HQibP0RKfP9g+Qhjv0EodkvEVooj7WLy2LCuNHbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnILdT60; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnILdT60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952E3C4CEE4;
	Tue,  6 May 2025 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555831;
	bh=k+mZaSBaKRCfObPQ+dsbeXUoUesj23G8rm5vuy4hQkg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WnILdT6026fJnLUCFRq2f39GIiWLmWFFlFKbCS1RkTbkN1Ro5NPLL00xt3IuzgWa6
	 mVc4xqnnYIFJDIAcOP3UxzS0YhjdDeYW68pmBElrVVDgaTteoCRTxc1s0XmCbRX5J9
	 kxX7arPEwlkC34yRC7p6xlfAPoRCbAYb9i/8T57lXtEg3BBYaPY1jmRUgJQtu/y7ei
	 RjSUgSfNbg/ml2CZ8970EimefJA7q0+ja3kweOaNzMZUnTYV+5KoekMzB8cw8RAuAT
	 EYX7tq1TuxxLTQNJGOjq0hwvd9ooa6auTWge7Qxfi/EjEJKbN244Oh/Rs7mPm8m8XW
	 FbCPOJN0Jf+6g==
Date: Tue, 06 May 2025 13:23:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-rockchip@lists.infradead.org
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
Message-Id: <174655575105.2171003.12510940387691309807.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] RK3576 USB Enablement


On Mon, 05 May 2025 19:26:35 +0200, Nicolas Frattaroli wrote:
> This series is the result of what I thought would be a quick 10 minute
> job, but turned out to be more like 3 days of pain, suffering, and
> confusion. This should be expected with USB Type C though.
> 
> The first patch in the series extends the inno usb2 PHY driver to fiddle
> with some GRF flags in that driver when the PHY is connected to a USB
> Type C port. Without this change, devices on USB-C simply don't
> enumerate at all, as the state machine gets stuck waiting for vbus to go
> low or something along those lines.
> 
> An alternate way to implement this would've been a vendor property in
> the PHY binding which is then checked for in the driver and needs to be
> present in all rockchip inno u2phy instances that happen to be connected
> to a USB Type C connector. This is what downstream does, for example.
> 
> Patch 2 and 3 allow Super Speed in reverse orientation on USB Type-C
> connectors to work, but I am not entirely confident in the solution I
> arrived at.
> 
> Patch 4 is what I think may have been the culprit of what originally
> made me add the USB2 PHY suspension quirk, but I'm somehow unable to
> reproduce that particular SError fest anymore.
> 
> Patch 5 adds the USB related nodes, including associated regulators and
> Type C controllers, to the Sige5 tree.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v2:
> - Rebased onto next-20250505
> - Drop the u2susphy quirk, as I can no longer reproduce the original
>   problem with various amounts of ripping up the DT and changing the
>   config. Yeah I'm not super hyped about this now being a heisenbug
>   either.
> - Drop the bindings patch, as Rob showed me there's a way to do this
>   without extending the bindings
> - Rewrite the usb 2 phy driver patch to no longer walk an OF graph from
>   PHY to connector, but instead first find the USB controller that uses
>   this PHY, and then use the USB controller's existing graph connection
>   to the usb connector.
> - Adjust the Sige5 DTS patch to now have two port connections from the
>   USB connector to the drd0 USB controller, one for high-speed aka
>   USB2, one for super-speed aka USB3, ordered as per its binding.
> - Add a patch for rk3576.dtsi to reference u2phy1 as a clock in the drd1
>   controller.
> - Add two patches to fix USB Type-C super speed in reverse orientation.
> - Link to v1: https://lore.kernel.org/r/20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com
> 
> ---
> Nicolas Frattaroli (5):
>       phy: rockchip: inno-usb2: add soft vbusvalid control
>       phy: rockchip: usbdp: move orientation handling further down
>       phy: rockchip: usbdp: reset USB3 and reinit on orientation switch
>       arm64: dts: rockchip: reference u2phy1 as clock on RK3576
>       arm64: dts: rockchip: enable USB on Sige5
> 
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   5 +-
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 113 ++++++++++++++-
>  drivers/phy/rockchip/phy-rockchip-usbdp.c          | 154 +++++++++++++-------
>  4 files changed, 376 insertions(+), 56 deletions(-)
> ---
> base-commit: 214464d4c3491d4eb2c0e9d1310d7f60c408b94b
> change-id: 20250328-rk3576-sige5-usb-230102aeeaca
> 
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 214464d4c3491d4eb2c0e9d1310d7f60c408b94b

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com:

arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: usb@23400000 (rockchip,rk3576-dwc3): clock-names: ['ref_clk', 'suspend_clk', 'bus_clk', 'utmi'] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: usb@23400000 (rockchip,rk3576-dwc3): clocks: [[18, 262], [18, 263], [18, 261], [22]] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: usb@23400000 (rockchip,rk3576-dwc3): clock-names: ['ref_clk', 'suspend_clk', 'bus_clk', 'utmi'] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: usb@23400000 (rockchip,rk3576-dwc3): clocks: [[17, 262], [17, 263], [17, 261], [23]] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: usb@23400000 (rockchip,rk3576-dwc3): clock-names: ['ref_clk', 'suspend_clk', 'bus_clk', 'utmi'] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: usb@23400000 (rockchip,rk3576-dwc3): clocks: [[18, 262], [18, 263], [18, 261], [22]] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: usb@23400000 (rockchip,rk3576-dwc3): clock-names: ['ref_clk', 'suspend_clk', 'bus_clk', 'utmi'] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: usb@23400000 (rockchip,rk3576-dwc3): clocks: [[18, 262], [18, 263], [18, 261], [22]] is too long
	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#





