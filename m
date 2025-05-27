Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86513A41F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748319446; cv=none; b=geZ6n/0O6aCMbyjZtk9cZFaT4h/Iwxriyqyd+zuHcbvPojpWT7x5OC51NzMmTIe/uuVcBTauK42ebQ7WQtxga2CYbXVFW/srQWZBI4+RZWKmpidXyKEV2GQ/8gfrWZSxdGKwy1Nm4Q4qAQXebdnzJXUv6Blajw59KUIi2g7zzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748319446; c=relaxed/simple;
	bh=sgBhcpAEyHXGV9tocvXkTTOiKUo9Af37OTe2Hq1NzHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTbQiSmRsOWPTqmPB0j7DvnSWsYpTMxlbjrZ4SLfeo+drklbJgh8uKs4H233IBlwLQ+gJalTiH59FOUeYaKvIyvZImHKnF5zIt+cEaj7JEu3zWMLW4l8HSk6e+pcOUvkzUR1zs2a/hEbMiRrNR14f6tuEEK8ZVGCDxkny9zddmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hySMcNQx; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hySMcNQx"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87de8a14cd7so808553241.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748319443; x=1748924243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+nmL4xRMzH2dXOh1RqFS8ZdirXjb/43RsaMOi8bGU8=;
        b=hySMcNQxpkQ8/ZUp46Vsh9XmJmcSCa5yAW79LAnPQsoZ/j8Idkyh9l5esYuUgL9i/V
         zD9rpxjPONwSeYjAkZZT8li+3fBpsqsoqHDRMcdtzDNQ0D6mmIsjmcsiRCAgBdrPu2tT
         /Rh/LLwCWyq85yoks0qvShwG/twndyW00JS7/18V4LLRnQbx2JCF3GKKCFLD/VIrYiam
         cImS8K+GGgGLuRW543JFI+czKiNMMJh7mVnFf5yBaFMz86/xVGwkdpOLQGXRRk9Neow8
         lL+jCUUB/u/Jshe4+BaoHgR2QkbEOJhuPO0nWN3rAhJw6DmUWRiHfsv8dY9K+uPXQPmr
         CvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748319443; x=1748924243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+nmL4xRMzH2dXOh1RqFS8ZdirXjb/43RsaMOi8bGU8=;
        b=dKXrw3CtL9+k74iU9gFFbIfrsqE1p6QQ3IV8WqrV+rKJaZqJbBkP36Rrmv+eNtYulw
         U0L3oBxTi22yNMvSO+2PCtBIu9AUKpzsd2LtWzIVJWDefmzE3g6qn1O3SBuyDxe9OejG
         jWQPLPUdYBygVW0YxGnc7tKHVHosBpGrk8HXp6ZCoqankT7CZWoWfCsN1FbVIILCLqqg
         OAEny7JvOmQLn/LMfJtsqF+nFf+nyUjplv9YhGNKPIZqmyClY5EzdxBfT+Sn3vSf6F7U
         Vtcweo45Q5gb6bIbo2uNPG1vESwI6OKplgcAFtF26X89h6dL9VXMn3VIGWQNFxR4xY9s
         ltFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZKL4fzavsKOIy5nUx0bXCutV45tMylUgSAw8lFbwZ39Iqflf3Cgg/VyK94Ekh6XwHjz66UFD5DdBtNYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz03yrUgcREN359t5CqGJPlgBTKYQnt2Kwy8rqYpiydsYd9Tdo6
	HlENZkFiPfiOxrGVyqWh8TNimvsvkmDqwLJGZQmVl7ZrtDohBuub+5d8pfFhX5SawKpYrhP6lRy
	T8zxpzY/zjjhIICbr5BzxbRSJJuAziHk=
X-Gm-Gg: ASbGncvAhv+y8DRK+uJLWTOrBKqz/uNwvGCqPp0j95pP01Va4By98U6ZGKi3l4QQD8U
	wqMovStN7hHuvpykUphcUbLVLu3ppmky6mCbbjs1qNae56d8h0sn3oD3uZ+hujGisEtI8mv88SY
	30bfhsM59OT0ionS2h77+VIrmgwbqpFb2iCg==
X-Google-Smtp-Source: AGHT+IGtqV+qdb8z7IZ2fhbjRiKOYA7Wq+zaoY3vaW7RnCXXSqRP/bNQqYQhflDpSLNZG8KRJUaontOxiNrkc41qO38=
X-Received: by 2002:a05:6102:1520:b0:4da:70a8:73cf with SMTP id
 ada2fe7eead31-4e424160a3bmr9098058137.20.1748319443611; Mon, 26 May 2025
 21:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
 <5abe8b0c-2354-4107-9004-ccf86cf90d25@redhat.com>
In-Reply-To: <5abe8b0c-2354-4107-9004-ccf86cf90d25@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 27 May 2025 16:17:12 +1200
X-Gm-Features: AX0GCFvoUl5A5HweNIKUep1FsI4hg4oqYQ-qmOtW0kVbmdEeFStbTBMBJsqM3BM
Message-ID: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, 
	Lokesh Gidra <lokeshgidra@google.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:39=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 23.05.25 01:23, Barry Song wrote:
> > Hi All,
>
> Hi!
>
> >
> > I'm encountering another bug that can be easily reproduced using the sm=
all
> > program below[1], which performs swap-out and swap-in in parallel.
> >
> > The issue occurs when a folio is being swapped out while it is accessed
> > concurrently. In this case, do_swap_page() handles the access. However,
> > because the folio is under writeback, do_swap_page() completely removes
> > its exclusive attribute.
> >
> > do_swap_page:
> >                 } else if (exclusive && folio_test_writeback(folio) &&
> >                            data_race(si->flags & SWP_STABLE_WRITES)) {
> >                          ...
> >                          exclusive =3D false;
> >
> > As a result, userfaultfd_move() will return -EBUSY, even though the
> > folio is not shared and is in fact exclusively owned.
> >
> >                          folio =3D vm_normal_folio(src_vma, src_addr,
> > orig_src_pte);
> >                          if (!folio || !PageAnonExclusive(&folio->page)=
) {
> >                                  spin_unlock(src_ptl);
> > +                               pr_err("%s %d folio:%lx exclusive:%d
> > swapcache:%d\n",
> > +                                       __func__, __LINE__, folio,
> > PageAnonExclusive(&folio->page),
> > +                                       folio_test_swapcache(folio));
> >                                  err =3D -EBUSY;
> >                                  goto out;
> >                          }
> >
> > I understand that shared folios should not be moved. However, in this
> > case, the folio is not shared, yet its exclusive flag is not set.
> >
> > Therefore, I believe PageAnonExclusive is not a reliable indicator of
> > whether a folio is truly exclusive to a process.
>
> It is. The flag *not* being set is not a reliable indicator whether it
> is really shared. ;)
>
> The reason why we have this PAE workaround (dropping the flag) in place
> is because the page must not be written to (SWP_STABLE_WRITES). CoW
> reuse is not possible.
>
> uffd moving that page -- and in that same process setting it writable,
> see move_present_pte()->pte_mkwrite() -- would be very bad.

An alternative approach is to make the folio writable only when we are
reasonably certain it is exclusive; otherwise, it remains read-only. If the
destination is later written to and the folio has become exclusive, it can
be reused directly. If not, a copy-on-write will occur on the destination
address, transparently to userspace. This avoids Lokesh=E2=80=99s userspace=
-based
strategy, which requires forcing a write to the source address.

>
> >
> > The kernel log output is shown below:
> > [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> > swapcache:1
> >
> > I'm still struggling to find a real fix; it seems quite challenging.
>
> PAE tells you that you can immediately write to that page without going
> through CoW. However, here, CoW is required.
>
> > Please let me know if you have any ideas. In any case It seems
> > userspace should fall back to userfaultfd_copy.
>
> We could try detecting whether the page is now exclusive, to reset PAE.
> That will only be possible after writeback completed, so it adds
> complexity without being able to move the page in all cases (during
> writeback).
>
> Letting userspace deal with that in these rate scenarios is
> significantly easier.

Right, this appears to introduce the least change=E2=80=94essentially none=
=E2=80=94to the
kernel, while shifting more noise to userspace :-)

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
