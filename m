Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21CF10E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307153; cv=none; b=oLSCjz+UKlx1ysh3kqCR2OyoQXTktarIgm6v+vikQ4/mdcF/CPMqzegJYstBQM1oEvlAhYvOqBjdunaFk3xWlfOUQ6sfT59oGLJjTQgJG1tjV1iLTF8PRW08Onn00o9ujra9s/5BB8f+go0GbDP5N6MBTUKx53+HEFB40hD61ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307153; c=relaxed/simple;
	bh=4Y1B7yEUMwN8Yi4EnTP1B1Mj+kWnL8dJZYt6BzSnYHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVhZdDuGmtYjETVt2DxsOoTfBuQMewAR6zYKjS8U4nSQtmZ1x0ejTkMHexdsO83oGzzJcOj9eDN3gVYd3ZNyBDc6aUGhPCwWrDb4Z0NZNghk9g1lssrumEeCOMCIYfKGrK+csrVO7CfLI7F3JT2m8OOWnDOrsBj2nskXxGsxZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=A94Eb/lZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V2s81PiK; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="A94Eb/lZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V2s81PiK"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 788DC1140189;
	Thu, 15 May 2025 07:05:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 15 May 2025 07:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747307149; x=
	1747393549; bh=c1dvWW4gQyzSKfq4Kp8HqCWRioZZ6Lyhd8KNO5uJE7Y=; b=A
	94Eb/lZ/EEx+pEYXi+N9Z4vlXLH6QC/ZS/nLW6EJRoAtT2TJzad85DJA01d7N65K
	FSl5ISDQQ/nXYTQmkC+oZMFdi1OlmHoRXOrNbfu4Xa4rt9gVV3ipsJGzAyxz7sEN
	5jkIISbHJCEX984ww4+thonxS4RInjUDYFz7dkCSk/34KdP8s57UHANrf3W53rN8
	l8NXVcr42Tbai4esFWquODcUM7w60+AKWPGe+1dGrpeUGlm+e0sJl+TZFNdCsqqu
	URwMGFFuEtOebNO2F732bCjANzi0KKOxBzz+xaZrLaNuhHYfgW6F82ydgLH/S++J
	vrM1wg66U5QeVivkduQqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747307149; x=1747393549; bh=c1dvWW4gQyzSKfq4Kp8HqCWRioZZ6Lyhd8K
	NO5uJE7Y=; b=V2s81PiKeaWH9uuRLSDHKm5WUFIf3mXl/oWsHvvgqtYB6jhdgUP
	U5aV1OxmDkweHZTlEW1D7YLWQXJBbBbsKDTUTT+7fu/e3GmBz2Xn3w8wzXFnvKQC
	sYIqdwj2mMHgiFTRgOJdkcUHeBtoW3WhdscapdjSOkRisBMeWs2PVu0PWoNz5/bd
	DuqPm4KUUC6ybhqWTeAREoEjJ8NCdv1aBxGNc5TooaYG30yrnZx1UDwTqfuZEyAd
	FXYpkjXu3w9hIUrOfqVV+hxldL8RTpUxiVk7+9V1mxENLF3qkLG6TUcwOgo5HI5e
	aIAL20mkeREsKIee1EyTHWanEc45yVUWUSA==
X-ME-Sender: <xms:jMolaGQ6mxCMnGs2XGrQXTNDBmDA4VhnsYmFLyIEaDQP-gVasj6rbg>
    <xme:jMolaLzQs1wKLwJXaUNIiBqucM51N0yz_7eX799sNYpseXoZLvF0a5kX2P6aJIK1b
    GOOKkEdAZ1fQhEeavw>
X-ME-Received: <xmr:jMolaD0gyXLgz2CPzaszQLpb8oJkX2Z5xncnmKSs13SuoBFXg5TyaSBFlx-CtIjgOaCYmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeljedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeeukedttefgkedv
    keejhfegvdeuhffhgeeihfeulefffedtueejhffgheegtdevvdenucffohhmrghinhephh
    gvrggupgeigedrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtth
    hopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhgusgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtohepsghrghgvrhhsthesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:jMolaCD0uHXt9d60scSxNF6255qE6yNMAMubWPdM1NejPAerSph58w>
    <xmx:jMolaPh12FSZ2jHtx5_Oblt5vzrSdhD5Ngwrcza39_C661OrIQACfw>
    <xmx:jMolaOqmres3_83wgp1Bhry9nb1ogNnwDTPW6vdpTTlpyFNxFDBVUA>
    <xmx:jMolaCjfO5td0u4Z1JWs1vr19t3cUwXxEWIUa0uWlcP26gWnwE__WQ>
    <xmx:jcolaCsfdAx60VIsMceH_GnBo7maOIgl5STmi96nAMfvP11Q_wH_9-xP>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 07:05:46 -0400 (EDT)
Date: Thu, 15 May 2025 14:05:42 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 4/7] x86/boot: Set 5-level paging CPU cap before
 entering C code
Message-ID: <4ul6frw5heovjirf73hygxc2ncfgd3ssb4m2nyef4catd5zasl@dqy5d7z3eknr>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-13-ardb+git@google.com>
 <loshl2p4k2p7pvgwsympb3f5jisv4cnt5eh4gqabd3cdaifoeu@bahujxd4qvrl>
 <CAMj1kXGUmmBuho7PM3iQAjY33kjxT2qwM7jNoNvLHf6rmTdDYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGUmmBuho7PM3iQAjY33kjxT2qwM7jNoNvLHf6rmTdDYg@mail.gmail.com>

On Thu, May 15, 2025 at 10:43:27AM +0100, Ard Biesheuvel wrote:
> On Thu, 15 May 2025 at 09:00, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > On Wed, May 14, 2025 at 12:42:47PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > In order for pgtable_l5_enabled() to be reliable wherever it is used and
> > > however early, set the associated CPU capability from asm code before
> > > entering the startup C code.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/include/asm/cpufeature.h | 12 +++++++++---
> > >  arch/x86/kernel/cpu/common.c      |  3 ---
> > >  arch/x86/kernel/head_64.S         | 15 +++++++++++++++
> > >  3 files changed, 24 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
> > > index 893cbca37fe9..1b5de40e7bf7 100644
> > > --- a/arch/x86/include/asm/cpufeature.h
> > > +++ b/arch/x86/include/asm/cpufeature.h
> > > @@ -2,10 +2,10 @@
> > >  #ifndef _ASM_X86_CPUFEATURE_H
> > >  #define _ASM_X86_CPUFEATURE_H
> > >
> > > +#ifdef __KERNEL__
> > > +#ifndef __ASSEMBLER__
> > >  #include <asm/processor.h>
> > >
> > > -#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
> > > -
> > >  #include <asm/asm.h>
> > >  #include <linux/bitops.h>
> > >  #include <asm/alternative.h>
> > > @@ -137,5 +137,11 @@ static __always_inline bool _static_cpu_has(u16 bit)
> > >  #define CPU_FEATURE_TYPEVAL          boot_cpu_data.x86_vendor, boot_cpu_data.x86, \
> > >                                       boot_cpu_data.x86_model
> > >
> > > -#endif /* defined(__KERNEL__) && !defined(__ASSEMBLER__) */
> > > +#else /* !defined(__ASSEMBLER__) */
> > > +     .macro  setup_force_cpu_cap, cap:req
> > > +     btsl    $\cap % 32, boot_cpu_data+CPUINFO_x86_capability+4*(\cap / 32)(%rip)
> > > +     btsl    $\cap % 32, cpu_caps_set+4*(\cap / 32)(%rip)
> > > +     .endm
> > > +#endif /* !defined(__ASSEMBLER__) */
> > > +#endif /* defined(__KERNEL__) */
> > >  #endif /* _ASM_X86_CPUFEATURE_H */
> > > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > > index f6f206743d6a..c8954dc2fb26 100644
> > > --- a/arch/x86/kernel/cpu/common.c
> > > +++ b/arch/x86/kernel/cpu/common.c
> > > @@ -1752,9 +1752,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
> > >       setup_clear_cpu_cap(X86_FEATURE_PCID);
> > >  #endif
> > >
> > > -     if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> > > -             setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
> > > -
> > >       detect_nopl();
> > >  }
> > >
> > > diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> > > index 069420853304..191d5947a762 100644
> > > --- a/arch/x86/kernel/head_64.S
> > > +++ b/arch/x86/kernel/head_64.S
> > > @@ -27,6 +27,7 @@
> > >  #include <asm/fixmap.h>
> > >  #include <asm/smp.h>
> > >  #include <asm/thread_info.h>
> > > +#include <asm/cpufeature.h>
> > >
> > >  /*
> > >   * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
> > > @@ -58,6 +59,20 @@ SYM_CODE_START_NOALIGN(startup_64)
> > >        */
> > >       mov     %rsi, %r15
> > >
> > > +#ifdef CONFIG_X86_5LEVEL
> >
> > Is #ifdef really needed?
> >
> 
> 'Really needed' no but setting this capability is semantically murky
> if the kernel is not configured to support it. But you wouldn't get
> far in that case, so it doesn't matter much in practice.

If we get here with CR4.LA57=1 and CONFIG_X86_5LEVEL=n, we are screwed.
Something is very broken in stub or decompressor.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
