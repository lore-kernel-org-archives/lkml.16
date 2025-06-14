Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B6178F2B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749939805; cv=none; b=FHxYMv90OGcgBW5YAFVjm5VK4HFCqVkMKKhZvUE+WBu3nlThKchwfH7orM5JluKh1K6ZLgMRD8nPf4gG7P9zB9GY2j9X/riPqYjsVuszXRiYsyDZCDEu9XmIjDSkADb6XaO6hIxF+XdPWLq59I5Ex08LoxMTQaofccjVK3JbI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749939805; c=relaxed/simple;
	bh=JgXzOSwx3lx593qrtNOab+gWyh803AH/x2RF7pnBC1Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u3WsorsbfUl0wFNqXbbovMeYvdUMAnAsWZi9+Kj96DhaDKgMbWsYfsQSNXthR7I53Kri2k550vM3NKOBYBBQjRfDEipNAk+GN3gEkmbHcpPNcGU25hzsSTpjSpxzC5G/TMgsoYCd+PxX05Qumpk46K39B43Crs2zK6sTVn5CejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=ctRlsid/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KpTUwHhG; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="ctRlsid/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KpTUwHhG"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B94025400B1;
	Sat, 14 Jun 2025 18:23:21 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-08.internal (MEProxy); Sat, 14 Jun 2025 18:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1749939801; x=1750026201; bh=R5IH2AQBUb
	4RAS5LogGIc5vg9iZoaEBh2D+FWHxCDl0=; b=ctRlsid/ybC7YOAceTlvg/Lljy
	+jEzumd1RqAaaH67zdB3X2j8VSMknaUm2+diNozpH3jwnupt9Brwq4Sr8Wn2nWlK
	fEf1y2THjH1ZDAo1e/vS9yb35YyP3cfn6DfvZhh4JW9SV15y9LvXh6Zdw273dCPK
	QwoBXFGsw1S144dFgqEcHjk6LZr5ZKSBFteR5K/v2ob8/vD348S+pmTHeIZONwol
	kUZU6khSdjI8pMKUQp4BoQgbHHounER5zu0R/fNergZZSJmUUV+WXEH/7B/8i8uW
	wHuYrETGysi/iqjQCRRZc1T9OaPl4v2TqzK5pTG1svb6hcPElXKA9ibW8aHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749939801; x=1750026201; bh=R5IH2AQBUb4RAS5LogGIc5vg9iZoaEBh2D+
	FWHxCDl0=; b=KpTUwHhGbQQcPRlao0++96xxKvhWWRAHd3N4800SjnbQEkQcGLS
	TglahkSiIR8CFloElMEjxFtN0GHUKqstHxrlsKdxQhXLWIxDhDN07Q1UsIv4W242
	pGQ1KmelP88vIYTo+w4LU3WfMvoxU6LnWOJmWb97JHMKTRAmTyL5A11a3ElvXBRK
	ZdrqXzjNAcgYLGg/rHhmSkGs9uQ1pA9TGWnkO994xr3uN+ok9O579y5p6dXV2z/r
	mAOoqsdFQyiK0Q2nTNT2GkmtlWfPWIpjGMk+B+SgGu9e8SXGJzQCjE8yAvmxdEfs
	gjqR1nfi5LurvEM9WJ9WJIKcVimDIoi9vfg==
X-ME-Sender: <xms:V_ZNaHgnS-dhmiUFsR-y42HnvlK8Rhx4fCJsFZvDuP4MTGD946urvQ>
    <xme:V_ZNaEC6C7t1_kcvVolFH4XzNrEetWr3dcTMch3D0H3hxilzWHOqDe4lQldZiEh0J
    vba-gtQw39MAYLHZo8>
X-ME-Received: <xmr:V_ZNaHEltFeP7JXnqH9fyCbKE82a6mZmK5efgWbgQ-vqLqeLYox0VKnSqGU_U00wRKtSXXb-lTWw6ii2EtnDpNZnWH7k_MfDSn2AgUEXkc6LsI7mIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomheppfhitgholhgrshcurfhithhrvgcuoehnihgtohesfhhluhignhhitgdrnh
    gvtheqnecuggftrfgrthhtvghrnhepgfevvdfhfeeujeeggffgfefhleffieeiuddvheff
    udehudffkeekhfegfffhfeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsggprhgtphhtthho
    peejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovg
    hnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegsihhjuhdruggrshdrjhii
    segsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegurghvihgurdhlrghighhhth
    drlhhinhhugiesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrth
    hiohhnrdhorhhgpdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:V_ZNaETjZvgTlYAlvoOXkvYFef8jJ0Ne_29TXS94eLRnazoGIu2Gzg>
    <xmx:V_ZNaEyg8erYO8R7clzLz2PTzlZnwxLAoLqyUk2Ggls-hsrpW5VnRA>
    <xmx:V_ZNaK4k3E0HWLgqJ0JSEDxtte2_OYRW9YS4YbxF2uhxWLwdgHd5vA>
    <xmx:V_ZNaJyDtRaOB8CO6zJXWxQoQiCs3d8ljufgdEW8Rtbnu8VUX2wOnA>
    <xmx:WfZNaDChNvq-EtFNhv5wRaLVqCqt-KdQOrkOQpYeJhp-mwbX30_ypt-Y>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 18:23:19 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id F38D811F386C;
	Sat, 14 Jun 2025 18:23:18 -0400 (EDT)
Date: Sat, 14 Jun 2025 18:23:18 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 02/10] lib: mul_u64_u64_div_u64() Use WARN_ONCE()
 for divide errors.
In-Reply-To: <20250614222633.77a7d242@pumpkin>
Message-ID: <0qs6r27q-qq9s-s676-p80q-s20po6541q16@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-3-david.laight.linux@gmail.com> <4rp80297-985r-546o-on47-q34rr7po03r7@syhkavp.arg> <20250614222633.77a7d242@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> On Sat, 14 Jun 2025 11:17:33 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Sat, 14 Jun 2025, David Laight wrote:
> > 
> > > Do an explicit WARN_ONCE(!divisor) instead of hoping the 'undefined
> > > behaviour' the compiler generates for a compile-time 1/0 is in any
> > > way useful.
> > > 
> > > Return 0 (rather than ~(u64)0) because it is less likely to cause
> > > further serious issues.  
> > 
> > I still disagree with this patch. Whether or not what the compiler 
> > produces is useful is beside the point. What's important here is to have 
> > a coherent behavior across all division flavors and what's proposed here 
> > is not.
> > 
> > Arguably, a compile time 1/0 might not be what we want either. The 
> > compiler forces an "illegal instruction" exception when what we want is 
> > a "floating point" exception (strange to have floating point exceptions 
> > for integer divisions but that's what it is).
> > 
> > So I'd suggest the following instead:
> > 
> > ----- >8  
> > From Nicolas Pitre <npitre@baylibre.com>
> > Subject: [PATCH] mul_u64_u64_div_u64(): improve division-by-zero handling
> > 
> > Forcing 1/0 at compile time makes the compiler (on x86 at least) to emit 
> > an undefined instruction to trigger the exception. But that's not what 
> > we want. Modify the code so that an actual runtime div-by-0 exception
> > is triggered to be coherent with the behavior of all the other division
> > flavors.
> > 
> > And don't use 1 for the dividend as the compiler would convert the 
> > actual division into a simple compare.
> 
> The alternative would be BUG() or BUG_ON() - but Linus really doesn't
> like those unless there is no alternative.
> 
> I'm pretty sure that both divide overflow (quotient too large) and
> divide by zero are 'Undefined behaviour' in C.
> Unless the compiler detects and does something 'strange' it becomes
> cpu architecture defined.

Exactly. Let each architecture produce what people expect of them when a 
zero divisor is encountered.

> It is actually a right PITA that many cpu trap for overflow
> and/or divide by zero (x86 traps for both, m68k traps for divide by
> zero but sets the overflow flag for overflow (with unchanged outputs),
> can't find my arm book, sparc doesn't have divide).

Some ARMs don't have divide either. But the software lib the compiler is 
relying on in those cases deals with a zero divisor already. We should 
involve the same path here.


Nicolas
