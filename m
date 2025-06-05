Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A2221DBD;
	Thu,  5 Jun 2025 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128087; cv=none; b=l/wDFOZNDcrZpCJd8+wTWVQ9WzE44eOp6ffl3bqk+ZuqFcDi5XkHbOoGIBOwsyGUU6zoIi5HScZrf6+1IrrjTXj063RCDHML5lPDoIyaxyDFh0pC3nZ1k2KaIIz3r7foPJMgRtoTELw+ldpT3SWCmxsGdEAcvaVwm87YG6ek6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128087; c=relaxed/simple;
	bh=PYgywu+Ee6L/2bO4dkMIMczldnizYHbF7o64P9fbjqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gorRXlEGdDKqS/0Sivf5XMyFMLg63ebi/KIlNgrrzcKsHpF9efmyQqYGIGwU5aLg75SkyrryjQShs0JFL3mPuv1FamlZdM76xtcxTsuVGdwG3ZD1CUxwxPDmWqLsvJPgYd2JKq29aQldZNVAjjZh3YqRj/EE+0LLQeMuSol1x3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dazN0FPk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dazN0FPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC339C4CEE7;
	Thu,  5 Jun 2025 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749128087;
	bh=PYgywu+Ee6L/2bO4dkMIMczldnizYHbF7o64P9fbjqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dazN0FPkk0EqfcCEuRhs0q8ErzHlQyVb3HhQR2sAb7ivjY9T3uiSs8O0quybtJFnZ
	 B/a0u90enAYHu73oOPAyQ9f1M69Y5mXcAOxPGyO9ajkK3vdc5619i/twItsxPB6jbe
	 g75mcSuNSUCkZFs3FGzT7oCEK05NJ10YmJxaYCrnDftdHKkRMQ03ABWKmGOV0poqtM
	 dRKIhsOJWtt1x9CuMtIR/CSWURTUvRr3bc1I6YWFMnAlfvWq3oh2tuLr25dZoAV7iR
	 Qbu1E/bdgACMrKnQBQpDJ478orpzYpJOHGGftHoflw5e3GCdi4E5CSj2pHg35PY40g
	 SABplTlvTel+A==
Date: Thu, 5 Jun 2025 07:54:44 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add
 arm,armv7m-nvic and fix #interrupt-cells
Message-ID: <20250605125444.GA2354143-robh@kernel.org>
References: <20250528163704.690840-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528163704.690840-1-Frank.Li@nxp.com>

On Wed, May 28, 2025 at 12:37:04PM -0400, Frank Li wrote:
> According to existed dts arch/arm/boot/dts/armv7-m.dtsi and driver
> drivers/irqchip/irq-nvic.c, compatible string should be arm,armv7m-nvic,
> 
> Remove unused compatible string arm,v6m-nvic, arm,v7m-nvic and arm,v8m-nvic.
> 
> Fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
>     failed to match any schema with compatible: ['arm,armv7m-nvic']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2:
> - fix example interrupt-cells
> - commit message add driver information
> - remove unused compatible string
> ---
>  .../bindings/interrupt-controller/arm,nvic.yaml     | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> index d89eca956c5fa..c0be00b450291 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> @@ -17,9 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> -      - arm,v6m-nvic
> -      - arm,v7m-nvic
> -      - arm,v8m-nvic

These came from Zephyr and are in use:

https://docs.zephyrproject.org/latest/build/dts/api/bindings/interrupt-controller/arm%2Cv7m-nvic.html

> +      - arm,armv7m-nvic

Add '# deprecated' after it.

>  
>    reg:
>      maxItems: 1
> @@ -30,10 +28,10 @@ properties:
>    interrupt-controller: true
>  
>    '#interrupt-cells':
> -    const: 2
> +    const: 1

Have to support both.

>      description: |
>        Number of cells to encode an interrupt source:
> -      first = interrupt number, second = priority.
> +      first = interrupt number.
>  
>    arm,num-irq-priority-bits:
>      description: Number of priority bits implemented by the SoC
> @@ -45,15 +43,14 @@ required:
>    - reg
>    - interrupt-controller
>    - '#interrupt-cells'
> -  - arm,num-irq-priority-bits

Is there NVIC h/w without priority bits? If not, this should remain 
required.

>  
>  additionalProperties: false
>  
>  examples:
>    - |
>      interrupt-controller@e000e100 {
> -        compatible = "arm,v7m-nvic";
> -        #interrupt-cells = <2>;
> +        compatible = "arm,armv7m-nvic";
> +        #interrupt-cells = <1>;
>          #address-cells = <0>;
>          interrupt-controller;
>          reg = <0xe000e100 0xc00>;
> -- 
> 2.34.1
> 
