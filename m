Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD120101C8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746666344; cv=none; b=ZGaT+lVilL1nOhDdvFCDXIsq34pEAe63TdEJtRRCTX2Ar+I0Z1uWt2tn0D8Zq/yaY2QUayJs2SiMsZYWoy6mE9tD4FEHSzCaQK1p/gOFIiqKAGHM7mCbyzHUhmTusIRzcaZNNWDI8YPmoTFKwmxWaQg14bEek2w4beEPAdpEORY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746666344; c=relaxed/simple;
	bh=2QB/um2dC25GQugBU+tqsERTf1/t04bsuvEr/0+GsYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COQRr9mFEBIuJtdwItkY2KNq35VxGmngYmojcs8pArP3SzNwsyKvOmyktt2D1i/B0CGLvsTAqGFFdX0R3WOd0ToQiJlaMZXzmjB0veVMMaSiESGSzvwAkjPuZ3CPHCjqiN3Yn9Hs0y+jKLD1+wCUJWbgO4xCR45RpuYu976InIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMFhY7+g; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMFhY7+g"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so289102241.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 18:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746666341; x=1747271141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V20XewBqSgIlIIe+WN0AIsJRzTuePTfDjWltPUvkBBw=;
        b=DMFhY7+gFdHEsiPUZxWJ7z1m43QEVepwphiq4q0j8CLPIE+Ek8UgOnBfd1xaOHhH8a
         wHmYVhyFghaJ5uYfDTCWU7611SVIaC9lO+2yh551xPOxy/NknzbX9YDTae3vk5ODM3YA
         oo/cxVF5cnLQ3yE7K/iPoAJAdARL3Tt9dprsZaAAeKUOjlReA984xKCVoexM+x7sfmJP
         Qdazci2axz+X1eck5IYK/0WUf52qSSCzPg+B8auRqc7EPmqyNbH0KDmKHlNYg8bUsTRk
         5FCNTQP2TZynpPmX/zh4KhW5bEDaSRW40Ps20ArCE21OkBZ4Q3O0InAuNrWyQHnA9YoW
         i5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746666341; x=1747271141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V20XewBqSgIlIIe+WN0AIsJRzTuePTfDjWltPUvkBBw=;
        b=JxzfACqpvgilzSXhI+yClTCafvr51LKtXZ4NnnXMB83sIQMfLH6Gwq5Sc7KdQP74A2
         zJ6J140zNF7bb86H/p9BUmxWMlk5lFBqdfyXazBdgvUEqlJO0ak7A4a15lPTvntOyY1M
         Ou8NgN3kR9KyMO4aRA7eFv90+xSgkClpDmNOjz9ssX0S8RZfULvNto1AzX2vs1VbXLxE
         UlKGQfrRkB7s/vv2xlyxIEtAby9Y18Wxo0ctVJYM2ou8mwNQrnkB4t1SrUWERJWCkLkJ
         LQVTO3DksQuz0jLAL+XmXTuVj+UhjsFIVogkRJvNbiq+O9JmU/0YayxEy7wb0gKaZeOd
         CP7A==
X-Forwarded-Encrypted: i=1; AJvYcCUAVoShSmGsMLANFO9cLyjW6gX4DcJoN5OOgJwK2dAGUKJOvrYqRXvirzNE96N+qaqfO2mGaOh1uJBaCkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLFay3+1WMzSXLJ2VUWr5VJG4H8kLwCiUaUlJPnNW5sVZ3PK7
	Vnq6/dU2nFDaBOENalUNQ9ckitwP2cAtSMUWn3sgUSuAkjSaknqF6gYfKpGlJPJankYhKZDZyGp
	KKFzlQb5d3pD+AmQ832C8Lt0M2H+37w==
X-Gm-Gg: ASbGncvS9DjgG9nw6YDXU3k9XOr15TL+U6HpEpZUjFbwYKwNqiSjTkfcmk/0hPAJzLz
	KYXqTkY37hhvIOCHOxBe6lNKGoQseRTzG1xBjk2FVtMDttHFjBkLB/8V8NIBuj+tBl1X9EhFVAU
	C5LlzzD+X957W2+/bSgc/Eig==
X-Google-Smtp-Source: AGHT+IE7km9lmSTnSvKTjYLMV92hOJPH1egp7siyKPqBzv3WI9OzYiCidDJet77XUG0vq8DWl2IRaTBKlHCZOCCEGpo=
X-Received: by 2002:a05:6102:1276:b0:4dd:b3cf:880 with SMTP id
 ada2fe7eead31-4ddb3cf1498mr106286137.16.1746666340565; Wed, 07 May 2025
 18:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507060256.78278-1-dev.jain@arm.com> <20250507060256.78278-2-dev.jain@arm.com>
In-Reply-To: <20250507060256.78278-2-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 8 May 2025 13:05:29 +1200
X-Gm-Features: ATxdqUE6npRZCUjSAVz0xnncNeF_TmidG1_jkgEPYgB9rZsFVjbgVIogY_crfUQ
Message-ID: <CAGsJ_4yvS8REg=gef71A1gq37VPcDJY_2nMc3gwmOOcSuaKLiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: Call pointers to ptes as ptep
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org, 
	libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com, 
	anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com, 
	yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com, 
	hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:03=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
> type variables with p. No functional change.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/mremap.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84..0163e02e5aa8 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,8 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>         struct vm_area_struct *vma =3D pmc->old;
>         bool need_clear_uffd_wp =3D vma_has_uffd_without_event_remap(vma)=
;
>         struct mm_struct *mm =3D vma->vm_mm;
> -       pte_t *old_pte, *new_pte, pte;
> +       pte_t *old_ptep, *new_ptep;
> +       pte_t pte;
>         pmd_t dummy_pmdval;
>         spinlock_t *old_ptl, *new_ptl;
>         bool force_flush =3D false;
> @@ -211,8 +212,8 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>          * We don't have to worry about the ordering of src and dst
>          * pte locks because exclusive mmap_lock prevents deadlock.
>          */
> -       old_pte =3D pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> -       if (!old_pte) {
> +       old_ptep =3D pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl)=
;
> +       if (!old_ptep) {
>                 err =3D -EAGAIN;
>                 goto out;
>         }
> @@ -223,10 +224,10 @@ static int move_ptes(struct pagetable_move_control =
*pmc,
>          * mmap_lock, so this new_pte page is stable, so there is no need=
 to get
>          * pmdval and do pmd_same() check.
>          */
> -       new_pte =3D pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dumm=
y_pmdval,
> +       new_ptep =3D pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dum=
my_pmdval,
>                                            &new_ptl);
> -       if (!new_pte) {
> -               pte_unmap_unlock(old_pte, old_ptl);
> +       if (!new_ptep) {
> +               pte_unmap_unlock(old_ptep, old_ptl);
>                 err =3D -EAGAIN;
>                 goto out;
>         }
> @@ -235,12 +236,12 @@ static int move_ptes(struct pagetable_move_control =
*pmc,
>         flush_tlb_batched_pending(vma->vm_mm);
>         arch_enter_lazy_mmu_mode();
>
> -       for (; old_addr < old_end; old_pte++, old_addr +=3D PAGE_SIZE,
> -                                  new_pte++, new_addr +=3D PAGE_SIZE) {
> -               if (pte_none(ptep_get(old_pte)))
> +       for (; old_addr < old_end; old_ptep++, old_addr +=3D PAGE_SIZE,
> +                                  new_ptep++, new_addr +=3D PAGE_SIZE) {
> +               if (pte_none(ptep_get(old_ptep)))
>                         continue;
>
> -               pte =3D ptep_get_and_clear(mm, old_addr, old_pte);
> +               pte =3D ptep_get_and_clear(mm, old_addr, old_ptep);
>                 /*
>                  * If we are remapping a valid PTE, make sure
>                  * to flush TLB before we drop the PTL for the
> @@ -258,7 +259,7 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>                 pte =3D move_soft_dirty_pte(pte);
>
>                 if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -                       pte_clear(mm, new_addr, new_pte);
> +                       pte_clear(mm, new_addr, new_ptep);
>                 else {
>                         if (need_clear_uffd_wp) {
>                                 if (pte_present(pte))
> @@ -266,7 +267,7 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>                                 else if (is_swap_pte(pte))
>                                         pte =3D pte_swp_clear_uffd_wp(pte=
);
>                         }
> -                       set_pte_at(mm, new_addr, new_pte, pte);
> +                       set_pte_at(mm, new_addr, new_ptep, pte);
>                 }
>         }
>
> @@ -275,8 +276,8 @@ static int move_ptes(struct pagetable_move_control *p=
mc,
>                 flush_tlb_range(vma, old_end - len, old_end);
>         if (new_ptl !=3D old_ptl)
>                 spin_unlock(new_ptl);
> -       pte_unmap(new_pte - 1);
> -       pte_unmap_unlock(old_pte - 1, old_ptl);
> +       pte_unmap(new_ptep - 1);
> +       pte_unmap_unlock(old_ptep - 1, old_ptl);
>  out:
>         if (pmc->need_rmap_locks)
>                 drop_rmap_locks(vma);
> --
> 2.30.2
>
