Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314679CF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747716095; cv=none; b=YCxuUspfuhGxnUdFK4WxWq10IsH7ApfgWyv9eKg/s46hrOMnSVBpi2ob13pr0ISBf24COowRF2Sx+vQhApv600IHpCMHqPgDGvBpIgwACvhdH30+cMOqEJk6VaX6/E5pTSZdXdJwcYUIsj4VQVyl9OjAGCrYx5iVerTT7cK+9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747716095; c=relaxed/simple;
	bh=ukue+xyZAxsasmJX9gDcCu/YeigtoMZDNni4ec+LRdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlNxF5DZHUp25bA3UNR6Zu7HweU/KfhX6TAfXIzezinvNeOiqrWBQ3yu4uze8nFBcdzDuqNJZEGw4WOFuZcCyvw4dWMMcvN5UBeCedhtvDQRP+Se7UxTp6Nsys648pZwnU6Uj2yt5Zmi1JQlXfABvN8qnbElnqTbEei/Lh7vDxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyHn1vf+; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyHn1vf+"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52ee2242b24so567055e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747716092; x=1748320892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PGsEVRuOLLAJr1H7lswziptx7jnjpDYYZxCcbVfAq4=;
        b=eyHn1vf+1AO0ImQPjrjzUzg9AaXBQjePXHXDGZMDInW7K8T0ndN0VJfa77oOcueHnb
         NHLj47tGWjVaPnv8AJOyvIPMVkuMPunhyG7orhqK8nk0q7wvdrv5yB9O3aEjfyNs/EZn
         Cxh6WayPmHEiaHVhPPTyaR8vOqidbZ45MLhAszNBWMVviGtnUZUePPnUSO2bFEECctcR
         i/hOgBzlDWZidWlIMpkEvBfF+S8BcyF6+aDo85NbXACRTEEwNUa2zI7FiP+wR79+ypLb
         KBbMWqyrw5TydOJKpjjnwomMcfDbkdeocg6lC+LhK+KLhncf4bXlWm2yT8TTzvfgInHq
         hlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747716092; x=1748320892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PGsEVRuOLLAJr1H7lswziptx7jnjpDYYZxCcbVfAq4=;
        b=CJEs3P7SkTeP6XG84Sf10MPROpzr6qFP8QSDSm5z64jypRnGOPBfMDVzOHzLJVnm4J
         s0zJ/3CVoZErTpRoGfkkGfY+iqjGlrfG/OfNJyH7P1OKbJ7T0Gw4tvp8TtTSWLKTjNGU
         wnY37KOif/8UEt3YqJ3oq8fqtQ6HlO0zuC1zHWoaxwTiDMcT5O81L3KpJ9w/mn/L5vI/
         1vIcsSMEg6lzhMwGVSIg4zPd3iV5sEq6zAQX31GcCfYI1zIYq6Ax1YG016OrqkFtkjlI
         yJxESX9POIzuQUn8NGLWMYuuFyjE7HTutp527h19vCQ1JQYFDk0o62/Hz6P1H/zFDCac
         EJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZEr8mL5kiJv3Tx0fPy14sMmsKZdMtJ27jXBbQcrzXQE2jhyPmlmNA71Z+KsFVv5Jz9SMBkEvtYOnHdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3ZiW/6UqYSzDPxE7JHQIsW03azJ/NYfxgMkI21vdoyLsyZpr
	WmDYTiu9X3c6Q26eRRMf9mq9VfqlRRU7CgFk94AWPZ7XPL6eBBzlTR5PApRrXmFISNOyqssBDkv
	SYgZUfsZ6vcHqkpLfJw4Bg3Ir+Zc7/+c=
X-Gm-Gg: ASbGncsWmOkQuJSxKgQgByLm9lR4KLac81Zm5VThPdZzJ+4qTgI5x1Jy4RSJEk9JTS8
	kCZVl+ytckCk2/Pjza655zW2ylXFaepsEbdNG3568f9HlfBmT6ElAFuQrgYXxksSQH3q4OJ9XFC
	t9WuMUcS9M05jPsdJUhE7cuATelgd7ovnt1WYnjf0uZIQ2
X-Google-Smtp-Source: AGHT+IFbArCYIwR2O/XBoeciC8FmCdBof1bsivqX5W5MnnOOmOlzuLNzaRop84BOKTPpznME2mGSIpjrRoQG+H0ayQ4=
X-Received: by 2002:a05:6122:2203:b0:52a:90d1:ed2d with SMTP id
 71dfb90a1353d-52dba83aa75mr13682011e0c.3.1747716092432; Mon, 19 May 2025
 21:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
 <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
In-Reply-To: <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 20 May 2025 16:41:21 +1200
X-Gm-Features: AX0GCFtFF3WFy2ZJO51MlfJuT8MJKMwchLGRfuBGHfQPNVy5hqpUeX4HrnyUKdE
Message-ID: <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, bhe@redhat.com, 
	chrisl@kernel.org, david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gmail.com> w=
rote:
> >
> > > From: Kairui Song <kasong@tencent.com>
> >
> > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > index e5a0db7f3331..5b4f01aecf35 100644
> > > --- a/mm/userfaultfd.c
> > > +++ b/mm/userfaultfd.c
> > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_struct *mm=
, pmd_t *dst_pmd, pmd_t *src_pmd,
> > >                               goto retry;
> > >                       }
> > >               }
> > > +             if (!folio_swap_contains(src_folio, entry)) {
> > > +                     err =3D -EBUSY;
> > > +                     goto out;
> > > +             }
> >
> > It seems we don't need this. In move_swap_pte(), we have been checking =
pte pages
> > are stable:
> >
> >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_s=
rc_pte,
> >                                  dst_pmd, dst_pmdval)) {
> >                 double_pt_unlock(dst_ptl, src_ptl);
> >                 return -EAGAIN;
> >         }
>
> The tricky part is when swap_cache_get_folio returns the folio, both
> folio and ptes are unlocked. So is it possible that someone else
> swapped in the entries, then swapped them out again using the same
> entries?
>
> The folio will be different here but PTEs are still the same value to
> they will pass the is_pte_pages_stable check, we previously saw
> similar races with anon fault or shmem. I think more strict checking
> won't hurt here.

This doesn't seem to be the same case as the one you fixed in
do_swap_page(). Here, we're hitting the swap cache, whereas in that
case, there was no one hitting the swap cache, and you used
swap_prepare() to set up the cache to fix the issue.

By the way, if we're not hitting the swap cache, src_folio will be
NULL. Also, it seems that folio_swap_contains(src_folio, entry) does
not guard against that case either.

But I suspect we won't have a problem, since we're not swapping in =E2=80=
=94
we didn't read any stale data, right? Swap-in will only occur after we
move the PTEs.

>
> >
> > Also, -EBUSY is somehow incorrect error code.
>
> Yes, thanks, I'll use EAGAIN here just like move_swap_pte.
>
>
> >
> > >               err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr, =
dst_pte, src_pte,
> > >                               orig_dst_pte, orig_src_pte, dst_pmd, ds=
t_pmdval,
> > >                               dst_ptl, src_ptl, src_folio);
> > >
> >

Thanks
Barry
