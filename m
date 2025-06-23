Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FC1B4242
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701284; cv=none; b=f4mPIawiyF0fWUT+qJpOjgpAiVHpZnJXdAw4/ZFf8DcYhXhk0lfk0S7frYpU+CeWHr3TKLQjay+LlC8MjeakpEaVfycP6jrhsnLCNUulZQ4LF2Vh+cyvXhoAeT4LNwFna9bdT3HMbNdNpb42yTBGWUg6s/rgpvYzTio7TibVpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701284; c=relaxed/simple;
	bh=DEXDEnhLmgNiAoFLhqKzOxsWcB0nFiuBsvFefHaGqOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb9uVCXH5Ezq3iS3IDHqVemew6jp/i964BvVbXbTUSU8g2dhMrcBOhJEFbGQSDn6ly8l/TkJ6xV2UO/evhazCKP8emhUZAPjIrJw8s1JoFR4xqcoxmmzYvhyy6tfvyuzUI3Sik9RJtXKSu1mmedit1Jn/fom7MlC7gv8Gqw9Xzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JUGbZZON; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JUGbZZON"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e740a09eae0so4157396276.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1750701282; x=1751306082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2umrYHd0J3tqzw0yG5M5k9L2TulLqh3KukmLpWDNa1I=;
        b=JUGbZZON4dUMFGdEw5dxKSIrAsOg0HicxOj0/8kKohn3dw1tWGHmdaMs7YoMFxcebQ
         /PCxbb2OifLUxQBDbGT1hm3/kuy6/WXnLSu267d7Xgs1HmGNw7OSTPzh3DpwKZv6dhkg
         CzI/zGmIuZBvJhp2Sjf36+9X8A0knCqGI+Sy3Sz2blpULIey8Ruk9csf2czPWXiZ6r5m
         L288E9HfgXrmiKUpJDXFCFFKMn5DAe2MPt3tFUt8VjZ4KVOsC272vQlJA5jmuJD54B+R
         5IvJezB6+hQCnUjUgDTsfZ6BbDK8fuiQRdLKwPyafTUTxmmiN8hcWxWw69ZkWOmai/S+
         SGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701282; x=1751306082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2umrYHd0J3tqzw0yG5M5k9L2TulLqh3KukmLpWDNa1I=;
        b=wj+F3PkpjoOVD1YE1MxD0Yde3JjMitv7W35F0vqWLBHKX+ZFfUY01xVSgUe8RA/Ib7
         C6hmIJj1D5zDdqjNu4lrg3O6U8PE+i7rH+UTy/n4BLqy7QNdKdhEokL+Rv2UimF00u/V
         lTObFxrKqi3G/pFpjqlL/NgDcm71/Pvjrv/R7nedagVjSQ0lkj0qX0J2hBkHu4OV26sS
         FiyASIGcMtwu4bOyGRLdCiH/G4SO6139VKwKrwoVjvwdLKuiW2ppVKYPacMC+CbOdB6g
         DRk1O6wxddLhV84zBGnkZ+IZydRORSvD81iUwBpO+4gH8nlbxBh3zPlgfyf2irOnMNuW
         Epsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRiVLsP/yiV71Bkc4+Q8Rdnd6WkQbs+N3lgeVquO56AaXwXtoB8OB9ELQR5XRRaa2guYb32QcI8FJy35I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqkavvdH+evKl87HyrE4O3sGSCcxbstihGQU56RarhwyMEVcd
	Wg2m82awGcKT6yUQvbcAmJGn5cziu+QIOdSMd2NOmBKbgh9Fu5LTHugdFTSHh/8UG5s+3EdewHk
	aYYLc5Ckza73mmpbV4OxUfOJukhQ/fOCbCZExq814rg==
X-Gm-Gg: ASbGncug3UZZ37GE2y0uleXvW12uknIjc09uGqBKkKbOBG4geX9LnwzInO6+aZgLRR+
	P1bGJIqn8jlGlpSjHnyweTfBQ+gsBZheKm4UM3PIvkZCvC3AEk6tUNrZPIa+d52rBH7xlBFaDyr
	pVvkTcz/j9hpOFtCfW5zNiqYXcsmuczzJ1N45jWsH/WsxOcbZ6Sim+ZykiPawWIwsJkRWpTLqC6
	zY=
X-Google-Smtp-Source: AGHT+IGfoKcrgWxXbXinchiD0boKI8XS21vm7EaD/9/fAZ8SN+qxvOdYfr3tfI2hM/Ouf1leep1F62DdDBljcNdq3YM=
X-Received: by 2002:a05:6902:2b85:b0:e81:b2a2:c633 with SMTP id
 3f1490d57ef6-e842bcf7d10mr16162769276.32.1750701281840; Mon, 23 Jun 2025
 10:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
 <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka> <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
 <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
In-Reply-To: <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Jun 2025 18:54:23 +0100
X-Gm-Features: AX0GCFsJmnJSIgh3LKawkx-7MO5eDaDetGX5z3Whb404Zemw7AoPyaf6laHApe8
Message-ID: <CAPY8ntCkgnwhA_OuDY3zMMrptFmLqTm_mLdmdLeO5txyFuG1Jw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Thanks Krzysztof

Sorry for the delay in replying - other priorities.

On Mon, 28 Apr 2025 at 18:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/04/2025 12:03, Dave Stevenson wrote:
> > Hi Krzysztof
> >
> > On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> >>> Adds a binding for the HEVC decoder found on th +maintainers:
> >>> +  - John Cox <john.cox@raspberrypi.com>
> >>> +  - Dom Cobley <dom@raspberrypi.com>
> >>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >>> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> >>
> >> Drop, no mailing lists in bindings maintainers. These must be people.
> >
> > Ack
> >
> >>> +
> >>> +description:
> >>> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> >>> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> >>> +  boards respectively.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - brcm,bcm2711-hevc-dec
> >>> +          - brcm,bcm2712-hevc-dec
> >>> +      - const: raspberrypi,hevc-dec
> >>
> >> Not what Rob asked. You should use specific SoC compatible as fallback.
> >
> > In which case I don't understand what Rob was asking for.
> > I asked for clarification in [1], but got no reply. Sending a new
> > version has at least got an answer, but I'm none the wiser.
> >
> > Staring at this trying to work out your meaning, you want the generic
> > first, and SoC specific second? ie
> > +  compatible:
> > +    items:
> > +      - const: raspberrypi,hevc-dec
>
> Drop
>
> > +      - enum:
>
> That's enum, not fallback.
>
> > +          - brcm,bcm2711-hevc-dec
> > +          - brcm,bcm2712-hevc-dec
> >
> >> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
> >> such file in the next.
> >
> > Typo.
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
> > Reviewed by Rob only just over a year ago [2]
>
> There were some discussions and reasons with explanations.
> Feel free to use same arguments and accurately describe the hardware, so
> we won't be needing to ask usual questions.

Sorry if the previous descriptions hadn't been clear. All the same
points as for raspberrypi,pispbe.yaml apply here, which is why I'd
tried to link to it originally.

Describe the hardware:
Raspberry Pi designed and are the sole owners of the IP for this HEVC
decoder block. This is *not* Broadcom IP.

That design was given to Broadcom as Verilog to wire into the
bus/interrupt/clock fabric of BCM2711, and to manufacture it via TSMC
on a 28nm process node.

A few years later the same design was given to Broadcom to wire into
BCM2712, and to manufacture it on a 16nm process node.

As it is Raspberry Pi owned IP it can be used in other places than
Broadcom SoCs.
Broadcom does not have a licence to use the IP in any other of their chips.

It is the same situation as for raspberrypi,pispbe.yaml except the
block already exists in 2 chips rather than just the 1. There also
isn't a version register in the hardware that is different between
those chips (an oversight noted for future chips).
It could be compared to a Synopsis or Cadence IP block dropped into an
SoC. The vendor prefix happens to be raspberrypi instead of snps or
cdns.

Is there any part that needs to be further clarified?

> Anyway, we asked for fallback, so you need items, just like every SoC
> compatible (see also example schema).
>
>
> >
> >> Before you reply that there is a binding using different rules: well,
> >> there is always poor code. Above two comments are repeated, especially
> >> this about specific compatible - all the time, so these are not new
> >> rules. These are given in reviews since some years.
> >
> > My Google-foo is totally failing with the only directly relevant
> > mention of "fallback compatible" I find is [3], which just says to use
> > them.
> >
> > You're effectively saying I can't take anything in the kernel tree as
> > being a valid example as it could be poor code, and a layman such as
> > myself has no way of telling.
>
> No, I am saying that argument "I saw someone doing this, so I am allowed
> to do the same" is not correct. There are good and bad examples. For
> example in my talks I mentioned good examples. The list of good examples
> was not accepted to the kernel so well... I just use as an example any
> recent Qcom binding using specific compatibles.
>
> > Could you please point me at documentation and examples I can rely on,
> > or educate me with what is wanted in this situation to avoid me having
> > to guess?
> >
> > A further mailing list search has brought up [4] which is a thread
> > with yourself from 2 years ago which looks to be a very similar
> > situation. Other than missing the const on the SoC strings (although
> > that isn't in the merged version of cnm,wave521c.yaml), and two SoC
> > specific strings, I'm not seeing an obvious difference between there
> > and here either.
>
> How is the [4] relevant? That's IP block from other vendor.

It was another example of an IP block belonging to vendor A being
added into an SoC from vendor B, same as the situation here. Raspberry
Pi != Broadcom.

Thanks
  Dave

> https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties
>
> https://elixir.bootlin.com/linux/v6.3-rc6/source/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml#L31
>
> Best regards,
> Krzysztof
