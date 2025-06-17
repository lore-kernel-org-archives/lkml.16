Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442AD2EF653;
	Tue, 17 Jun 2025 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171850; cv=none; b=rkzPOjHlb8RfK4IEgOudmcHHIQM+xfmiMUVfmrxLbTULUHS8+oLDgaUaGbhjQiLWrpm7a37EM6Jl/Cu+zKjgzN37mLc4qnpqW89vymvjuugPxWX2Vx091Li5uIHhgUeU+cj8kCfh60IDtGtYZJJQGY6GI4OwTz8a4hhBSMKnUQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171850; c=relaxed/simple;
	bh=gEP6B7AZOOyR3lWw7vaikvzZpFJmNDZgWuZSYWcJorw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szU503YaksW36cs/278YE7gDdpQCcm9uiIpukUZNRA+x2d19akojnAOBbRUBQzItuGfGItUhrNzJGn4WmClHNyJfP/IID1aFeIouWxAjz2Hi4le9QPn6GtOX/Ahhzzk5hXa29J+cqjyb2sE7p5EoNo4NzACTzqDadOjrRUjlasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpA7ae4A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpA7ae4A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so46693205e9.0;
        Tue, 17 Jun 2025 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171846; x=1750776646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sIQYIOw+Li4heaQIClyl0MJmZhztR0A6h9Y965AmpE=;
        b=JpA7ae4As5YAqKd/fANEuzQtm2c4NZjFRKT2/JeYGbDHiQvmYDHnqIsCFJ4QFlNNxu
         83+nWqo5TPw2oDUnKX7I0j8CRxXvdz7edhK2V8Hf+OckzqFJedKbx0ednL//yAqauDpp
         B8Wvz31DkNwV/dsR/hCDR7E5Qh1hPWHuqtvVYic+cayrQbDXfZX/0fiqr02djSbutojk
         i96g4H+YXyqe87F+enPMtEkdSZh+7JIXCagvk5F6ChbwVhO03C5xsHzAS7yPamMa7c6u
         +zzxxBbHQKKAf+PCCErdcZTQEzPMQ9CdYSLwsx72lViDrU2t+tak8WOD5WXiVD+psp2l
         VX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171846; x=1750776646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sIQYIOw+Li4heaQIClyl0MJmZhztR0A6h9Y965AmpE=;
        b=HitTBnykvCHR5bvmrt+5ax+Ln2apzgS28mACoERfcrwd8I2GhUBkMerwiLM4wDsqSC
         YW21YnWWyLb6zHIfwTMpjokJZdfI5V3064mdJ/9DQKF83HVtx453ibob+FSP43AGsLDT
         GkHpbkFpNNtGhyMjJmN3R71kqjhiDK+OzcsRTJkRcTFIpY/7pN7Tk/Et90PAMswUzK6N
         ZaNyG9wl6gLdz9qn1PkE36KKrWqRojjkYa9kEw4oBlQNxSML36KZj6SYQkWJTbSkSYkS
         drCqgdqtNpj0jdZDZHg2lz+D3OGN66SXSzaOvUgCKtrDp8yZp1KMoWzsJMx780YfTi3X
         2ePw==
X-Forwarded-Encrypted: i=1; AJvYcCUjluDznv5wegqzgst6wkQGTzi0Nfn8aOY38i5ZzrgxZu6yYlFG0S1EAc2OS62k/FVmjCRF9NItkvIP@vger.kernel.org, AJvYcCXdzQLCqAjatcogNi7zOilvEmmW9KnKHhExdLl/dORm9S6wKcgVHniuUxIICcE6jsOYzzDBWiTJx1D4kmaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDY4y3Xq+B55OYn5Jd6nJDl4UfFnTqf6PGhRqOsVoK5wurQUB
	DDOpCck97KGu+/uGt1byiy0oKGgS4vTXwPDNvLX0wSGUAloM94pyEV56
X-Gm-Gg: ASbGnctUmdnle1zopm0g4/Ro/36uBcVw++5wG8ygjT4sasN7GTytToo0TSpo3suuHwk
	8jTOkWNE3z0x1dTUJEqYfHFBwQJzdHRbNTGj3AMuOyuniy0doWHkoApHF7aZOhXxTeN2z7u0odk
	UsMtbV321Ze/vMLWggJhH2ftahtV5ZrrUfZDW8ajhMxZRjVZ9WN0Z2gPdmfpB/VUH88d1kzaJtZ
	Q0mWtqvPYOcYYDyKZXRNlNmgf8QFoNDXdyBIqLqlSYkGrXHaXP+EsTm1EOEcphZBQl7Gc01/BhI
	GsuRGwaoOCS64fMJ58djvUCA94CGPPUgdIf+NA3hSfrN2FDaxHfgxc5fssLsXGKBFUfEEB1cyEX
	LQzixnjg=
X-Google-Smtp-Source: AGHT+IGenP4A7u1sQEyb0CDTNFDAGJg0rzMGlGqsI3G9roPlmRR2B1MNfF6O0TOKovnr/fKEBSSKyQ==
X-Received: by 2002:a5d:584d:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a572398e5cmr12098068f8f.2.1750171846268;
        Tue, 17 Jun 2025 07:50:46 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a589092d1asm2026683f8f.24.2025.06.17.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:50:45 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:50:43 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
 <20250606-sliver-freeing-d01268258c25@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606-sliver-freeing-d01268258c25@spud>

On Fri, Jun 06, 2025 at 05:08:45PM +0100, Conor Dooley wrote:
> On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > core that implements the MIPI I3C Basic controller specification.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9591a30a2d6cc6ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices I3C Controller
> > +
> > +description: |
> > +  The ADI I3C controller implements a subset of the I3C-basic specification to
> > +  interface I3C and I2C peripherals [1].
> > +
> > +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > +
> > +maintainers:
> > +  - Jorge Marques <jorge.marques@analog.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,i3c-master
> 
Hi Conor,
> Seeing this with no versioning info is pretty suspect.
> The adi spi, pwm, axi-dmac etc all have versioning info, please try to
> emulate that.
> 
> Otherwise, I think this is okay.
> 
> Cheers,
> Conor.
> 
The driver checks the IP version via register access, for the other adi
ips, the -x.00.a suffix was never updated. For example, the axi-dmac
current IP version is v4.5.64 while the compatible still is 1.00.a and
there is a mention of v4.3.a in the binding. It is unclear whether
suffixing it with "-1.00.a" would be useful, or if the time comes call
the new "adi,i3c-master-2".

Do you still think it is necessary?

Best regards,
Jorge

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: The AXI interconnect clock.
> > +      - description: The I3C controller clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: i3c
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i3c@44a00000 {
> > +        compatible = "adi,i3c-master";
> > +        reg = <0x44a00000 0x1000>;
> > +        interrupts = <0 56 4>;
> > +        clocks = <&clkc 15>, <&clkc 15>;
> > +        clock-names = "axi", "i3c";
> > +        #address-cells = <3>;
> > +        #size-cells = <0>;
> > +
> > +        /* I3C and I2C devices */
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1ec3e067c65e9894 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11243,6 +11243,11 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> >  F:	drivers/i3c/master/ast2600-i3c-master.c
> >  
> > +I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> > +M:	Jorge Marques <jorge.marques@analog.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > +
> >  I3C DRIVER FOR CADENCE I3C MASTER IP
> >  M:	Przemysław Gaj <pgaj@cadence.com>
> >  S:	Maintained
> > 
> > -- 
> > 2.43.0
> > 


