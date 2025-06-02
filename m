Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A1182D0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748903176; cv=none; b=snjpOnvf3q/MOAVZ450mxbGUuqHhrtBkLq+H17BVnXE++MjM1pApI9PCcZAv6i/rgWwoQw0Q79qyGh0NwdvHVJ6GZrtZh4Be/uQHWrvTLab0luoBSZynsS/8W2VG9wMkfRED1JEDre0gC/rnXxbQrpbr+K/HoVkQuGJWidPR0jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748903176; c=relaxed/simple;
	bh=G9ei2MmfipeJrTzyTHJQ7IrpWVOmO09lUXTcfFdf/Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqHEUz0pVCs/V5ZfnV2oDU+pl9Ciilekq0E/vFvxTrjNjwCmQtfD3841bIpNL7x4z9Hn01keZzZA6K0IxPSeL8nqPRHEK98gPDPMJMssCTCi6+LpjMHoOvxbLu+c2sPMUcVan5h8UmRttU51n2tA454OLhE1yQCNQOz4A31wifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SeUPK2st; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SeUPK2st"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1957a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748903172; x=1749507972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggwqhwzY13rsbQ8W0g8A+kQtQsV22cDwzKKigdCvrFI=;
        b=SeUPK2st0xwz2M/FuaiZf7A0gAvgVNa5rF3ejJezh0XqtPLdb4j3VKwSRaYXfiYsEW
         /XGQtZk3q46m1yGKjNowPdVDhpvM97le1PnNU52WShe1zQ7GEqGvdjhEhUtvbXlU2bzC
         FgBLy6uPMAJ1KHSFwP8Hg0BlxLdoR7hh83/rUoctDtBmPlIu+SFxP9/M9B1QRDUCKvI5
         Se1mJKHCYSnZPNfWKthunJQerbyBn8nbPjkAT8M9B1VG3N7tF9OumauATzFXCW8yCNmO
         uVPoGUyiTZGxwwiY48XFvs3T2HpcplYKUFwOOhbPjevpAcTPuKHna1p76/s+E6jJT/hg
         RgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748903172; x=1749507972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggwqhwzY13rsbQ8W0g8A+kQtQsV22cDwzKKigdCvrFI=;
        b=Qxq92td52A8fEe/GJlM+dzWvqaYYwYuefDSKREDwVPrjOwDm42nPXFJl418XB86ChJ
         ajkhNgAgcpizlvZHfd3VsT1InRDNL0oqbaDzRL8/PV3EkAPX99KYQ1RLpdXVyCHfsKTR
         fqCwF1QI7DYq2hTgHGunPvL2ZD6CNaTyzc/XK2ExMKPfnAAWE3to3UJgHN2uyjIAMnfn
         ikpNOZyqcpL/qvbkpICeZlMNZ7WnOtOToduh15/jp0lqWUKfRhR3+b+mBtAIE23RpyNB
         Hm+CO3Db9STWs3LNHxLR8GB2umdsqrK89ZBER0B230B8Ej5xGugKL4YIKEgxKA5Gi8IO
         KVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmaFxsbXZ5ekrUA4fHFlhFQieBnY+BUpEtlWjNeC1GMjiUWDXn9+Y8Y4A1lXtcU/9yQiU8UYZPSO4ePr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbKO5iLWpDXf0B1HDKw+ScPA1FTf7lObyI5cEUigDoYd4jiBn
	1Z1iT7aBCMPnk83yWx81NFO+9w6KjCVufp1i7Hkll7UGl15wDKFHOoUC5oa0+qeY5Qs4Qs8gbQP
	kxi/d1RttYA9MSBqa8B0a65aCVAWcumi1m7sjOHqM
X-Gm-Gg: ASbGnctds6V53ttsJbApDqWM91ZGY98X1RK9ZuVccdTq1h3ajSA4vqSLJDko9qnAK8R
	l1rvR+Xevi+37mfYQUb5dDqvkpVsFXLcJctwZboWYFCR/r+ng/oGfIEFBJ0hK3X1LQwEDPtMP8E
	h9gsxApPIM7NSfmQMZRR7uPj+jU9pvn7lZDoCceBTS0kKrAFPnf2fbHACDumdXO9tggj4BHOm2
X-Google-Smtp-Source: AGHT+IHCnQ6O+FfmJRLdseofJPmCzgnTOWeuU97+sL6MZMGY/8rjDnNzhEvaRbUl6ncHmBQYBdBsTtB7yshO2C9nRuE=
X-Received: by 2002:a05:6402:28a7:b0:601:f23b:a377 with SMTP id
 4fb4d7f45d1cf-606a9542c05mr35408a12.6.1748903172208; Mon, 02 Jun 2025
 15:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 00:25:36 +0200
X-Gm-Features: AX0GCFtxDfnvFRB2WV6vaT1DdceqGi4zxTufCelV1dyvfVZFFDsmjT-keuBn_9k
Message-ID: <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com>
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing, non-vma traversal
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:07=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> The process addresses documentation already contains a great deal of
> information about mmap/VMA locking and page table traversal and
> manipulation.
>
> However it waves it hands about non-VMA traversal. Add a section for this
> and explain the caveats around this kind of traversal.
>
> Additionally, commit 6375e95f381e ("mm: pgtable: reclaim empty PTE page i=
n
> madvise(MADV_DONTNEED)") caused zapping to also free empty PTE page
> tables. Highlight this and reference how this impacts ptdump non-VMA
> traversal of userland mappings.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  Documentation/mm/process_addrs.rst | 58 ++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proces=
s_addrs.rst
> index e6756e78b476..83166c2b47dc 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -303,7 +303,9 @@ There are four key operations typically performed on =
page tables:
>  1. **Traversing** page tables - Simply reading page tables in order to t=
raverse
>     them. This only requires that the VMA is kept stable, so a lock which
>     establishes this suffices for traversal (there are also lockless vari=
ants
> -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> +   which eliminate even this requirement, such as :c:func:`!gup_fast`). =
There is
> +   also a special case of page table traversal for non-VMA regions which=
 we
> +   consider separately below.
>  2. **Installing** page table mappings - Whether creating a new mapping o=
r
>     modifying an existing one in such a way as to change its identity. Th=
is
>     requires that the VMA is kept stable via an mmap or VMA lock (explici=
tly not
> @@ -335,15 +337,14 @@ ahead and perform these operations on page tables (=
though internally, kernel
>  operations that perform writes also acquire internal page table locks to
>  serialise - see the page table implementation detail section for more de=
tails).
>
> +.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim emp=
ty PTE
> +          page in madvise (MADV_DONTNEED)"), we now also free empty PTE =
tables
> +          on zap. This does not change zapping locking requirements.
> +
>  When **installing** page table entries, the mmap or VMA lock must be hel=
d to
>  keep the VMA stable. We explore why this is in the page table locking de=
tails
>  section below.
>
> -.. warning:: Page tables are normally only traversed in regions covered =
by VMAs.
> -             If you want to traverse page tables in areas that might not=
 be
> -             covered by VMAs, heavier locking is required.
> -             See :c:func:`!walk_page_range_novma` for details.
> -
>  **Freeing** page tables is an entirely internal memory management operat=
ion and
>  has special requirements (see the page freeing section below for more de=
tails).
>
> @@ -355,6 +356,47 @@ has special requirements (see the page freeing secti=
on below for more details).
>               from the reverse mappings, but no other VMAs can be permitt=
ed to be
>               accessible and span the specified range.
>
> +Traversing non-VMA page tables
> +------------------------------
> +
> +We've focused above on traversal of page tables belonging to VMAs. It is=
 also
> +possible to traverse page tables which are not represented by VMAs.
> +
> +Primarily this is used to traverse kernel page table mappings. In which =
case one
> +must hold an mmap **read** lock on the :c:macro:`!init_mm` kernel instan=
tiation
> +of the :c:struct:`!struct mm_struct` metadata object, as performed in
> +:c:func:`walk_page_range_novma`.

My understanding is that kernel page tables are walked with no MM
locks held all the time. See for example:

 - vmalloc_to_page()
 - vmap()
 - KASAN's shadow_mapped()
 - apply_to_page_range() called from kasan_populate_vmalloc() or
arm64's set_direct_map_invalid_noflush()

This is possible because kernel-internal page tables are used for
allocations managed by kernel-internal users, and so things like the
lifetimes of page tables can be guaranteed by higher-level logic.
(Like "I own a vmalloc allocation in this range, so the page tables
can't change until I call vfree().")

The one way in which I think this is currently kinda yolo/broken is
that vmap_try_huge_pud() can end up freeing page tables via
pud_free_pmd_page(), while holding no MM locks AFAICS, so that could
race with the ptdump debug logic such that ptdump walks into freed
page tables?

I think the current rules for kernel page tables can be summarized as
"every kernel subsystem can make up its own rules for its regions of
virtual address space", which makes ptdump buggy because it can't
follow the different rules of all subsystems; and we should probably
change the rules to "every kernel subsystem can make up its own rules
except please take the init_mm's mmap lock when you delete page
tables".

> +This is generally sufficient to preclude other page table walkers (exclu=
ding
> +vmalloc regions and memory hot plug) as the intermediate kernel page tab=
les are
> +not usually freed.
> +
> +For cases where they might be then the caller has to acquire the appropr=
iate
> +additional locks.
> +
> +The truly unusual case is the traversal of non-VMA ranges in **userland*=
*
> +ranges.
> +
> +This has only one user - the general page table dumping logic (implement=
ed in
> +:c:macro:`!mm/ptdump.c`) - which seeks to expose all mappings for debug =
purposes
> +even if they are highly unusual (possibly architecture-specific) and are=
 not
> +backed by a VMA.
> +
> +We must take great care in this case, as the :c:func:`!munmap` implement=
ation
> +detaches VMAs under an mmap write lock before tearing down page tables u=
nder a
> +downgraded mmap read lock.
> +
> +This means such an operation could race with this, and thus an mmap **wr=
ite**
> +lock is required.
> +
> +.. warning:: A racing zap operation is problematic if it is performed wi=
thout an
> +            exclusive lock held - since v6.14 and commit 6375e95f381e PT=
Es may
> +            be freed upon zap, so if this occurs the traversal might enc=
ounter
> +            the same issue seen due to :c:func:`!munmap`'s use of a down=
graded
> +            mmap lock.
> +
> +            In this instance, additional appropriate locking is required=
.

(I think we should take all the vma locks in that ptdump code and get
rid of this weird exception instead of documenting it.)
