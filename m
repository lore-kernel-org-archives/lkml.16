Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0D280CCF;
	Tue, 27 May 2025 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368584; cv=none; b=VAcLJejJ/SR8XL+CIWl//JtvcaJmIgm+9v4BuI7pU0mViqNkiuSzOKelXp0RzInX0qvrNEcrVAXgwbGFMlsIBV1OjlRBk+xi7cOYcacZ2NCO+9HcFXdLoFO0I7tWvX5tE9q91+Cs2xISzRV3TXEn/pGGkTkuoZnsyGsyy5+OARA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368584; c=relaxed/simple;
	bh=sV+VhsTFkVG+PDShstWZZdPvkV2+Hq/qwiK6U/6fXX4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RuwtecUHYp1fwM8WX/XJE/9amD43axnjSv3f6WkbLY0rMJJN8eMGopa4m8SQRzQArWGuCork8PoT5734p3cEYBmQLFYwN8lj5glHiT6OTK07m19ZgAqK3qzy29lQ4abqsN91rHUHpdJlnMRglJhdD9yosJEgXt0K9t9FJUeII84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMlTMlYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMlTMlYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCD1C4CEED;
	Tue, 27 May 2025 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368584;
	bh=sV+VhsTFkVG+PDShstWZZdPvkV2+Hq/qwiK6U/6fXX4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pMlTMlYA7liTZY9OykGRA3FaijfG6V9VIWY5Ld8zatBhpjG4hSogpxyr9bSf5UqJh
	 8iWA5Y3nICnvHva2hPy7O96VjfGDSNFWmL5vshJtgbPvkmOtjOro6W0NRN7bNmqkgP
	 TUnr1VfvE0b524sw5rYpAz3q7jrhDu5MdQhZMqHnjr6lUkMa8GzkHSUJ6CNtJiO9sL
	 tkhSiGusHHXmAaOOJPsduatEs16UfTxqF08vbAeGVBlKRMoQIXMxyMYf8X2sD268Hx
	 dyYrjIx7QcHfw0WKB6BPHDgjMkOTpGFXOBikATkXZv6+yEDCYanjnGnutVk/HGntOR
	 mqo12813VnD0w==
Date: Tue, 27 May 2025 12:56:22 -0500
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
 linux-arm-kernel@lists.infradead.org, Ed Tanous <etanous@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Leo Huang <leohu@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Deepak Kodihalli <dkodihalli@nvidia.com>
To: Willie Thai <wthai@nvidia.com>
In-Reply-To: <20250525-dts-v1-0-9ac63ad3bf15@nvidia.com>
References: <20250525-dts-v1-0-9ac63ad3bf15@nvidia.com>
Message-Id: <174836830738.840800.7951224308265522325.robh@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: nvidia: Update DTS to support
 GB200NVL hardware


On Sun, 25 May 2025 18:20:16 +0000, Willie Thai wrote:
> Update the DTS file for the GB200NVL hardware change.
> 
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Leo Huang <leohu@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> 
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> Willie Thai (3):
>       ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
>       ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
>       ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the HMC gpio pin
> 
>  .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 39 ++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> ---
> base-commit: 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3
> change-id: 20250525-dts-8eca0cb6dfae
> 
> Best regards,
> --
> Willie Thai <wthai@nvidia.com>
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
 Base: using specified base-commit 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250525-dts-v1-0-9ac63ad3bf15@nvidia.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@200 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@280 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@300 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@380 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@480 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@500 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@780 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@800 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#





