Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24C71F3D5A;
	Fri, 31 Jan 2025 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738358605; cv=none; b=uIgsKGntBqwBAu8DkjsV+2f4dYcubWlL7suDb9qEfx6D3cQjtt1AM7nF75GtuOEAYbqBvGsSZnplHk4+X0vVoXj2btBu1/xWVZZbJ3oZfVMBih1H+az75XEmfr4LshGyIMf3E5mFpPKp39SKOOdxrRFiJPaTaAXFyzew9NYhIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738358605; c=relaxed/simple;
	bh=/OS0LJz7wGEUpGR+VvSZsu8R7CgAohC+kmS8JtEiaVI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YbNaQmEYM47t68UH4Aac+yH75a6eIa/umbrOr1VY3hfgr3P1/Dzm+SZBgu6Hk3V9TdGgG+bIuCEkRdFcb6RXASqT9BxwGtRKlFoXe/E1aTw57KsQf0GDS+xBrx/3DVi/WKu4Wx0PZiJcZFwdOXMb8FAuhPHcGN18D72vCKZQHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMhwrxun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMhwrxun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A26C4CED1;
	Fri, 31 Jan 2025 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738358605;
	bh=/OS0LJz7wGEUpGR+VvSZsu8R7CgAohC+kmS8JtEiaVI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AMhwrxuneDEerKPohzvNX4q54TznV3ECcDXgGN5gjOaRoDkjbtomCg7/2fV6fPYku
	 VcV4M7zmZmqwqbbfHnZA+OPS+ykMcRQ3tNhmZ30B7Y4lp/4y/6LJTNMxh8ZPm+rqJ8
	 XH5sL2NjUgq1lqPAI0uEQlpxVpeLrQDuo/6tjIg0JtVe3eefQZACbW8FwZImxUwKqA
	 2yBOqp3XfXenCxWvNASz8upaFKPEq3DuMtg4Yr1C8hNfaepa+z0ppYlx1geJDnnVaD
	 kzTvtkelBHO6e7z/yYZULxxLUrZTB+zWM4K0gyKmOo9Lul49qdGTVDAKzHcHav/k9X
	 HPKd01fTMMsww==
Date: Fri, 31 Jan 2025 15:23:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 Karl Chan <exxxxkc@getgoogleoff.me>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Artur Weber <aweber.kernel@gmail.com>
To: Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
Message-Id: <173835855352.46011.13506160179490240246.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick


On Fri, 31 Jan 2025 20:03:17 +0000, Ferass El Hafidi wrote:
> From: Ferass El Hafidi <funderscore@postmarketos.org>
> 
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Android TV 9, upgradable to Android TV 10
> 
> There are multiple variants:
>  * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully
>    labeled on the board)
>  * 2. Blue PCB, not much documentation about it, presumably manufactured
>    between 2021 and 2023
>  * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
>    changes compared to the 2020 variant
> 
> Among these variants, there are many boards using multiple different
> Wi-Fi chips.  Supporting all of them is out of scope for this patch
> series.
> 
> As of the time of writing this has only been tested on the 3rd variant.
> It is believed that software-wise all three work mostly the same (if we
> don't count Wi-Fi), but testing on the other variants would still be
> appreciated.
> 
> The devicetree is based on the Amlogic P241 DTS.
> 
> Ferass El Hafidi (2):
>   dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
>  3 files changed, 313 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> 
> --
> 2.47.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250131200319.19996-1-funderscore@postmarketos.org:

arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: pwm@86c0: clock-names: False schema does not allow ['clkin0']
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white:default-state:0: 'heartbeat' is not one of ['on', 'off', 'keep']
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white: Unevaluated properties are not allowed ('default-state' was unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#





