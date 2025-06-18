Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF63B283128;
	Wed, 18 Jun 2025 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238486; cv=none; b=U9ioH7wjkxB/WaPqckCYp0zBZ/ucrhKWpusTFsD/0iB2dGqmvbBNrhxHHzJarCjyaHg1WHqFWwe5nlabGgS/6EbqrJ6xv9vBZHdH8KOFtqAhXF5z6VkR9XG06WgOUxaM1Q2UVIIzAW73P3VW2wpd/0/+AD5C2hW3EjBfGIR3cow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238486; c=relaxed/simple;
	bh=zTcgqaF/0GYo093jxGYoUNjPlooySG9s1mcys1CjAgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E35T2rjEEXPXCsoXXaz5FkqC1bgjErGu9bIzJ2Wcd9Qo0ltbtYC/Ve1tRC4w0MBXoDa/VzjU79ZBZmycLVw/yrbByIvtybWlw1Q808aRGG7YLKFChDA8FbfKobDHEDLiPNrN6rk1usHzaUUfTMzGj3zbuqLubuMSfb/trGZlZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNIDpUmR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNIDpUmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6A4C4CEE7;
	Wed, 18 Jun 2025 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750238485;
	bh=zTcgqaF/0GYo093jxGYoUNjPlooySG9s1mcys1CjAgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNIDpUmRpDhMC9ZpBZgtGiBHCtsLuJY4/1tDc2RdaP4LB/xjSyo6FujuGhdh5k2pP
	 320klkimYNBwl1qgomVOldkyRQV8s1SaokJpa9hF5puefEoEAAdpIddnMZ3f3vz8hR
	 eohaYoY3bpK3ft1qO8ti2fYhOPR/CQRJDU2D+gjcxhp0x2U6wTQcZXRb+PuD3Q4V44
	 1TpAFxpbkyGyZpwRV1dZEyotbs8T6S5mDqRZR9UKLVkvbz+Du5kUtg7T4+0kG+6/mU
	 6KDkd/+MwEydodNjkubO4nvvLGV+Zw0rbNC9MvGwAJrq2Cu9kMQzBgA8po9MeXCOGk
	 vjKxXAFRzDz8Q==
Date: Wed, 18 Jun 2025 11:21:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gastmaier@gmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250618-visionary-hawk-of-success-d4aab8@kuoka>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>

On Wed, Jun 18, 2025 at 09:16:43AM GMT, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.

Here you put outcome of previous questions - why such compatible was
chosen, that hardware is this and that.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml

Filename based on the compatible, so adi,i3c-master-1.00.a.yaml

> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> +  implementing a subset of the I3C-basic specification.
> +
> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +properties:
> +  compatible:
> +    const: adi,i3c-master-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Why?

> +    items:
> +      - description: The AXI interconnect clock.
> +      - description: The I3C controller clock.
> +
> +  clock-names:

Not synced with clocks.

> +    items:
> +      - const: axi
> +      - const: i3c
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@44a00000 {
> +        compatible = "adi,i3c-master";
> +        reg = <0x44a00000 0x1000>;
> +        interrupts = <0 56 4>;

Use proper defines.

Best regards,
Krzysztof

