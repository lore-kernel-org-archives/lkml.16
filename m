Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C01DE8AE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931010; cv=none; b=vClERJ0U0aEsE4J8aRP1EWmsJr1N8lRB/LKQ3W0TdlrivRwMXACKK21c7ziK7lIqP8JChTW7GyOCcMV773nTGOE1+6VT4m5Z4S6OKvobtQzyMPJKLyLABF3wy87SAvp0ZMo87aJgOGuEGEQgxlYt/2WimOgWiKDtLFAPkumtP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931010; c=relaxed/simple;
	bh=xU+NxQu+ZdmfxjIGD+6cTjdfN+ULA51LsJozITCFWVs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eY6gOoxcSCjdcumy18/yrgHAPXuOtWFvoihO2NqKIgSSFbODDIcVfbEMN/SnhjRpOIh2/QK1zR4P8Olw8WiPxr9YfqN6OZTnh3HxhYpA5p6UnPRE1m4WAE6AegW8OeZy7lGsL0SkLmP0MWGWXVSaODvocmIT1LAsIFITZ7nvIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kPs3nZLZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kPs3nZLZ"
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B60C53F68F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738931006;
	bh=smgbTMbeu8icVrnu9cfoEB2Q5GHev6Hr1t62+cNN3e0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kPs3nZLZgAzRj1yJbHKLorWJTwmPUI2l1S0FOaK0ulBoqbJlOpwconfgJuqgQozUf
	 r4JcmIuXQOb9aCn44Lqr0aXlvWvEgQ+KgdwgAcBYVkYXlBlOie0buKD7eyqRmTI/77
	 boyKnocWi6fCQ9rz5G2NtNq4qY32qyilGimFHfhFs+Qq22mB7QCjdhgQyIhcgaU1Ff
	 2S9CSy5z2uOtYQZicBrKYIfeMV8BK2tab148AQLykgsGqn0d2tLqwPiHYNWdJurblb
	 4ECl0WxKw4qlDx8M6huWakpfKsrB5ETSqk9mdO4t5tjdQ2MPufyeNzqGeoVqjz3qPT
	 JmyFPHImnCjUw==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3ebb8b41130so2038536b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931005; x=1739535805;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smgbTMbeu8icVrnu9cfoEB2Q5GHev6Hr1t62+cNN3e0=;
        b=YojQtGcsKX+cbJCagOS3saH97XPi0kVMtsMGXKAovkRBAEzIK8GxYLPwtl5lPVxIyE
         +ZyK/Cl9ueOnnGzyCTHL4Zq4SphOx+JAoxaiuJpm/rzr3tbvCNcbvCIHoK4upqq6p++c
         2I+dvICL3wwskKSAebhXIsl/rjH2l33yWEnT1XRRakG/fCa095v7awcDZtbRp27kx7bb
         QWpUDGYYqJnlvprZ4L0A98Lxdw2Mk0MF7acIfkU7Fu97tmwPnxy/Rw3wHRwOwE8Ml1/K
         ySFJlFz5JzrH5uqLtaioQk9kTQm77jezeCyrkIU0Uf7lo3yjlyW9nDPb5Cbx2W+Mgx0Z
         11EQ==
X-Gm-Message-State: AOJu0YzqTVi2eo++/yWVKSf+zxVQneZWMOiPGzTX2gqmy46tvQSjq26A
	3+Bv5skWwekFN4L2r01jriyQbw52WXDGWcD7kDHeE2ez4p3yc7hI6aUTxFuoWrOTmMu0mzs/dQ5
	/e2tELdIcGXvVCrTnwPNEaRZgjAUK7v/zsOL3KY8124rgDQonzZn9ncM3qePjr1NGjE6BQpA6dD
	5uGUZU5GZ+2bNx1xo7nlc97/56jEbfDZojR/ayAxDweuzKUTAlgKuQ
X-Gm-Gg: ASbGncuXDzG9CRvBceSxBs7fzeT9lHyb1mJLhAU8mbC2kIRcLrFb+d6negftDm4RwuR
	isAJ9ievh96MxUJJv3/teIA3TOeHBgDFhicNuapueoaRoj59js3ksTapaNE3WBg==
X-Received: by 2002:a05:6808:158d:b0:3e8:1f5d:b804 with SMTP id 5614622812f47-3f392227aa1mr2106251b6e.15.1738931005651;
        Fri, 07 Feb 2025 04:23:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoWtq8QvHTFwUXCNlAOzdK6vr0/WNVnEmu1/clVLO6yPv833r20851aMa64CXNcis26sE03zc6C9b//9W3WHY=
X-Received: by 2002:a05:6808:158d:b0:3e8:1f5d:b804 with SMTP id
 5614622812f47-3f392227aa1mr2106085b6e.15.1738930999827; Fri, 07 Feb 2025
 04:23:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 07:23:19 -0500
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 07:23:19 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-3-e@freeshell.de>
 <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com> <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 07:23:19 -0500
X-Gm-Features: AWEUYZmFMLw_yZeW-AzXd8sVPQD1bUtN_FeA79ISlCbVkryjsD8gUyr6HkVDrCs
Message-ID: <CAJM55Z-fvjUiKEnOAnT_HLt0JHYooSgDWW+MpSq0nCTFoxPv3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Hi Emil,
>
> On 2/5/25 02:18, Emil Renner Berthing wrote:
> > E Shattow wrote:
> >> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
> >> better compatibility with operating system and downstream boot loader SPL
> >> secondary program loader.
> >
> > Here you should be explaining why these values better describe the hardware. To
> > me this just reads as "u-boot does this, so let's do the same" whith doesn't
> > really explain anything.
> >
> > /Emil
> >
> >>
> >> Signed-off-by: E Shattow <e@freeshell.de>
> >> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> index a5661b677687..8a59c3001339 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> @@ -317,8 +317,8 @@ &qspi {
> >>  	nor_flash: flash@0 {
> >>  		compatible = "jedec,spi-nor";
> >>  		reg = <0>;
> >> -		cdns,read-delay = <5>;
> >> -		spi-max-frequency = <12000000>;
> >> +		cdns,read-delay = <2>;
> >> +		spi-max-frequency = <100000000>;
> >>  		cdns,tshsl-ns = <1>;
> >>  		cdns,tsd2d-ns = <1>;
> >>  		cdns,tchsh-ns = <1>;
> >> --
> >> 2.47.2
> >>
>
> That is true, there's not much to explain. It works at delay 2 and
> 100MHz max. I tried many delay values with the pre-existing 12MHz max,
> they did not work. I don't have more information than that except what I
> wrote about on the U-Boot mailing list [1]
>
> [1]
> https://lore.kernel.org/u-boot/ZQ2PR01MB13072E932737DD9D65E3A250E637A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
>
> The parameter training code in U-Boot when given max 100MHz has this at
> somewhere between delay 2 and delay 3, where delay 3 almost appears to
> work but there's data corruption, and delay 1 is totally non-functional.
> With all testing so far the delay 2 and max frequency 100MHz is reliable
> and also is a common occurrence in the Linux code base for similar qspi
> access.
>
> My testing methodology was pretty extensive and I wrote about the result
> on the U-Boot mailing list, however here we're taking the success of
> that in U-Boot and literally just applying it to Linux where it also
> happens to align with some common similar assignments for other boards
> in the devicetree code base. It works and there's no deeper insight here.

This explanation is fine, but it should be in the commit message so we can go
back and check why those numbers were chosen.

/Emil
