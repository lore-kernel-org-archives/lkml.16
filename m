Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C829B767
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693162; cv=none; b=LYEBwtz2nKg5ZINLb9V5EDWzZRiwkNUOnaEyDGxMMHhLAvu6CAjMEFBl7vRpuWxTHpAozdXfETubOWRlXM+aPxA7mGaQqT9S0akBxRH9rMcGyRgfcGn8Zj1/k3ZUzDY2Wm9cqmWvXOKdZtPO/DzJVFU72E4UBK5+FXm+my7YmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693162; c=relaxed/simple;
	bh=mquKo7q72V+xUN/n2Zfv1gwSkGcWTeHtpD0P5laj5eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Blx/jpSZ+TxkQcNWnMHGgRKQED5bYZXuDc5n/2nDRNbFOiLbYiAkjdcDCNIh1Iu4q5zRF32faE6CG/nKI013M+EFZu+/bvZ/gI5IvcMvAB2qCB1k+D3246bx/7LlevmIPZrGpE1KdimSbpdrRDrn8JOXuoIpTl/N48mG+WSSBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNjnjoy8; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNjnjoy8"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47e9fea29easo757451cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750693158; x=1751297958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXpGhB8D/EFyEFVKBdpBHH5TY+f9AXT6r2w1zPMMC18=;
        b=NNjnjoy82uZsu9De0cpv2mEHSODcTQCgG6A4nAlmOoFXmff3GuUNnYHzWB7C3lYEt1
         kzdeS+tohLxmTvljQ8KIHgA/5tznoqqvublgUxCJKBiWFnx4JJruyZ+9lmG9azwIPUV2
         3Zvi53CGzFai+O64KRHHsJfeE/6PjGt/ZyKHTdddLds7ZSuu6TnDPY6TwM1zpyKu+RaH
         xpSYwmQ/8BPHx0FUL56ARHTD2mhtNFo8pRdHF4xKK11zOXqPgI7h6yCSaXADMVqRVMPY
         CXc2wQOEbrKy69ay54D+BGN2VOWZB7DLmGwz+9V4ZMUn75urL099LIN8iBnWUS5TA80y
         B24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693158; x=1751297958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXpGhB8D/EFyEFVKBdpBHH5TY+f9AXT6r2w1zPMMC18=;
        b=a8Q8fXtYru/IwDeiqPtpNMEB2tTe4h6UBZviw2E3pJOrOCDFszBHa5s8SEp87meyqq
         OgSIprYVSHOrmuPBG7XoLrsVCs8wqPS1CDcNfo4OssagNdXctxxfzVa/8pn9sqJ5gzs0
         rWQ7aLE7rIUfpPg4fjQIe8VyJugc/tw0gWp9NWc22dv5qBiGeEDK+JqUoqqdaTkGvOst
         SlQc73e73JOMhQ0gD8D1f1aRzV5Ycjg/svzudW8imysgBT9oIK2VtL9GzX0MX9jDZP3h
         wMq7bWPKEkgVq+s71Qjmp9bEdfOXvvpHh6cptIqmkpGCPp2+6duSu68XgpcnOy2Pydli
         iLjA==
X-Forwarded-Encrypted: i=1; AJvYcCXSn+Z/nv00bZsxE27xOzZJvBWxJtb6A+NxHJdrNf0cahKnoPaoERm6/xpL5d6RnC49fibewZFN1Y+2O38=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+vYneIYSogYU3I0kqKTDIfiJlukGoq2Xngjw2QSYJJaLTjCw
	KF9J8Wr7G3ZYlRJP+zq8xhobUspnpiEQC1IY1Fyhp0o2RScyVWClRRMav8FavVaylU8r22pfmRk
	y37GAcA64oKo/fCphKQ+L5Rq4qW1OnFo/Q64QiMK8
X-Gm-Gg: ASbGncsJpvzF3COmpZ1A0mOMW8fWlxv0lyAWxfKWoi+5sQmcQMFJox0FVjBfyl+m3u4
	VJl8borpe5oLKoVaznjPc5WyZyEzGd5Kyz3TyCQ7emkOtqeurQwjPeZw82ps/wblydgWdCparMG
	FWDg1zETOmsFVT2Qx2DPZumdTUR3MK+6T/IKbwGiGNihBRgIe1bjlB
X-Google-Smtp-Source: AGHT+IF95EFLkc/FCP1YCcV3dI+eQE9bOqB4iNEeLrvaybuWX/WfpRtkSxzFcESxVTnkO2L/DcAlKqhu8ewdgrnOaN4=
X-Received: by 2002:a05:622a:8596:b0:480:dde:aa4c with SMTP id
 d75a77b69052e-4a785418ccdmr6434191cf.4.1750693158070; Mon, 23 Jun 2025
 08:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz> <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
In-Reply-To: <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jun 2025 08:39:07 -0700
X-Gm-Features: Ac12FXypuLgcEDBw9XhSelwuQgJJ0khGAjfDvtlFfTgvOwT9ulXoeO2zFqOjGy0
Message-ID: <CAJuCfpG_ORN2+pifB4H16eASTAQFY+Fa_5FRROkffLKuNJpD3Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 8:00=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Since the introduction in 9a10064f5625 ("mm: add a field to store names
> for private anonymous memory") the code to set anon_name on a vma has
> been using madvise_update_vma() to call replace_vma_anon_name(). Since

s/replace_vma_anon_name()/replace_anon_vma_name()

> the former is called also by a number of other madvise behaviours that
> do not set a new anon_name, they have been passing the existing
> anon_name of the vma to make replace_vma_anon_name() a no-op.
>
> This is rather wasteful as it needs anon_vma_name_eq() to determine the
> no-op situations, and checks for when replace_vma_anon_name() is allowed
> (the vma is anon/shmem) duplicate the checks already done earlier in
> madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> fix use-after-free when anon vma name is used after vma is freed")
> adding anon_name refcount get/put operations exactly to the cases that
> actually do not change anon_name - just so the replace_vma_anon_name()
> can keep safely determining it has nothing to do.
>
> The recent madvise cleanups made this suboptimal handling very obvious,
> but happily also allow for an easy fix. madvise_update_vma() now has the
> complete information whether it's been called to set a new anon_name, so
> stop passing it the existing vma's name and doing the refcount get/put
> in its only caller madvise_vma_behavior().
>
> In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
> only to cases where we are setting a new name, otherwise we know it's a
> no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> can remove the duplicate checks for vma being anon/shmem that were done
> already in madvise_vma_behavior().
>
> The remaining reason to obtain the vma's existing anon_name is to pass
> it to vma_modify_flags_name() for the splitting and merging to work
> properly. In case of merging, the vma might be freed along with the
> anon_name, but madvise_update_vma() will not access it afterwards

This is quite subtle. Can we add a comment in the code that anon_name
might be freed as a result of vma merge after vma_modify_flags_name()
gets called and anon_name should not be accessed afterwards?

> so the
> UAF previously fixed by commit 942341dcc574 is not reintroduced.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/madvise.c | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..ae29395b4fc7f65a449c5772b=
1901a90f4195885 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -176,21 +176,25 @@ static int replace_anon_vma_name(struct vm_area_str=
uct *vma,
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>  /*
> - * Update the vm_flags on region of a vma, splitting it or merging it as
> - * necessary.  Must be called with mmap_lock held for writing;
> - * Caller should ensure anon_name stability by raising its refcount even=
 when
> - * anon_name belongs to a valid vma because this function might free tha=
t vma.
> + * Update the vm_flags and/or anon_name on region of a vma, splitting it=
 or
> + * merging it as necessary. Must be called with mmap_lock held for writi=
ng.
>   */
>  static int madvise_update_vma(vm_flags_t new_flags,
>                 struct madvise_behavior *madv_behavior)
>  {
> -       int error;
>         struct vm_area_struct *vma =3D madv_behavior->vma;
>         struct madvise_behavior_range *range =3D &madv_behavior->range;
> -       struct anon_vma_name *anon_name =3D madv_behavior->anon_name;
> +       bool set_new_anon_name =3D madv_behavior->behavior =3D=3D __MADV_=
SET_ANON_VMA_NAME;
> +       struct anon_vma_name *anon_name;
>         VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
>
> -       if (new_flags =3D=3D vma->vm_flags && anon_vma_name_eq(anon_vma_n=
ame(vma), anon_name))
> +       if (set_new_anon_name)
> +               anon_name =3D madv_behavior->anon_name;
> +       else
> +               anon_name =3D anon_vma_name(vma);
> +
> +       if (new_flags =3D=3D vma->vm_flags && (!set_new_anon_name
> +                       || anon_vma_name_eq(anon_vma_name(vma), anon_name=
)))
>                 return 0;
>
>         vma =3D vma_modify_flags_name(&vmi, madv_behavior->prev, vma,

Maybe here we can add a comment, something like this:
/*
 * vma->anon_name might be freed by vma_modify_flags_name() as a
result of vma merge,
 * therefore accessing anon_name in the code below is unsafe if
!set_new_anon_name.
 */

> @@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
>         /* vm_flags is protected by the mmap_lock held in write mode. */
>         vma_start_write(vma);
>         vm_flags_reset(vma, new_flags);
> -       if (!vma->vm_file || vma_is_anon_shmem(vma)) {
> -               error =3D replace_anon_vma_name(vma, anon_name);
> -               if (error)
> -                       return error;
> -       }
> +       if (set_new_anon_name)
> +               return replace_anon_vma_name(vma, anon_name);
>
>         return 0;
>  }
> @@ -1313,7 +1314,6 @@ static int madvise_vma_behavior(struct madvise_beha=
vior *madv_behavior)
>         int behavior =3D madv_behavior->behavior;
>         struct vm_area_struct *vma =3D madv_behavior->vma;
>         vm_flags_t new_flags =3D vma->vm_flags;
> -       bool set_new_anon_name =3D behavior =3D=3D __MADV_SET_ANON_VMA_NA=
ME;
>         struct madvise_behavior_range *range =3D &madv_behavior->range;
>         int error;
>
> @@ -1403,18 +1403,7 @@ static int madvise_vma_behavior(struct madvise_beh=
avior *madv_behavior)
>         /* This is a write operation.*/
>         VM_WARN_ON_ONCE(madv_behavior->lock_mode !=3D MADVISE_MMAP_WRITE_=
LOCK);
>
> -       /*
> -        * madvise_update_vma() might cause a VMA merge which could put a=
n
> -        * anon_vma_name, so we must hold an additional reference on the
> -        * anon_vma_name so it doesn't disappear from under us.
> -        */
> -       if (!set_new_anon_name) {
> -               madv_behavior->anon_name =3D anon_vma_name(vma);
> -               anon_vma_name_get(madv_behavior->anon_name);
> -       }
>         error =3D madvise_update_vma(new_flags, madv_behavior);
> -       if (!set_new_anon_name)
> -               anon_vma_name_put(madv_behavior->anon_name);
>  out:
>         /*
>          * madvise() returns EAGAIN if kernel resources, such as
>
> --
> 2.50.0
>
