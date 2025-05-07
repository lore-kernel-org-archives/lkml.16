Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022091FBCA1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625881; cv=none; b=fIq7r03ujsROWBVvjYHpIy+NwmnKnF302OB9F/h0f9nD/crIrbVwVuOSmdtiIVE+2X+N32IEL0rkn3NLCBftuQoxt1R0Fu7ALSs30EHuNdI+7gNU4F+4blbAlS4jsNdSIEF9WFs/mzjMwV47XbeJsonrgx2X01bp4rd8W1eV+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625881; c=relaxed/simple;
	bh=zPxSLX2u0Owd2aHq0g6pFMuJoMnQJd5hF9DYAZ/FyL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFksNPKXzOwLO9Su1Ym025OaYWhkXvw3pxs9y+9eBkSD7hkWKVBfe6/bd6hbzdbod6w7+JMwFD6dgE+llFNO8npzdiT53jeioG5+NvoTR5ERnRX9C8dgxY7uYsnKiwOxju/hg8qfj8EMjPxUOq+gU+JnmpyKoabMFtxwKEMn/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5ZmPBRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5ZmPBRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF3DC4AF0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746625880;
	bh=zPxSLX2u0Owd2aHq0g6pFMuJoMnQJd5hF9DYAZ/FyL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c5ZmPBRgqRxg2bAxfTnHUKAVFdk5GGPy8JyFvl8nMXP3/420+gAfd7ZV/DnrIgMtG
	 k3pJdEGhwW01mr8u0lZ515WzQ+J6aswyJSplnY1SEBBToBE8jzTpuhD6Ig74lSQI6n
	 SlRcYjlWcLJrRFJgaq1saDql+UXRRqp5d18VWst9CQEMCWJSJB1FPR3m0kX2oT8vc8
	 kYH/O7knMQImtxCnGhjhQVT03oBCQfSUXm/flDp12ktSZm0jVHLjLFrRUjrnWXGQoF
	 6LjkrpSoPd3fmluaLPOcp52808eWTrwsJzLqArCDquHQXLT0IcrhvWTZMSE32AjDB+
	 tgDFgSxdOvo1A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b0d638e86so8499629e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:51:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoYgYbxDMuX6lt4nfxI6GtTZS0xTcvYe9Tcx2iDo5rpeRwcwj2MficBP6jdhiMzGJcWfW/t5HSaZnneLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoGLF0Uwz/UB01XWsAV1dzOOxVz1hWS3inE0s/0VdWvWWrA2Kt
	aQ6W2ojSZntv5tWWi1l80OvhrIZV6QqYFbGtA3EHi9LVmKI/YH6Palxyn0Bme8NBRCxz5iilVN8
	RRl+vz3lXfuVzzJPTwk/nJIHKVTw=
X-Google-Smtp-Source: AGHT+IEx2J6/f1Spt+4OyPGsqKuuCnw6EFg2K9gMgGfdbH08NuWRmR7GILEdSz4a6NZEB9OoOIGyS3oA0hT9ypDvWR4=
X-Received: by 2002:a05:6512:2203:b0:549:5b54:2c77 with SMTP id
 2adb3069b0e04-54fb96034a9mr1310459e87.32.1746625878732; Wed, 07 May 2025
 06:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
 <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
 <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
 <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
 <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com>
 <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com>
 <CAHk-=wh3np3kEJ-D4OZC2nHGuY7crkTw6kefGkUYaerSpUP3Gw@mail.gmail.com> <CAMj1kXHtovutcgJXbsCMA+cmrJgN+K-3Dk5ihuFMzgT9eEe7sA@mail.gmail.com>
In-Reply-To: <CAMj1kXHtovutcgJXbsCMA+cmrJgN+K-3Dk5ihuFMzgT9eEe7sA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 7 May 2025 15:51:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEJ_SzoYaEEMq32Er5Ro6kOEg0Z_mk0MEeOh6wNX5mqoA@mail.gmail.com>
X-Gm-Features: ATxdqUHsnfge49J5hcPHhSIl49eOyQdRi6S78-oRNhVyqUDqyo4oOzYo9bi2khU
Message-ID: <CAMj1kXEJ_SzoYaEEMq32Er5Ro6kOEg0Z_mk0MEeOh6wNX5mqoA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 21:50, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 6 May 2025 at 21:42, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, 6 May 2025 at 12:15, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > First of all, that would mean calling into even more C code from the
> > > 1:1 mapping of memory,
> >
> > Not a lot, actually.
> >
> > When I did the runtime-const stuff, I refused to use the alternatives
> > code, because it was called much too late and was much too
> > complicated.
> >
> > So I just did an early fixup by hand - in the place where the variable
> > was actually changed. Exactly so that you had *consistency*.
> >
> > It's literally four lines of code that gets inlined.
> >
> > See runtime_const_fixup().
> >
> > And I just checked. Those four lines of code generate seven *instructions*:
> >
> >   .LBB80_4:
> >         movq    $__start_runtime_ptr_dentry_hashtable, %rcx
> >   .LBB80_6:                               # =>This Inner Loop Header: Depth=1
> >         cmpq    $__stop_runtime_ptr_dentry_hashtable, %rcx
> >         jae     .LBB80_7
> >   # %bb.5:                                #   in Loop: Header=BB80_6 Depth=1
> >         movslq  (%rcx), %rdx
> >         movq    %rax, (%rcx,%rdx)
> >         addq    $4, %rcx
> >         jmp     .LBB80_6
> >
> > that's literally what that
> >
> >         runtime_const_init(ptr, dentry_hashtable);
> >
> > generates in dcache_init_early() for me.
> >
> > Seriously, this is *trivial*.
> >
>
> This looks trivial, yes - I thought you were talking about the
> alternatives patching code, which seems rather complex, and either
> pulling it into the startup code or writing an 'early' version of it
> seem like a lot of work for little gain.
>
> So yes, let's use this from the startup code, once we figure out which
> of these constants are too costly to be expressed as
> 'pgtable_l5_enabled() ? foo : bar'

OK, after digging a bit deeper, it seems that runtime constants are
not going to be usable here.

First of all, the constants

page_offset_base
vmalloc_base
vmemmap_base

have their address taken in the KASLR memory randomization code, which
subsequently overwrites them with different values.

This means that runtime constants are not usable here. It also means
that there is no need whatsoever to assign these variables extremely
early, given that they may assume different values during the
execution of setup_arch().

That leaves

pgdir_shift
ptrs_per_p4d

which are both 'int', and while looking into adding runtime const
support for the 'int' type, I noticed that it doesn't appear to
support loadable modules? This is a problem because these variables
are exported.

So, in order to get rid of USE_EARLY_PGTABLE_L5, which is how this
discussion started to begin with, I suggest we go with an approach
that just redefines references to these two variables in terms of
pgtable_l5_enabled()?l5_val:l4_val, as I proposed originally. Then, I
can try to make cpu_feature_enabled() usable from early boot onwards
so we can drop the early variant of pgtable_l5_enabled().

If any of these variables turn out to be a bottleneck in practice, we
can revisit.
