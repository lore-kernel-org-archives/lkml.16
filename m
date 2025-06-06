Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96DA28688D;
	Fri,  6 Jun 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202841; cv=none; b=fs+xtCP7jlDyUVZN/irGnC/l3yaEbP61sjYyv/q5wZTqHphbR5tUlAfH+M0ooTvaZfxrLYoAz5jE1AvRjM3wBe32byL53F991xT/cp530VRdcsuhQzZh7EztWGGwuxmhJ73rKtt5RPFdeoi51mpjFKlHy4PVxyBSaDqqDh6RsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202841; c=relaxed/simple;
	bh=MsSVWdGVlzcxZp/J2ROe/PeWjaXznhz0HwdWWtqU+e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bejnDSNigBiaPPXzPyoznlpRdA3e33WgEGQKeDLqcPOuvCbfcki+nvP0rgYza1aOOKRfMyWpVvxMT1+DJREnBh20BFt/KRdVTS23SBzgIpq7jv8aiwPrq1Oq8bbAjaSZwd6vBWfHsrvwTxzu08B1ICXVqjyCttBlH8QmEACae8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRQTQBEC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRQTQBEC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d3f72391so24788115e9.3;
        Fri, 06 Jun 2025 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749202838; x=1749807638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+n76qVXU3h+uhDCEUxB7URrPrTN6QFQxKPKPiN//Go=;
        b=CRQTQBEC8ZFZQ/DgEqyr1N4/Vuk19KgIRlKMrVx5QtQ8sMLtmbXigRHKqc2TvA9H6N
         XbHrepfy1lyL76pnamtgU6YJNXfOFZxBFY6Q7H1mjX+ttlUkNNeHmwFJEmDqQtM6KEg1
         EJdPupjcDcKK6XyWp/rIHAfVZbMa0byydMIy9pwUvtEY5p7V9ybcLFhmy1r9h3P6DAlq
         zRfaU9zOJNBfCMIFLW4BohyKOtRrf4kwRwtRdMAFN2BZRIMcKCedB7ETLJoQk71kFK1X
         tkzOqX1YTMAZBJCtyxTgEX6Xi/vDc6azzfqtpeca4gcqgyPZ4+KNPUUVNboAiCym56CI
         n7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202838; x=1749807638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+n76qVXU3h+uhDCEUxB7URrPrTN6QFQxKPKPiN//Go=;
        b=a0gglGlXN/GLFvyCxqaSCmfrVq9kmThKCktBIVtehhmpowUBDuH0OjtddaRxlQRNou
         Ro66pGG53YGpL3kWPjJd+GH+Bu17dE4YyJkUcRmMuTX6f+x1+9jC68oUcaV49pl8bKQ+
         VRRxvFP+m2StBfyqaTVqi1txCXVqd47sRXfFyjLekkgBN93nHRie8CbserJ1e3yOcMj0
         unUkkWk+FNA0SWfMlPAupC+900d5x2vf3BCmm73nB29cD/tNoTjMqcaKlIufOlCyMggM
         qRSNK73bPRZgph3MlQf7VN0RJRvd6vS+gJ0rNv6Zqx/IGXgtp81btfa5okVAsetkeLsU
         TLEw==
X-Forwarded-Encrypted: i=1; AJvYcCXC0fmcbtI5V0Fyhdi5hNy3efGysI7FRKZ2rM/ojus+dQ9NPZryHJbJotKTnjjYx1goiLfHE8SZ1rDEdJQR@vger.kernel.org, AJvYcCXIgf26YUT2EoM1la2sZAkXBgHz7L56GwcUTVPbhMUR2EMtgr0YFgkToaawCHRqr/ysvYTAu/vrOvfP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxipl1j1RqT1qDjeH0aND2WV04AyP9ENZttEEGjZuwBuRs8+Pbn
	whmsRhPGrBDGAGXxiuPCMVSZgm22g3HR27ddJKySOSdxcp1g9gDqKvRg
X-Gm-Gg: ASbGncvNMcHRNHHOI5D0VTFfPWf6zchXpcn7UdJWF41qkQzCnC/PyoP+uPwfCOa3pZy
	bTsd2VEz7EXBd6JV+BhURttC6HW5VpQ1QlnwnwwvexG9UvzQSTgs4lThj2MV/Bp6nXJycVU6hRd
	uOTBnqXt9ZIHjNej1Gv8Dmbu1hVdmhv9b6gBZQuCnrFg6FuZuXLqaKvI0f7ZAd0IMmqTUX15GRl
	3rQtsZb4RrS8LtYk8xGQ0Z10xFPSX9i96IKQX5P2vsT8aRt3fhdsgTjC+9PKxSF3UOdPiPbp2Bs
	kv2GqcIoqM4P3X+IXnDvC1Q5kqXAjLTbo/OHpscLwoBq8/Tk/Bu9S/wQT8Xv5rAw1MBFFF8/0rO
	x
X-Google-Smtp-Source: AGHT+IGwBj0jxP6yyRAAm+wJVRyOfQEStxQUYPCyRL5B3SL086Ed1xUu2fktxVuU5/8a5FZfBehQTQ==
X-Received: by 2002:a05:600c:548d:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45201437aa8mr27346985e9.6.1749202837831;
        Fri, 06 Jun 2025 02:40:37 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1225:ec01:d1d7:779d:8019:7bb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73b8sm15003775e9.29.2025.06.06.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:40:37 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:40:35 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <binjodgavnupkl2plmnwjito4pu27uwwmhgwexlqq3diad3zj3@c2jotuzsq43o>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
 <aECSL3cn3m9pKJv6@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aECSL3cn3m9pKJv6@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, Jun 04, 2025 at 02:36:31PM -0400, Frank Li wrote:
> On Wed, Jun 04, 2025 at 05:48:57PM +0200, Jorge Marques wrote:
> > Add nodes for ADI I3C Controller IP core.
> 
> Add binding doc for ...
> 
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 68 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..859dbfde15f123db59d7aa46c120c4a3ac05198e
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
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> 
> New binding, generally, allOf between required and unevaluatedProperties
> 

Ack.
> > +properties:
> > +  compatible:
> > +    const: adi,i3c-master
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
> > +      - const: s_axi_aclk
> > +      - const: i3c_clk
> 
> Needn't _clk surfix,
> 
> - const: axi
> - const: i3c
> 
> Frank

Ack.

Best Regards,
Jorge
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
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i3c@44a00000 {
> > +        compatible = "adi,i3c-master";
> > +        reg = <0x44a00000 0x1000>;
> > +        interrupts = <0 56 4>;
> > +        clocks = <&clkc 15>, <&clkc 15>;
> > +        clock-names = "s_axi_aclk", "i3c_clk";
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
> > 2.49.0
> >
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
