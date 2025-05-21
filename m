Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95616320B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747787940; cv=none; b=MySEDvFLaQKUb7HzHXkHbgznMVjVi3gZgRqHt2tkE4xiC2N0I9xzls44BDOa58R9QbVBBxTNLMZ8cl+IYiaN50suNTJXRxENeF4uEX8K1tGbR4clq2q8aEMkjpBnyEfJOY8WVQju6lhpimSlYIrEw1QQYwD8u0mdeGVdVTrWer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747787940; c=relaxed/simple;
	bh=U7WreOu0RES9FDjcTDjDH14RGJFWK8lQsifbrWQtRVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qwq81ckDjyEyV2NEl+WRynvIJWLlkkxo1kvaayNjk1G4VDhmGeby+W0DzSOc5Zz+NVXB464lHUynf6E5+TOsqvasSCXpcJyCV/Lw8+ogO7IpGwF5QCG0Mls0sRRngutofkD7xMAiYidAKEqSzWoP4Cc2hjGDntZxfwd3yDe8Zyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l3FHKiDM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l3FHKiDM"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so26629a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747787937; x=1748392737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WspCal8y8NZa4tDmuGWQBUOazVn+kNd9Xx/2Q+XoBxI=;
        b=l3FHKiDMgU03tZ3CjADdwiVBBlpWwxcCNxQDPtgaVJ1hLG4RzwjOUWHLT0G5yFwP32
         77FJgAXhgG1vsOlFEnIP3fk78kT7S+Irh0Bj1czpGVXvUdbMKY1Sfyw+0Kzdw2aqerzT
         Gd6hNYWYrkS5Lfi071mOZVzqdOHbh8dTzXwrhQLwFISK2y/losuh4vkNHV66RtANTpPM
         QA63Yqquan6H5LSY+GacPN+U3y5zLqJ84h5c/ip3GOOByhwbg398ecZf7XKEPEMUJlKE
         uh3k092eh8+R+eYEKejLrSsLjRpcbEE5BnMOVYuMvUiYAz1ZbmaOIXUtZH/teXy/5tpC
         /oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747787937; x=1748392737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WspCal8y8NZa4tDmuGWQBUOazVn+kNd9Xx/2Q+XoBxI=;
        b=WQg0qg1bzEpt2sL4H5jzuUGJK7RpdxcVM6rQyRN5+uUGWSYLFOA3osniwvqyyJndDD
         nd68IlvME8q7IZrzq9YZPvs9lPfn4t9w1N3I01FvCe4PAaseXlIhRmOseYzJnp/6LtNr
         DupF/zKp7Uv5qR0qQXVMGdcK6Q5L/MMN58VyX+aN/nHIJnVYSUNEBi46S+9/npKrRGHF
         WT2dE5Xjze3w4y1rOVpbkAcLyBXAyJY+eusWqfReV22jPKSR3x9uV+zxQqgF5uW7xK/M
         5wSkrpj+UCKkFlFzpIeXRaL7HGG1ofmz/AqtRutatHAf5rIPJEPvdbMMes8ynDwUm64b
         vvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8AdA4Z6ZWrmr/ci9i+tRAwc0+iYTGDyGR96g22xVb1/rCJhZxXedWEkLJ8vWjoaaCHgYQ9d8ykwFOYs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iuZ0xOuMeDTFz96AZCVoa0gngKHzpKQuAWTc6n/Vv7THxlaK
	htXMDxvreuXpcJP91670m1wlj5MADIDS4YUzuNsrgQ8/yNT7JIfJLE79WEIrQMF6JigVMZSsUML
	xdNqTvwSTo77dQ7uR+lZ4BIyNxh681zZ7tVKPXc2L
X-Gm-Gg: ASbGncvH6t9ztyCpK+s9yRICJeCaC3WRipgZf2OEEIHVocM9J8s9JDDkMC5dndH7iGh
	X3D9PUkc66dMQ6JPJUV5B8nLxa1rzLKeVnlSs53tk0xbvy1I2whbt+MpchgYEiLEyw7OYlhIDwS
	nh6PvSeWQHut+Mh7B+Q2lmZ0vms/DcoY5E2VIjvSKBgRQP3d0AyYs74lv5TdICNnYUX2zUuZhx
X-Google-Smtp-Source: AGHT+IFGzg1HiyU3iSRyJlcEH+h760Pi+n2Y93HX/OapY6BeDZU3wPr7AjpuGUN09T84tbsasqjEUyHQjDZU2RrY0WM=
X-Received: by 2002:a05:6402:14d5:b0:601:233a:4f4d with SMTP id
 4fb4d7f45d1cf-6019bf2f776mr369506a12.2.1747787936630; Tue, 20 May 2025
 17:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520214813.3946964-1-roman.gushchin@linux.dev>
In-Reply-To: <20250520214813.3946964-1-roman.gushchin@linux.dev>
From: Jann Horn <jannh@google.com>
Date: Wed, 21 May 2025 02:38:20 +0200
X-Gm-Features: AX0GCFu94sdnWGHTjJDGScJi6wHq5LLBJs6G1BkmzL4E483Bo3JMeYGYzyLmFEI
Message-ID: <CAG48ez39SaJe=cwq3JZ6UM0BLMHEj76Kdmd9=Ho1nr17fAco6Q@mail.gmail.com>
Subject: Re: [PATCH v5] mmu_gather: move tlb flush for VM_PFNMAP/VM_MIXEDMAP
 vmas into free_pgtables()
To: Roman Gushchin <roman.gushchin@linux.dev>, Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:50=E2=80=AFPM Roman Gushchin
<roman.gushchin@linux.dev> wrote:
> Commit b67fbebd4cf9 ("mmu_gather: Force tlb-flush VM_PFNMAP vmas")
> added a forced tlbflush to tlb_vma_end(), which is required to avoid a
> race between munmap() and unmap_mapping_range(). However it added some
> overhead to other paths where tlb_vma_end() is used, but vmas are not
> removed, e.g. madvise(MADV_DONTNEED).
>
> Fix this by moving the tlb flush out of tlb_end_vma() into new
> tlb_flush_vmas() called from free_pgtables(), somewhat similar to the
> stable version of the original commit:
> commit 895428ee124a ("mm: Force TLB flush for PFNMAP mappings before
> unlink_file_vma()").
>
> Note, that if tlb->fullmm is set, no flush is required, as the whole
> mm is about to be destroyed.
>
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Jann Horn <jannh@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nick Piggin <npiggin@gmail.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
>
> ---
> v5:
>   - tlb_free_vma() -> tlb_free_vmas() to avoid extra checks
>
> v4:
>   - naming/comments update (by Peter Z.)
>   - check vma->vma->vm_flags in tlb_free_vma() (by Peter Z.)
>
> v3:
>   - added initialization of vma_pfn in __tlb_reset_range() (by Hugh D.)
>
> v2:
>   - moved vma_pfn flag handling into tlb.h (by Peter Z.)
>   - added comments (by Peter Z.)
>   - fixed the vma_pfn flag setting (by Hugh D.)
> ---
>  include/asm-generic/tlb.h | 49 +++++++++++++++++++++++++++++++--------
>  mm/memory.c               |  2 ++
>  2 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 88a42973fa47..8a8b9535a930 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -58,6 +58,11 @@
>   *    Defaults to flushing at tlb_end_vma() to reset the range; helps wh=
en
>   *    there's large holes between the VMAs.
>   *
> + *  - tlb_free_vmas()
> + *
> + *    tlb_free_vmas() marks the start of unlinking of one or more vmas
> + *    and freeing page-tables.
> + *
>   *  - tlb_remove_table()
>   *
>   *    tlb_remove_table() is the basic primitive to free page-table direc=
tories
> @@ -399,7 +404,10 @@ static inline void __tlb_reset_range(struct mmu_gath=
er *tlb)
>          * Do not reset mmu_gather::vma_* fields here, we do not
>          * call into tlb_start_vma() again to set them if there is an
>          * intermediate flush.
> +        *
> +        * Except for vma_pfn, that only cares if there's pending TLBI.
>          */
> +       tlb->vma_pfn =3D 0;

This looks dodgy to me. Can you explain here in more detail why this
is okay? Looking at current mainline, tlb->vma_pfn is only set to 1
when tlb_start_vma() calls into tlb_update_vma_flags(); it is never
set again after tlb_start_vma(), so I don't think it's legal to just
clear it in the middle of a VMA.

If we had something like this callgraph on a VM_MIXEDMAP mapping, with
an intermediate TLB flush in the middle of the VM_MIXEDMAP mapping:

tlb_start_vma()
  [sets tlb->vma_pfn]
zap_pte_range
  tlb_flush_mmu_tlbonly
    __tlb_reset_range
      [clears tlb->vma_pfn]
zap_pte_range
  [zaps more PTEs and queues a pending TLB flush]
tlb_end_vma()
free_pgtables
  tlb_free_vmas
    [checks for tlb->vma_pfn]

then tlb_free_vmas() will erroneously not do a flush when it should've
done one, right?

Why does it even matter to you whether tlb->vma_pfn ever gets reset? I
think more or less at worst you do one extra TLB flush in some case
involving a munmap() across multiple VMAs including a mix of
VM_PFNMAP/VM_MIXEDMAP and non-VM_PFNMAP/VM_MIXEDMAP VMAs (which is
already a fairly weird scenario on its own), with the region being
operated on large enough or complicated enough that you already did at
least one TLB flush, and the unmap sufficiently large or with
sufficient address space around it that page tables are getting freed,
or something like that? That seems like a scenario in which one more
flush isn't going to be a big deal.

If you wanted to do this properly, I think you could do something like:

 - add another flag tlb->current_vma_pfn that tracks whether the
current vma is pfnmap/mixedmap
 - reset tlb->vma_pfn on TLB flush
 - set tlb->vma_pfn again if a TLB flush is enqueued while
tlb->current_vma_pfn is true

But that seems way too complicated, so I would just delete these three
lines from the patch.
