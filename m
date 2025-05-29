Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A921ABBB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529068; cv=none; b=Lg8f2uJyEuhAYnnrgNBGFbsazBlltZOqZRJ+90vRcGy2OrS5mRWuuH3c6bzgMlb/gjNoUbjuh8N2lZTEak0c0YBj7mIL1cTuCU8ZBKu6EUwbJSn3CNcirJM6T732hqIq3RUjmYYbF/cZJzyQuCUZLKRI4k5RG+T+SCUr3Vx4vq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529068; c=relaxed/simple;
	bh=OSSYo42TqZYGJUhy3Nk27GxJhQMqPKv73QCCxoH6ipw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uo7V5RPkPu56cmM9DkeHF5h40or8OM0ahxRJ8ysW5Y6FM9tTCQOUKdLz+37L/ejQ4izPPS36uReyMyz4KGJ3cqxKa7QYjClfX9N1lFTjx9z8Xgxcxa4LfRgyoSSSF+/JDl0ThsduofHspKxMf6umsqF1JFWVM4Rv9qWoWJO5k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yyYq/V0o; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yyYq/V0o"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e3ac940ecso8219047b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748529065; x=1749133865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iiNsjWQEyZpPU2lsoxmyL7jHbDdd7M5piMd8IBeFtnY=;
        b=yyYq/V0oxAQDfkIiYkP+IAfpOyhcEuNP1pUXRwlnS26AwtwInwv3J2kL20K+JfJAKW
         23bCQy2y/30HKcqt4tBUjfwzVzNqo1R4UkqVG9gqU0wdxZmHZpSzO7/p7Z8llWJgOmXy
         HAl5SUovHcfvFpLDeSF4nejnUfUcpjduXnucU3WVvfFEpwiCR+Aey0P5LK3W0j0re1qq
         zn3DMvx4AUNB9LPanpEm4c94w/53Q84FMqLPXzd/HIicsv5sn40xaPU/hwT/P/I1ZdrP
         AYcEvegYv9/EKdHWmMpR4+b7FGqdM9tTxzEXcX4bheR6AE/bg8VOrclMm9vYUQFck8DQ
         j5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529065; x=1749133865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiNsjWQEyZpPU2lsoxmyL7jHbDdd7M5piMd8IBeFtnY=;
        b=XYdGgsbw+nQU3sjbYMVM695LSQl4qyKVr4vuqyyYZroeWKjJNVeAMePfk6G8/Nd+kD
         ha3RTMv0EWYhVTJS9+BWXQUUd3IFC0fNe63QCrIAnMiH7nOydNvd32dqp4DFAEVlLiwW
         BbvXMeVPnggMdphJyVsqAJ7mih6XhAIK7Nbb6UjDzeI1ZskqxPRrJIPNFCmLtm5iSPWh
         8cwj2XYvVrVhh4dRxlv8VrMEF7KOBlm7016X9tikbe7zOtG4tH9T+jjcKOWzAequzN+C
         7O6nWTC4htVCuiZKud0PXxH03A2tLUnfoBMY//D+upDY0b4Mf19DV+aufPmX3Dphbh3k
         b+hA==
X-Forwarded-Encrypted: i=1; AJvYcCU92waEGRj+/2Tgdsf3Pqw+xpHE8yaVjBrTE50hLG8NEiHeUffXDE+cLkt6UTEF6vxwZJ0Q2E0ThSMUhbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMiXzZf2XR6TlX8LOtWnkGG8yVVSNXJd7CH0AXx96v47pH5InU
	a15pRz0234CAbYuRmYAyiBc7rES01ZypcAluArUwtsLtzEWA7vp3gNwzqodr1qyoEI5yiO5u3WD
	KV7eeFO+LGxakY4M01amJy0JTvcbizr009x35NkAhxA==
X-Gm-Gg: ASbGncsIWaBc6J2Kw2Vhbwdhx+QfurX7zcpdGFrWIkuTooxPHsL8ARDXx0XadO1eNcd
	giVlgOKkZRXE2tJXSyOKCpyPn/FUNyCfJEG3mwVguWbtW91wTUal1/4GyhlfbrXiP8OWapCRhY7
	17Xax43JYcflFP56ZD9FrSBApZBDVeMKT5HYX3BKsdGdfx
X-Google-Smtp-Source: AGHT+IG6aP3uO7zL9olXY3uD2iNkvJAd0Zb+nywZHDYT5mlGvdkAedvr2taoqLqHeEIOtbchgpfhBcSmd0BjVvoBYKQ=
X-Received: by 2002:a05:690c:3691:b0:70c:965b:46f8 with SMTP id
 00721157ae682-70e2daaccb8mr277921647b3.32.1748529064648; Thu, 29 May 2025
 07:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aDhtVkHfJvDfkfaX@lpieralisi>
In-Reply-To: <aDhtVkHfJvDfkfaX@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2025 15:30:51 +0100
X-Gm-Features: AX0GCFs0RlzjYRbMTr-iLB95Xb99i0M6tDZ41x5EbK-0xfLufyMisf-oRGvKwZE
Message-ID: <CAFEAcA-=0GWG+rnHDOnsHg8cUq1pszN=x1-W+4MYZXXD8H8Pkg@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 15:21, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
> >
> > > Two questions:
> > >
> > > - I don't have to spell out the IRS/ITS config frame (and SETLPI, by
> > >   the way) as non-secure, since that's implicit, is that correct ?
> >
> > Do you want the DT binding to handle the case of "CPU and GIC do not
> > implement EL3, and the only implemented security state is Secure"
> > without the kernel needing to do something different from "ditto ditto
> > but the only implemented security state is Nonsecure" ?
>
> Not sure I follow you here sorry :)

In a hypothetical system like that the dt could either
define the (only) IRS frame in reg[], or in secure-reg[].
The former would let the kernel not care about the fact it was
in Secure, but would be a bit weird. But I think we can probably
ignore this hypothetical in favour of keeping the binding simple.

> > (Currently booting.html says you must be in NS, so we effectively
> > say we don't support booting on this particular unicorn :-)
> > But the secure.txt bindings envisage "kernel got booted in S",
> > mostly for the benefit of aarch32.)
> >
> > > - How can the schema describe, if present, EL3, Secure and Realm frames ?
> >
> > The tempting thing to do is to have regs[] list the frames
> > in some given order, but the spec makes them not simple
> > supersets, allowing all of:
> >  * NS
> >  * S
> >  * NS, S, EL3
> >  * NS, Realm, EL3
> >  * NS, Realm, S, EL3
> >
> > secure.txt says:
> > # The general principle of the naming scheme for Secure world bindings
> > # is that any property that needs a different value in the Secure world
> > # can be supported by prefixing the property name with "secure-". So for
> > # instance "secure-foo" would override "foo".
> >
> > So maybe we could have
> >  reg : the NS frame(s)
> >  secure-reg : the S frame(s)
> >  realm-reg : the Realm frame(s)
> >  root-reg : the EL3 frame(s)
> >
> > ??
>
> I assume someone has to write the root/realm binding extensions.
>
> In Documentation/devicetree/bindings/arm/secure.txt I don't think that
> reg is a contemplated property - I don't know if the list of properties
> is up-to-date.

It's up to date in the sense that so far we've only needed
to have the 'status' property have a secure- variant. My
suggestion here is that we might extend that to also allow
secure-reg, and to have root- and realm- prefixes too.
Though I don't think we would want to permit secure-reg for
any old device, so maybe something more-GICv5-specific would
work better.

thanks
-- PMM
