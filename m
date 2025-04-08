Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83C26A0E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115266; cv=none; b=Cc2CJvyE8FA6cfsZ9tYIAWMTtX92dxAy491qzv+hSAleOiE2a9V3B2gGEOtI34/lJMs5A5IE0MZPtPJu76OuW4qOAs3YCeujMvo5/T7lGHtVO5m6Jsd6H9oNFw1pa/MhBVdsjZEzHoPzePkXw3eFQukZRiN47SJTMuymXtZNGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115266; c=relaxed/simple;
	bh=IDQ1GUBQnBf8rB+j8B4YQyr6pwORfkpzRHAeXl4MJdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=solo0UNmMRiCoCZlmPzG6DsakQqZ1MgdC36wwSfj9pK8q94vzqd8Ml7DCsYimrvj86AwEpUYrQ9xk3oxyVyeucD7ReX2D8CGDU4We9yzOrJd/rPEqh3IKKc+D6nkT+AEwvc2uNQZ41MYr+wfF/M5EMqlY0XS65iiEhzu17l/c48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMrI9nxB; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMrI9nxB"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-700b17551cdso53440567b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115264; x=1744720064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB1seewdxiTr2VW07A3+uDKCe37V8ksv4C8EdOhGRy0=;
        b=VMrI9nxB0s0Z99TUT7AT9OOLUGMyfuRHfG+aR+L2o2WS1Z8C76iRCy3CPMgS/R5JLQ
         odPaDbDCDYb7ccEua9sI2sRWmDF7/XAMGe0GC+Hsqnp0Be5p9Ev8elj55TnkGpif/EwD
         1GGhlNxIHGcccvmpxI26h4pfN4xAz4E6Asihf39+/Xzfg4Oey99U3Wx9cJTdiKo3lbML
         Hz9fJY/HIeHdMEi1N3rcoGoO+y3LHC6QqxkXEItDV1LIVPQEhpKpdqMcbHt67xT1W+E3
         4xul1M1L4/cAzkmQQflunjOP55QuoHwAp+7oBcTVy9a2aLB3gfRbJVH2UDV692i544d3
         CMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115264; x=1744720064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB1seewdxiTr2VW07A3+uDKCe37V8ksv4C8EdOhGRy0=;
        b=cEoZJ9SAlkU0oGqwKeXECIWFUhHQ7tHoFZZOYHsyI0lJnCuTSgcY4sIED360ZeZBvv
         G6fhPeiKeB7cbX1g1DRJT3vBRWRoeDYjO7akuQV8SMfbCSMoWedPfjHMjzfUpdLeK/2q
         j5xVlgS4Z/T0VOI65360F4elvbtDVI1b8FahR8X92bP0Tl0767MqLQMCGvBUVuUknBbq
         dSVWJJvfrYt3rJzwu43GvZBrhmP5ZH0O4YsKTLQpaTBCOl4JNHywDDIokptZRiyPx4/l
         X5J3QbqGEYUcn45AY9EcWh/aXpK2LqMaEh830CV/dETvgaCy2LFXs+rT6wEE0oztqcPR
         8QAA==
X-Forwarded-Encrypted: i=1; AJvYcCX3fKw6D5PhiQmYPH8igw52DL/dnnr8egcan+sy/Yd6sHtV3Oe3VqsUud+sWJjj6XXxBgNbv/jci0pyflY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2lb6ctNyAvLMuxX1JPLaAw5+b1PYGWfa1ir6Itcex5iKffwf
	hF2NtjeO03T6G4N8GJveb4wcgu4gPeagRujpuUy44/voltOJs4fjZzHNZShHRF5I7qDu8EE8mHy
	59KUwvihEyJSqBppGfNXQ18QwJfNmc6GC5952fQ==
X-Gm-Gg: ASbGncsydndnxbluwTTPB1k+wNd3e8BpaxB6aS9RO52AT7Dp8/1VHIAgHFn2/yUwtul
	vFNLgi6Aq0KLYXpjcnAUtemudy4O+D6DVWGuyi8h/KIV5nzfYuhe1c12ppoguYQs5CR0sagzKWg
	tR9zc2k6B7zvXAvePmVO+7qQ7JQ0w=
X-Google-Smtp-Source: AGHT+IHPTBP1/MTjSrc/I/MptAtnciiKhGr+WPv5BjoVAvGTZrpvXVXjRqBEPOIQ+IqwWxaW3A1IyTTYeV/ni7FYYsI=
X-Received: by 2002:a05:690c:4b06:b0:6f9:af1f:53a4 with SMTP id
 00721157ae682-703e16636afmr292316087b3.32.1744115263719; Tue, 08 Apr 2025
 05:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
 <CGME20250303143637eucas1p1a3abdea520ab88688de1263a5f07bba0@eucas1p1.samsung.com>
 <20250303143629.400583-5-m.wilczynski@samsung.com> <de50dd55e1285726e8d5ebae73877486.sboyd@kernel.org>
 <4c035603-4c11-4e71-8ef3-b857a81bf5ef@samsung.com> <aacd03a071dce7b340d7170eae59d662d58f23b1.camel@pengutronix.de>
 <e90a0c77-61a0-49db-86ba-bac253f8ec53@samsung.com> <38d9650fc11a674c8b689d6bab937acf@kernel.org>
 <CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com>
 <ef17e5d1-b364-41e1-ab8b-86140cbe69b2@samsung.com> <21983f8d-681d-4fed-ae44-42eee44c7f14@samsung.com>
In-Reply-To: <21983f8d-681d-4fed-ae44-42eee44c7f14@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:27:07 +0200
X-Gm-Features: ATxdqUHjCmHHXOL_8iuBi_mjDxdVOZW28WwVm4E83fRcaHrvrprcU7GgL8K7Wwo
Message-ID: <CAPDyKFofVfrK04OVmJ2aX_0uMV0b+f8dCpoezpA9LJbnSOf-9Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] clk: thead: Add GPU clock gate control with CLKGEN
 reset support
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, 
	mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, wefu@redhat.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[...]

> >>>
> >>> It looks like the SoC glue makes the interactions between the clk and
> >>> reset frameworks complicated because GPU clks don't work if a reset i=
s
> >>> asserted. You're trying to find a place to coordinate the clk and res=
et.
> >>> Am I right?
> >>>
> >>> I'd advise managing the clks and resets in a generic power domain tha=
t
> >>> is attached to the GPU device. In that power domain, coordinate the c=
lk
> >>> and reset sequencing so that the reset is deasserted before the clks =
are
> >>> enabled (or whatever the actual requirement is). If the GPU driver
> >>> _must_ have a clk and reset pointer to use, implement one that either
> >>> does nothing or flag to the GPU driver that the power domain is manag=
ing
> >>> all this for it so it should just use runtime PM and system PM hooks =
to
> >>> turn on the clks and take the GPU out of reset.
> >>>
> >>> From what I can tell, the GPU driver maintainer doesn't want to think
> >>> about the wrapper that likely got placed around the hardware block
> >>> shipped by IMG. This wrapper is the SoC glue that needs to go into a
> >>> generic power domain so that the different PM resources, reset, clk,
> >>> etc. can be coordinated based on the GPU device's power state. It's
> >>> either that, or go the dwc3 route and have SoC glue platform drivers
> >>> that manage this stuff and create a child device to represent the har=
d
> >>> macro shipped by the vendor like Synopsys/Imagination. Doing the pare=
nt
> >>> device design isn't as flexible as PM domains because you can only ha=
ve
> >>> one parent device and the child device state can be ignored vs. many =
PM
> >>> domains attached in a graph to a device that are more directly
> >>> influenced by the device using runtime PM.
> >>>
> >>> Maybe you'll be heartened to know this problem isn't unique and has
> >>> existed for decades :) I don't know what state the graphics driver is=
 in
> >>> but they'll likely be interested in solving this problem in a way tha=
t
> >>> doesn't "pollute" their driver with SoC specific details. It's all a
> >>> question of where you put the code. The reset framework wants to focu=
s
> >>> on resets, the clk framework wants to focus on clks, and the graphics
> >>> driver wants to focus on graphics. BTW, we went through a similar
> >>> discussion with regulators and clks years ago and ended up handling t=
hat
> >>> with OPPs and power domains.
> >>
> >> Right, power-domain providers are mostly implementing SoC specific cod=
e.
> >>
> >> In some cases, power-domain providers also handle per device SoC
> >> specific constraints/sequences, which seems what you are discussing
> >> here. For that, genpd has a couple of callbacks that could be
> >> interesting to have a look at, such as:
> >>
> >> genpd->attach|detach_dev() - for probe/remove
> >> genpd.dev_ops->start|stop() - for runtime/system PM
> >>
> >> That said, maybe just using the regular genpd->power_on|off() callback
> >> is sufficient here, depending on how you decide to model things.
> >
> >
> > Thanks Stephen, Ulf !
> >
> > So the way forward I see:
> >
> > 1) The reset driver can be merged as-is, if Philipp is fine with this
> > code [2].
> > 2) I will cook up the update to the thead power-domain driver which wil=
l
> > handle reset and clock management.
>
> Hi Ulf,
> I'm working on the series right now and I wanted to ask you how you
> prefer versioning to be handled. Would you like me to send a series as a
> v1, or treat is as a continuation of this series [1] and send as a v9.
> Would like to avoid any confusion.

I would suggest starting over with v1, but don't forget to refer to
some of the previous attempts/discussion in the cover-letter.  At
least I would be fine by this.

>
> Thanks,
> Micha=C5=82
>
> [1] - https://lore.kernel.org/all/20250311171900.1549916-1-m.wilczynski@s=
amsung.com/
>

[...]

Kind regards
Uffe
