Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B624C66C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770592; cv=none; b=jIbTC3XiB9CjOZN/v/9lkGZ1wXeTP9LL0eMp1bKkZ4TM1HZp+7QKaCSW/Q8X2SyaRfonNzWV494rjJYg4+GCxbP/6mIaYDj0bokLEfcj1h4lG/QwNGY/0queQrqbkzuJD1OJQ9b5p/qex/nBOzmVpsoLS8Bah6MYQH+r9sDqlGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770592; c=relaxed/simple;
	bh=4kqGjqyHl0iy7b+yQw/1AQ3EbGuPqXxaF1bUFTgcRSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuvbNyArE/wwVIXyVFLyojC8RjREyaDv6Zq3UREeguVfCbEHDPIvhJX4JQkQmDE9I8jnKYnCIKHp7aSU46N3v8YYKfppzpXnG+fqW/88deRpwZKmJDTt2bVFT/bnbSx/GYcIV2xL/jIGl8h+ClTuQa6OLCLpSO31asIhXeWanoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzLxcCgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzLxcCgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9829C4CEF3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770591;
	bh=4kqGjqyHl0iy7b+yQw/1AQ3EbGuPqXxaF1bUFTgcRSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JzLxcCgI5C35/fYQ3FvWCNMAZeFw0nvbc35swrkCe2kCJrUUzGNYgvLX4dbzS5cbM
	 zNGwtbKUKbGQ91UJHQI2/0WaCHTNumRlSwK0bhjDLP19ggDA3cxM2OovgjclfauVOc
	 VUdf+ySL5npmH5dR/8r/7UcG/erCVjLqusxO+ALwNNd14MqxDIBrHA5M2oEh0ms8y8
	 3A8EFBFhWnMQibHl99v1UqTmtQOLFBpLctEasaCi4qa7/HLL+e7vhHb6gp0vMPpDBf
	 VnaONWqutB9G2ne+87LAdme5pMFECM33PdJJ56mqPuazEh5heozezrjYasyoXAmroL
	 mvbve+Hg3IOzg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32918fe5334so25642331fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoiWlQA7TmwncAfLd0Q4HTL17Uevfd3bQnJ4K5J7rB2j410OHkticdc40YfyMlGISsTTMnND04fKEqNUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziAsNoIVH6WIB8e0ZxYmbCVkwC+Vn+lrpBRV1S0K9Z+CWBbbzu
	mPZ2FbUTeaJ4JW6UfhoGDH90zYGYLMJvV87YsjhJacEXa0BNSRKkua1s27AITkJ9pYyrpAjqJe+
	pMnVUs16KelQ/+pl4F+/3NlmLq/46rT4=
X-Google-Smtp-Source: AGHT+IEnRfq2fYVLbsDEEqRD+CjFlowLHwafbWpynfinbDwaVcRGAfTefCZQE+rJtf6W6exnmSl0cfDoL1Rqz0olpps=
X-Received: by 2002:a2e:a90d:0:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-328077cc687mr76706091fa.32.1747770590276; Tue, 20 May 2025
 12:49:50 -0700 (PDT)
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
 <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local> <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
 <20250520180101.GPaCzDXW2MlArU71xe@fat_crate.local> <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>
In-Reply-To: <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 21:49:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGf4tXuo9DBkjPhwxJAU4gAt7ApYZ3MF6HgD9yAX-JEGw@mail.gmail.com>
X-Gm-Features: AX0GCFsWd7TQIwLVGSWuPHBfV2JWQK3cf-AyRkxWnKSlfWd-CV_ytP-NyCgULLM
Message-ID: <CAMj1kXGf4tXuo9DBkjPhwxJAU4gAt7ApYZ3MF6HgD9yAX-JEGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 20:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 20 May 2025 at 11:01, Borislav Petkov <bp@alien8.de> wrote:
> >
> > OMG. :-)
> >
> > # 32 "./arch/x86/include/asm/pgtable_64_types.h" 1
> >         movb %gs:__pgdir_shift(%rip), %al       #, pfo_val__
> > # 0 "" 2
> > # ./arch/x86/include/asm/pgtable.h:1178:        if (!pgtable_l5_enabled())
> > #NO_APP
> >         testb   $1, %al #, pfo_val__
>
> That's garbage.
>
> Gcc should be able to turn it into just a
>
>         testb $1,%gs:__pgdir_shift(%rip)
>
> What happens if pgtable_l5_enabled() is made to use  __raw_cpu_read()?
> With a compiler that is new enough to support USE_X86_SEG_SUPPORT?
>
> Oh, and it looks like we messed up __raw_cpu_read_stable(), because
> that *always* uses the inline asm, so it doesn't allow the compiler to
> just DTRT and do things like the above.
>

I suppose that is what the this_cpu_read_const() is for, but that
requires a const alias declaration and an entry in the linker script.

If we decide to go with a per-cpu var, I can add this
USE_X86_SEG_SUPPORT codepath like we have in other places - that
should give the compiler sufficient insight into the fact that this
value never changes, and generate optimal code as a result.

For an ordinary variable, I suppose we can still declare it as const,
__attribute__((const)) etc if it is defined in and set from the asm
startup code, resulting in the same potential for optimization
(without alternatives or runtime const hacks).
