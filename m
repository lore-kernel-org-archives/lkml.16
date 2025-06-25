Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2C33991;
	Wed, 25 Jun 2025 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886214; cv=none; b=moZedVUL2c+uWjUJebNj4XllD+y0+O/rqrDf9WqHWIPI/S6ZkAZ7EF2m6HZWnq/o7ZznDNyUWvdxZC9vn7jkUuoWNu5jkfk4cd/fieOCAKOeA3f+F1r8c8zYHitiCMDdW50mNXu3GWo5j3BCvuw6X66TrYrMdfdspSyQXSorIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886214; c=relaxed/simple;
	bh=4prugb93ZC+OeAoNZx1cEeiLG8KuCXkhRSGGMhghjJA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cq8mZm8rLzc2X678j8cDIxfs3ucH5H94T6K4GizXlCuMe59qHLT/X7ATrmYSp6hi3oGgEULlEuLb8UzWARhuSCMM7PlNDCNMEmNKAjyK/JZGNoWximbPMN3XhY4GC+UKIlt8iM6HHVC4G9qvva7QBoy4oEdatRb/xoT8Z4396uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPWmotoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPWmotoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A947C4CEEA;
	Wed, 25 Jun 2025 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750886214;
	bh=4prugb93ZC+OeAoNZx1cEeiLG8KuCXkhRSGGMhghjJA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QPWmotoN6Pr3ty6QhJmEQgUMG5YfGeAEEOQn7LC7Z7cZDOKx91RJlaLsvaPGR0rXv
	 IC60ujHJyn7RboNytYtA1jiZNinAFcw6L8FJBst5hFcJFmLamq3mdJKTHR9/7Y42cC
	 pWJwSiR1PbEkdqKtcy85s1MqZc/X4XuWlxiSiXDEvhJTLhUREsrDnhNsFkdvXP04GJ
	 aTaL3+VOuBZyIH6fypOyWoYPbaRlgtfJ0xFnKp+Eshkgy3pNnYxTl77CkM3M5npCYI
	 sePXc+qVfF6lFbJIQwnah57Pq1pjnvUryjvjZqnXYe9jk338LFpejeTYzlvkrKZd1C
	 Z9QhLgBPnhu+A==
Date: Wed, 25 Jun 2025 16:16:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rafal Milecki <zajec5@gmail.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Taishi Shimizu <s.taishi14142@gmail.com>
In-Reply-To: <20250625154315.114139-1-s.taishi14142@gmail.com>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
Message-Id: <175088617875.2239084.4449036167098088262.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: Add support for Buffalo
 WXR-1750DHP


On Thu, 26 Jun 2025 00:43:14 +0900, Taishi Shimizu wrote:
> Add Buffalo WXR-1750DHP under BCM4708 based boards.
> 
> Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: tags/next-20250625 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250625154315.114139-1-s.taishi14142@gmail.com:

arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@12000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@12000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@13000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@13000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@14000: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: pcie@14000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
	'fixed-link' is a required property
	'phy-handle' is a required property
	'managed' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@7: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
	'fixed-link' is a required property
	'phy-handle' is a required property
	'managed' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@8: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#





