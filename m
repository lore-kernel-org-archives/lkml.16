Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34699F4ED
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304282; cv=none; b=JGOsdrNVqeYXwZjSoB84f/Gl6gxNJzWmCX6IodUXKaZN8LtU2gmBqzyMU0sb6gt9j4guS4FgKQsc7YPTkuvZ+6wdi/S52uKWXiHDI3semlyO+cJyYZsXRfQSqveZdHHEb2T9FWacG+UZ8L4IDgSIZAsTJJ2g4xDSAl8crNFSH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304282; c=relaxed/simple;
	bh=mRNhaJxrS52yu6RBqXmhjKIE1neJvcshNuxE4ZSPuvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJVupTg7uvIL+PRC5Tv6fmZLQWWqEP7S8CS880FAhD7U3j4xZHFsSTRY6piwt8W4f5uhokupbIWF3ubYUGFuFSemE+mRGUIF2CS/rXTbQ+/wFMIWJV0ZG1M90JgQvxtqaWbPCKT4LIEbQMSrYaN+bFLVw2EQSh1v6Omfi++L0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAl2nef8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAl2nef8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09D9C4CEED
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747304282;
	bh=mRNhaJxrS52yu6RBqXmhjKIE1neJvcshNuxE4ZSPuvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lAl2nef82/ncIhlGh5i0IISg0ME7OcLNYxtfrXm4vtqMY7pCkAPg06wO4/tRZWX6t
	 046bzcfRdgo/pXD9U+0JqtIB1TRP7SmBHXMtzUIX91tEewgWgFfSWNR8cwJF7NowfO
	 fEjW6F7GMEUX7cjt4o6zHa7Yrl+EVlffHbo4k+BZuQ2T5dlQOdcjzEYoCCc0m7TmZa
	 TPg0cnducAzitQ96bUtekZxZzOn6Ty6ca5ItSpcd6MmtU/tdthHSwr3Is4plWgA0wx
	 tMyURmiVC2YDdX3fPE7zPiNeB7wWmIQ/FvBzfDO5W/V7uRXpGtBjB37p+B1COa5PqX
	 /jZIaKFj4vZfg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-326d823304fso5876581fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:18:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3eMDQLWvhHcrxb6bj+PiB2mIEjunGR7aJl8ecGK1ARNJ1G+2GEII12TJ6Os2Tv5DFT8tOES52AMOZbB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/P7d1SGElRcX8W3gqd/utZiZy6VPl9K81ApuS9fgXBV68MWLi
	/58pCCyT3XWNV65P1JAuZegavniKAscNpuh2h1oosPgOO5LHkD29Hn6oQ1RrPvvN0tD3jetrG9s
	WZIHUzrQRtRcYA7tuzeTYUG0Kfcw=
X-Google-Smtp-Source: AGHT+IFqctQxUPBHwqa9LcesyGi98i0svDkDgmQEGGa61XBlkHfaoW1CvwPKvtz95+yS1LkoEnPZz8/2McdYpuvjggo=
X-Received: by 2002:a2e:a99b:0:b0:30c:50fd:925e with SMTP id
 38308e7fff4ca-327fabcdff7mr7138951fa.3.1747304280293; Thu, 15 May 2025
 03:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <20250515095157.GCaCW5PRk1CTPjEtzJ@fat_crate.local>
In-Reply-To: <20250515095157.GCaCW5PRk1CTPjEtzJ@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 11:17:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE0Ak9EgbQRCn+hCoO=Va-fpVrVEP=Bur_tUEthy+fs8A@mail.gmail.com>
X-Gm-Features: AX0GCFtfgYtdBEwkRaBaLbsXkj313cArN6YEFV8laXmOf-rqskJW5pIJ_CMTbq0
Message-ID: <CAMj1kXE0Ak9EgbQRCn+hCoO=Va-fpVrVEP=Bur_tUEthy+fs8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 10:52, Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index f67a93fc9391..d59bee5907e7 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -395,7 +395,7 @@
> >  #define X86_FEATURE_AVX512_BITALG    (16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> >  #define X86_FEATURE_TME                      (16*32+13) /* "tme" Intel Total Memory Encryption */
> >  #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> > -#define X86_FEATURE_LA57             (16*32+16) /* "la57" 5-level page tables */
> > +#define X86_FEATURE_LA57             (16*32+16) /* "la57_hw" 5-level page tables */
>
> Is there any real reason to expose that flag in /proc/cpuinfo?
>

I'd lean towards not lying about whether the CPU is la57 capable in
/proc/cpuinfo if we don't have to - this flag directly reflects the
CPUID leaf.

> >  #define X86_FEATURE_RDPID            (16*32+22) /* "rdpid" RDPID instruction */
> >  #define X86_FEATURE_BUS_LOCK_DETECT  (16*32+24) /* "bus_lock_detect" Bus Lock detect */
> >  #define X86_FEATURE_CLDEMOTE         (16*32+25) /* "cldemote" CLDEMOTE instruction */
> > @@ -483,6 +483,7 @@
> >  #define X86_FEATURE_PREFER_YMM               (21*32+ 8) /* Avoid ZMM registers due to downclocking */
> >  #define X86_FEATURE_APX                      (21*32+ 9) /* Advanced Performance Extensions */
> >  #define X86_FEATURE_INDIRECT_THUNK_ITS       (21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> > +#define X86_FEATURE_5LEVEL_PAGING    (21*32+11) /* "la57" Whether 5 levels of page tables are in use */
>
> Or can we stick to that one?
>

This is arguably the important one: as long as "la57" does not change
meaning, we should be fine from compatibility pov.
