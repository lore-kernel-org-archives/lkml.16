Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C417BA1;
	Mon, 21 Apr 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220157; cv=none; b=Z7/ibi36PUx2PokX0do3BWaIn/EHvco2cq0zpbo1pDme/FLy7PO/CT5fWBgKq/fQL4vZlJLlGlVVpzXCwa9plK52UNeqd+bpB2NOGBOWZn/idmJW7ww7AK/X9wumIMbJGU4Hsz8UngYHzZWOfjcAKIC07mu23PkPmmOBavMzUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220157; c=relaxed/simple;
	bh=rrQ2Kinny+DCeA0qKm4t1aUGb+DIipxCXEcYHaeWxfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gU6VhQ9dAx6oRhSrlfQdlA6HZICnzUxZzHLs9a3sdkSXdKVKb/4HZZwDxti1bbyKfBdshlOG/CpYqOkoBagbd+TI1IMFZ2BiV+MvMZxG0cmFmM+M4d0aSXRQOCO5OUFdeRJjSK8RkXg5K0zwi/za2VrBY+QB+uM/LTfv5zQzMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BPTWG404; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BPTWG404"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70FD71FCE7;
	Mon, 21 Apr 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745220153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pB/HrPehJ8yBSz1jcdQAHt5d+DzA9WDigakwtL+7yQM=;
	b=BPTWG4046AxS47RS7og1B9IhPUceoJjjieNTQ9pyyODZGK3f1/gv+okj+dogYvAFzkwdvl
	+M0W6IlJ1Dz/MbxF7uQF+f43IeqgrNNeKjue/wpfk5125IZI/1s11mwxasTW8qe+NX2vY9
	FoOuJz90Va8h3peogzG1AhpedOoqJDu4QUJAGvWNwbYgdHvwqNQ4+VtpGQFPS0TLZg5Ic1
	K0Jz9s25srNQ191xM+9UWbq4qgXFEKH1L/tSVng31v67fGi5jz4w/Zn7FH81E05MRNeN5C
	bqE0As9y5KhVnbufyPqpK7LH8kAl/9hIrW7+KJz0nxnJwF8MmbpQMADBIyuGgQ==
Date: Mon, 21 Apr 2025 09:22:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and
 i.MX95 I3C
Message-ID: <202504210722320ac51194@mail.local>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
 <20250421061544.2471379-2-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421061544.2471379-2-carlos.song@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemtgelugdumegtvdhfkeemhegvsggsmeeileekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmegtleguudemtgdvfhekmeehvggssgemieelkedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegtrghrlhhoshdrshhonhhgsehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtt
 hhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com

On 21/04/2025 14:15:42+0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 

My guess is that the IP still requires 3 clocks but the integration in
the SoC feeds the same clock to two of them. I'm not sure this change is
required.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..9255d35e2854 100644
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
> +        - nuvoton,npcm845-i3c
> +        - silvaco,i3c-master-v1
> +      - items:
> +        - enum:
> +            - nxp,imx94-i3c
> +            - nxp,imx95-i3c
> +        - const: silvaco,i3c-master-v1
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
> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
