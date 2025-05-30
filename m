Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01A22B5AB;
	Fri, 30 May 2025 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609529; cv=none; b=pzqpuZNQrl0DKNRuLx5DSwXqS99uSu9fAH6+pwVhAWO+HQuteCDvvrRXQQzrFf5XvrJ+7C+fq/iW94S9tLX7u3w28fWAXWnhwT4uk8Ef78AjOL8p5deyPapnXRemsdG9RJ/efMFsEm5goHMsEWp3xPsF5hxVYRmVZT4DD8az2zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609529; c=relaxed/simple;
	bh=UQcVtwjs57NCo0a9YDF3wREUlaK90WOqq5g46sAvigg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=C3QA+OqYmjpo1I1nmk/28OtT2d+LB/iRB1fPFJ2ZeIIrUPVSGmw7VZyXCNA+zpKrAEUrXHDs1xwYh0c9vk+Nous54PKVihT5ez5saUnYBifUYNgjU3M1pmsOEVHQfrycQs/7gSDwtb8D1yFhG86kLX5OL7oF7au/4xOPxiT2d44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ra2olD78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ra2olD78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223FFC4CEE9;
	Fri, 30 May 2025 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748609528;
	bh=UQcVtwjs57NCo0a9YDF3wREUlaK90WOqq5g46sAvigg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ra2olD78R+++u/Q1wQAKNFyK/4T9kaxrz3Srtkq9PeX6OmziR448c53Lcgghrathh
	 OKRKbr6kJttLG1p8E9BJ68u4tH4LkbGZfsEtmhlFJXF+GofHpt99TiW+M+L50EmF/u
	 kESczJ/S8aSLX0l4YWtHplRy9G/caV9ZSGB/MS0Z5/A7S2tejjbQkIrsQVnzeQPcYw
	 1kforgKu/xq1IMD79Y7gbul6YEDjDlF8e3GOhuJUm9WupaLKV0NuPTcA6QfUZ1nmab
	 OvN+iObUZHeEDfQ4Sx57XzGwksmiH3NFey4NfbgG1Xnc3gK4pIq+EeORaJcIzhDqkM
	 hAVeT1v8tJCHA==
Date: Fri, 30 May 2025 07:52:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 quentin.schulz@cherry.de, inindev@gmail.com, sfr@canb.auug.org.au, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 nicolas.frattaroli@collabora.com, krzysztof.kozlowski@linaro.org, 
 andrew@lunn.ch, jonas@kwiboo.se
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250530031046.166202-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
Message-Id: <174860938675.1571999.8236778735226903385.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC


On Fri, 30 May 2025 11:10:44 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v5:
> - Make led-1 off by default (Chukun Pan, v4)
> - Add color settings for led (Chukun Pan, v4)
> - Remove vcc5v0_usbdcin
> - Put enable/gpio before regulator (Chukun Pan, v4)
> - Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
> - Update the name of vbus_typec (Chukun Pan, v4)
> - Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
> - Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
> - Remove usb_con node
> - Remove extra blank lines (Chukun Pan, v4)
> - Add phy-supply for u2phy3_host (Chukun Pan, v4)
> 
> Changes in v4:
> - Update the name of the regulator
> - Remove the i2s5_8ch node
> 
> Changes in v3:
> - Update the name of leds
> - Add more cpu nodes
> - Update mdio compatible
> - Fix the order in the node
> - Add the default serial port(uart2)
> - Patch 1: Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Changes in v2:
> - Fix rgmii delays
> 
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 838 ++++++++++++++++++
>  3 files changed, 844 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250530031046.166202-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']





