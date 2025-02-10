Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC82566DF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211501; cv=none; b=aDo6AqKuN6IIBWbeoi+ZlFmEOiNwkwRCU2No66Eq7HiLa1QG8EP4HRPtBZEID7GRVik1HzCsiajflGmmrcvJ4IBA5HHNGZqpiJjrYvUEgucW+FJdQPl9EZh7qgkWgFnB8MymBvxrwaRX/cQYSRSqpf7dGJlEvJdGTDmNUVL0RCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211501; c=relaxed/simple;
	bh=Z0LkxULppWnldIRHTXRvkPP+OYE6EZX6Fo09vZD0NhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9lyiJbajZZ9J/JngYuy1AukR53u45kR34uLETAO/9x/lkg85zr4APTSY4hM34k/CBmnGg3Ccmc7RUgYjuxP1GB4mH2pTcpVQXpv2rULLKQDjGeU3xoCvgpat3SZaFiCzqGUxzHxvjYPhsu/+KEZsKLT0f/vBd/zrEo5HLTv6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWfO7YsZ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWfO7YsZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4718aea0718so15561cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211498; x=1739816298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjGru9Ln4tbOycCTpJ6V8GzTqZ4kbdWoqnzlOAH8jAU=;
        b=GWfO7YsZawJnMv8QrIn/vxTeY7CWv5bTNazStdCCDc7b/Mj+JUguV/2Yu8E4SNnmCz
         qMnmoDMooZAaroU9QB92Qb2bbIc3g1Z6FM7kfv/jYNQ0FEORyZMhOOU8QgR6WSN1qaQw
         HZh7nWMjZWPpMBMo4a187ZzdIKy7RiO/1l2Gu5kBvQcaAtke78+kyXIjixQJkOQ358lN
         aMfTtna9pWbrjdj65iPoE2P0PRXFKI3v+tghEXTuqrWJNpa0U/4TYMSbT4syKQ9J+Rcc
         S0R5/KYjGevThgST9PrzL1E8SEgnpCYEIQFLE/XvoYcPHlD3PDEfkReHEqu4u5HIbkzj
         b25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211499; x=1739816299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjGru9Ln4tbOycCTpJ6V8GzTqZ4kbdWoqnzlOAH8jAU=;
        b=XVr3P3trXHlmIPLY7N0spWgzYcDI+mGCBf5BtMHjddUUvi6gA3XXSqL02supCMbpfD
         L6JTLltCTpyzeEzpt6pjpOvgSfoJ1lcyj+TOWbyL0zl1ohMoOcIOwR8TIhWveRioJkpO
         vBIjASQh0acPcfBB2QUlVKspxhIaPL9akRjRm8eN0Iw/tFjsK/KtFic6oax4YL2HSvkP
         KAwWP96wGf82mfGnS+REGQijA4WfYn3QSSodJ9zAgh+2bdQZTNRTSIfPj7vCNBOt35Vj
         yAvCSJIi+UNIl24twXCMqLfi45aB8OZZUK+wWJGx74SZIoNq4WMW0MWhfc8GNKbdiWzY
         tLrw==
X-Forwarded-Encrypted: i=1; AJvYcCVpfVWaj1Yi/30PctoVMQPWKPfHR9ocxelS5NxnwEicKnOJsVxeAtbtsrVfZ+jmtdEftuPM/0WxhzGS5mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwUuBdMFFGXHUndGiLDnrvn6xmI6gqDccX6zjU8U/CCjhExQ9O
	Cs4Fjbuhk3Ms+dUMO1DXL70qWzMXnV7+iOptxmtonyBxfZ55bBXpPWVa+7Wr7PFrGs2sBB4pluG
	WutKL68QI1WPUgsPSgGLnOhPHNnt0v3qlJJj/zrr//wRyfKq5aA==
X-Gm-Gg: ASbGncuaau7kL5B590ji1ZSCdxJGCsz6WthD8vSvuBfKo27OS95CbzvytuP1Awk5Ngf
	PRIewXTQf57OedPDxgmIXk56VxeCUT/nAsmXODsbGzwoo+tDKx7fGGjGtHEp7eEfymd+X9A==
X-Google-Smtp-Source: AGHT+IFz7teG0ywMqv/Stl5zm+XKD0UK+hMT0yq9uSlaA20Mp0FnitgbkTRGblu2TeB8c/463lqDHGHw7b1JIjBnk/g=
X-Received: by 2002:a05:622a:1a02:b0:471:98ba:cb41 with SMTP id
 d75a77b69052e-47198bace2emr3730371cf.2.1739211498432; Mon, 10 Feb 2025
 10:18:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com> <20250206185109.1210657-2-fvdl@google.com>
 <Z6nTWhmqkIwFzNMN@localhost.localdomain>
In-Reply-To: <Z6nTWhmqkIwFzNMN@localhost.localdomain>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 10 Feb 2025 10:18:07 -0800
X-Gm-Features: AWEUYZlxwABmR4cpB9nR60jmL250rbMazLScEgkq5SHVd2OrPlsMf17BTN_54p4
Message-ID: <CAPTztWZBm3M6CxDLj_XkX2-xYWEzPdibhGno47ELEHFjmefZ=A@mail.gmail.com>
Subject: Re: [PATCH v3 01/28] mm/cma: export total and free number of pages
 for CMA areas
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:22=E2=80=AFAM Oscar Salvador <osalvador@suse.de> =
wrote:
>
> On Thu, Feb 06, 2025 at 06:50:41PM +0000, Frank van der Linden wrote:
> > In addition to the number of allocations and releases, system
> > management software may like to be aware of the size of CMA
> > areas, and how many pages are available in it. This information
> > is currently not available, so export it in total_page and
> > available_pages, respectively.
> >
> > The name 'available_pages' was picked over 'free_pages' because
> > 'free' implies that the pages are unused. But they might not
> > be, they just haven't been used by cma_alloc
> >
> > The number of available pages is tracked regardless of
> > CONFIG_CMA_SYSFS, allowing for a few minor shortcuts in
> > the code, avoiding bitmap operations.
> >
> > Signed-off-by: Frank van der Linden <fvdl@google.com>
>
> LGTM,
>
> nit below
>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks for the review!

>
> > ---
> ...
> > @@ -444,6 +445,14 @@ static struct page *__cma_alloc(struct cma *cma, u=
nsigned long count,
> >
> >       for (;;) {
> >               spin_lock_irq(&cma->lock);
> > +             /*
> > +              * If the request is larger than the available number
> > +              * of pages, stop right away.
> > +              */
> > +             if (count > cma->available_count) {
> > +                     spin_unlock_irq(&cma->lock);
> > +                     break;
> > +             }
> >               bitmap_no =3D bitmap_find_next_zero_area_off(cma->bitmap,
> >                               bitmap_maxno, start, bitmap_count, mask,
> >                               offset);
> > @@ -452,6 +461,7 @@ static struct page *__cma_alloc(struct cma *cma, un=
signed long count,
> >                       break;
> >               }
> >               bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
> > +             cma->available_count -=3D count;
>
> I wonder whether we should have a cma_bitmat_set, so available_count woul=
d be
> touched in there.

Yeah, I initially thought so as well. Then I realized that for one of
the later patches (early CMA reservations), I'd need to decouple the
bitmap set and adjusting available_count again. For cma_reserve_early,
you don't have a bitmap yet, but you can use available_count to see if
you can get what you want.

So, I decided to not combine the two.

- Frank
