Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45083219A70
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614030; cv=none; b=goa0AUEkunXW5cljW5y3R9sbt5XdIo7eOllwTVFTfa69RWImTj5V6gWvbs9ioLntHAJVy+Fufk4rJ8V3zluD6xpw1hjznE4K+dgBlkf40jt59R9BU22F4dpJ+PiSjN3TOX5HVyZPV9MOADPODoouQjr4ZFOe2qxkVfcutI2ME7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614030; c=relaxed/simple;
	bh=49lOEawzcUUc3zewKrlMDEFeUWHJyq7OcN3B9QMeBkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m81q75jM+Y1Z0L/usacOM0itW9IYcvSZj8mqpp5rrNm5tPv28ANjnR4GAxeVP4i6TkIV74wSueFzIrouBoRPSsV/kUjcvBe/BOnpu65KE77aSMEsW9QhDE58a/iejH8cx65BwObr8FVmuprbQ1G8VxXfPnZIWxVVPalbe9fBpGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kd8tIRHX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kd8tIRHX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso10464a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748614026; x=1749218826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b+svQCcwpPh21cJ0DTZTXgTj5OzFaHmSN48KWEm3Y8=;
        b=Kd8tIRHXUyTSjhSsDl0G2wqQ/KlykakC89KwguUPsqxtD5jy6JJaBvma9NCMJOsMDG
         pBqFnE+sMNRShOByMuzgj2/pVk/1FrDtUfBaAfL3w6lETas7QGemom7AsuKZi4zeuTC3
         +nhesnDsj9g2Ccm4Fo+uayzRNlIrX/PS78A5I7i79mcJDD/E7NtsyvBHIW42GLYoeD4f
         NTlLzzd8a7Cve4k5iM+Z4rqjaqJbK8I2u6hdWAEHXJpb2OSxKpNGiZVqEIcqrkrw1GDw
         ookDr7IOdzqOtDKr9Hjelf7Ov/WCI8EFvVpwPzKP/hTGLTWE46r8QmlFkal7gbT45jQ/
         wl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748614026; x=1749218826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b+svQCcwpPh21cJ0DTZTXgTj5OzFaHmSN48KWEm3Y8=;
        b=YsKyFAQilXDSg9M5UC7xpa4I4gtuzk+PibHGz7+dSXxbH+Safbp8kulPvDTgTv7xMV
         nEMau/PE0uGRS0bf/Lapueiyv3YSnnirDeWVcEOSSgV3lxFOp4BKGjxyawHjrMzX/A73
         pG3H45JxJ325v0Gx8RC0iHgWxR5rtnANoTtuqOnAEXKJIIsBR99GAWzFeEvLWk1zDjyy
         fGnZKIbp2YBm8rvqzHANQQ8d8sg8BboBNsbqsOSctREe5vPxmbIbnXCmmdRp/AqMd//A
         Gdj55cH7fWfPx3JVg7I0WkQ81ixiMu5PsKP8iR56zdjgHH+mNG0wLkKG4c5yBpABkTQy
         ujCw==
X-Forwarded-Encrypted: i=1; AJvYcCVWVr+OJ9ns1ekueN0B+35iYfJzBbCSLgna6/MYjOoIJCMdppf0CsysuzuRtTOHpBu8TSoUcHLN6wQgjE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkiw57OuQRSVYG0myiJHsyXRcj5oq4a0gTI+k4JVg8BXbcE4H
	SPR9dUBo3M750UJQdulH8l96pd7NcT6zMMwep/5zsj4OWizpyjcqDXHiAW1e4qvPhsKg0wjQLNa
	WM2cGGTBjvKMGEa5aYojKN1+5SnG74ccS1XCcJwo+
X-Gm-Gg: ASbGncvnp3Wdl2DPc8IOz2NorDTcgIJ4Aq88I2XfbGGcDG0JpDzDTagiu+iqrVe0mmx
	WSAE0hhL3IQyzrTCz/+fD+42TeeHwFPweeb3ktPqBSralPs+25IfAr6usBc2b2LumWfCLt4bePt
	RT2vvyiW3TYG0onatQW/OMb4Mlf06vTXYElZDM9oRpPczMSr8eIW1SZl6ceT3pzqaB/I88Hvg=
X-Google-Smtp-Source: AGHT+IE4YAi11hEi/4MOex5qEodbZ0TPqICUbKDdoy137I4/cykm5Z8Vupf8nfwF8GzVY//VBVDuEEYMCVJS/dCxR7Y=
X-Received: by 2002:aa7:d687:0:b0:5fc:e6a6:6a34 with SMTP id
 4fb4d7f45d1cf-60571ab2164mr87893a12.6.1748614026146; Fri, 30 May 2025
 07:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com>
In-Reply-To: <20250530104439.64841-1-21cnbao@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 16:06:30 +0200
X-Gm-Features: AX0GCFvQX5C4zRFBSQKL2uP3abQCAg94yDHvhFqKytoCuqknnCNmM3qglgTUqDA
Message-ID: <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
> Certain madvise operations, especially MADV_DONTNEED, occur far more
> frequently than other madvise options, particularly in native and Java
> heaps for dynamic memory management.
>
> Currently, the mmap_lock is always held during these operations, even whe=
n
> unnecessary. This causes lock contention and can lead to severe priority
> inversion, where low-priority threads=E2=80=94such as Android's HeapTaskD=
aemon=E2=80=94
> hold the lock and block higher-priority threads.
>
> This patch enables the use of per-VMA locks when the advised range lies
> entirely within a single VMA, avoiding the need for full VMA traversal. I=
n
> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs=
.
>
> Tangquan=E2=80=99s testing shows that over 99.5% of memory reclaimed by A=
ndroid
> benefits from this per-VMA lock optimization. After extended runtime,
> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> only 1,231 fell back to mmap_lock.
>
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity o=
f
> userfaultfd_remove().

One important quirk of this is that it can, from what I can see, cause
freeing of page tables (through pt_reclaim) without holding the mmap
lock at all:

do_madvise [behavior=3DMADV_DONTNEED]
  madvise_lock
    lock_vma_under_rcu
  madvise_do_behavior
    madvise_single_locked_vma
      madvise_vma_behavior
        madvise_dontneed_free
          madvise_dontneed_single_vma
            zap_page_range_single_batched [.reclaim_pt =3D true]
              unmap_single_vma
                unmap_page_range
                  zap_p4d_range
                    zap_pud_range
                      zap_pmd_range
                        zap_pte_range
                          try_get_and_clear_pmd
                          free_pte

This clashes with the assumption in walk_page_range_novma() that
holding the mmap lock in write mode is sufficient to prevent
concurrent page table freeing, so it can probably lead to page table
UAF through the ptdump interface (see ptdump_walk_pgd()).

I think before this patch can land, you'll have to introduce some new
helper like:

void mmap_write_lock_with_all_vmas(struct mm_struct *mm)
{
  mmap_write_lock(mm);
  for_each_vma(vmi, vma)
    vma_start_write(vma);
}

and use that in walk_page_range_novma() for user virtual address space
walks, and update the comment in there.

> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
[...]
> +static void madvise_unlock(struct mm_struct *mm,
> +               struct madvise_behavior *madv_behavior)
> +{
> +       if (madv_behavior->vma)
> +               vma_end_read(madv_behavior->vma);

Please set madv_behavior->vma to NULL here, so that if madvise_lock()
was called on madv_behavior again and decided to take the mmap lock
that time, the next madvise_unlock() wouldn't take the wrong branch
here.

> +       else
> +               __madvise_unlock(mm, madv_behavior->behavior);
> +}
> +
>  static bool madvise_batch_tlb_flush(int behavior)
>  {
>         switch (behavior) {
> @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_struct *=
mm,
>                 unsigned long start, size_t len_in,
>                 struct madvise_behavior *madv_behavior)
>  {
> +       struct vm_area_struct *vma =3D madv_behavior->vma;
>         int behavior =3D madv_behavior->behavior;
> +
>         struct blk_plug plug;
>         unsigned long end;
>         int error;
>
>         if (is_memory_failure(behavior))
>                 return madvise_inject_error(behavior, start, start + len_=
in);
> -       start =3D untagged_addr_remote(mm, start);
> +       start =3D untagged_addr(start);

Why is this okay? I see that X86's untagged_addr_remote() asserts that
the mmap lock is held, which is no longer the case here with your
patch, but untagged_addr() seems wrong here, since we can be operating
on another process. I think especially on X86 with 5-level paging and
LAM, there can probably be cases where address bits are used for part
of the virtual address in one task while they need to be masked off in
another task?

I wonder if you'll have to refactor X86 and Risc-V first to make this
work... ideally by making sure that their address tagging state
updates are atomic and untagged_area_remote() works locklessly.

(Or you could try to use something like the
mmap_write_lock_with_all_vmas() I proposed above for synchronizing
against untagged_addr(), first write-lock the MM and then write-lock
all VMAs in it...)

>         end =3D start + PAGE_ALIGN(len_in);
>
>         blk_start_plug(&plug);
>         if (is_madvise_populate(behavior))
>                 error =3D madvise_populate(mm, start, end, behavior);
> +       else if (vma)
> +               error =3D madvise_single_locked_vma(vma, start, end,
> +                               madv_behavior, madvise_vma_behavior);
>         else
>                 error =3D madvise_walk_vmas(mm, start, end, madv_behavior=
,
>                                           madvise_vma_behavior);
> @@ -1847,7 +1908,7 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>
>         total_len =3D iov_iter_count(iter);
>
> -       ret =3D madvise_lock(mm, behavior);
> +       ret =3D __madvise_lock(mm, behavior);
>         if (ret)
>                 return ret;
>         madvise_init_tlb(&madv_behavior, mm);

(I think Lorenzo was saying that he would like madvise_lock() to also
be used in vector_madvise()? But I'll let him comment on that.)
