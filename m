Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B931F3D54;
	Thu, 24 Apr 2025 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480795; cv=none; b=qePJk8jS+9MTUtijkxcl+2Vq7t/izyL3f+dyawswP4zZd4UBRYcJvcifp0+dV+xFd0y0km8469VAEUck/q/uZBN7khDGj3qYj5OPIBixZn2PQHrTjsz0UQ4x9DVk4n1krRdJr78ONfk9p0Hfn5tMLMhcoLfYpzUXYmBttOcF9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480795; c=relaxed/simple;
	bh=0V9WGCW9Dl7FGs6F9jrkHbnIrmofvrWwmHG1/UcXuG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1DU7E0TvFc+0MGUGruDUo9Ia0DWD3TxjgS7hxsWs1SAbfYDfhoNrDbOMpJOmcuH3GtG2tEB8E1KqndKnKXjjALW2s6lmOyfIqH9iOY82k9c3xnRnrhHaXG6Cceev7pRvSAsBQNflkbru4mEy3WzIYbKpkh9XVBFDVOfv5RERhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/pJzigr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/pJzigr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1BCC4CEE3;
	Thu, 24 Apr 2025 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480794;
	bh=0V9WGCW9Dl7FGs6F9jrkHbnIrmofvrWwmHG1/UcXuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/pJzigr5qdS5xSGAQGWHUe4MJTilt/YKSPtuZ0NNdAMf5FKsGNtS0gLki+UPlU8X
	 KlYrqz+ry2ovDqhKoytL6go9LtGj17NRNGrdGsmZ0k/07J2cFIBqWrEypyaojUG9UY
	 akdHqVvoKWagDioiWQ5DBtqHEKkBsJ8SM/fJxNElPiGiPaxwV+F0IJFxAh9XfdvmMj
	 GXZ++6Kpoixr9elcveD6jIr9NmQUh7crXZf/WD1npP0zd9wJDVzNbnpedBPP7hqxFb
	 quT2bZUxP8C2RhXFtZ+nwbJGLVY2OsiU7ec3E71UmJh9bBUWzKScgGg+LvpHmMeHm3
	 rZ/0YL3Cw0d1w==
Date: Thu, 24 Apr 2025 09:46:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, conor.culhane@silvaco.com, linux-i3c@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
Message-ID: <20250424-axiomatic-fennec-of-kindness-ce1acb@kuoka>
References: <20250422070853.2758573-1-carlos.song@nxp.com>
 <20250422070853.2758573-2-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422070853.2758573-2-carlos.song@nxp.com>

On Tue, Apr 22, 2025 at 03:08:51PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change for V3:
> - No change
> Change for V2:
> - Fix bot found errors running 'make dt_binding_check'
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..fd64741abc0c 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -9,14 +9,17 @@ title: Silvaco I3C master
>  maintainers:
>    - Conor Culhane <conor.culhane@silvaco.com>
>  
> -allOf:
> -  - $ref: i3c.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - nuvoton,npcm845-i3c
> -      - silvaco,i3c-master-v1
> +    oneOf:
> +      - enum:
> +          - nuvoton,npcm845-i3c
> +          - silvaco,i3c-master-v1
> +      - items:
> +          - enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +          - const: silvaco,i3c-master-v1
>  
>    reg:
>      maxItems: 1
> @@ -25,12 +28,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -46,6 +51,34 @@ required:
>    - clock-names
>    - clocks
>  
> +allOf:
> +  - $ref: i3c.yaml#
> +  # Legacy Socs need three clocks

Drop comment. I do not get what is here a legacy SoC. Which ones are
legacy and *why*?

> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1

Missing nuvoton compatible. This is supposed to be enum.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks

Drop comment. Don't repeat constraints in free form text.

Best regards,
Krzysztof

