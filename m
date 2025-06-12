Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC82DECAE;
	Thu, 12 Jun 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749766258; cv=none; b=tVBNoqUyw5bjNisVvyJY4DS4o9chEosPbCcUNfaDEQv9bS8gjMp2XaxxXSMWAEX6w5+txB0Fx9mvqgkj4Vrw4w6gBX4RS9ZKi1kRpSd9oAhQNFMgTrLP9OCPnJTi3hHl3LDNYCgpXU/02gq3u4q/4kC8EdoPSVTKkvCOlluUvmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749766258; c=relaxed/simple;
	bh=X4UYrbhCkqofW05LY1qWOtvrFlFxZeee9uJgB4Rayds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qusNS2dVwAWTJ5J7mqZvL4AkwBEdF5ClvatYCIc200FekrGYwtWtzMObauBXfFyrMHBvYpKq1fKzGvSVDTiEgyAePMdYTo8DMRmDRaRk31nCbK/w1wmlBY/7YUDGPSq39M94htdPQ6pl1h+KzaLgoMS8ZTnd+hPfTI/WLg0PZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoyRQ5sV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoyRQ5sV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234f17910d8so15842025ad.3;
        Thu, 12 Jun 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749766256; x=1750371056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=PoyRQ5sVmrGNsX40y3KgBCM0VTbhFJ6YVoMdRh8/zwOUK5NCec3Nh6aXy8MpBJ/ek9
         10p/AoAA46TOkxKUfK0WFwpnL63Trv1yB4gzbZosqa7KJ76CzQ+sGWmHRXpu630LQpQx
         GnO5lRdMlaSbAFN9/S9kq9DLEte+YPPZlItacqZpCYHr2ZUNCyQttsIZC41QAxui/Gic
         GqLGmxhTEGu8WvrjadjbDYuER/szk1xGjka/srSoO8ve8A9QtPkc4CJEcsCC2DLKdbBW
         kjGpL/ofOu47W/6nOSFXEN81dXMnkHFq2NFb+AF0oW61HUVtpzOZv6xzpGJuq9ou9ZVE
         qQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749766256; x=1750371056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=c/lDtSfjYkkUzpdCPasvGEN9gGtPcxj78kICkYEXwZIX7YJhmtVolt4Zs80BRpZF7U
         bCquktTY4pbzWUFnIHmLZjZYk8otN5y2fjaV51FFSHudD3t/ayKnBpvUux/5NBDt/4f5
         9cI8k9SYQOGc0RxFDH0YXz2/pUtIURI88MCbiqBSpbrFevCsAB9zr3XxpILS8omy33iy
         Y4GmEZ8KiNURsKuLv6In8KMgMPPoH/tF8Ys+buQ/6P/JsNgnXFzmAsKwgg2tAtrpbZ83
         k4X4p3vfesAQI9elcDg0IWFpc8kctFKYdOM95AtnIpuDCBLMw63ESV3niKHJ+iO38I29
         TODw==
X-Forwarded-Encrypted: i=1; AJvYcCU+caKx6V/9RhYiJOE63GX6sbe7G96Jst6e33BP3CuVcb6puepRSebhBzU2Jpmx8R0+9IoU+PpMV28FAZ90@vger.kernel.org, AJvYcCUsbZM250mO4HOXrdI9iMgXr4PcOcIXIdlLA8sNo+PGCRmEdvlm/9UI2nbSJCUTFLJezQOgZ8tPVwmx@vger.kernel.org
X-Gm-Message-State: AOJu0YxDf6Fgalz/LI766b2tEn6TwWAe0hxDjFyL/1YC2j5OBGG3vwbs
	WfeUHTxHRAQm9qG+v+C6rWGcKC4NmbfJLQngUZSBMdnf+zn2eSde2qZO
X-Gm-Gg: ASbGncuPvl1n/Ya+GFf5ZcuEEMdXTc8WbmtqXD2I5eHfK34KkHKZDRxE61e5QOD7NPW
	683DUB58RMuHKK1oy1AXfMOTWYxPHGtMn36I62sPo+NdYQtXOAMOV/W1NZVeeJlDiMA9jo8SfxX
	imlTpxgJP4vv2dpll7PBxJB85rxLqvVBt8MPabg4iXzPmxdJ1FabCfhMGRDw0Rpja8Ef7PPryeW
	ybXDa9Ei94Qw+7U6WFsK/+me9rLc7LY9l8uclqpOhyugql+EawKGsSym7nWvJ5wFnh8HjPOpB6w
	VBUCszxAzhUdp1XaRlH/ER4gkcDqlGMCAvG+/g==
X-Google-Smtp-Source: AGHT+IF3VWf9CLIOpaSuBO7CmtrEXj75DaYp06Yzj+Kv4Xtv5ablupO9zYlfs0wiUHGpvDYApyEsXg==
X-Received: by 2002:a17:903:98b:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-2365da06f72mr9323335ad.31.1749766256233;
        Thu, 12 Jun 2025 15:10:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365decc11fsm2092655ad.222.2025.06.12.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:10:55 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:09:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-culpable-roman-295df1360198@spud>

On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..e8093a558c4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> 
> I think you're supposed to add "unevaluatedProperties: false" to each of
> these nodes.
> 

This is is OK for me.

> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> 
> Why are these permitting random addresses? Are they not at fixed
> addreses given that you only support one platform (modulo the rebrand)?
> 

IIRC, they are fixed address. I use random addresses as I see many one
in binding do the same. Should I switch to the fixed one?

Regards,
Inochi
