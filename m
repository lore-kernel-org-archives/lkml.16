Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA61C34545;
	Thu,  1 May 2025 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101300; cv=none; b=vEv6JqE+715mALkrFqH03d1uFSSJQ3tGEdwnOHVOWGEUihgTSuZ474IJWtdeyTb9ythwKIQ4vIMlTaLWT/6uJSuPu33jDYQIILkbWTk56a2G4XjRjIH61nUGfA+/GyU4iSM6DSxTl9wT1Ay5HrCoi+d/Wy81FwQtLxh/1tvVB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101300; c=relaxed/simple;
	bh=8D5TRtC5TmDQclk37a04XUySA9DOJFZV97XArHUgb1g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=n2cnKrky7mWtlIQMBaVoezTccT9FFedULYGaLM7sEGD6cZ5ppUCyvVFakulgxF/A8Q4+9Usx2gahLnYdiqfYUXIKOORrnCpybDsh+xnWsFDgjyYB7kO5yjP0oBvBwDcS39tXKnmMLKrimSxoDAqiu1UYE80j9EODKaCsoQQZlio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6ZIIYnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6ZIIYnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E2DC4CEE3;
	Thu,  1 May 2025 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746101300;
	bh=8D5TRtC5TmDQclk37a04XUySA9DOJFZV97XArHUgb1g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m6ZIIYnpnbH7GFwBoxMZ62dxGFIacdbrkIcdm4+VQ7CGdee5vu4z++rwdCTG5i/mc
	 p4I4moI6xTq8l0NUjHUDMr/giz6dmhV5SGQJqav3ZcCLdCYZJz4i2cMgtwOXJMjsm1
	 qHhYLwaolHV8hEH0TnMvdFEkBQJ6NZm+n1UdN0aQH37F17gkbQEkSzoLui7EDCTzBg
	 EJYt+dQOcjT/NFw4sNWj7lvTPqxN2ygLyAqYWJ9AOnNhPmtlNzyMd2qwb2caLTRfZ+
	 8K0JZn93sS995fr5xyMeIKhjCVw76zOekqVJocE+pIxB/W1ezoXMcSSkd3OYbuKSdh
	 EZ8p6CYd0IJOw==
Date: Thu, 01 May 2025 07:08:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, tarang.raval@siliconsignals.io, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
References: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
Message-Id: <174610123214.1957273.17506465011735193373.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout


On Thu, 01 May 2025 11:16:03 +0530, Himanshu Bhavani wrote:
> Fix SD card timeout issue caused by LDO5 regulator getting disabled
> after boot.
> 
> The kernel log shows LDO5 being disabled, which leads to a timeout
> on USDHC2:
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> 
> To prevent this, set regulator-boot-on and regulator-always-on for
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
> signaling for USDHC2 using a GPIO-controlled regulator.
> 
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
> 
> kernel hangs during boot with the following logs:
> 
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> [   81.119872] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
> [   81.119876] mmc1: sdhci: Sys addr:  0x00000010 | Version:  0x00000002
> [   81.119882] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000010
> [   81.119886] mmc1: sdhci: Argument:  0x00844358 | Trn mode: 0x0000002b
> [   81.119891] mmc1: sdhci: Present:   0x01f88009 | Host ctl: 0x00000012
> [   81.119896] mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080
> [   81.119900] mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f
> [   81.119904] mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000
> [   81.119908] mmc1: sdhci: Int enab:  0x117f100b | Sig enab: 0x117f100b
> [   81.119912] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502
> [   81.119917] mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407
> [   81.119921] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00ffffff
> [   81.119925] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x0076b27f
> [   81.119929] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00000900
> [   81.119933] mmc1: sdhci: Host ctl2: 0x00000008
> [   81.119937] mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x4003f204
> [   81.119941] mmc1: sdhci-esdhc-imx: ========= ESDHC IMX DEBUG STATUS DUMP =========
> [   81.119944] mmc1: sdhci-esdhc-imx: cmd debug status:  0x21b0
> [   81.119949] mmc1: sdhci-esdhc-imx: data debug status:  0x2200
> [   81.119954] mmc1: sdhci-esdhc-imx: trans debug status:  0x2300
> [   81.119959] mmc1: sdhci-esdhc-imx: dma debug status:  0x2400
> [   81.119964] mmc1: sdhci-esdhc-imx: adma debug status:  0x2594
> [   81.119970] mmc1: sdhci-esdhc-imx: fifo debug status:  0x2608
> [   81.119976] mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2798
> [   81.119981] mmc1: sdhci: ===========================================
> 
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
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
 Base: tags/next-20250501 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250501054604.23368-1-himanshu.bhavani@siliconsignals.io:

arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): 'gpios' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: regulator-usdhc2-vqmmc (regulator-gpio): Unevaluated properties are not allowed ('gpio' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#





