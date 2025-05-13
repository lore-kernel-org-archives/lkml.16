Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4012BE0EC;
	Tue, 13 May 2025 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156008; cv=none; b=ggzaIZl46exBHCX2Rlno6UIK1otMGh8PtFbX68Gdi+fK2JH9FdyrMtMTdRb7MZYUAMoXVnKNatj5SUYLzU0+pO5lg2BtZhnj7lFz7I8kJkcHFv1/lVxu450oW4VY9v3JG61ETuL6lfVHGcA7tGh4rod3Tx+DIulwXTUYpKBnG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156008; c=relaxed/simple;
	bh=GuuUrOBDBLtQJTivMZS9Eor4DSDf3u+U86Nys8bePDI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=adtDO69/XJ+XLeEtezns+p5WM4tmbf3tkU6KicADDq9b7+pBQKfBGa5bRd89IvKwrx4ze9kSCWyNhJTTDcVHCWhsD3AQZCECjAgqBLxnSBdWv2M8aNwEKMIDhTqXUbbkltgrZXhfQerKzl5JzrOiyppE3ioSlxuHIP4lhCb75Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4N9AqEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4N9AqEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46810C4CEED;
	Tue, 13 May 2025 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747156007;
	bh=GuuUrOBDBLtQJTivMZS9Eor4DSDf3u+U86Nys8bePDI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l4N9AqEqFmYpOf1eS+C/6LqddeqrbI3zLDv3XxYt8GepWQNyzq2TZrDHdS9Vj0kco
	 uMQJJ0x1caJRkZ5lNsoRDCEbkf7zTsvl9ZtuB/iuQTul9YL/13kxdThbVD39+bN5pt
	 5+YwJzOZTRuRoJKQGKCBuF1hTgZ3mZeKTn4GqB3rlnj9AlVGSGtluuY5uWRHtVxtQ/
	 Q1M4O2N0Xgu9wIM8v8OUf2hf1jlVWgzjlFIiteU38xzXlnSI4khQPbEcCxP5ORDZbs
	 f99OaUvivtcpWILQiw9uAfUiRTOvwTY2ngZQdnGV81GQMs9MzUhUNYrrzksTd0s2pZ
	 JXjyX+ATuKN/A==
Date: Tue, 13 May 2025 12:06:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Conor Dooley <conor+dt@kernel.org>, Fred Bloggs <f.blogs@napier.co.nz>
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250513153044.167187-1-i@chainsx.cn>
References: <20250513153044.167187-1-i@chainsx.cn>
Message-Id: <174715590563.2918523.6781766383894838049.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC


On Tue, 13 May 2025 23:30:42 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v2:
> - Add support for Firefly ROC-RK3588S-PC
> - Fix rgmii delays
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 910 ++++++++++++++++++
>  3 files changed, 916 insertions(+)
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
 Base: tags/next-20250513 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250513153044.167187-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds: leds-gpio: {'rockchip,pins': [[3, 10, 0, 259], [1, 29, 0, 259], [3, 16, 0, 259]], 'phandle': 273} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds (gpio-leds): 'power', 'user', 'user1' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#





