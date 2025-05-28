Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9E2857DD;
	Wed, 28 May 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435843; cv=none; b=U4ZT/rSqG7LIdhvsofsMmf8F8oJJRv/vB4ZeykKsjLTDBjUEh+7WTxdQ1uqgtPxtlZDnMBhUp01iVYUHF/bv8s8Ux85cLo0045vd2HePWgRYNshFf4fJXOLQCrTjgb2fYaK/5nQHdE+GGhGk3jcjvhIJvnCtx70OeiKAHSL1dbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435843; c=relaxed/simple;
	bh=SwIjqVSvohQeuyiIN8uNmg4HfM55OQFRpt3e7TbxcD8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gqzSjVl8jKfAJENx+sbZFb0cgWCVuuK66soIaDa5M5pr3EVLxcc+p2xihVvoR/CEvvJiaKJ0l9I8TA+AlAoyw4n1zy4SFNz4wEM2dt3RSgjblC3PHutycujEIDIFjOzbma1QQ/IwJjCRy4voyRd+8fGbWHSxses9qs0+b1qb/Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6LFxqXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6LFxqXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C89C4CEED;
	Wed, 28 May 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435842;
	bh=SwIjqVSvohQeuyiIN8uNmg4HfM55OQFRpt3e7TbxcD8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l6LFxqXiYbmvXE3d5oHFaMP/IYEtmIuQvHyEgP6i6Es59vyX6G2tFH2EcmgX7USz/
	 Zu6iviFZKESD6T/0kAU3SH4M36aqdUcxo8UgN23bVEa8j/It5Wsa+vhJiiJAbEz1KB
	 eNxeZhYiuxt98pGsccMpFYSxY5unPEoP5HwZZyvyJ/516Bg8dWHj2vVg/rryoi//cn
	 d0LrmR94N9X0hEen2iqLYbHl64HvCktAfuzI8nm7On4v2iFbYvlfFrUmWr8MyBGKYj
	 KABb26JvVbeuD3QnC/YcYfKG6nZOZArcd2miZTJ4gVuBVYSqDL0wiL8dAVDu5hY6JH
	 XyqFwilZK4pqQ==
Date: Wed, 28 May 2025 07:37:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Ge Gordon <gordon.ge@bst.ai>, 
 linux-kernel@vger.kernel.org, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org
To: Albert Yang <yangzh0906@thundersoft.com>
In-Reply-To: <20250528085457.481372-1-yangzh0906@thundersoft.com>
References: <20250528085457.481372-1-yangzh0906@thundersoft.com>
Message-Id: <174843567439.3636671.2589475239055731550.robh@kernel.org>
Subject: Re: [PATCH v1 6/9] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board


On Wed, 28 May 2025 16:54:57 +0800, Albert Yang wrote:
> Add device tree support for the Black Sesame Technologies (BST) C1200
> CDCU1.0 ADAS 4C2G platform. This platform is based on the BST C1200 SoC
> family.
> 
> The changes include:
> - Adding a new BST device tree directory
> - Adding Makefile entries to build the BST platform device trees
> - Adding the device tree for the BST C1200 CDCU1.0 ADAS 4C2G board
> 
> This board features a quad-core Cortex-A78 CPU, and various peripherals
> including UART, MMC, watchdog timer, and interrupt controller.
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/bst/Makefile              |  10 ++
>  .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 ++++++
>  arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 ++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/bst/Makefile
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi
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
 Base: tags/next-20250528 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/bst/' for 20250528085457.481372-1-yangzh0906@thundersoft.com:

arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: /: failed to match any schema with compatible: ['bst,c1200']
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@0 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@1 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@2 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: cpu@3 (arm,cortex-a78): Unevaluated properties are not allowed ('freq-domain' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: /soc@0/dwmmc0@22200000: failed to match any schema with compatible: ['bst,dwcmshc-sdhci']





