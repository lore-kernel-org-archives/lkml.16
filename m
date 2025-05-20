Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A313C3CD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768218; cv=none; b=rmKaY9y8YLKT81jkGste/kQjXxXk5/3FpbViusldAJs2/QJfQTWNY2V/OYANd12NZwC2Y0vSDTrzny3bKBtY/hkSM3jTQ5B0B0cKDC1Olx4v9xpWy434z7z2GWfGPN6Wygo6woIoGW7HJoGtbziyaUczctM1wY2Zc3hgJiuUUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768218; c=relaxed/simple;
	bh=1jcGNWuqjA9di0Iw7wpr3kegFkONWodh968iwzCodwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUuI/spFaXSV0pQzpBlYGjCDjbfLeldJbmfOP4DU2s3sqUhg8Laq7jSJAbdy6YYXmGn2Px0xVQsZLQQPl0zdGzEBEfSxrCrx33zAaU/XERkfgpFEoXM3IL89hTWfC6xpWzO5Zbu5l/tJ9AQ7asVuEDAA3qdTNClBymqg8TiHCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZAcFB0w; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZAcFB0w"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3290ae9b011so32795211fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768214; x=1748373014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPsO0f2BWiwLoElcAZPyuEpqP8kWpMqtpBL6TS/Lmi8=;
        b=PZAcFB0wwbNaO0xTPqAAqJIw692QuP1pG5+2EkkmW1BwL8CHwXoSHlKH0LVLM1+7O4
         NLzmeZddCykGohPeqDKGl3rr/VF2Woy07LBUypKD9sNZSJc1Y7dTG6PnbtgmB4G1ygUf
         bcSYGewTIoAv2NlIlrPjtB8r1mBRJyUHms8NIQWrsQossu6G5gBv8BdzKAPJUPRQxrmV
         HCY5OPKhBYYp9gmNzjJDUriD1xzHi9oc/r8iuv18UwEiA9RxRibYmc3f0Psp9fqzYwR4
         +N9qLiNv4Bit0YBdB4kH45P+bY736zlXzIg6LmbHPfaE1yR8PuDaIjshIm4R0hKuU3Zz
         LTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768214; x=1748373014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPsO0f2BWiwLoElcAZPyuEpqP8kWpMqtpBL6TS/Lmi8=;
        b=aUSgL0xEQYzdb9yuUGu6TXexmjD5eggVAYgkG5Cm2Kiw+d4bKDd1cnEpy3scKXsAkC
         K0JT9n8ftyJblWKjqxiZnFq79oD1aE4RwNy1Z+koCJCyiFMJua/TLW6FJhazPTnirQQu
         1Bp0HsR2Iil9vN8g/IImngp14OXBL+Tv3ar+7iwu9i/oEbQZOlQAk6goDXZD40GgS36H
         p+roZdfHfOkUxHG5ZktspiX4RLpkxj2QToUfxnatgMxaSzCNJEZW2Z7eVqUHEVU9AOX4
         b0N/Sh33x7hZ+P2yRbzx/HKtpeNli0uiCUNo9teDiAqd0wkl6V+JNXd9VMLasCdlvfxj
         0t7A==
X-Forwarded-Encrypted: i=1; AJvYcCX1zxcNC1y3Uf7WxUqwC83pNbSktfSqNpaWfbvqq+kMpSFN3/FbgEnLw/LrdXzL96Y9V5J1lQMk6iuOfv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wkfvkFkeweEdoTq8t6YOV9V+eDcmjZIsdfJze8XG0lbhvP60
	pxoH4pF01hkhKvPP5xsO2RqtMdrrPNzBKuT9p8KfUqNXHy3c41eAZin3BiUJidlKuR9Scr7iBT4
	4CL+BQQMIwIubLScf/RkTd5WRhhbcDhc=
X-Gm-Gg: ASbGncvIfI3cHaOj8NIU6C5+QXMFb1Bhxri7L/JMrSJtrfYem3VekTHdQRUXi+iMT4C
	3Cuz4iqe7ntSF39+Fyw/h+gNjPCpgaPpyjTOXe981AFjilnf2K0S5o3sfzl72SOC7Y9UtXZ7YKP
	hXWISgPRVKlF/3xjkSMyml4pwsgLHpsjlouO3wMmbV+nV3
X-Google-Smtp-Source: AGHT+IG16erSfQCKQUExc5Ec2MNVNDdswbVgxsFyD29WQGDrNQv9DL99soNojHJYgWzNFEr0dlvzKU09eWi759D2lkg=
X-Received: by 2002:a05:651c:b25:b0:328:604:9da8 with SMTP id
 38308e7fff4ca-328096986cdmr57652731fa.6.1747768213725; Tue, 20 May 2025
 12:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
 <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com> <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 May 2025 03:09:53 +0800
X-Gm-Features: AX0GCFvS0Qh8UlwFUeBGaeNobGkHIR_Uv-gx1q7Z8yZ-MxE_Jq4EzqIPqQcytn8
Message-ID: <CAMgjq7AO__8TFE8ibwQswWmmf4tTGg2NBEJp0aEn32vN+Dy8uw@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, bhe@redhat.com, 
	chrisl@kernel.org, david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:41=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
> > >
> > > > From: Kairui Song <kasong@tencent.com>
> > >
> > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > index e5a0db7f3331..5b4f01aecf35 100644
> > > > --- a/mm/userfaultfd.c
> > > > +++ b/mm/userfaultfd.c
> > > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_struct *=
mm, pmd_t *dst_pmd, pmd_t *src_pmd,
> > > >                               goto retry;
> > > >                       }
> > > >               }
> > > > +             if (!folio_swap_contains(src_folio, entry)) {
> > > > +                     err =3D -EBUSY;
> > > > +                     goto out;
> > > > +             }
> > >
> > > It seems we don't need this. In move_swap_pte(), we have been checkin=
g pte pages
> > > are stable:
> > >
> > >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig=
_src_pte,
> > >                                  dst_pmd, dst_pmdval)) {
> > >                 double_pt_unlock(dst_ptl, src_ptl);
> > >                 return -EAGAIN;
> > >         }
> >
> > The tricky part is when swap_cache_get_folio returns the folio, both
> > folio and ptes are unlocked. So is it possible that someone else
> > swapped in the entries, then swapped them out again using the same
> > entries?
> >
> > The folio will be different here but PTEs are still the same value to
> > they will pass the is_pte_pages_stable check, we previously saw
> > similar races with anon fault or shmem. I think more strict checking
> > won't hurt here.
>
> This doesn't seem to be the same case as the one you fixed in
> do_swap_page(). Here, we're hitting the swap cache, whereas in that
> case, there was no one hitting the swap cache, and you used
> swap_prepare() to set up the cache to fix the issue.
>
> By the way, if we're not hitting the swap cache, src_folio will be
> NULL. Also, it seems that folio_swap_contains(src_folio, entry) does
> not guard against that case either.

Ah, that's true, it should be moved inside the if (folio) {...} block
above. Thanks for catching this!

> But I suspect we won't have a problem, since we're not swapping in =E2=80=
=94
> we didn't read any stale data, right? Swap-in will only occur after we
> move the PTEs.

My concern is that a parallel swapin / swapout could result in the
folio to be a completely irrelevant or invalid folio.

It's not about the dst, but in the move src side, something like:

CPU1                             CPU2
move_pages_pte
  folio =3D swap_cache_get_folio(...)
    | Got folio A here
  move_swap_pte
                                 <swapin src_pte, using folio A>
                                 <swapout src_pte, put folio A>
                                   | Now folio A is no longer valid.
                                   | It's very unlikely but here SWAP
                                   | could reuse the same entry as above.
    double_pt_lock
    is_pte_pages_stable
      | Passed because of entry reuse.
    folio_move_anon_rmap(...)
      | Moved invalid folio A.

And could it be possible that the swap_cache_get_folio returns NULL
here, but later right before the double_pt_lock, a folio is added to
swap cache? Maybe we better check the swap cache after clear and
releasing dst lock, but before releasing src lock?


>
> >
> > >
> > > Also, -EBUSY is somehow incorrect error code.
> >
> > Yes, thanks, I'll use EAGAIN here just like move_swap_pte.
> >
> >
> > >
> > > >               err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr=
, dst_pte, src_pte,
> > > >                               orig_dst_pte, orig_src_pte, dst_pmd, =
dst_pmdval,
> > > >                               dst_ptl, src_ptl, src_folio);
> > > >
> > >
>
> Thanks
> Barry
