Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E884D34
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745530105; cv=none; b=TLpmGGfeJlww40VWFBgukzoHKVxXHFKk3uLBVXkVOesH2n4QHUEwSA/Gkc2ocpk2ja70POUjF0/JJ2VhcIxT/1Fx2id86d0tKvV/9oEjaZmCPttCVSFCFsb9qsFUYnhdov7a7g1qJ00zitFRuM+0da9Uvwm+OwI7UI6PObqXo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745530105; c=relaxed/simple;
	bh=wLKWCvu+iQ+NHAp34v0YLucvFtvmmMtL0Blgbv19Ac8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M9glj/ZxNspoblvAfSC3F5yP7GsEusRxoOCw6yzZn7xysAvBFo1Scb4CV1BUs4VqVjbg9a/U6ETkVgZ47JULP2R/3i8AXjIPk8Mj6Q3k7pJjKplXioxnWlbr142GiI5S4OpPBB4drxfGtmiM9oUmeOZNpUX3CRFURxNRvzd/zeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=rGi9i1Q4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ORg9xDFj; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="rGi9i1Q4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ORg9xDFj"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 883EC13801DD;
	Thu, 24 Apr 2025 17:28:22 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 17:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745530102;
	 x=1745616502; bh=rZFS9AFpRvZdHjvWuollRfRtx2GgZpFwPOlMhnHg6H0=; b=
	rGi9i1Q4GxqrNKuwtbcB+HDUQkHKl9jxp6oXZAu8DvTr5Y7FYadzL2PJ7nY3ADMd
	uAeyVYtqha4pX7oQhby0z6x02BThGynZWZT4S9EYYMfnxxfuM3zIpYa/AyJrRPee
	S0E4j7dflGJMkgqjqEZvLDd1jKDLv8FcqfFkG+yiVh8iq3DUTn2wUrhuRB84i1xS
	XMsFEZaMl8Jm+Rbbs12z87VYZszxXD+F8ke+M8sq+LVQ2lbQP9x9Yk4rAvia4NSm
	LB5eJIw4kyMNBRKvGDBllqvaz5D40vcTqK1Viox5j3lMSmUIPSqfm90X7LZbf3SA
	sLLhtsmlJAJifYPtjFSasg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745530102; x=
	1745616502; bh=rZFS9AFpRvZdHjvWuollRfRtx2GgZpFwPOlMhnHg6H0=; b=O
	Rg9xDFjkpRT00qdQimXb1jCVedaHvBvjHFszlT7tlCXO8m9+q1GENv0svnPAS5/y
	03d+MwvlHIWpg8SAIZz4lcDj+kmi85DJHIsti9cs3j+QKXZkMGXo0k1caSKr2LJ5
	o05Rm8chzrTLU8hDIRBYnTHx/VSfsYrWl6vdT662BBvT8HThq2uhiGiIV0+Y0nO0
	09x0+1fYiGVTCL9L/c6ro9tp/yH/eKg5hHgksu/8Xhqp4eqAnUEsWLqSw3RXFd9A
	3wRzvyLLQK0Zyc8/anIMa4FGYkH/lDC4vXVtUt8RXROYkITeCpgqucxakTX0YY9q
	ubZuTy2P/r5KkZDIapT1g==
X-ME-Sender: <xms:9awKaLTry2rJDfElNuRh9IKcVtantZZEJ6efMu2OBjF0bhUWKfBphw>
    <xme:9awKaMwvfVhqTzSvqAvvhuFRHQcUjUvpJd_-VYWhYwJWTIwNxH0lHajHaLsHWjaei
    5GVHDuQTtbyIIOR4J4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdrtghomhdprhgtphhtthhopehp
    vghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvg
    hlrdgtohhmpdhrtghpthhtohepohhlihhvvghrrdhsrghnghesihhnthgvlhdrtghomhdp
    rhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehssghohi
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:9awKaA36rhUm8ERMbAvNW1CzKsdUp5Aj5-IeLkIN44R8m2xKGLwXZA>
    <xmx:9awKaLCRB39BR8b07IlqJvydMKjMHPyfVaut0huxKe8j3UTbJwwprQ>
    <xmx:9awKaEjsoA188NSg9Q7WdbxNpzg8Crf0x7SljLCsf09yGWoD_KxN7g>
    <xmx:9awKaPrmEyUpyR_-TBPcCwWs891VeaEcj4TUngJsSbAZBPeeRY91Vw>
    <xmx:9qwKaB0SVL6cAxmF9AHUQyTou1Mm1HeAdd-TQjSIvGqaRH8NvExB2w07>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D3ED2220073; Thu, 24 Apr 2025 17:28:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T4342aa6c0720da08
Date: Thu, 24 Apr 2025 23:27:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "kernel test robot" <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
 "John Stultz" <jstultz@google.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Stephen Boyd" <sboyd@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>
Message-Id: <dd29df0c-0b4f-44e6-b71b-2a358ea76fb4@app.fastmail.com>
In-Reply-To: <aAp6u9ylKCpvMJRF@gmail.com>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
 <aAp6u9ylKCpvMJRF@gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025, at 19:54, Ingo Molnar wrote:
> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
>> I really get the feeling that it's time to leave i486 support behind.=20
>> There's zero real reason for anybody to waste one second of=20
>> development effort on this kind of issue.
>
> Fully agreed!
>
> And to turn this idea into code, here's a very raw RFC series that=20
> starts removing non-TSC 586 and 486 code and related support code from=20
> the x86 architecture, with the goal to make TSC and CX8 (CMPXCHG8B)=20
> support unconditionally available:

Yes, makes sense. I had considered doing something like this in
my cleanup for large machines, but decided to keep stop there
because I know that there are users that love their museum pieces.

For embedded systems, I'm quite sure that the AMD =C3=89lan, SIS 55x,
RDC321x and Vortex86SX have ended their useful life. You may
still be able to buy Vortex86SX machines and they are probably
still running somewhere, but the entire point of those machines
is to run old software. DM&P provides patches for linux-2.6.29
and Windows CE 6.0 for the SX chips.

The desktop Socket 7 clones without CX8/TSC all got discontinued
over 25 years ago, and they were rare even then.

>       x86/platform: Remove CONFIG_X86_RDC321X support
>       arch/x86, gpio: Remove GPIO_RDC321X support
>       arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
>       arch/x86, mfd: Remove MFD_RDC321X support
>       x86/reboot: Remove the RDC321X reboot quirk

I'm not sure about the RDC321X bits. Obviously the original
321x/861x/vortex86sx chips are obsolete and can be removed,
but the product line is still actively developed by RDC and=20
DM&P, and I suspect that some of the drivers are still used
on 586tsc-class (vortex86dx, vortex86mx) and 686-class
(vortex86dx3, vortex86ex) SoCs that do run modern kernels and
get updates.

>       x86/cpu: Remove CPU_SUP_UMC_32 support
>       x86/cpu: Remove TSC-less CONFIG_M586 support

I think Winchip6 (486-class, no tsc, no cx8) and Winchip3D
(486-class, with tsc but no cx8) need to go as well then.

At this point, maybe we can consider removing
CONFIG_X86_GENERIC and just always build kernels that work
across a wide set of CPUs: Only CMOV and PAE still require a
CPU with the hardware support, and X86_L1_CACHE_SHIFT needs to
be at least 6 (64 byte) for compatibility, but everything
else should just be a tuning option.

      Arnd
