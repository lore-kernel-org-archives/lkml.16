Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2D29B8C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530328; cv=none; b=VUdFWz3lRe4sAlliB7GWtgAdNn5Fpx4p2tEHAB9HiC9ZiADYNwLJ/uTFLWtT2SwUluMb2Zfu6bYpwRTZ3iCATr52MXNljz66E1gDLuSW2MAs5SQffQm41VjiRMoyIyOjUUJ5otcvGFLU+wl7GA4m7gomwcbBAXZ4vPQgpW5U1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530328; c=relaxed/simple;
	bh=lDphxl+Sg2RIqYjkShGwzirhgk/K0xRM7vcy+iIsA24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvTwQoMJckRhNYNCfY1x1wGPmDRMgOWPC1IOapDQAfj0pFaBsgL3oX6xQ3ZnDx0sIj7KVYD/owmuM2rbOury68wcbmQykaU+J/OiPfMqMplmyUeRVKvcOWFeIcE2xrP47woRpwCru1vdG/WhPsOHWaNx/NOZmbRdn9Ao3ZK1iUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uXF2q-0006JI-3y; Thu, 03 Jul 2025 10:11:48 +0200
Message-ID: <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Date: Thu, 3 Jul 2025 10:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hello Laurentiu,

On 10.06.25 18:01, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The AIPSTZ bridge offers some security-related configurations which can
> be used to restrict master access to certain peripherals on the bridge.
> 
> Normally, this could be done from a secure environment such as ATF before
> Linux boots but the configuration of AIPSTZ5 is lost each time the power
> domain is powered off and then powered on. Because of this, it has to be
> configured each time the power domain is turned on and before any master
> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

Sorry if this has been asked before, but I hoped the cover letter or patch
3/6 would explain if it were.

What is the default configuration for the AIPSTZ before this series?
I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
changing the AIPSTZ settings needed for the DSP to work?

Thanks,
Ahmad

> 
> The child-parent relationship between the bridge and its peripherals
> should guarantee that the bridge is configured before the AP attempts
> to access the IPs.
> 
> Other masters should use the 'access-controllers' property to enforce
> a dependency between their device and the bridge device (see the DSP,
> for example).
> 
> The initial version of the series can be found at [1]. The new version
> should provide better management of the device dependencies.
> 
> [1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/
> 
> ---
> Changes in v7:
> * fix merge conflit caused by addition of the reset-related properties to the
> dsp node.
> * align values for the macros defined in "imx8mp-aipstz.h" as per Shawn's
> comment.
> * encapsulate the default configuration and base address in a
> "struct imx_aipstz_data" to make the driver more future-proof as per
> Shawn's comment.
> * link to v6: https://lore.kernel.org/lkml/20250415171919.5623-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v6:
> * drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
> help with making the DTS more readable but if it makes it look worse
> then there's no point in keeping it.
> * use consumer ID as first AC cell and consumer type as the second cell.
> Better to go with a format that more people are used to as long as it
> still makes sense.
> * pick up Rob's R-b
> * link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v5:
> * merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
> currently only used in the DTS so it can't be added as a binding.
> * place 'ranges' property just after 'reg' in the binding DT example
> as Frank suggested.
> * use the  (1 << x) notation for the configuration bits. Previously,
> hex values were used which didn't make it very clear that the
> configuration options are bits.
> * shorten the description of the bridge's AC cells.
> * shorten the message of the commit introducing the bridge's binding.
> * pick up some more R-b's on patches that remained untouched since V4.
> * link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v4:
> * AIPS5 node now only contains a single memory region: that of the AC
> (just like in V2). 'reg-names' property is dropped.
> * AIPS5 node now uses 'ranges' property to restrict the size of the bus
> (1:1 mapping)
> * change the number of AC cells from 0 to 3
> * add binding headers
> * link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v3:
> * make '#address-cells' and '#size-cells' constants and equal to 1 in the
> binding. The bus is 32-bit.
> * add child node in the example DT snippet.
> * the 'aips5' DT node now contains 2 memory regions: that of the
> peripherals accessible via this bridge and that of the access controller.
> * link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v2:
> * adress Frank Li's comments
> * pick up some A-b/R-b's
> * don't use "simple-bus" as the second compatible. As per Krzysztof's
> comment, AIPSTZ is not a "simple-bus".
> * link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
> ---
> 
> Laurentiu Mihalcea (6):
>   dt-bindings: bus: document the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: add aipstz-related definitions
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
> 
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
>  drivers/bus/Kconfig                           |   6 +
>  drivers/bus/Makefile                          |   1 +
>  drivers/bus/imx-aipstz.c                      |  96 ++++++++++++++++
>  7 files changed, 255 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>  create mode 100644 drivers/bus/imx-aipstz.c
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
