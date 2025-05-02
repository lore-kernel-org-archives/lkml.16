Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7201E5B62;
	Fri,  2 May 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185091; cv=none; b=BCBuW/q/sIJWWbC1Mpx/7PpkeCIj8Lc5QySZLP5T/McpSY6VtxGgFdRFGSwHCe3xbbvVNA67/eKz85PXwbT6135RYh4uJ6i4idtlS02s6HtVEHuUF7tjKF7+8RbSS5ShZqh8F93JcqK0OHXmLoJyF3Sokm/jxaydq9g2xH6rU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185091; c=relaxed/simple;
	bh=cKOTqHsBhMM6YjpkOCPn/l8zd9SEgokeFwXnmYii7q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgjwZKa0Bl1vi5bz9dng9utGtuupTNtj3fW5L62SKlw+EivobP3YI8PFqrKdJjXJ7JXiffX0Hq2aEeftCpJNi+9Mt7Vs3x/yG1siZOvB86GexIdZd6iWvA4kSjIVJw448TtxwDwlHhr0AzMXOa2Nvd10G8iOg5ZLbnE1VrXg/No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.61.17])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 1FF12B4C2411;
	Fri,  2 May 2025 13:24:44 +0200 (CEST)
Message-ID: <d96b2243-0eb8-4596-bbef-7e7f9419d1ed@freeshell.de>
Date: Fri, 2 May 2025 04:24:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0
 pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>
References: <20250424060605.638678-1-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 23:06, Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
> 
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> This is only a prettying commit. The resulting DTB files have the same
> content with or without this patch (verified by doing sha256sum on
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).
> 
>  .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918f..a2c72b385a905 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -8,6 +8,7 @@
>  #include "jh7110.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>  
>  / {
>  	aliases {
> @@ -428,16 +429,16 @@ GPOEN_ENABLE,
>  		};
>  
>  		mmc-pins {
> -			pinmux = <PINMUX(64, 0)>,
> -				 <PINMUX(65, 0)>,
> -				 <PINMUX(66, 0)>,
> -				 <PINMUX(67, 0)>,
> -				 <PINMUX(68, 0)>,
> -				 <PINMUX(69, 0)>,
> -				 <PINMUX(70, 0)>,
> -				 <PINMUX(71, 0)>,
> -				 <PINMUX(72, 0)>,
> -				 <PINMUX(73, 0)>;
> +			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> +				 <PINMUX(PAD_SD0_CMD, 0)>,
> +				 <PINMUX(PAD_SD0_DATA0, 0)>,
> +				 <PINMUX(PAD_SD0_DATA1, 0)>,
> +				 <PINMUX(PAD_SD0_DATA2, 0)>,
> +				 <PINMUX(PAD_SD0_DATA3, 0)>,
> +				 <PINMUX(PAD_SD0_DATA4, 0)>,
> +				 <PINMUX(PAD_SD0_DATA5, 0)>,
> +				 <PINMUX(PAD_SD0_DATA6, 0)>,
> +				 <PINMUX(PAD_SD0_DATA7, 0)>;
>  			bias-pull-up;
>  			drive-strength = <12>;
>  			input-enable;

Ref:
https://lore.kernel.org/lkml/ZQ2PR01MB1307BD49C0A49DAD3AA76049E600A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
"[PATCH] riscv: dts: starfive: jh7110-common: Use named definition for
mmc1 card detect"

Thanks for taking this. Read previous comments from Hal there is yet
some description in dts/upstream/src/riscv/starfive/jh7110-pinfunc.h
that needs to change / be improved on.



-E
