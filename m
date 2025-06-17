Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0628F942;
	Tue, 17 Jun 2025 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147696; cv=none; b=uYv/BhYWh4gUSQ5R8OcuMVGMhYL2aHbQXXELlx+L4BeAR3ikXY1MJKGusGzj9rbmXK8+rNVDmX+kmTfTpUtM6UoIbPJVXcWroH/BRjW8Z9WaHHUlGZyt0yccJ9HtgOzpWJPlwhp8kKQa7fQN2uslLHHM2S6Tx8i9Ceh7zq/PCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147696; c=relaxed/simple;
	bh=xSp6YzXqyFFcF2Z2Zs5t0bWps7VV8UD7jYJkKHZXM/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os8xJg+GC2cXO3kHv1djRXWnB5MFfaQZq+YGNKide9ybgpOHjKz8qU9A59FK6LZ8etGwN/GZktYFrZM04eYxgEg3WYHCaNlI6bL+wvA2FHiwoM8PtwGGw3AfJW8mzbTIQvEd6sK4fryblkQYO1956fv1hlYfZ8cscEGJyDHO+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO8swg8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO8swg8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F24C4CEE3;
	Tue, 17 Jun 2025 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147695;
	bh=xSp6YzXqyFFcF2Z2Zs5t0bWps7VV8UD7jYJkKHZXM/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jO8swg8tV7STz2bUcJ9YCtQWUWoTKiqQrzOUzXza+nsU39hVu0EUGgliDvYKP2rLc
	 6cGmSR3DT+tJa/rJcLN3NLYGKTdJ5ciOR1gUi/KmFmKUQ9qnkTa+M2U/n6uEOvRiki
	 TJ9FY3IHIzksbh2K0E/JyENQQkM0irvxW4JwPveiVplqxnC7C70NHE9b9V42ilWYrL
	 fHJei7Fs+MtBSZsyYo4ryVAWpFdvgfDT8kau8rHY9sLfuJUJzwOkQNs/NCCjgQFMn+
	 eWm482swAZI18VzqH+AMY9SC1N5VG/wZcxuv3t/0MhEWQKatRhVCfWaM3H7yY8s5h1
	 VNVR9j4o8uKEg==
Date: Tue, 17 Jun 2025 10:08:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Daniel Semkowicz <dse@thaumatec.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Message-ID: <20250617-small-vivacious-labrador-7f0eb0@kuoka>
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
 <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>

On Thu, Jun 05, 2025 at 05:41:06PM GMT, Quentin Schulz wrote:
> +  rockchip,reset-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    description:
> +      Mode to use when a reset of the PMIC is triggered.
> +
> +      The reset can be triggered either programmatically, via one of
> +      the PWRCTRL pins (provided additional configuration) or
> +      asserting RESETB pin low.
> +
> +      The following modes are supported (see also
> +      include/dt-bindings/mfd/rockchip,rk8xx.h)
> +
> +      - 0 (RK806_RESTART) restart PMU,
> +      - 1 (RK806_RESET) reset all power off reset registers and force
> +        state to switch to ACTIVE mode,
> +      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
> +        RESETB pin down for 5ms,
> +
> +      For example, some hardware may require a full restart
> +      (RK806_RESTART mode) in order to function properly as regulators
> +      are shortly interrupted in this mode.
> +

This is fine, although now points to missing restart-handler schema and
maybe this should be once made common property. But that's just
digression, nothing needed here.

>    vcc1-supply:
>      description:
>        The input supply for dcdc-reg1.
> diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
> --- /dev/null
> +++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Device Tree defines for Rockchip RK8xx PMICs
> + *
> + * Copyright 2025 Cherry Embedded Solutions GmbH
> + *
> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
> + */
> +
> +#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
> +#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
> +
> +#define RK806_RESTART		0
> +#define RK806_RESET		1
> +#define RK806_RESET_NOTIFY	2

I do not see how this is a binding. Where do you use this in the driver
(to be a binding because otherwise you just add unused ABI)?

Best regards,
Krzysztof

