Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F321DDD1;
	Tue,  8 Apr 2025 01:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076825; cv=none; b=o3pLkomkQQd7UGpxTV/6DId8YxjBwVaNLoGHCgqqO2orOknSq+Y0phYmJHAut6geyzYg4AExHEXmHOJdokzD6U0vmPSvUFRLrDF6vfmAi6FKJlHtZ5B3RdZxkrLzeAKgb72zzykya/lLlOrprQK5o1XUJnO6y2eMIm/BdjoxYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076825; c=relaxed/simple;
	bh=YA2FjLZ6C7Rd6ck30PIehjjNv9gQY/g7Hrv2FNC7Z8U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OB2HLp3eCvlS1l2Yv89ZE/wtP+hYPun8O16twFWtH0CnmAHHF9l6lGpwVDEumvT+QIkD11hq3HyoWh89JnyQBthitFlWrj1Sl8zS6ghiDKEWscbcVEEHBAGA5vRa5uc5J7SB8CXk1ICR9sV+7RPiPygCw+o/n4PIH9QsodZ2/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHINpG+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHINpG+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEDFC4CEDD;
	Tue,  8 Apr 2025 01:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744076825;
	bh=YA2FjLZ6C7Rd6ck30PIehjjNv9gQY/g7Hrv2FNC7Z8U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JHINpG+TUH6ummVko6ene83cpxVEN3f5ST7UHVRYPZK2uJp282p3aTaVJb5ppVs6D
	 doRV3tPZgPjzAGDdQCFwlgXur2qXbC8tSTkFuCWq1gQT/rPROkeCfbJzh1stUnVEJm
	 9ycz8NBbNHIO//Z981Ike6qp1Uu/hu7RUptTHHwv4nVoeRq+3eN/wNigfPp97ZeKSK
	 a/mNRs4HxqpuEDzBkaPSUXGC3STG/rWrBXLEy/PJxLT01D9AvYku1plkaEQKEc74me
	 TYAoc3ekRA7617uyEKR3eULAzPOZ2666+RPDrZ1hGHFlnYYBPclWtqzVbeATJzO6py
	 a+DK/G+BlgHKg==
Date: Mon, 07 Apr 2025 20:47:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
Message-Id: <174407675028.451691.12125338246182249303.robh@kernel.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: ti: introduce basic support for the
 AM62L


On Mon, 07 Apr 2025 10:34:37 -0500, Bryan Brattlof wrote:
> Hello Everyone,
> 
> This small series adds the initial support (currently just a UART) for
> TI's AM62L SoC family.
> 
> The AM62L is a lite, low power and performance optimized family of
> application processors that are built for Linux application development.
> AM62L is well suited for a wide range of general-purpose applications
> with scalable ARM Cortex-A53 core performance and embedded features such
> as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
> power management modes, and extensive security options for IP protection
> with the built-in security features.
> 
> Additionally, the AM62Lx devices includes an extensive set of
> peripherals that make it a well-suited for a broad range of industrial
> applications while offering intelligent features and optimized power
> architecture as well. In addition, the extensive set of peripherals
> included in AM62Lx enables system-level connectivity, such as: USB,
> MMC/SD, OSPI, CAN-FD and an ADC.
> 
> AM62L is a general purpose processor, however some of the applications
> well suited for it include: Human Machine Interfaces (HMI), Medical
> patient monitoring , Building automation, Smart secure gateways, Smart
> Thermostats, EV charging stations, Smart Metering, Solar energy and
> more.
> 
> Some highlights of AM62L SoC are:
>  - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
>    1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
>    of two external
>  - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
>  - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
>    DPI (24-bit RGB LVCMOS)
>  - Multiple low power modes support, ex: Deep sleep and Standby
>  - Support for secure boot, Trusted Execution Environment (TEE) &
>    Cryptographic Acceleration
> 
> For more information check out our Technical Reference Manual (TRM)
> which is located here:
> 
> 	https://www.ti.com/lit/pdf/sprujb4
> 
> Happy Hacking
> ~Bryan
> 
> Changes in v1:
>  - switched to non-direct links so TRM updates are automatic
>  - fixed indentation issues with a few nodes
>  - separated bindings into a different patch
>  - removed current-speed property from main_uart0{}
>  - removed empty reserved-memory{} node
>  - removed serial2 from aliases{} node
>  - corrected the main_uart0{} pinmux
>  - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/
> 
> Changes in v2:
> - alphabetized phandles
> - corrected macro and node names for main_uart0 pinmux
> - Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com
> 
> Changes in v3:
> - added more nodes which have been validated
> - added link to data sheet which is now public
> - Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Bryan Brattlof (1):
>       dt-bindings: arm: ti: Add binding for AM62L SoCs
> 
> Vignesh Raghavendra (2):
>       arm64: dts: ti: k3-am62l: add initial infrastructure
>       arm64: dts: ti: k3-am62l: add initial reference board file
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
>  arch/arm64/boot/dts/ti/Makefile                  |   3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 672 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  19 +
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 144 +++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
>  9 files changed, 1328 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20241220-am62lx-ca9498efd87e
> 
> Best regards,
> --
> Bryan Brattlof <bb@ti.com>
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
 Base: using specified base-commit 0af2f6be1b4281385b618cb86ad946eded089ac8

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250407-am62lx-v4-0-ce97749b9eae@ti.com:

arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0 (ti,am64-uart): clock-names:0: 'fclk' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000 (ti,am654-ospi): '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#





