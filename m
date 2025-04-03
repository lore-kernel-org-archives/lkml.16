Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B924EF75;
	Thu,  3 Apr 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690936; cv=none; b=oUE1fWmaXmZRvgc97mxCy00yBdogsQmTT2X+3T6mYi4IaCBuZ3mhYMogMgudtv/blNxv5wZ8aSTYkyU4MTFNlyqudf/vDIxhtlWTmv9wPOjHxxJuVMAP20lmSFimB7SHqDrRFnkn5hotR99onWKp8oqaBoMAax49A9VyFFX8A6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690936; c=relaxed/simple;
	bh=zumkyYgD4rKRxbVuiS3xNK72xMEL7G46+2AXsQp2PTM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AGMnTp6FK2XR1cZPBR2mumdKTVYFjEOFnOS7X93Uxu+jyXZjwFBjG7sFCe6+pE+S75KMep4bp+sg8vET2HwD7srEuBiTasARTgXp062Ba33QoWVYTM+oUxqFoL/x3TI9++c2VQbEfObO5bs0F/J3vIzHaPGBkjtK7CgyMe6ZPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAn1mFcb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAn1mFcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94184C4CEE5;
	Thu,  3 Apr 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690935;
	bh=zumkyYgD4rKRxbVuiS3xNK72xMEL7G46+2AXsQp2PTM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aAn1mFcb7H6bICJ3q77Y2KkevOwYQkQpfxxEt5dkNtIUmPbo8+rf6rI7/i+ZmrqDF
	 GQ8qmloqZtKEvPdwmAqegoZY0Zq0HeCZLpt5N1ASKyZuot87W1m1zDrNEJx6Z7goZF
	 q4av7dDSYKfMX2lxMqsrE0hWkVSSxRqUUJEyJAG9VawD4CqdMSfEKVUme+qptjwA9T
	 J0fq5D6JhaAqT5vKWz1lT4taJ7njeZe59y/5WxfFYp/2F3kG4w6uzldaX69N1B6H6S
	 S7l+qc3d+gV6K/a4AhvM+jt5esZlNKngtfnSZPoXZHWLsg70SWvGdq+JwB5uUfstm7
	 oYJLRDmmHhfbQ==
Date: Thu, 03 Apr 2025 09:35:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org, tglx@linutronix.de, krzk+dt@kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 maz@kernel.org
To: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
Message-Id: <174369066487.2789685.6006460527429704975.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add ST STM32MP2 GICv2 quirk for EOI split mode


On Thu, 03 Apr 2025 14:28:02 +0200, Christian Bruel wrote:
> When using GIC EOI split mode, GICC_DIR fails to deactivate the interrupt,
> leading to a WFI freeze. On ST MP2, GIC cpu interface is limitted to 4K,
> thus GICC_DIR register is reachable with a 0x10000 remapping
> 
> When using GIC EOI split mode, the GICC_DIR fails to deactivate the
> interrupt, causing core freeze on WFI. On the ST MP2, the GIC CPU interface
> is limited to 4K, so the GICC_DIR register can be accessed remapping the
> register to a 0x10000 offset.
> 
> Christian Bruel (3):
>   dt-bindings: interrupt-controller: arm,gic: Add
>     st,stm32mp2-cortex-a7-gic
>   irqchip/gic: Use 0x10000 offset to access GICC_DIR
>   arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in
>     stm32mp251.dtsi
> 
>  .../interrupt-controller/arm,gic.yaml         |  1 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  2 +-
>  drivers/irqchip/irq-gic.c                     | 47 ++++++++++++++++++-
>  3 files changed, 48 insertions(+), 2 deletions(-)
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
 Base: tags/next-20250403 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250403122805.1574086-1-christian.bruel@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#





