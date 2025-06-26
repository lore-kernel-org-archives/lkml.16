Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589ED23B61F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927145; cv=none; b=Rdgd8ioGsdtbdxK1DjqJaTAPWWYB9MO6M1x5oPGmkvpsXEpaDH0ZpZ/uAH3AirhymL0ZK3Ft3966TkjFZZ5HajyhDBU6eGICIXcIbvqtSdAoctM8m5nwE05ZHfk5OozNbdBqx6zLTlr8iU53WrevjPVcUV4Op7TVoth/1T55dkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927145; c=relaxed/simple;
	bh=07vUsEyMksdmohfakBhz4xlamEj3Jb2m/86V7iG/J7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA5grof92yK4QOsnMDUJsj3OyDXI4aQmC1/aW0C7fzDo43TsjQ3pNHdvNJfdW2NoV5gJJv2Pels3l7vxukDz2WrVU2cN0y5b7xtkCKh8bZnrdx5A/gqA3nri8g1dCpMEfUqp+oTVYjxmWvQ8F2GgTB1juuejsHdmWdqTM62MfB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so244832137.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927141; x=1751531941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FKr6SOJmsMSyWxgl87rxUfaSgqLues1OApSM1lNIyA=;
        b=lbHNPWqRGANg+P/YcYQt9TxhEbGeTpl4VBrt6BOWSftyIfNmdjePGa7J00d0HkKf3e
         xjuCRKykzkU4isXK/RfuOH4Mzna09gOiS0x+GWVPnZYFwkLbwTVK9ZkqOPGWfMED/jPT
         qDBaRgg+nAOKyN9Buh1KFv725iQFeqI8H1Y6FMisseKLbTfD9fMV+ukkM+QSfYyCLPPu
         eJS2G4UAQi8vnOTuguETYZpfUkYxM531Liv7dEtVi2ozAQ+POfTc8gSndgyemYx8lh3p
         MiAQLA+4YhJ2MxJfQ9/rSutM9zJapaH6pN6aIQPAR5X5v3JlrSuCGHq4QWov2MPFI/Bu
         uVrA==
X-Forwarded-Encrypted: i=1; AJvYcCUeikUpdOkG0Ne4ueWyDNXFcrc9K4DsVSaCw0fJA/yrzUAAqvIWVrtCucbDfyFeFJ0mp8qWvl8XcNJ/KSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuwSGILCuUVByiSMN1ajRXsYFfBzaTYr5y0Ui5tjvl5vCWYLqb
	UrgaRQonTEWa54p4sUZr31Ky/RcyjO5UybRFM6CbljN/Ri5TvBBFrelcJNaCia8L
X-Gm-Gg: ASbGncvN+gKo//Vmwng9drze8mUG3jWC6Y+XVuXBcOCk3awx+wHBlAdrRkhXa6XIThw
	JapArGvLIM640menx2EzsbDkD51mm0i+DkwoO7cEX0BczAlLvF7Cs6djmredboY/bNuKsVmMJ5c
	zrDa+W6oS167ZRRIDHYATee7jd5WrUzZTtNsxDx5dgSmaGBqfbbSjnxCwGA0rfjfFkH3h//oDlj
	w5bNKbGNBxXgWCQfQ0JV/nAzIU15vpE0OFOydrZiUzfGELxhTiV+qE8mZC7zsCEHIZIjrhnZAUX
	v1mcQ4SB8wjTmMk3Ucs4Fsd8Fz9d6JJGO4YetfbHhxNUFnDfeOGXSXzLa7V99/sKpT221o9niW9
	GdFWUqr3/fWz/3BVazlPqzVE0
X-Google-Smtp-Source: AGHT+IEOp4bpEnsUP1xgDR/NgaY/Xh+kONaiI1+8VE/NW/5hT2IKsPoRrZ1b/wpTiJioZR8qlD81aA==
X-Received: by 2002:a05:6102:b0f:b0:4e7:3efd:ac76 with SMTP id ada2fe7eead31-4ecc6a77133mr4593951137.8.1750927141388;
        Thu, 26 Jun 2025 01:39:01 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c302136esm2350314137.14.2025.06.26.01.39.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:00 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so216872241.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTzrZnVBZhmAa2QWMgkQOiTWb4iixo0QCADSe066tPgAsb9UaAnP3q0IlMCIIaDwSOoUhaL5+iG8uwpFY=@vger.kernel.org
X-Received: by 2002:a05:6102:c8d:b0:4e5:9628:9e39 with SMTP id
 ada2fe7eead31-4ecc6a7750bmr4213230137.6.1750927139785; Thu, 26 Jun 2025
 01:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-2-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-2-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:38:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd=eha_pRNGCFHN7sS2OOh60cj=c=yPUyg_-J0S8V8yQ@mail.gmail.com>
X-Gm-Features: Ac12FXzbd6ICmeY6_N3sDigtBp9r-6oclQKShUI06FUTJz5bv9x-2knTpcY-Rxo
Message-ID: <CAMuHMdXd=eha_pRNGCFHN7sS2OOh60cj=c=yPUyg_-J0S8V8yQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] m68k: mm: Convert get_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vishal,

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses get_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17, with the small changes
described below.

> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -148,16 +148,18 @@ void *get_pointer_table(struct mm_struct *mm, int type)
>
>         /*
>          * For a pointer table for a user process address space, a
> -        * table is taken from a page allocated for the purpose.  Each
> -        * page can hold 8 pointer tables.  The page is remapped in
> +        * table is taken from a ptdesc allocated for the purpose.  Each
> +        * ptdesc can hold 8 pointer tables.  The ptdesc is remapped in
>          * virtual address space to be noncacheable.
>          */
>         if (mask == 0) {
> -               void *page;
> +               struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);

I will move the assignment just before the NULL-check below, to ease
applying the WIP preempt patches on top.

> +               void *pt_addr;

I will move this one line down, to follow the reverse Xmas rule.

>                 ptable_desc *new;
>
> -               if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
> +               if (!ptdesc)
>                         return NULL;
> +               pt_addr = ptdesc_address(ptdesc);
>
>                 switch (type) {
>                 case TABLE_PTE:

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
