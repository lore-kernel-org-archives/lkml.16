Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFB21ADA9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763208; cv=none; b=kkk6MR3fbP9wKXReLTAwblK5tB9X4dro2jdqzS2bI4/fa7yoQGB5vQuHAX4sc0BNAw+bb/mU96lUuNYLtXiFxXcLO009VGSbCvmoGM7RuTIGdGpGRn52yfdAAOTqUOI/ysR5rLUVWAMaq8BHvSwmp7S7z42liVH+cBw+GLoUzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763208; c=relaxed/simple;
	bh=HDKfUDddWTn11QWGvG9CU20Wtn/YaSVZa2GiKY6r+Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/f7dJqoDWZfjpkdRZCjy7hhBXcG25y/UY5/qGbEXgfz8YrUcXekNwYzU+PJqtntQn37SaV3n+k8LRECklsRtnyBjbuhDhcrtznvFr3cae9L7MvbeubAoYDYA9Lt7OD9VjjoP+VcBQ0XoIieeaJkuBMe+Nk7PneV2Nh/IoGEBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAJGDd+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAJGDd+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A421C4AF09
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747763207;
	bh=HDKfUDddWTn11QWGvG9CU20Wtn/YaSVZa2GiKY6r+Fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hAJGDd+gWoRqOJ1gkPAfKs35VRrUMmFoGd8P2qgtFg3TIq6v+btUgmmqflSHR4xAn
	 L4PomGU9eZENZKtOtWgwm4y4aMy98ND3JOWxLXCE5CzUFnOrnVD+ROaU6MjYfTEVxT
	 YIfb9uX2Ghp//s6Oa9Zr5o5OP+ZofWyYLS/xbSgx5mDy55hhA1zCFbUuLyVGHt3Wmm
	 qwjtibOnmoZ5HdMUnlj+OMUlzbGQFOY9uJyEWvdMnBrpm+ScYrnn+iJDl5LX3mdQrY
	 10TiFbbEbQ19h1oApiN+v4NXat/EXp7VyYor/1Yg7kmWM1GSXYE77pZoupNMwEqvBO
	 kuF8eUEq+L3cg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a071so68204011fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRRPqM3J8QGoRJc+7cL/Kd1Ba+nI8B1fWLGqCI2HdVBQSPbIrSuy4WvSTltE8IGPbNxGMlXZaD0I92Ut8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7pD4hr9TIsjrD2o+/amx+Vm3vmvcN/jmmTHFRgpGtGJQ4obEb
	gJTHuKwMOQptS1UD2kSrbTUG3GYo14d56O2podIfg4mM5w8kQ97vBYq11QXHEWN9JWex8BfB/1Q
	aVq5u3RU+OSYussJfB7yo4zBIq3GnGEM=
X-Google-Smtp-Source: AGHT+IGj9ifGIBawraTK6AuaBKL+1X0Q0baWl9ygrTwQ9RHE/vzGKHRHRk2L02rTGU9LqBnRgAk7FJlDXsFog54RZdU=
X-Received: by 2002:a2e:ab0d:0:b0:30c:50ff:1a4e with SMTP id
 38308e7fff4ca-328096f24fbmr56915931fa.18.1747763205903; Tue, 20 May 2025
 10:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
 <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local> <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
 <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local>
In-Reply-To: <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 19:46:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
X-Gm-Features: AX0GCFvAiT_BavmPJuSazn0khgHmCbDAGHYUCOeUL4yJ4iHcsbkg2gpMl1_RczU
Message-ID: <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 19:38, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, May 20, 2025 at 07:03:37PM +0200, Ard Biesheuvel wrote:
> > No. But if you had read the next couple of patches, you would have
> > noticed that PGDIR_SHIFT, PTRS_PER_P4D and pgtable_l5_enabled() will
> > all be derived from this variable, and the latter currently uses code
> > patching (in cpu_feature_enabled())
> >
> > This is also explained in the cover letter btw
>
> Yes, I saw that.
>
> The question remains: are the *users* - PGDIR_SHIFT, etc - on some hot path
> which I'm not seeing?
>
> For example pgd_index() is called in a bunch of places and I guess that adds
> up. But without measuring that, we won't know for sure.
>

Look at pgtable_l5_enabled() please, that is the important one.

> Looking at an example:
>
> # ./arch/x86/include/asm/pgtable_64_types.h:32:         return this_cpu_read_stable(__pgdir_shift);
> #APP
> # 32 "./arch/x86/include/asm/pgtable_64_types.h" 1
>         movb %gs:__pgdir_shift(%rip), %cl       #, pfo_val__
> # 0 "" 2
>
> ...
>
>         movq    40(%rdi), %rax  # ppd_20(D)->vaddr, tmp128
>         shrq    %cl, %rax       # pfo_val__, tmp128
> # arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
>         movq    8(%rdi), %rcx   # ppd_20(D)->pgd, ppd_20(D)->pgd
> # arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
>         andl    $511, %eax      #, tmp130
> # arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
>         leaq    (%rcx,%rax,8), %rsi     #, pgd_p
>
> that looks like two insns to me: the RIP-relative mov to %cl and then the
> shift.
>
> If you use a "normal" variable, that would be also two insns, no?
>
> Or am I way off?
>
> Because if not, the percpu thing doesn't buy you anything...
>

The variable access is identical in terms of instructions, the only
difference is the %gs offset being applied, and the fact that using
cache hot data is guaranteed not to increase the number of cachelines
covering the working set of any existing workload (the region is
bounded to a fixed number of cachelines)

Happy to keep this as a simple __ro_after_init variable if there is
consensus between the tip maintainers that we don't need this perf
advantage, or we can use some kind of code patching that is not CPU
feature based or ternary alternative based to short circuit these
things (and pgtable_l5_enabled() in particular) after boot.
