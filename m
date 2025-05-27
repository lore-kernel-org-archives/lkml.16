Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ADF1E4BE;
	Tue, 27 May 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351579; cv=none; b=Rny4z/1bMinTPYcITp4vYoR5u5OowlDVftyAmIQRtO4SKHEHkC8mShaXijEndRiAzs0Vq/v8VXjmEyFoPAMKZZ826LtiHqebo1C6Z6vB4W0/x/zDhUJy48ljyzYdvZoU0mZyO7Bwg0KJotVWGA2GF4oAqbIS7+imdTcBAA/DMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351579; c=relaxed/simple;
	bh=dzGbsJp//zG7Ib4jWbLdhkmBxjqHy4GxwjXSB0ekCFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nemh4/SvrrGVKlcCVE3s/KuU+URDXBcgznagRX07TiF/DVBWw16U3NOfXA2jzLR4nPcn1puA7CjtmcvyldMrDHy2Lb3+zfin4HUB63rYO+KhyYKrDMJEVvuF7rSSDwgNpmx3uIKk/tz9Em/XWOz+iTy8+5AjjPltLjswH2xjDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOzwl26J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOzwl26J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A14DC4CEE9;
	Tue, 27 May 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748351579;
	bh=dzGbsJp//zG7Ib4jWbLdhkmBxjqHy4GxwjXSB0ekCFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOzwl26JN6O+y041qoX9r0mMR044QBRYuwDcw0qzQmN1G3G38vHvbkM1xjuuIZQke
	 ExKpA99O4IBzVhvQF0VMFkqNgxtTOJNzHYyi95jv81cTKAHBqpdikYp7OqyzpZ5IMQ
	 2nKBrcz11JWiGg+Hfkf212qytSXEZwK6jfKoKitW0DQ/rQMdyHpdygpKCiZdxST6ss
	 Wr77GYqoxufgtwQEhXUCopGDbk6CwVf5o+EHDKMbYvgLsJLFUbcRhk+MmdPMYksEuT
	 Xa7YPqgr2d7qUwFlD7YFI2d/Z6ykzyqQNkH3L7PmzOi49BAbpYlOV5ZjW38scOi0t9
	 9aZYbxzzuWO0Q==
Message-ID: <eec2a1db-717e-46f2-a988-6beefab7b699@kernel.org>
Date: Tue, 27 May 2025 15:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: stm32: fullfill diversity with OPP for
 STM32M15x SOCs
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
 <20250527-stm32mp157f-dk2-v1-1-8aef885a4928@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250527-stm32mp157f-dk2-v1-1-8aef885a4928@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 15:03, Amelie Delaunay wrote:
> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> This commit creates new files to manage security features and supported OPP
> on STM32MP15x SOCs. On STM32MP15xY, "Y" gives information:
>  -Y = A means no cryp IP and no secure boot + A7-CPU@650MHz.
>  -Y = C means cryp IP + optee + secure boot + A7-CPU@650MHz.
>  -Y = D means no cryp IP and no secure boot + A7-CPU@800MHz.
>  -Y = F means cryp IP + optee + secure boot + A7-CPU@800MHz.
> 
> It fullfills the initial STM32MP15x SoC diversity introduced by
> commit 0eda69b6c5f9 ("ARM: dts: stm32: Manage security diversity
> for STM32M15x SOCs").
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm/boot/dts/st/stm32mp15xa.dtsi |  5 +++++
>  arch/arm/boot/dts/st/stm32mp15xc.dtsi |  4 +++-
>  arch/arm/boot/dts/st/stm32mp15xd.dtsi |  5 +++++
>  arch/arm/boot/dts/st/stm32mp15xf.dtsi | 20 ++++++++++++++++++++
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xa.dtsi b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.

You create entirely empty, unused file. There is literally no benefit of
this file, no impact, just more files to handle.

> + */
> diff --git a/arch/arm/boot/dts/st/stm32mp15xc.dtsi b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
> index 97465717f932fc223647af76e88a6182cf3c870f..4d30a2a537f15c1e145635b090de0f0222526579 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xc.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
> @@ -1,9 +1,11 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)

License change is not explained in commit msg and anyway should be
separate commit with acks/sobs from all copyright holders. You also need
to CC them (Cc e.g. Gatien).

>  /*
>   * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
>   * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
>   */
>  
> +#include "stm32mp15xa.dtsi"
> +
>  &etzpc {
>  	cryp1: cryp@54001000 {
>  		compatible = "st,stm32mp1-cryp";
> diff --git a/arch/arm/boot/dts/st/stm32mp15xd.dtsi b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */

Same problems.

> diff --git a/arch/arm/boot/dts/st/stm32mp15xf.dtsi b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..5f6a2952125d00d468e2e4012024f02380cfaa49
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include "stm32mp15xd.dtsi"
> +
> +/ {
> +	soc {
> +		cryp1: cryp@54001000 {
> +			compatible = "st,stm32mp1-cryp";
> +			reg = <0x54001000 0x400>;
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc CRYP1>;
> +			resets = <&rcc CRYP1_R>;
> +			status = "disabled";
> +		};
> +	};
> +};
> 


Best regards,
Krzysztof
