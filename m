Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AEE249F9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561023; cv=none; b=hsafrUFpUh0wR4ZinSCk0PVqc1gpw8L0WuqHun2TGl6RA7qdkn6/5wvkMYPHg4f4InZaQWepjBcyiY96WpYNtiqZecQcWbe+lasgXeGVKrA7CzkR78g6Fec5tznlOzeq/RSW2nxX2Zj6UHtvO404oTCMVAu7DWrGvzcYo1C8Rko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561023; c=relaxed/simple;
	bh=kNbZ21dhdbGHQQ7oxgt0oAsM9mbpZYvkNgn24U3J3TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9VTUF1VeC5XREahwrEAHNgNatnZqAuTaeBLYmDlkjMYd5MQKBGKJmF4O/6rR1RsS183vyQlfvUw8gOJQriGgYORNM+NLLFJYcYvxK1EBtM35HlC1T5iwAt+XpJA6Vm070l9CEk3u/TfztFXNZ/422d7CutJFYKWjuaMjm9nz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loh+pcP9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loh+pcP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFACC4CEE4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746561022;
	bh=kNbZ21dhdbGHQQ7oxgt0oAsM9mbpZYvkNgn24U3J3TM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=loh+pcP9BSAcpNYTW0VLUy9JZy4c3iCDkhoWc2ReJlR/gPSPIl/7H1XSkYlue516U
	 1FRI4vwK1EGx+gvFPuhI6V4K7lI6XYO0ShzCDTI3ELi5NJsnFZMybGfmL6BDNCxicb
	 Jx31ZlQcIaG3E0J4a6fv7Twoa0fQXu+pIaUzoLt/0w5vE7XrwvZZkJNHoy8uCLkKAt
	 G7PFNnweMaRDP7DyVwa8rnR2vcefKOLwk0rTz/tzGqAYULEyAt6GPqkIrjvoJBWP32
	 jPQhaBHE+3jG0mToT/fU+Gn1gxawzmAgf+nkPQKCl+E6M3m9s9C+Bpe0j6xOsaoWqq
	 w1QEfMqHqbvxg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfca745c7so55275291fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:50:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFXLxBQiIsavD5e2PsxoLqCthjQupDgyuZBnn9QlyhRhCJjLNSmEEhZiP/yK/m8ljcGVSnbO0I36vNV/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvhYvhAyeX7va5BeIm39EpwOSFa1rLfrmaT1I7uS54nkny8eA
	XH61d+04NdxCu0hacTA97D+LfxmDpkkr8UtVCprf+Ix/fvFuF2VWXvJruu9zkMzIKagRTIz2NJs
	sHX3K4utOILg2hTDvJ6amgfJ618I=
X-Google-Smtp-Source: AGHT+IGCcznNTbeOY9pRpVxpm++2olnw9PbjNBmGg9KPuB7a9taNGqTf7ScjZK/Cw35/AO7DHcVwJzaZO4hG4PiZ/fQ=
X-Received: by 2002:a05:651c:b0a:b0:30c:40d6:5cdb with SMTP id
 38308e7fff4ca-326ad17d8f4mr1091421fa.11.1746561020937; Tue, 06 May 2025
 12:50:20 -0700 (PDT)
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
 <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com> <CAHk-=wh3np3kEJ-D4OZC2nHGuY7crkTw6kefGkUYaerSpUP3Gw@mail.gmail.com>
In-Reply-To: <CAHk-=wh3np3kEJ-D4OZC2nHGuY7crkTw6kefGkUYaerSpUP3Gw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 21:50:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHtovutcgJXbsCMA+cmrJgN+K-3Dk5ihuFMzgT9eEe7sA@mail.gmail.com>
X-Gm-Features: ATxdqUGq8dg9rp0Nctp7ftZrcKyPNNA_2ihKOcf5feGZdyscq2ue0PzNzRx0NSY
Message-ID: <CAMj1kXHtovutcgJXbsCMA+cmrJgN+K-3Dk5ihuFMzgT9eEe7sA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 21:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 6 May 2025 at 12:15, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > First of all, that would mean calling into even more C code from the
> > 1:1 mapping of memory,
>
> Not a lot, actually.
>
> When I did the runtime-const stuff, I refused to use the alternatives
> code, because it was called much too late and was much too
> complicated.
>
> So I just did an early fixup by hand - in the place where the variable
> was actually changed. Exactly so that you had *consistency*.
>
> It's literally four lines of code that gets inlined.
>
> See runtime_const_fixup().
>
> And I just checked. Those four lines of code generate seven *instructions*:
>
>   .LBB80_4:
>         movq    $__start_runtime_ptr_dentry_hashtable, %rcx
>   .LBB80_6:                               # =>This Inner Loop Header: Depth=1
>         cmpq    $__stop_runtime_ptr_dentry_hashtable, %rcx
>         jae     .LBB80_7
>   # %bb.5:                                #   in Loop: Header=BB80_6 Depth=1
>         movslq  (%rcx), %rdx
>         movq    %rax, (%rcx,%rdx)
>         addq    $4, %rcx
>         jmp     .LBB80_6
>
> that's literally what that
>
>         runtime_const_init(ptr, dentry_hashtable);
>
> generates in dcache_init_early() for me.
>
> Seriously, this is *trivial*.
>

This looks trivial, yes - I thought you were talking about the
alternatives patching code, which seems rather complex, and either
pulling it into the startup code or writing an 'early' version of it
seem like a lot of work for little gain.

So yes, let's use this from the startup code, once we figure out which
of these constants are too costly to be expressed as
'pgtable_l5_enabled() ? foo : bar'
