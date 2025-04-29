Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B21B19D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941987; cv=none; b=ns+L00Un23BAB3TmNz20E6fAUzi8nQepEtJVL3HFccUrR7NW3VnRD6AOudo+rn6H8TMyAoPV8NffHVoeeOYeAyfxOm7n2ucKRtkcUsMfba9lOqSdQTr5BWsvyB0Ci2cWWQDdyEBJVUnpAbLY7B/LQ/Ow9yMywxP7pHrYZ+F/BbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941987; c=relaxed/simple;
	bh=h/IZQcnfBHT4G86+I5es43VQEQkabF+DsuYFa4wAYeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7Og10tDp5d1A7+JNCBQ63edd6okpndI3xpLOWnJ2xjRkVCVroKyQIc8jcdb9aOO7IZj0LD7VYg8L0xztLwFaHNvT8XS/qcs+7ow/+AfT2d43vYYVJELO1PA8HCxVSu6VGIDT7k+oNnog31mqb8lhzKkQpqD6xIARIvSb6Fo5q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T09odg57; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T09odg57"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo40331cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745941984; x=1746546784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR4G/oE7lDV+SqdB3MLGFRpZBNejLhq+cnMM4fvc76s=;
        b=T09odg57AXY9EfSVw8uvzkytMQ+UbLC8RpwE9oXC8Rc9+Vz5TUD2fDr+UWjsixh/pr
         2gd/Csn5Zaxq/xGVg11Yf7zy0o5tyvtgP4FAMJDL/2czQHMdTDrOnOA0hyu6H/qh66sf
         FsrnZ5zq0OVhk021Z2JLzwIcWHbUGqpF+kzB/9ohGfWRNU/Nrgk/A8Vtnwdqke9RNvUT
         pudzOPtc3PlsUzNC40vJCWgf/z1ppTUrDqWC4yY9XnNPPdDtYHx9hhwQc0uwtfNohMZG
         LGYlfsO7rz9jQ8d/Ay9LnFHw/0q86nrBAntaoQLlxmJ0mIaamf6yDBpKtpQZr9YO65wd
         7x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941984; x=1746546784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR4G/oE7lDV+SqdB3MLGFRpZBNejLhq+cnMM4fvc76s=;
        b=VXhmsKYZ8Nh7KvI4jOthzf57rIhv5J9dMO++284Rwr4XBMPAjts+8gytobrD6BmpIL
         3YSxQ8fwpBjD39c1IyRw6Gt8guWm5HvWZlDxe9ieqOcWMHTofKzrFyG9NhqQRV4B1g0d
         WzGSIVu+TwirOg9wyG6iAEmO9RHV8dfj0xLVadmTyiB7Ryh9etFIuPsfjy9P/rcQj/Dq
         6XqlbGDbLc5culXhBxSeCe0ztqkHhCTW8jdzQDas3jEaNPiXrqZ3peRuHOQVfDGGbdb3
         XCxrYsEA+mcgEAxfUOiTx2/Gjh5jYQqOVc8lcCMte0vKWPKvG9uprY7HJ2p69+fsSX+n
         Rttg==
X-Forwarded-Encrypted: i=1; AJvYcCUuor3xsz8mf+GLfXymmOH/9okuQNFKZENFeWu9AJ431C3wLIL4jwNEor/LYMLed43h3YquoEX7kjDNinQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11JOBOq9/a/fl68Cocm4P8+n/+A6cs1QzKwEQqBjo3UoBUmsh
	aA+ugHIEGn3JZIm3S320T/JiuQXURQR4RJ4G50fvP6sdHiXl/fa6p7k6GQzRCVnZJFGm6PeckGs
	5Gd0xQNlnnuNgcbLaZF+sbj64R8CWdUoQbDG9
X-Gm-Gg: ASbGncst+nhw2q6JJb71pKQmfx2Kwp32xXojZYGj+NeiwUahdqityTsYNrF1JTGw3HL
	4xc3U7OPag1t0FvbOGUlk/qqI1G+OLVpVeoeL1SwQujONdinIv8tKPGtsiA7B4RycTXfoyUi3wb
	PdTsoZcUGhCSsxq35EniUqCSJ2KBTdlrAOPLGAwRDYWo0ZWnLIz4XsjVDAbsax8rY=
X-Google-Smtp-Source: AGHT+IGUq0/bI6iWrr9yZSSFf6tf5FG9S03JekqmQqENCmT+EVGlFWDUhQvyd0VduyAxZKvqcwn9zVZ9YpU7aaw47qI=
X-Received: by 2002:a05:622a:1822:b0:47e:ad75:c1a7 with SMTP id
 d75a77b69052e-4885f13f423mr5274211cf.18.1745941984053; Tue, 29 Apr 2025
 08:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com> <de327c4e-67c6-4e7e-a40d-bc0e936de17d@oppo.com>
In-Reply-To: <de327c4e-67c6-4e7e-a40d-bc0e936de17d@oppo.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 29 Apr 2025 08:52:52 -0700
X-Gm-Features: ATxdqUFtkPoy459ruNkC4oHR_d__4et9mgSOFxeAb9dS-Stp0Dg4GrMRRqwCwKk
Message-ID: <CAJuCfpFYEJDC0mypseU+tGDUmE+72jEGjfx-gBRPs3o3y-o7+A@mail.gmail.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
To: Hailong Liu <hailong.liu@oppo.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 12:48=E2=80=AFAM Hailong Liu <hailong.liu@oppo.com>=
 wrote:
>
> On 4/29/2025 9:47 AM, Liam R. Howlett wrote:
> > Temporarily clear the preallocation flag when explicitly requesting
> > allocations.  Pre-existing allocations are already counted against the
> > request through mas_node_count_gfp(), but the allocations will not
> > happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> > avoid re-allocating in bulk allocation mode, and to detect issues with
> > preallocation calculations.
> >
> > The MA_STATE_PREALLOC flag should also always be set on zero allocation=
s
> > so that detection of underflow allocations will print a WARN_ON() durin=
g
> > consumption.
> >
> > User visible effect of this flaw is a WARN_ON() followed by a null
> > pointer dereference when subsequent requests for larger number of nodes
> > is ignored, such as the vma merge retry in mmap_region() caused by
> > drivers altering the vma flags.
> >
> > Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > Reported-by: Hailong Liu <hailong.liu@oppo.com>
> > Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> > Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@=
oppo.com/
> > Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett=
@oracle.com/
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Hailong Liu <hailong.liu@oppo.com>
> > Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> > Cc: Steve Kang <Steve.Kang@unisoc.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> > ---
> >  lib/maple_tree.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > Only the MA_STATE_PREALLOC flag needs to be fixed to avoid the vma
> > iterator issue.  Doing the minimum change here mitigates risk in the
> > stable kernels.
> >
> > If this fixes the issue, I'll resend without the RFC and add Stable to
> > the Cc list.
> >
> > Thanks again, Hailong for the work on this issue.  Your testcase helped
> > me narrow the bug down in the end.  I appreciate all the work and
> > support provided by the Android partners, especially the involvement on
> > the mailing list!
> That's my pleasure. I also learned a lot from you :)
> >
> > diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> > index 4eda949063602..d9975b870dadc 100644
> > --- a/lib/maple_tree.c
> > +++ b/lib/maple_tree.c
> > @@ -5508,7 +5508,7 @@ int mas_preallocate(struct ma_state *mas, void *e=
ntry, gfp_t gfp)
> >       /* At this point, we are at the leaf node that needs to be altere=
d. */
> >       /* Exact fit, no nodes needed. */
> >       if (wr_mas.r_min =3D=3D mas->index && wr_mas.r_max =3D=3D mas->la=
st)
> > -             return 0;
> > +             goto ask_zero;
> >
> >       mas_wr_end_piv(&wr_mas);
> >       node_size =3D mas_wr_new_end(&wr_mas);
> > @@ -5517,10 +5517,11 @@ int mas_preallocate(struct ma_state *mas, void =
*entry, gfp_t gfp)
> >       if (node_size =3D=3D wr_mas.node_end) {
> >               /* reuse node */
> >               if (!mt_in_rcu(mas->tree))
> > -                     return 0;
> > +                     goto ask_zero;
> > +
> >               /* shifting boundary */
> >               if (wr_mas.offset_end - mas->offset =3D=3D 1)
> > -                     return 0;
> > +                     goto ask_zero;
> >       }
> >
> >       if (node_size >=3D mt_slots[wr_mas.type]) {
> > @@ -5539,10 +5540,13 @@ int mas_preallocate(struct ma_state *mas, void =
*entry, gfp_t gfp)
> >
> >       /* node store, slot store needs one node */
> >  ask_now:
> > +     mas->mas_flags &=3D ~MA_STATE_PREALLOC;
> >       mas_node_count_gfp(mas, request, gfp);
> > -     mas->mas_flags |=3D MA_STATE_PREALLOC;
> > -     if (likely(!mas_is_err(mas)))
> > +     if (likely(!mas_is_err(mas))) {
> > +ask_zero:
> > +             mas->mas_flags |=3D MA_STATE_PREALLOC;
> >               return 0;
> > +     }
> >
> >       mas_set_alloc_req(mas, 0);
> >       ret =3D xa_err(mas->node);
> Passed local test, planned to aging test.

I also confirmed the issue is not reproducible with your patch. Thanks!

>
> Brs,
> Hailong.
>
