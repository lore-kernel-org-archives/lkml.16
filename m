Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2959E21322B;
	Fri,  9 May 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800212; cv=none; b=Q1Ci22taBD+KmGMpP1z71A85pub+yL6xKxwAwcZsXLjDgNtW3tGRZSuzq7tNhGlsmx+n40W1dFUsuQiij6M1fcCpNyErBSkTPkUYLv5jUpB5v5qE0loVkvCZc5mTyRMJrZAzSODt/flyXsa0kX7OdoFok32G4XKvLRl/F2Am3cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800212; c=relaxed/simple;
	bh=vMVUJZu9yYRGIoVM8aKfqXn5nkHn4uhH6yrt76qg8Bo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=S1Z8Ed1Jz5sjxqALvNl2whpxZOOhPAAik77X9gxUY40az2gOwNWolt+BDzit4GOD0ll5+pPQKrfKQRaxM5CZXEYEoudtss3QJ45RSJ1uhJ7l6ODg77Jqs6DOvDBxVWftQI+9tbQm72pfclxwwkLOFzfMzlXoSXH3ZqVdTHYHJxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccrr7mhG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccrr7mhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F4C4CEE4;
	Fri,  9 May 2025 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800211;
	bh=vMVUJZu9yYRGIoVM8aKfqXn5nkHn4uhH6yrt76qg8Bo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ccrr7mhG0MUfhAyaZklvA7LfwZOJnA0way4Qf/VXo+XXV5znPdMuiKRnRaghQfLph
	 fq2Vhqf0OSAMuTO1bec60sjVOHQVSeb220o4P2U1wFWLl4qofUL86KOHqLGWpdgLGx
	 RZZKQ0LMuPtjKKQoPywZk1dUAw+hBy4SR/9uQedk3QD8g6lnBG0fqjZ4D6Akjy8FNy
	 I/JOGXJ9bb7hE+8DOp6lkaaPGn1dNhWB/L52aTz93Gy4tnlyenMYjso8/oAA10exqk
	 KtqBDlUcbyHoSjv91c7Efxsj4WnqvqT8YhN6q4NA+kD2LLV095FC7iMxi1cZ6E/yZm
	 BWiMcR8pzW3hg==
Date: Fri, 09 May 2025 09:16:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
Message-Id: <174679984762.3368109.6575241416894070817.robh@kernel.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: ti: introduce basic support for the
 AM62L


On Wed, 07 May 2025 22:09:18 -0500, Bryan Brattlof wrote:
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
> Changes in v4:
> - corrected copyright date
> - used the ranges property for the fss{} node
> - converted control MMR's space into a syscon{} node
> - Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com
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
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 673 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  25 +
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 133 +++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
>  9 files changed, 1324 insertions(+)
> ---
> base-commit: ed6f779e213070572e53e9801e4a6e510d7bc208
> change-id: 20241220-am62lx-ca9498efd87e
> 
> Best regards,
> --
> Bryan Brattlof <bb@ti.com>
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
 Base: using specified base-commit ed6f779e213070572e53e9801e4a6e510d7bc208

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507-am62lx-v5-0-4b57ea878e62@ti.com:

arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0 (ti,am64-uart): clock-names:0: 'fclk' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@43000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000 (syscon): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000 (ti,am654-ospi): '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#





