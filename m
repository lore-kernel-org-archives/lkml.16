Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E2F27FB3F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784647; cv=none; b=RV8uji8C8bP1ivhcOeTqN5nlVxX5JP4A0NH9SY06WbiJHbmH9G0rjx2cyAd3oKDObGjqk+DedrclHBPSpSbP/7T8un/6ZVSq9leqSc/8Kft5iVIJSGMzGCI6MxSjwpXJkrCKeGW4POZiAWwwriuRDSgwsvhsFfmtVcP3ZYC8bHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784647; c=relaxed/simple;
	bh=N0kOXiZhGX1q39WSp08kbdSOZeR89HROVZ7Jcr4A3oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9K12PW5h++6MFZiN0oWbeoIQfCQN5yDDM/NGdbhPvWFY9DpgwDCNx5sonQew9A1ZglUpoDVGNFFEzla5qNGcW2aNo8weejTzSmzq4rqOBGPyezU6+YZfwq9d2oBABCxmxEy/4WokYQm06UpUsf+VKqwEJpkpyTFpOlzfpg7W/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD8D725DD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:57:13 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 704EE3F673
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:57:24 -0700 (PDT)
Date: Fri, 9 May 2025 10:57:15 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Message-ID: <aB3Re4ZR85jJkMH8@e110455-lin.cambridge.arm.com>
References: <20250506022210.2586404-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022210.2586404-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:09PM -0500, Rob Herring (Arm) wrote:
> Convert the Arm MPS2 Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../bindings/timer/arm,mps2-timer.txt         | 28 -----------
>  .../bindings/timer/arm,mps2-timer.yaml        | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
> deleted file mode 100644
> index 48f84d74edde..000000000000
> --- a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -ARM MPS2 timer
> -
> -The MPS2 platform has simple general-purpose 32 bits timers.
> -
> -Required properties:
> -- compatible	: Should be "arm,mps2-timer"
> -- reg		: Address and length of the register set
> -- interrupts	: Reference to the timer interrupt
> -
> -Required clocking property, have to be one of:
> -- clocks	  : The input clock of the timer
> -- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
> -
> -Examples:
> -
> -timer1: mps2-timer@40000000 {
> -	compatible = "arm,mps2-timer";
> -	reg = <0x40000000 0x1000>;
> -	interrupts = <8>;
> -	clocks = <&sysclk>;
> -};
> -
> -timer2: mps2-timer@40001000 {
> -	compatible = "arm,mps2-timer";
> -	reg = <0x40001000 0x1000>;
> -	interrupts = <9>;
> -	clock-frequency = <25000000>;
> -};
> diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> new file mode 100644
> index 000000000000..64c6aedd7e8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm,mps2-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM MPS2 timer
> +
> +maintainers:
> +  - Vladimir Murzin <vladimir.murzin@arm.com>
> +
> +description:
> +  The MPS2 platform has simple general-purpose 32 bits timers.
> +
> +properties:
> +  compatible:
> +    const: arm,mps2-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Rate in Hz of the timer input clock
> +
> +oneOf:
> +  - required: [clocks]
> +  - required: [clock-frequency]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@40000000 {
> +        compatible = "arm,mps2-timer";
> +        reg = <0x40000000 0x1000>;
> +        interrupts = <8>;
> +        clocks = <&sysclk>;
> +    };
> -- 
> 2.47.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
