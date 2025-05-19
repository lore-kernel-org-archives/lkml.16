Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612EA2A8D0;
	Mon, 19 May 2025 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659702; cv=none; b=XhSrCzY/xGAz8VjPZKSuIkA1uWOcV154USdX9jYLmKP8F/XifiaLCos6Mxq8EVK88STcpn1lFxIHJdDZyBq8gOoENHKzXAj03YX2n6hPTKuInT5+wN4SWxpWLq2rjBedJcGi9rgHX4H0t3NeE+PM3KzzdysGzMoTen67bgTheKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659702; c=relaxed/simple;
	bh=fe34uv+vZJuboUS2vJB9BIOWNbDbPeHkvFJbgEczgew=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=urZha2Ebcd9VJixY0AoL1zAas5VwBYEOAuXenvwTlbv9L1JqqzNN+ay9XHdsyhyLtA/pPc0cCV3x3izUsaje6UGkRcEoAWYoRrGQfiecsEKejbAyEeAjGDLYyJKVUe04bt7yUAnGa8K5XKrWFysQHwQONjaUZzGpQnWx64Pvne4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFrkF/S2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFrkF/S2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB79EC4CEE4;
	Mon, 19 May 2025 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747659701;
	bh=fe34uv+vZJuboUS2vJB9BIOWNbDbPeHkvFJbgEczgew=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HFrkF/S2McppJVusyqJl0fmqDd+4Mxqls0tBibhYf9SEFnauRUsAUFI9Mqt2xx+NO
	 OKNgo8H2oVx4utcspymUAU/2vHPkRpQ3qqnqmbETJHqiW/mq1uYZJ9rp0r7s3GAA/t
	 xAG7Apdy1HF6nA8muZyToEWF8/Z74uCNNyd+KxwrcV/c2HXDgtwQ/pC6UeoHtJpiYa
	 6IdI063Dz+F9lzq7Ajui3b02tkQa5ndV1nrdXneCdEvJ1uhkZOhuLbwy45N8/i4QOJ
	 hNCOwf3tOXXl1sKcyHd85CyOaAsj2nw6Ocr0pkh7EYG5FuJf+vfus1dwx3QduJbfbp
	 oPwrCN5Hu7wwQ==
Date: Mon, 19 May 2025 08:01:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nicolas.frattaroli@collabora.com, linux-arm-kernel@lists.infradead.org, 
 krzysztof.kozlowski@linaro.org, heiko@sntech.de, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, inindev@gmail.com, andrew@lunn.ch, 
 conor+dt@kernel.org, sfr@canb.auug.org.au, jonas@kwiboo.se, 
 quentin.schulz@cherry.de, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250519075432.2239713-1-i@chainsx.cn>
References: <20250519075432.2239713-1-i@chainsx.cn>
Message-Id: <174765962904.2025653.12342723895898738243.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC


On Mon, 19 May 2025 15:54:30 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
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
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 922 ++++++++++++++++++
>  3 files changed, 928 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250519075432.2239713-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']





