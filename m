Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAF238177
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573607; cv=none; b=KQBMFoXLqqD4FaQ7B1DUJwYFsh99wfMQD0PwzXuTCIdRXbLmxGAPBAUebEHZa6E/Sugjd3Hs67Wxm3x+BV72XTo4gZrrn4Dy7jPs4ax4SmphlpG2o2t4dz6zz4F0vhcaEs49RxIC5/YLgh6xOcXuDjLiSWLH6oiSaYhKkMF+BQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573607; c=relaxed/simple;
	bh=xEFueX/Bodec7Gjjbs3hNXIqlH8WQ8s+TotgDo5QQto=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Q6STacAgy+WM9OLu96NDI850nWjlOJ4JTpvgOv20qxFzjY5X5pYtrdDtzL8Zv+6EU72QGN/Dn4w/jMgKPhHKcsSQH6pe+DsDH6Apu45BKMcDPVUJUBQFjeM21dJkz5yMZrw/dg32S+AXXcKMq1BmmxSbWolTsYM8buaAg/pF3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RC724N45; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fI2Qj7ok; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RC724N45";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fI2Qj7ok"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AFF80254024D;
	Fri, 25 Apr 2025 05:33:23 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 05:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745573603;
	 x=1745660003; bh=qfJfUJA53o5up8Yqx6+gPpPZuOdO309/Ile0zl2l7aA=; b=
	RC724N45eAxRdI9X4IRTpF39R+Mgib5n8OBWCJJBBTJvpfHbwVX1tjT77ke5raEK
	k+27rT/3VVGKhVRnz/HyiWHnIn6UakbYqEN+bD4MAm2lasepdN7j9fJdFj/3UrIL
	yNl5YEE+b/V48QLWCIX9t3iVoac6j86Ng7+N+tGxW6b0ZeKVx6MWnB9Lxm9eB4qI
	MTfSwdrZtZS/bMGJgOqsioSLECyALhtc0z9jTdpVdsJ92UnZvWGlew3tjmBERGq7
	NqbZ/pnPKZJ484Lg5qahs1n/+I20ZgtjqktCWgMRNGN0lgDjkd3O+zdhY2qC6h25
	4ihfSXVD9SFAurjJWogBOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745573603; x=
	1745660003; bh=qfJfUJA53o5up8Yqx6+gPpPZuOdO309/Ile0zl2l7aA=; b=f
	I2Qj7ok5kNsVOmyk+fD0XSTr9vbLsvMTm9cU53/EFz+bvACfIPlBZ2tAWJSt/lYz
	y+1zzTgcGxrH+Hi9TD4RXborPOJ8TwUa58/LmCFgTViNzQpHTdxnck+xTYDSP50e
	ZV7d5C7cWriD3SWCH0Mb6UHyStuZdbYsjC88cVZtrUrJHwn2lNvvVxD0rEsFhGUM
	Z1rOErDnG4jmRFvVLkmFKnP0yNtwTymC6hJv/QoB/JqbpqLDinwiDk+r7xsyfLr1
	HILhgAhSpA9zetcd87d44FANl9jk49jTafEUFq5EqeGkd40+aEylsg7fXCBKNSvD
	Q3rurVVV1QKTipmbxmCyg==
X-ME-Sender: <xms:4lYLaLLhWbpm6Y74zEgTpHuDQlkAdQkbRXVedFoAWKQwHiufd6tNFQ>
    <xme:4lYLaPIgGc044tHsN4aY4fmXuRjO7rO6ezVAgExOtsh09c8VEwATFfR1r0reedTrv
    r48QPfQHILRyECFOAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhhsthhulhhtiies
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopeholhhi
    vhgvrhdrshgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhhinhhgoheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuh
    htrhhonhhigidruggv
X-ME-Proxy: <xmx:4lYLaDvLxBlwoiPKdPATE0wvxbxZQyDI__6t8N9x0lFGOY37Rvou7w>
    <xmx:4lYLaEb2qJAt0DpW9ukHgJ0ApWpSnEfJZ1npDObMAdE1p6jnNwLpUw>
    <xmx:4lYLaCaE_10yeBUH0nfgBBKQ00ApMtFD7u85l0WzKfxjITzuj6wNTg>
    <xmx:4lYLaIAEdN5b5T9mw4QF7Z1zWiRAm2lA6GF70uPnwZrrGDrMoD8puw>
    <xmx:41YLaNA10GyT2DCIqrDLidlbi789eHlAfZutuShdUl1IVquARiLd1T4Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F7C42220073; Fri, 25 Apr 2025 05:33:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T4342aa6c0720da08
Date: Fri, 25 Apr 2025 11:30:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "kernel test robot" <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
 "John Stultz" <jstultz@google.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Stephen Boyd" <sboyd@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>
Message-Id: <69b8542a-81e8-4e51-983f-9d3067d9ecd0@app.fastmail.com>
In-Reply-To: <aAs8fuPmXz7kK1l4@gmail.com>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
 <aAp6u9ylKCpvMJRF@gmail.com>
 <dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com>
 <aAs8fuPmXz7kK1l4@gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 09:40, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@arndb.de> wrote:
>
>> >       x86/platform: Remove CONFIG_X86_RDC321X support
>> >       arch/x86, gpio: Remove GPIO_RDC321X support
>> >       arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
>> >       arch/x86, mfd: Remove MFD_RDC321X support
>> >       x86/reboot: Remove the RDC321X reboot quirk
>> 
>> I'm not sure about the RDC321X bits. Obviously the original
>> 321x/861x/vortex86sx chips are obsolete and can be removed,
>> but the product line is still actively developed by RDC and 
>> DM&P, and I suspect that some of the drivers are still used
>> on 586tsc-class (vortex86dx, vortex86mx) and 686-class
>> (vortex86dx3, vortex86ex) SoCs that do run modern kernels and
>> get updates.
>
> So CONFIG_X86_RDC321X actively selects M486:
>
> +++ b/arch/x86/Kconfig
> 
>  config X86_RDC321X
>         bool "RDC R-321x SoC"
>         depends on X86_32
>         depends on X86_EXTENDED_PLATFORM
>         select M486
>         ^^^^^^^^^^^
>         select X86_REBOOTFIXUPS

Right, when the code got added, it was certainly for that
specific chip, which I think is 486SX compatible.

The 'select M486' here doesn't actually do anything because
Kconfig silently ignores 'select' for 'choice' symbols.

> But indeed the other drivers are not dependent on M486, at least 
> overtly:
>
>   arch/x86, mfd: Remove MFD_RDC321X support
>   arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
>   arch/x86, gpio: Remove GPIO_RDC321X support
>
> Although the watchdog driver has this indirect dependency:
>
>    drivers/watchdog/Kconfig:       depends on X86_RDC321X || COMPILE_TEST

> Anyway, I've dropped the mfd/watchdog/gpio removal patches, no harm in 
> keeping these drivers.

Thanks. We should still revisit all these separately and see which
ones are used on more modern RDC/Vortex86 chips, as the relation
between the brands isn't well documented.

I found an older lspci output from Xcore86MX/Vortex86MX showing
that is uses an RDC R6021/R6036 bridge instead of R6020/R6030
on the RDC321x:

https://lore.kernel.org/all/4CC80AF3.9040708@croler.net/

The Vortex86DX (585tsc compatible) datasheet in turn lists
an R6021/R6031, which means the driver won't work out of the box,
but it's probably not far off either if someone just adds
the PCI ID.

Clearly nobody has done that so far, which would indicate that
not a lot of people run vortex86 /and/ realize it's related
to rdc321x.

> and I've switched the watchdog driver over to X86_32:
>
>   config RDC321X_WDT
>         tristate "RDC R-321x SoC watchdog"
>         depends on X86_32 || COMPILE_TEST

How about 'CPU_SUP_VORTEX_32 || COMPILE_TEST'?

> There's also no harm in keeping the southbridge reboot quirk I suppose, 
> so I've dropped this as well:
>
>   x86/reboot: Remove the RDC321X reboot quirk

Right. Same thing here: the code probably still works on later
R603x south bridges, but only triggers on the R6030 PCI ID
that is not used on supported chips. Most likely nothing
needs it.

    Arnd
