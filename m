Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0601E2858
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274658; cv=none; b=U0tZsV+v8jsMYEyZsOZC0ToQKj03eH8ZYE4s+VHALOHzuZ+4fTDW736nEPJh1rp2aLyD/wQ14cVYLu/MTksJS3k5JcdTUH53ZStbT93d6FCadx3dSK1vECibaNHC4Vbef+zgAADzI2JDu9vmKGDG3rIgpJ/haIgIqAjELeldXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274658; c=relaxed/simple;
	bh=wtv+LFHxuM9AWX0L6ikf56UwuRoDnrS0tJ6y5ORCVkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9piqDwnXtAsro8RsTlQf2oaIgmGutr23qLrhaEMmcZV+ntb9d134FsYSulAj1eSwbtlIOL445jJGIbVhENKO59KxJ2Clv+GDNVLqTzw7l8tMFIyDFY5aZDGErMOMON/vdey6oNpqj10WRPXk03c8Fs9bvbyHtsX1zzN9QPHVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XUzJg0co; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XUzJg0co"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae361e8ec32so467949566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751274655; x=1751879455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1c7UVB+HsIrwMhQKzoKR+ElhzYVbyK56CpcLANHfHcs=;
        b=XUzJg0cojs/dxd+UBiRjXtZwrbSlJGH9jluzmCVpyoH2taWOlsFi575EFNHyrXYwtq
         aSfOhtvslDhj8Xy0TywNl+PGrRiuQKIYG4eXJOnLirBKiNCvepBBeyBF2ny0GOh/MJ+J
         abXLDkBBMv2mStLY+QemkOsTBwTeNLNeugABv25HCB/gnEwNQDHT3++ZK+fenyIOPkrB
         DojJKHlSn3TGDgVkrnFmox/KYfsunXTYZ/jpgtqFOujdE7LTESpDvESz0xtHOo5usBXE
         dp1MkgOU0z5XP6dMRnn7N+51d421NXPhW5cwQ/yv5fwQm1KsM0VMW6tlPaQCgzbwf/13
         NsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274655; x=1751879455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1c7UVB+HsIrwMhQKzoKR+ElhzYVbyK56CpcLANHfHcs=;
        b=NM/IAYsZNsfTe0tBGNrMFBBuyXyAAOmnRZ+742q3XqYeG+eoQNwRVpn4ZL0gPaO6Sd
         TIFXdO4KrNQ+kcO58tOjMz7lrjytIRmMcDL1sek25dQtwGEjeQMpiRf5tZKEOUN2CI3V
         jV1r0en6o+ZPBoKiTGF+9dfm7PQrvs6eGBcAtb4b/BHcE3ZmCaGeWIuZT2q1uPaDrfNk
         c66XYNsiX+z01/m+kXPbdHanFurrKLrXSJ5KOKZTGMtWBxR0XsojLk1/9ulVpcXRBRaI
         3NeRMbnlsL8CzJHQk3iLnIUnvoEEMPPsc02+OR4KlsMWYCEOmvOqsuySSwn+a7cBVH3d
         Q5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWnE1EQ2EZjwnlLb1y7sM5DxO+dkUC/DcP9JHBCEGoOOBfPZN1HvvJaDw8H0ggKjT0IyGCqRpEjyVEznRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YybCr+73OmAYEYLn3zmPGNgGZz5qWjEYrqMs6nBjC0SHy1L97Lk
	ThVYGodaez4UDdu7+8tIn7cQtEcord7p3eJmgjXOpLUkaDptQoGI3FSVGGYf4DvL6oA=
X-Gm-Gg: ASbGnctNQCBD/q0kX78/v92XyPjgTdOg8vGzY2OZ1ha6R9bpNEkN3OlDpGIG3XYl1Q1
	RFVZqSXMT9I3E8NeyQ56kT6kfEjMPJ4Cuh1Yb7RHJ+kyLoQ4bkT0y9QFvwj9yjbU4ZFkiyyFmp9
	vaVG6y2tfc5Q7tUUiCejnH8PUg9HwOcUqiUqR8J6ANUHpl9lH2NavLBrVUwOynbCkeZoBkUXAR9
	Y+oE5emLfuw9J/cWpdSlXC/3VdjtVPu6fmqFORJX+LBXGsPKgjJdQm7SB04FDtLv2eGysxiJymQ
	d8GhNxAVFqUfYC9fxiyPBNox2t9tNFDNLa4OeVlv/BjjwjCslHel8Mhk6ePb2cDRZTOL8hY/XcI
	cCxh07i4pafazLaMhZZX6UVn3lp2pMC7gHMtL
X-Google-Smtp-Source: AGHT+IEkCjklJgOVn9m2h0ZYB9RYj1O2BKk8vmPV0JoHQsw1aXV4Ln/c1FHctMmon20dE6hzBNg4oA==
X-Received: by 2002:a17:907:7e95:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae34fd89929mr1069995666b.17.1751274654602;
        Mon, 30 Jun 2025 02:10:54 -0700 (PDT)
Received: from archlinux (host-87-14-238-240.retail.telecomitalia.it. [87.14.238.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363a9a8sm635407166b.33.2025.06.30.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:10:53 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:09:02 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: adi,ad7606: fix dt_schema
 validation warning
Message-ID: <epswbthrftxecrgm2rjkag6yxkpegr7boodzpjqfx675gghziy@p7dy7cns2ot6>
References: <20250526-wip-bl-ad7606-dtschema-fixes-v2-1-9bd56d039489@baylibre.com>
 <20250531170448.2be25330@jic23-huawei>
 <20250629171908.122a5163@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629171908.122a5163@jic23-huawei>

Hi Jonathan,

sorry, could you merge this, or do you need the hash fix ? 

Regards,
angelo

On 29.06.2025 17:19, Jonathan Cameron wrote:
> On Sat, 31 May 2025 17:04:48 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Mon, 26 May 2025 15:19:08 +0200
> > Angelo Dureghello <adureghello@baylibre.com> wrote:
> > 
> > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > 
> > > Fix following dt_schema warning when offload is used:
> > > 
> > >   DTC [C] arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb
> > > /home/angelo/dev-baylibre/linux-iio/arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb: adc@0: 'oneOf' conditional failed, one must be fixed:
> > > 	'interrupts' is a required property
> > > 	'io-backends' is a required property
> > > 	from schema $id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#
> > > 
> > > There isn't any reason that we couldn't have interrupts wired up at the
> > > same time we are using io-backends or SPI offload, so dropping off the
> > > related "oneOf" block entirely.
> > > 
> > > Fixes: ccf8c3f106a2 ("dt-bindings: iio: adc: adi,ad7606: add SPI offload properties")  
> > That ID seems to be wrong.   Probably down to the messy rebase I had to do pre pull
> > request.  Fixed up to be 81fe5529e812
> > 
> > Applied to the fixes-togreg-for-6.16 branch that will become fixes-togreg after rc1
> > is available to rebase on.
> I guess something related to the rebase I had to do just before the last
> merge window caused it, but that Fixes sha is wrong.
> 
> 
> > 
> > Thanks,
> > 
> > Jonathan
> > 
> > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > > ---
> > > Fix dt_schema validation warning.
> > > 
> > > Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
> > > ---
> > > Changes in v2:
> > > - Change removing the related oneOf block. 
> > > - Link to v1: https://lore.kernel.org/r/20250523-wip-bl-ad7606-dtschema-fixes-v1-1-d9147fb2a199@baylibre.com
> > > ---
> > >  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 6 ------
> > >  1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > > index 29f12d650442b8ff2eb455306ce59a0e87867ddd..1a5209139e1338f803c66ad2b4d63ad53cc11d96 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > > @@ -223,12 +223,6 @@ allOf:
> > >        - required:
> > >            - pwms
> > >  
> > > -  - oneOf:
> > > -      - required:
> > > -          - interrupts
> > > -      - required:
> > > -          - io-backends
> > > -
> > >    - if:
> > >        properties:
> > >          compatible:
> > > 
> > > ---
> > > base-commit: 3964c6e5877f054497ffccc7d00f8f7add307d0d
> > > change-id: 20250523-wip-bl-ad7606-dtschema-fixes-5e6ab342e043
> > > 
> > > Best regards,  
> > 
> > 
> 
