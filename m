Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E261EC4;
	Fri,  2 May 2025 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169322; cv=none; b=UCsVvW3e3R2bd8sA+rG6+cwdG4CCm4bkcmYNS9iG5bjcUShI3491YrONxzRWcvHLROdKPqceZ78VSYHTl4zY9TRJoBnnaJmwMVqXivqvjmjkTJUB6t7aAcIvabVwi22xVqqcnl1J7fbMrpbtqjV8hdU/FCuNwAQL+KcLG9gAzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169322; c=relaxed/simple;
	bh=PqKFG0JGTq4eNIheoo3AmOMJYkd1B6YTqiR8CVnXhYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msIyGUv34/LBSNSIp6mo4JmNyrPqH/+MJwWsl99oMPPiRqj02sPwGZM89ZX5Js8whW96oxXUMURJgBboNLSl6TrA1QPK0hhuwLgDtbHR2zg8HYll0lLBgH5l5VJSdV+BORKZKA0D4QI5cKgPR+tIGjsUuIT8S5As/x+PFgLWuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVzAz7NO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVzAz7NO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA19BC4CEE4;
	Fri,  2 May 2025 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169322;
	bh=PqKFG0JGTq4eNIheoo3AmOMJYkd1B6YTqiR8CVnXhYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVzAz7NOcx1ADL3FUVTSgq3yUEZzwYx7NJwUzsmRXywuZZfgaqRVVnbjTYnCBWn/+
	 ozbIFqkDfjOl4d3Rl+/Pp3ome9P5BtNz48awS8Hj+qfRGFbCrGJ74DTNvSaNx1bZ2P
	 t00t1/SwcM+Ir/whEIsspwLv4L0IolBjsDtpE/RIvY27YsVbbAzRkzcR6Nb5Bjub0k
	 7ZVTqC2pJ+5WH2BD/BUAT4eKVKVMvUnrztaNJcMa3Azyezp5xJ69v5vl0bw93YrOZZ
	 f6q0IPkxDDt0w2bQefK1iHmui6miOEE9S7u8wb739OslNMv4OgZDdNoEZIwPp/8ADm
	 J4mmDCmDZ2d0Q==
Date: Fri, 2 May 2025 09:01:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430153634.2971736-2-ioana.ciornei@nxp.com>

On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
> This adds device tree bindings for the board management controller -
> QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
> LX2160AQDS, LS1028AQDS etc.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> new file mode 100644
> index 000000000000..562878050916
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml

Filename matching compatible.

> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP's QIXIS CPLD board management controller
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |
> +  The board management controller found on some Layerscape boards contains
> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> +  etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,lx2160a-qds-qixis-i2c
> +      - fsl,lx2162a-qds-qixis-i2c
> +      - fsl,ls1028a-qds-qixis-i2c

Keep alphabetical order.

What is actual device name? I2C? Is this an I2C controller or device?

> +
> +  reg:
> +    description:
> +      I2C device address.

This says device, so i2c in compatible is wrong.

Anyway drop description, redundant.


> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1

Why?

> +
> +  "#size-cells":
> +    const: 0

Why? Drop cells.

> +
> +  mux-controller:
> +    $ref: /schemas/mux/reg-mux.yaml#
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg

Keep same order as in properties

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        qixis@66 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "fsl,lx2160a-qds-qixis-i2c";
> +            reg = <0x66>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;

So were do you use address/size cells?

Best regards,
Krzysztof

