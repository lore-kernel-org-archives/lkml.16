Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6123F281;
	Fri,  7 Feb 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941697; cv=none; b=E3+CqkwLkTo2ilPZG1fYEtYakV2CKU84SrhKlqZT+LhmVvK+wcxCxfXV3uuph7xTxZiv2Rk1I/MBB9xNM4I4Y4WsoUVOt4u0J2Vl3mIFI1E26nN2yLDM9OenIyVrqc3VfUtnUOoJpd8dPHFu9RDGmTzNuA2E7AfqdHcBfNmFWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941697; c=relaxed/simple;
	bh=hoOzUk8yEUXbW5Jl+9Yy9IINt/g5MuAe1JuDjRocquQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=R+RzPxHwniYI0MkwzlH01awmRa/lDh2+2pQZEtuz1Lvlxp4bAM8wX34VRMmeuq3BkuZjslmdesdJCAFUwhm72o5o9AKvhiHxwKWbmCQ6udPV9svpFCmM2Va9NIsvklvqN2ghCaCIDq4R+s6p4zyinWdpvF7R+Phme/GR9D5xyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdXRZnhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdXRZnhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA20FC4CEE5;
	Fri,  7 Feb 2025 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941697;
	bh=hoOzUk8yEUXbW5Jl+9Yy9IINt/g5MuAe1JuDjRocquQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DdXRZnhiDkG/wSkRgh/Maz5WH4bIpoJGgncnk6JG5XV7Ye5bfF4tZ1SyPyJeHWGMV
	 kAKWG5zuHIwuowdZ26JtxV+R+PAKyXeJa5jRPIj76GoClxv7+vtKstgQuq9dZq0kLY
	 1/M+8uNIZaBKgqbbRPSLIQqukYWsZ9DzzgBVj8tqUfFXsJ/X0PtS65lx4yNwt+htvC
	 NML5U7rEAqkQl/qr9qc6aHgx/V+CecC5RBrGss37lYsiBtfyteKrbbeqJt+PUrxoGS
	 0nrWYzDCUqqaHdG4eX23xA4pw6ud0Cwedh5852lT9fsHfERu7ivJhEVL/cXrkJ7iy+
	 fyanB9TYFw7ew==
Date: Fri, 07 Feb 2025 09:21:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Hari Nagalla <hnagalla@ti.com>, 
 Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Judith Mendez <jm@ti.com>
In-Reply-To: <20250206235200.3128163-1-jm@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
Message-Id: <173894150832.331169.2724539558758994273.robh@kernel.org>
Subject: Re: [PATCH v4 0/9] Add R5F and C7xv device nodes


On Thu, 06 Feb 2025 17:51:50 -0600, Judith Mendez wrote:
> For am62x and am62ax devices, this patch series adds device nodes
> for the R5F subsystem and C7xv DSP subsystem found in their
> respective voltage domain, based on the device TRMs [0][1].
> 
> This patch series also includes patches for enabling IPC for am62x,
> am62ax, and am62px by reserving memory and binding the mailbox
> assignments for each remote core.
> 
> Also reserve main_rti4 and main_timer2 for the C7x DSP as per
> firmware requirements.
> 
> Changes since v3:
> - Add SRAM child node for am62p MCU R5 core 0
> 
> Links
> v3: https://lore.kernel.org/linux-devicetree/20250204011641.1523561-1-jm@ti.com/
> v2: https://lore.kernel.org/linux-devicetree/20250131214611.3288742-1-jm@ti.com/
> v1: https://lore.kernel.org/linux-devicetree/20250127221631.3974583-1-jm@ti.com/
> 
> [0] https://www.ti.com/lit/pdf/spruj16
> [1] https://www.ti.com/lit/pdf/spruiv7
> 
> Devarsh Thakkar (3):
>   arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
>   arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
>   arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors
> 
> Hari Nagalla (5):
>   arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
>   arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
>   arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
>   arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
>   arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
> 
> Jai Luthra (1):
>   arm64: dts: ti: k3-am62a-main: Add C7xv device node
> 
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  25 +++++
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  12 +++
>  arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |  38 +++++++
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  25 +++++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 100 ++++++++++++++++--
>  .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     |  13 +++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  50 +++++++--
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  32 +++++-
>  8 files changed, 278 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 5532b8a9ce0e80514e37a1e082824934663580a3
> --
> 2.48.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250206235200.3128163-1-jm@ti.com:

arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#





