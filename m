Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09171DDA24
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243022; cv=none; b=N0FbvAYG6Hk3Hlil4w8IA5lNBSalNH2OMwX00eV+xc1YcpCYALLwwnl2lP6C8Y64+rZjTcAmjmDt4NLhr4oDoA1fFzb9+isKuaRop4S3Kdmg9EV1YXFG1rKnWSi1zunkEaKg26eMuWqeqjb++gbe2/1erqfC8rbAaMmBymNDwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243022; c=relaxed/simple;
	bh=9mU1IbjCwGrA6T2HroQuXJB/zERDHNnkDsrlmdviP74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwZoZWDbHVfpYgEYBod9N78qn9ytJs/Jkb72axWClDIgJF715Q2utOogzgVoi93PN0qEeotBuBih4imVyoLfxj/r/E61y3L2y1AJU4uMXleNwySw/pNlyMsstZrU+FzXFu6habc22732SW8kAr25Yi+VZtGryrnq/gp6DHn+RsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYPxz84r; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYPxz84r"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so398535241.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750243019; x=1750847819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6qb0UH+1O/3k3BaasSuo+Now7ZqMn2I9gUQF913qFs=;
        b=JYPxz84r5sv/q/NX5U8bMO4RPtp3Au7TzqrjQfs/VZ6Ut0QtpLyRY7jEGWt5z6n8In
         H/piz6GckWqST/RH83m5X7zi+OwIPSmQFoJdObDgdA0tI48KcAlAU58Jsp6EKvhhOF+Q
         UjDUWtqHQzExQH6xDK8LQm2+Nt4T3VdTDrbGKZlxmW4Bzb8FAVlBaXoI4z+PCt1dRSpj
         iLDGCaFJcbwSGUyWMfaYDD38GpwQioxihDcviK1I303dLgbsgSmCKG8cJsZB4GcGN3x1
         di4iuukkpI4a/YWR4rKVPoLt/Rw/kFQELkCGCYu3H1rATiE/ZRJZVxCfEaWc3Vl1YWi+
         2dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750243019; x=1750847819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6qb0UH+1O/3k3BaasSuo+Now7ZqMn2I9gUQF913qFs=;
        b=Oha5HGVuWbywaoq1ZwuLv/hlNiy0Ep4twuZcfqbQ5PpcLzP3kt0HBG4J6JVFGM5ICd
         q6So9meyG0AFsZotxScoHorq7kssCH3DU6ZaOzCT8B9XYwgX8+bK09xeJnP86plf7ToK
         2LgcFMHf4pOlsoPrD7p4pijfq/clLZUEG7ZCsJlvIUIlFGmzHaP4evxtyY9C8mzI//KB
         Kt4SMwyhfq85wQTc5Vg8GXTQ+lvQQJOmoZI7NVa7P9FgGnes/uZHJRwASzOblwwHAw2a
         BLfliRIOPQR1uSSkdps8PgHCDvtphNnjRmu6tW7d6y+4IGk/ZFglvzr96ojgBWqCiq5y
         8SIw==
X-Forwarded-Encrypted: i=1; AJvYcCXOIU0l0rxF0X9CcSxD1OZPJCPV8efV1/nZ94YnPL8iUtzlWLMFPmY+b2BH7VwV7kbe9LQU9+G/p1Aopsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbbB3ol1sY1Z5zy9JyuKfN4aWp7lwtDIwpJWQ6kIiXM15aAFt
	D6mOIgDBYRh5wP/ENl8qHhTgUxQnvJtTZfPzZiAN9aLCgnLQS13ZMOGBtYpB1vyefvecfKJdX99
	J+LhEvIVIiZJkNCLCPo43XeRaOO+lPVNuQQMR
X-Gm-Gg: ASbGncss8ueE06GjoWvoL8RKJTKgOmLiLJocWrtdxuf+8ropgk0zaOVwsA9K2J0qAvs
	Ueks8t92ohrz30jGhaLbfwqsz7Yg5BGrfLBxDWEXqdnAnpmPhNpzj4+QHFhWxXY9mL1Lp+0qDp5
	sWXRJPZ4VFWXHM2L9wMbPtA/4YEhA6GnSeP53OahCllxo=
X-Google-Smtp-Source: AGHT+IGrQTi1dFQKKC+4Tva42Wjpw/WTHK3Uw+fY6TyPSlSCJM6XkQXHvYhRRxeMSBv55713BrZWXfpy7EhrkPvU4x8=
X-Received: by 2002:a05:6102:2924:b0:4e7:b77d:7fe1 with SMTP id
 ada2fe7eead31-4e99729dffdmr918481137.0.1750243019526; Wed, 18 Jun 2025
 03:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607220150.2980-1-21cnbao@gmail.com> <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <CAGsJ_4yPg2AOxjorD3RPyu=Ko+7gpU1=-XWqQohvLWgGrzAEDQ@mail.gmail.com> <05d38430-3512-49b0-90da-1ae7a617a377@lucifer.local>
In-Reply-To: <05d38430-3512-49b0-90da-1ae7a617a377@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 18 Jun 2025 18:36:48 +0800
X-Gm-Features: Ac12FXzIhZQUu9QnNEnKJxKSW7chiutKLCuzqNt1W6Lvw2Zz1bxp0MqK3U7Qeh8
Message-ID: <CAGsJ_4xKmXO1LigxrG7RQG4EUzZyPwiYsYnQXNnJpvF=PEoDfw@mail.gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:33=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Jun 18, 2025 at 06:11:26PM +0800, Barry Song wrote:
> [sip]
> > > ----8<----
> > > From 1ffcaea75ebdaffe15805386f6d7733883d265a5 Mon Sep 17 00:00:00 200=
1
> > > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Date: Tue, 17 Jun 2025 14:35:13 +0100
> > > Subject: [PATCH] mm/madvise: avoid any chance of uninitialised pointe=
r deref
> > >
> > > If we were to extend madvise() to support more operations under VMA l=
ock,
> > > we could potentially dereference prev to uninitialised state in
> > > madvise_update_vma().
> > >
> > > Avoid this by explicitly setting prev to vma before invoking the visi=
t()
> > > function.
> > >
> > > This has no impact on behaviour, as all visitors compatible with a VM=
A lock
> > > do not require prev to be set to the previous VMA and at any rate we =
only
> > > examine a single VMA in VMA lock mode.
> > >
> > > Reported-by: Lance Yang <ioworker0@gmail.com>
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >  mm/madvise.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index efe5d64e1175..0970623a0e98 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -1333,6 +1333,8 @@ static int madvise_vma_behavior(struct vm_area_=
struct *vma,
> > >                 return madvise_guard_remove(vma, prev, start, end);
> > >         }
> > >
> > > +       /* We cannot provide prev in this lock mode. */
> > > +       VM_WARN_ON_ONCE(arg->lock_mode =3D=3D MADVISE_VMA_READ_LOCK);
> >
> > Thanks, Lorenzo.
> > Do we even reach this point for MADVISE_MMAP_READ_LOCK cases?
> > madvise_update_vma() attempts to merge or split VMAs=E2=80=94wouldn't t=
hat be
> > a scenario that requires a write lock?
>
> Well we're relying on happening to reach here with the correct lock afaic=
t.
>
> I'm going to be doing some follow-up series to clean all this up!
>
> I'd rather keep this in here for now just to ensure we don't miss some st=
upidity
> here.

I have no objection to keeping this as-is=E2=80=94just curious if using
VM_WARN_ON_ONCE(arg->lock_mode !=3D MADVISE_MMAP_WRITE_LOCK)
would be more accurate.

In any case, your cleanup series will address this, so it's probably
not something we need to handle right now.

>
> Thanks!
>
> >
> > The prerequisite for using a VMA read lock is that the operation must
> > be safe under an mmap read lock as well.
> >
> > >         anon_name =3D anon_vma_name(vma);
> > >         anon_vma_name_get(anon_name);
> > >         error =3D madvise_update_vma(vma, prev, start, end, new_flags=
,
> > > @@ -1549,6 +1551,7 @@ int madvise_walk_vmas(struct mm_struct *mm, uns=
igned long start,
> > >         if (madv_behavior && madv_behavior->lock_mode =3D=3D MADVISE_=
VMA_READ_LOCK) {
> > >                 vma =3D try_vma_read_lock(mm, madv_behavior, start, e=
nd);
> > >                 if (vma) {
> > > +                       prev =3D vma;
> > >                         error =3D visit(vma, &prev, start, end, arg);
> > >                         vma_end_read(vma);
> > >                         return error;
> > > --
> > > 2.49.0
> >

Thanks
Barry
