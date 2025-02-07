Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C31DE8AE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930922; cv=none; b=mbUXJWsMcOMfw10m0uxYJOHjXm91bDJSljiLuoPNo+XLCueuC/nA5azKujyuPuMAnfSvDyWb+MgLTDq4yUp2auK38eOU3T/GStCHO4rP3qTind0+H/iwbdpsLtBKfOShY/z/aIDrBbaqmad+i812NiYOlKBxnrvgdFLMoccDw6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930922; c=relaxed/simple;
	bh=tR5fX/SrcwQMtyjLVBuBtWUiGsJAX7EJADfXcgVi8WU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8lQLFl90+1U9iwFJQ9jB4u84Mq/XyZqqVhk7qNp2sE1ised2fGPbS7/vQyX9WwMX9r+fk9b7ONUJ3FcmewGb8OcYJcxt1KIiLXSg/Wvut3gI6Vo9mPbQhZ8LvwRlzwvF2ngdzeRJmM6KCFnr3QyWB+d5weQEcVNGfY5bpmtw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=aI1IA//7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="aI1IA//7"
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 922A63FE59
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738930915;
	bh=bLYbBkGBrBPKD0BA+zFMlOKFJsc5hMvXA5oz9aSTjyU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=aI1IA//7pBo/FYAoSPXPE2XyU2iIbqSQjBCQY71OX+J3m1pQC3JIFSjAprHms9sbO
	 bJ1tHvYjxjCwEc49BM10dOhbUCgI6ecJ00SZrtjhcuH6Y9B4M5frQdOLZnmUI5IIYG
	 HaMdmR5fB9WhixmplYxSMzCIAhG8M/qiHKGETFryu6bxaiRtnX6cQoULoh+tCwuJia
	 PoacAZX8jbVT6lGd5dmPqFAOlUEMZUkAkgdZ717JgD8IRRzWGuqMkBhZQbbBKNar8Y
	 d+fbxR8Lg1jrCgrH7DcFx0q65ofs0SvgMMxMEUvOfeOv+39MzzbozLO3t5pJ53Q2B7
	 /tYtTGkWJmgfA==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3eb97b1cc12so725638b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738930914; x=1739535714;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLYbBkGBrBPKD0BA+zFMlOKFJsc5hMvXA5oz9aSTjyU=;
        b=KKa5gs6qlMX2i6h90kH1ujxw4hen2fa2TLkOzfnYC8C12RHnicdyVVE0vvkLj+Ak/u
         2OPpthYDhWgganbdv9rKaDtEXow7IjqRH9Rtm6DUotvR0EHdT7snXNPwEjOfBpzcT1gC
         KEhpLfwKvKFi8OZkjeoQjHfNKggfGQ52dQEfFPYMtaxlC33tK41AK9jwQEjoZL+UftuU
         7Fv8T6lf81HBP62ONC7MLeMg5joe+CpnRNgeVHBwJFByM8BXhD4pcyC7SMcxKl+JKYrZ
         eZhMnIucZbDH+fvH2dPO3mKV+KwLz2b+gxxd1WiuPLCjLS84VLCeqSw8veONfB1D7niy
         F0fw==
X-Gm-Message-State: AOJu0YwPoNfDZJz9BWXVOpZlQsJIrnGj4mYL0tsGTfBANocl3k1ttmkg
	LyOtKpwfgZVfUr6lkc0gH6mt9vQQMTH7fk4NzOz0tqJdWYNQJ4Hx8sthvOvqZ7mQFdT1anJuC1k
	Z1AgYWy+4UcZLjJtlLPM54dqt+g8YZnew508njD2hkhIBY+GXEPTENbm8wvOxXHpiZhY+HrV1LG
	qH3XmPCLRYsvqoIkrbMeEVfmYZZaKK8BaE2rowiZZNJCNaLpAsUkVK
X-Gm-Gg: ASbGncsF2yQ3POdvNcgE/3bXB9xUKhAAxBhnn152vgdINIs9zrFVHUL7qQCcDPho9eG
	feEW8ZNfSi58jCLD8dtjwbKx3++RY0XgKfZKcYc4DD5fYV2LW71yYy5A0YQpTWA==
X-Received: by 2002:a05:6808:1a22:b0:3e7:5b06:ff61 with SMTP id 5614622812f47-3f392324bbdmr2004972b6e.21.1738930914174;
        Fri, 07 Feb 2025 04:21:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0nrruP1KWAtV3Ixvpat5sYozBaFXe8iNBwq/tYngmUIbKou/lN0W5ZFA5kCc2px9kPN8lYrh9JqD5uo1u+aw=
X-Received: by 2002:a05:6808:1a22:b0:3e7:5b06:ff61 with SMTP id
 5614622812f47-3f392324bbdmr2004957b6e.21.1738930913755; Fri, 07 Feb 2025
 04:21:53 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:21:53 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:21:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com> <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 04:21:53 -0800
X-Gm-Features: AWEUYZlUXTw9uJtoXI-0CyJ4qca5NzN8JB2qd0nSma75DDzMHwSqSLFJSPEnyhI
Message-ID: <CAJM55Z9HTLoE3ShMfyqN=-KeC+EY_kQ+JSvFpxpX1gumio1Brg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: E Shattow <e@freeshell.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
>
>
> On 2/5/25 02:16, Emil Renner Berthing wrote:
> > E Shattow wrote:
> >> Replace syscrg assignments of clocks, clock parents, and rates with
> >> default settings for compatibility with downstream boot loader SPL
> >> secondary program loader.
> >>
> >> Signed-off-by: E Shattow <e@freeshell.de>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> index 48fb5091b817..a5661b677687 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
> >>  };
> >>
> >>  &syscrg {
> >> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >> -	assigned-clock-rates = <500000000>, <1500000000>;
> >> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> >> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> >> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> >
> > I think Conor asked about this too, but you still don't write why it's ok to
> > drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
> > respectively. You should add this to the commit message itself.
> >
> > /Emil
>
> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
> the frequencies and increasing core voltage was ever needed.

I think it's quite common for SoCs come out of reset in a safe slow clock
configuration and then expect software to set clock speeds to what the chip is
really capable of.

> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
>
> Since [1] I have had problems with several passively cooled Milk-V Mars
> CM Lite systems powering off due to thermal limits. My experience then
> is that the specialized 1.5GHz operation is not appropriate for all
> JH7110 CPU board layouts and applications.

If that's the case then maybe only lower the clock speed on the Mars CM Lite
boards.

> Hal says I failed to get these assignments in Linux to work in U-Boot
> because U-Boot doesn't have driver support to increase CPU voltage, and
> Hal offering to add this to a driver in U-Boot... but that's the wrong
> way around in my opinion, unless there's some defect in the JH7110 CPU
> that it won't run reliably with hardware defaults.
>
> 1:
> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
>
> What is the correct thing to do here?

I really don't think slowing down all the boards because of missing code in
U-Boot is the right solution, but Hal also answered in the old thread.

/Emil
