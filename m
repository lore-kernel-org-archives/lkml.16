Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E841C69
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 04:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751169611; cv=none; b=pf42b4YMb+8I3fhhd2OpC563VRA0g2pQNge27PL009Ya0mwf4qK8Nqm5gEBeQCxH+vfVJ76BJmEIS+2P9KNCyyHSzOTfzSmqDJ6ikRPB9T84rdtKuO1nMRrYEmWmFRM1gFxj6cPCeIhWg7H8EQ2DV03De8s40G8bqMWyfpNuDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751169611; c=relaxed/simple;
	bh=RtuVDtq5TbL+hnwE4gaBOAo6wkj6IpQ3jNVvsLNBk3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7EbLlzMZv6uBqefr+uYeTneGtBA5ad05YoAhUOapL9g2tK+oI2AmFR4UddvYIfZLKudxeGDMlYszFGKbxY1PXnyVmo1l2eFIPhymx0njYEWsZq4/A2KQHizbR9zmVHFMbigtbmGFjeOjKiwJqonQ+ceR/WT6Kj3zyC8ryhhDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfPB0sg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfPB0sg4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D039CC4CEF1
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 04:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751169610;
	bh=RtuVDtq5TbL+hnwE4gaBOAo6wkj6IpQ3jNVvsLNBk3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rfPB0sg45h7QvAgZEBxNN42rt0eKRMEDZ1eEu4anMnMRV86K0HQZbbrMl5wp5JavF
	 CgEysQZqhFLldV1L8zZ1+m6r53UL1b0mdrmoBHgm4qQigZT2ZRUt6grk2alt2P8mwL
	 laMQ28nA+E149XMBZYFyRABfHh0Hilo0K6qi3JZ46FvemDp8YcC4u4FdZJOLaCebzB
	 ghlTqYVGAxYHi5Nx2O53QoWyi+RddLbbAQklnjxHaETn6i2SOGA/o7d+el0ahNqBWy
	 h5Mk+pPuXaOBpYfaYFBQ5Q13ZtvtyMJiY5SMMLdA6SnrVxv9qPjWf8vYsqGnwOiVDn
	 5+Q1rl0ZZMUKA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso1866292a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 21:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy/PISQ7Qw9pSzDvafLJ2cJkneS2QYygDRxt3E0kVCQOelvtlyT8aABG7dtuuZRjVUpR8v+djIcoXIFPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZh9unsoQEccoRw0hN62qVwL9AEkd7G92qiwJdpJ+ElQxQ0WI
	8g6nbeQXdBriFPGLQxv6CG+0woHJJ+nVgAZ/oipx7SFa78HJ+SO+ThCc3sGj0QxfdKq+wM6kJwV
	nhPZQMLmj8HP0In6e5oBeXj4lVsrAZAk=
X-Google-Smtp-Source: AGHT+IFR/X+IzRKZMjPiV32fxsRrid/bGycZmXS/rLsmY57Hptnpj7ONhqDFkQgH8k1KZspKRjCXf2EVJcJiCOy+T2c=
X-Received: by 2002:a05:6402:234f:b0:607:f558:e328 with SMTP id
 4fb4d7f45d1cf-60c88d94602mr7225092a12.5.1751169609355; Sat, 28 Jun 2025
 21:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org>
In-Reply-To: <20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 29 Jun 2025 11:59:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5BEe2FtKwh+SMNAKeKadhf4ALHb0nTFa5e_BBY1TOWCg@mail.gmail.com>
X-Gm-Features: Ac12FXxNJf3BIzs56rRkKoMLlQSE1OBvRLxUScISL38AA34e-NfDxLH47hRFN_4
Message-ID: <CAAhV-H5BEe2FtKwh+SMNAKeKadhf4ALHb0nTFa5e_BBY1TOWCg@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Use '.ascii' instead of '.string' in __BUGVERBOSE_LOCATION
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 7:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 5d476f66e6ad ("bugs/LoongArch: Concatenate 'cond_str' with
> '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output"), building
> loongarch with clang's integrated assembler fails with:
>
>   block/blk-throttle.c:205:2: error: unexpected token
>     205 |         WARN_ON_ONCE(!bio);
>         |         ^
>   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONC=
E'
>     119 |                 __WARN_FLAGS("["#condition"] ",                =
 \
>         |                 ^
>   arch/loongarch/include/asm/bug.h:47:2: note: expanded from macro '__WAR=
N_FLAGS'
>      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE=
_REACHABLE(10001b));\
>         |         ^
>   arch/loongarch/include/asm/bug.h:42:23: note: expanded from macro '__BU=
G_FLAGS'
>      42 |         asm_inline volatile (__stringify(ASM_BUG_FLAGS(cond_str=
, flags)) extra);
>         |                              ^
>   ...
>   <inline asm>:1:134: note: instantiated into assembly here
>       1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long =
10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "=
[""!bio""] " "block/blk-throttle.c"; .popsection; .long 10002b - .; .short =
205; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: break 1;.=
pushsection .discard.annotate_insn,"M",@progbits,8
>         |                                                                =
                                                                           =
  ^
>
> clang's integrated assembler only supports concatenating strings with
> '.ascii'. There was discussion of allowing '.string' / '.asciz' but it
> was decided against [1] because it was undesirable to match the behavior
> of released binutils at the time, where
>
>   .asciz "foo" "bar"
>
> was treated like
>
>   "foo\0bar\0"
>
> instead of the more intuitive to C programmers
>
>   "foobar\0"
>
> and diverging from that behavior was seen as risky and unnecessary. GNU
> binutils updated its handling of '.asciz' and '.string' to the more
> intuitive option in 2.36 [2] after this was brought up to them in
> passing.
>
> Convert LoongArch's __BUGVERBOSE_LOCATION from '.string' to '.ascii'
> with a manually added NUL, similar to commit 707f853d7fa3 ("module:
> Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper") for the same reason,
> which clears up the build error and results in no changes in output for
> builds with GNU binutils.
>
> Fixes: 5d476f66e6ad ("bugs/LoongArch: Concatenate 'cond_str' with '__FILE=
__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output")
5d476f66e6ad is not in upstream, so I prefer squash this patch to 5d476f66e=
6ad.

Huacai

> Link: https://reviews.llvm.org/D91460#2398228 [1]
> Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D3d9=
55acb36f483c05724181da5ffba46b1303c43 [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/loongarch/include/asm/bug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/as=
m/bug.h
> index cad807b100ad..d090a5bec5eb 100644
> --- a/arch/loongarch/include/asm/bug.h
> +++ b/arch/loongarch/include/asm/bug.h
> @@ -11,7 +11,7 @@
>  #else
>  #define __BUGVERBOSE_LOCATION(file, line)                      \
>                 .pushsection .rodata.str, "aMS", @progbits, 1;  \
> -       10002:  .string file;                                   \
> +       10002:  .ascii file "\0";                               \
>                 .popsection;                                    \
>                                                                 \
>                 .long 10002b - .;                               \
>
> ---
> base-commit: d298bb98d65f964288bb87feef014da1baafedda
> change-id: 20250616-loongarch-fix-warn-cond-llvm-ias-b954f02c446c
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
