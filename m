Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B222D790
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550699; cv=none; b=aAXI9s2nRxyGRn56C8GiROtiH0sIeFZtdufhRBVgLz/8WQ7kBsF9cgCWloxfb1V1XWVUkm+7cY9Clksb/9+M3X7iQLTrVgoTn6xvGwDHil7rkhQG2F6QDoK7/Y7jbzpeMJlT9OvUhXTdz8Ga8esZveZ1aDbzRWgAwPaZ4D/gALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550699; c=relaxed/simple;
	bh=AEyitHUT9Vkn7ar+swbAD9ERA8KqyBkxmZ/CAxIox50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8MPcxkRNiMZ1vgX1ydlRJOwanMTR6ukGmf4OyYQ3bLqvmPeuRL/AeEzXrmU6M3tznxB60MDCiQZxFEHCPStqGOeHFpdntAUUkJSxLcP+PcxszFfl1ciaqIVR6f5R5g0S7bJoKbuzAEeeyPcqitwr/G7LxJR22EvC5YNX1gmejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtfP2L90; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtfP2L90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96047C4CEF0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746550698;
	bh=AEyitHUT9Vkn7ar+swbAD9ERA8KqyBkxmZ/CAxIox50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JtfP2L90iGzaoABv+6CWrSLijEQXdSv9k9leFJiDtV0juNArXoEeZkQQMKgIWpoWa
	 Qg0cRPHOO1lNv7pUSVXTg1z4KL0h8q6vpMrcmfwr0qzQml3FQcoja2gVsSsdPouSVY
	 zXxuJIihv3AvDUYXCnAYgclddHxU3NIfKVJnoryO/5vgUFtKNTboo9fiCE+EKVwK20
	 NZXxZOucS1lEl1IkN9x7Z5OKrdyEMel/040JDotTWaucqsskHWg7zTSB5go0Ln3BTb
	 dUFMZh8M9+iiC2AgTiFMYMDNzuBmYdiEKV9YspU9JvCSGPBFk/WcOyHZ8GJ8k+kLU1
	 Q8S0G1RDOC9+Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso57841751fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+qvxwfrfR/wtgnmW/wu7JjVVA7yUQjdn0NydWTOyFZFUoPMN0w6irDSbNETyowqgkkW00Xw1kKdhIK4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyocXjYebarkY23pV32VUjE0/kPKL303j4+aIrBvH9Wg2JD+BRP
	kNnRankXVg/ppEtku2+unF2thLrRY4gM8DJodY9go/8Is4pk4PDsKXtm3YvN9cSRZgbpHnxttl6
	c4BnI/r5q8Fa9LcI/Sge93g+qj6k=
X-Google-Smtp-Source: AGHT+IG9Z8WmiT7vRg0E3g9PbvqGjH+lcaB6GsNIdhyOBaxzdipqwihxicIXMEcY8rc+4IY0eDIokFfs7PXAvlxpl08=
X-Received: by 2002:ac2:4e0e:0:b0:545:ea9:1a1f with SMTP id
 2adb3069b0e04-54fb95fc290mr34917e87.25.1746550696948; Tue, 06 May 2025
 09:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <aBo92LQh4WYXyRXK@gmail.com>
In-Reply-To: <aBo92LQh4WYXyRXK@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 18:58:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFsvWYMWy4_YCETsp2W0HQWe4RKcwXdB-fWKnoVqjzoqQ@mail.gmail.com>
X-Gm-Features: ATxdqUHsAh2PyWpdRbpAbyTCo2k1k5_j7rHjPa5qJjrOwVimjgv0pO4Ddl28Eys
Message-ID: <CAMj1kXFsvWYMWy4_YCETsp2W0HQWe4RKcwXdB-fWKnoVqjzoqQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 18:50, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > +static inline int __attribute_const__ choose_l5_enabled(int yes, int no)
> > +{
> > +     int ret = no;
> > +
> > +     asm_inline(ALTERNATIVE_TERNARY("jmp 6f; 8:", %c[feat], "movl %[yes], %[ret]", "")
> > +             "       .pushsection .altinstr_aux,\"ax\"       \n"
> > +             "6:     pushfq                                  \n"
> > +             "       testb   $1, %a[l5en]                    \n"
> > +             "       jz      7f                              \n"
> > +             "       movl    %[yes], %[ret]                  \n"
> > +             "7:     popfq                                   \n"
> > +             "       jmp     8b                              \n"
> > +             "       .popsection                             \n"
> > +             : [ret]  "+rm" (ret)
> > +             : [feat] "i" (X86_FEATURE_LA57),
> > +               [yes]  "i" (yes),
> > +               [l5en] "i" (&__pgtable_l5_enabled));
> > +
> > +     return ret;
>
> So why not create a new synthethic cpufeature flag,
> X86_FEATURE_LA57_ENABLED or so, which could then be queried via the
> regular facilities? This ternary logic is not really needed, because
> the hardware isn't ternary. :)
>

The logic is not ternary, and ALTERNATIVE_TERNARY() is a misnomer. The
first branch of the alternative is the preliminary version that gets
used before alternatives have been patched.

This is needed, because otherwise, code that runs really early may
observe the wrong value. This is the whole reason the
USE_EARLY_PGTABLE_L5 exists to begin with.

> With that we could do with only a single, obvious line of ALTERNATIVE()
> assembly:
>
>         #define ALTERNATIVES_CONST_U32(__val1, __val2, __feature)       \
>         ({                                                              \
>                 u32 __val;                                              \
>                                                                         \
>                 asm_inline (ALTERNATIVE("movl $" #__val1 ", %0", "movl $" __val2 ", %0", __feature) :"=g" (__val)); \
>                                                                         \
>                 __val;                                                  \
>         })
>
>         ...
>
>         #define MAX_PHYSMEM_BITS ALTERNATIVE_CONST_U32(46, 52, X86_FEATURE_LA57_ENABLED)
>

This will produce 46 during early boot, and may therefore result in
the logic in __startup_64() to behave incorrectly. (Not sure whether
this macro in particular is implicated in that, but in general,
anything that relies on binary CPU feature logic in this context is
potentially broken.

I do agree that having a separate CPU feature X86_FEATURE_LA57_ENABLED
would be preferable: it is kind of strange that we have to pretend the
CPU does not implement 5-level paging in order to use only 4 levels,
and I suppose there may be cases where we want the wider physical
address space even when using only 4 levels of virtual addressing.
