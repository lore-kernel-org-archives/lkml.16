Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B22D1F68
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775353; cv=none; b=WqzpApcNofL1aem9jJL9lPLiP2pfb2JcCNt6m+PpH3/SDvzPc8S8tDo4vyEn5m2gTiIdtO6kueWoIEyxvEwDQzZGqPa0+QGsYS5ujseXs+/UsAru1HNINbEPoLHzDI59V4zKC9QH/1JtwrcItM03SgdHkfx+UwDQIZveQjdMxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775353; c=relaxed/simple;
	bh=82DrN4PaXXS11j+9j66dZOi17onQ0rog+GYdZPUzWQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qyl//m3oPldISY6EF0Xz1FORayP7obNb1yKOFPz348DaXxQOrJy6J9AnAEod1n5g0q3doWU/aZOjaf6HpOkWCe2nOq2DXMLfQSvJ9QdqLmdgmfh11FizOV3TlGS+eypk4Vy1l1dvw/XpvOi3vP3wqtOnCAoxPQOzEqv/9e2fwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgjQflek; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgjQflek"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58197794eso175051cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775351; x=1751380151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSD2mYfxNDB+dLwDFCI+VBJcy2/hQ3H1VYIqXhGlYFI=;
        b=XgjQflekNV54SL9GUvWgBbhauJGsiz+xkiH7lMF/zx4Iuc4ZJOuf0hqhl7pyCXcJpi
         ssX2fKGf0dP9L4UzY7jt5tTf+t/VX2xoroMnuZB9ktCW3VckFJkKETBzlpIhebOBkJXZ
         G2lZMEzQZGDL3l8gtpmnv/qWAzFIhH6JmVmGMBbs1SMAYvEnEUVKqsfDv93UFRoD5StR
         0fMraYER6R9u9wgD7gDnH1bc3i4hUroslgXuu06VK2bYbHrpHMdEOyOikrj1Qldb/3F0
         3D7NTnrADPIeiCQX4qPwJUJMBhmc4cFI0oHMagvZScd/bCyNWiVfsuIZODJ9Z6HFF5gb
         ykdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775351; x=1751380151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSD2mYfxNDB+dLwDFCI+VBJcy2/hQ3H1VYIqXhGlYFI=;
        b=EI/bRaA+bFHDfTF6PBTsNnrKBzH+UaEJ4Qoy3++goB4eegpbaj7LuLJIp8zfr2Sbra
         VGpw/Av0ZNu96ksX0l/VKqIfDBqC3nzbL6ipLG2HpZbZlvDU7/SiTHelv14G59S/aQVD
         go5tA1rexRmyjsJ/FVfg8C5RxP5nWOcbe8bDrRwxPHCc5LwOPKhPvyeUZGjz7IL5BLZP
         ehGVWTWT7cSXvPRXq1qQ5uV6Cheyszctr5p6eOD2zY1B07Pvo7WH95YZPOH/2XoRhREs
         qVR2ongUR6pxp/pVPatLn2X4meQQEWcmosh3FEgYa7ILKg6IpklVlmO9ike7GM8Vp9/V
         o/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWAycUV7WI1uchyzVV3tK1SzNPKTGHWqAaip8YRmKrupzh4NN58gvRECGV656FDnXwpYM2E683RMl0uFqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsySix2u2qFBmMW3FzBw7bboPiTQ4urYjx+09Zax/yVSTrmOA
	UsGoRV7kONzXqsXa1gCH8CVN+mkn5zqbXa8IGQpk5h06xCaoZ02Psnv0AZH9upzWs0u6NNxC/yv
	gj7PxIMWKR6anPnsltuym7GySTqsRt/dpZk1uGqJy
X-Gm-Gg: ASbGncveOHLZoH+/eHPuVFe7Ugkigsc622YjtXoQGmsRKx6PQWWMEcjMU8pW0PD4Czs
	VIRMSCacglRxXnmxnF5q/lsz83Rk1yCrE7gDTdh1GgssJGb5/rQZNErZGXY/0gDiazuUk86Uw+u
	gJ8DklSraV7qcdC/KOHjPdkmNtk7bIWCJ2HNPoWHsptIymil10JWlchVumHuj3IlaEGjwfzA7P+
	A==
X-Google-Smtp-Source: AGHT+IEFMI9Z2wOmOoEl6+Gqr+r5GZMQn0E+Ub3SjHdvnw+ICeQc3UNbC7lwI6PyYtFkpoyIcT8V7lNB2r1BCDrj5BM=
X-Received: by 2002:a05:622a:344:b0:49c:ffd4:abcc with SMTP id
 d75a77b69052e-4a7b171567emr3429201cf.27.1750775350498; Tue, 24 Jun 2025
 07:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz> <e6e20d9e-ceb4-4e18-8859-5255ef1aa525@redhat.com>
In-Reply-To: <e6e20d9e-ceb4-4e18-8859-5255ef1aa525@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Jun 2025 07:28:59 -0700
X-Gm-Features: Ac12FXzjUywJN_m_OazPDhVZ_Bpe8eTuhidb-3HMvM1fE8Nqso1HTUWVB-CSsdw
Message-ID: <CAJuCfpFQedeU-cnsV9PX4SEz5ZS9oHMVzt7HirWExAKoU5y89w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:58=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 24.06.25 15:03, Vlastimil Babka wrote:
> > Since the introduction in 9a10064f5625 ("mm: add a field to store names
> > for private anonymous memory") the code to set anon_name on a vma has
> > been using madvise_update_vma() to call replace_anon_vma_name(). Since
> > the former is called also by a number of other madvise behaviours that
> > do not set a new anon_name, they have been passing the existing
> > anon_name of the vma to make replace_vma_anon_name() a no-op.

s/replace_vma_anon_name/replace_anon_vma_name

> >
> > This is rather wasteful as it needs anon_vma_name_eq() to determine the
> > no-op situations, and checks for when replace_vma_anon_name() is allowe=
d

s/replace_vma_anon_name/replace_anon_vma_name

> > (the vma is anon/shmem) duplicate the checks already done earlier in
> > madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> > fix use-after-free when anon vma name is used after vma is freed")
> > adding anon_name refcount get/put operations exactly to the cases that
> > actually do not change anon_name - just so the replace_vma_anon_name()

s/replace_vma_anon_name/replace_anon_vma_name

> > can keep safely determining it has nothing to do.
> >
> > The recent madvise cleanups made this suboptimal handling very obvious,
> > but happily also allow for an easy fix. madvise_update_vma() now has th=
e
> > complete information whether it's been called to set a new anon_name, s=
o
> > stop passing it the existing vma's name and doing the refcount get/put
> > in its only caller madvise_vma_behavior().
> >
> > In madvise_update_vma() itself, limit calling of replace_anon_vma_name(=
)
> > only to cases where we are setting a new name, otherwise we know it's a
> > no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> > can remove the duplicate checks for vma being anon/shmem that were done
> > already in madvise_vma_behavior().
> >
> > Additionally, by using vma_modify_flags() when not modifying the
> > anon_name, avoid explicitly passing the existing vma's anon_name and
> > storing a pointer to it in struct madv_behavior or a local variable.
> > This prevents the danger of accessing a freed anon_name after vma
> > merging, previously fixed by commit 942341dcc574.
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >   mm/madvise.c | 37 +++++++++++++------------------------
> >   1 file changed, 13 insertions(+), 24 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..fca0e9b3e844ad766e83ac0=
4cc0d7f4099c74005 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -176,25 +176,29 @@ static int replace_anon_vma_name(struct vm_area_s=
truct *vma,
> >   }
> >   #endif /* CONFIG_ANON_VMA_NAME */
> >   /*
> > - * Update the vm_flags on region of a vma, splitting it or merging it =
as
> > - * necessary.  Must be called with mmap_lock held for writing;
> > - * Caller should ensure anon_name stability by raising its refcount ev=
en when
> > - * anon_name belongs to a valid vma because this function might free t=
hat vma.
> > + * Update the vm_flags and/or anon_name on region of a vma, splitting =
it or
> > + * merging it as necessary. Must be called with mmap_lock held for wri=
ting.
> >    */
> >   static int madvise_update_vma(vm_flags_t new_flags,
> >               struct madvise_behavior *madv_behavior)
> >   {
> > -     int error;
> >       struct vm_area_struct *vma =3D madv_behavior->vma;
> >       struct madvise_behavior_range *range =3D &madv_behavior->range;
> >       struct anon_vma_name *anon_name =3D madv_behavior->anon_name;
> > +     bool set_new_anon_name =3D madv_behavior->behavior =3D=3D __MADV_=
SET_ANON_VMA_NAME;
> >       VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
> >
> > -     if (new_flags =3D=3D vma->vm_flags && anon_vma_name_eq(anon_vma_n=
ame(vma), anon_name))
> > +     if (new_flags =3D=3D vma->vm_flags && (!set_new_anon_name ||
> > +                     anon_vma_name_eq(anon_vma_name(vma), anon_name)))
> >               return 0;
> >
> > -     vma =3D vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
> > +     if (set_new_anon_name)
> > +             vma =3D vma_modify_flags_name(&vmi, madv_behavior->prev, =
vma,
> >                       range->start, range->end, new_flags, anon_name);
> > +     else
> > +             vma =3D vma_modify_flags(&vmi, madv_behavior->prev, vma,
> > +                     range->start, range->end, new_flags);
> > +
> >       if (IS_ERR(vma))
> >               return PTR_ERR(vma);
> >
> > @@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags=
,
> >       /* vm_flags is protected by the mmap_lock held in write mode. */
> >       vma_start_write(vma);
> >       vm_flags_reset(vma, new_flags);
> > -     if (!vma->vm_file || vma_is_anon_shmem(vma)) {
> > -             error =3D replace_anon_vma_name(vma, anon_name);
> > -             if (error)
> > -                     return error;
> > -     }
> > +     if (set_new_anon_name)
> > +             return replace_anon_vma_name(vma, anon_name);
>
> Took me a second to find where this is already checked (->
> madvise_vma_behavior()).
>
> :)
>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Cheers,
>
> David / dhildenb
>
