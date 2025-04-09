Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF331E5718
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187002; cv=none; b=qcijCEwvH6Hk6RpgJpGGWh8uqw/b8NPs96eBiKEqgwuQg+bdn0Ls7zh2FDkKLhhuuW+HBmpk/fatOsdUq60LF4xldwFeywGfD+F3UnXZ+wP9YGj5h0bBMM/ih3rGk9JpNuGAEDZ7vU7cAZhEOQ338OOwjPbmhG9dTo8dzEG55B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187002; c=relaxed/simple;
	bh=BC22B58ebf6orl7qqDiyHa7iwd/DmKy9U31GLWFWWvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMaoXOzc3faKErpE+pgIdQxlBSkko6uG8VHMcBgURcAVxi+UoRwJBdBQi5pG/rj1eJADzYRrr3gY0FHQ+ukHOgPiQdJvO6Rd2XMyR2tEK0MZeK5tVEWUDpkaxYho6zVIDDxRpnwasERvVsTXR22WX7JCMhdGqa8dvQFvrYogoYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kf++T9IY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kf++T9IY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so5278857b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744187000; x=1744791800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8Uxcp65AEN2lXG7OunlJf+FIxnQApjkFfx8Dt72lEU=;
        b=Kf++T9IYB1narSlux9I8VwS55DtKxov/GEKO+sXLP8bb9yKWWkLkXcev+rsxcxh/PD
         OmvrZG+grNaJNz1mpXWKtNVA2/Ox1iCefG58TkuYY77Tujn2qRtsjCaQxpow0ZkHcT66
         TU93FxhtGEkWvbW/ZUrZkXkRDAr23LCgCemiu613OsOoxGE13G6zCXniwYFirFhcbMX4
         +DYZKJFkrqMDYED9L8j3p6NJdoQ59eo+X1buY4ZJh7A8mRVDqHtLLUK44wLvxJE19KOI
         Aab44NkvxTg8BCwGfsyQrcGMcqZUmEoTLm8+TkccvpoOLnTnXWOfwsf5arx0AB2gFlL5
         VC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187000; x=1744791800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8Uxcp65AEN2lXG7OunlJf+FIxnQApjkFfx8Dt72lEU=;
        b=chTXfTntox6j3e6v2sCIabkH6P9iEHtTfQ+yCVWhmViQp4BZBOSuS0GQjEwcl/OHe8
         Yb1Kphj+SbwifwQrQJRuaZuygm+SjWCDH46rthARCQ0eiW7kDCm3ZHG98CLlNxdt8LGJ
         W2urpXyOp4/9+xVON1DF0Il3hw4QxrXoteeplLKf//a2mm4EEdVwSOdGChNOGftWg4sY
         bShV07wv8WH0nCLtAAmDSz0BCbpRYoF459LF116EzwyNrtb9PtMMys5Y4MKYmhEcveyY
         UuR9pVde4eXtWIfWb1bEHyP0gPTQsIE1ISobX+4AsZ/J230t34XQHsNOn6tmwMfH+COp
         HY/w==
X-Forwarded-Encrypted: i=1; AJvYcCXjRfMK0Ad8OSFfzzqOHX/LkJt9ejM1e04qnNaBY3gQPr/n+vEYFKAM6ge0cmbySQFlwMYPjxudUxqFRtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsC5n7iyS3jLic5s8XuBOImoe1g5Dd4hPsrLKh5Q6c+3gfxIn
	cxB9F85QR4x4Vdm56Muhp4JBXyf48cRKBgc5LnjWYL0gdAmsw3F1IM9o4JNHqUg72KtohuR1Mdy
	x
X-Gm-Gg: ASbGncuDV+LWQb2HJ767LJxjaWk4L26RHX5sG4l53S8CBxCRhQntPA/a8AefvE7R0+F
	TxNox4kTsngoerCMUaKmMn9tZXDbhOf6ZK2ahRHFif9OmHqdv1lC2t1s9MOhUKBc/cC8IO4lCc9
	ysQeUvTRr+2uN4t5VCtITsCYi6TsjuCM3d9dJPFgEdSS1OWSaBx1Bwh19hz3ykbjVv/KRvadaPO
	gefZHqe1/5QF4dR7p6PUVtSimrrKBkI9GSaqgCJxONFakOcVLljNh4sm/fG1UDYKGEJKD9XmwWk
	jZhTVhvqchVksYuyzwki0iZS7Z1jvqoGWvs1AZ1ISo6xDeNi3ZXoV8uqYLURtN0Vd9x3vGVJMs/
	Q
X-Google-Smtp-Source: AGHT+IELAFHnf6NcURJ7YwZpI3uONM/cHB108XuMeGlHH0Z4VyN7IgVNBUS39Fs8l1da/2JGxOqo6w==
X-Received: by 2002:a05:6a00:10d2:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73bae5512d5mr2408875b3a.22.1744187000327;
        Wed, 09 Apr 2025 01:23:20 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d464c9sm739894b3a.58.2025.04.09.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:23:19 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:23:17 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/YudZ0c2SBA+NMD@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
 <20250404-tangible-reindeer-of-penetration-ae9ca3@shite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-tangible-reindeer-of-penetration-ae9ca3@shite>

On Fri, Apr 04, 2025 at 12:46:28PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 06:44:58PM GMT, Sukrut Bellary wrote:
> > +maintainers:
> > +  - Tero Kristo <kristo@kernel.org>
> > +  - Sukrut Bellary <sbellary@baylibre.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Thanks for the review.
I will fix this.

> > +  Every clock on TI SoC belongs to one clockdomain. For specific clocks, the
> > +  parent clockdomain has to be controlled when the clock is enabled/disabled.
> > +  This binding doesn't define a new clock binding type, it is used to group
> > +  the existing clock nodes under hardware hierarchy.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,clockdomain
> > +
> > +  clocks:
> > +    description:
> > +      Clocks within this domain
> 
> Missing constraints.

I will add it.

> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    l3init_clkdm: l3init_clkdm {
> 
> Follow DTS coding style. Also drop unused label.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Sure, will fix this.

> > +        compatible = "ti,clockdomain";
> > +        clocks = <&dpll_usb_ck>;
> > +    };
> > -- 
> > 2.34.1
> > 
