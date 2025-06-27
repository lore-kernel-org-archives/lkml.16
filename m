Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B3C2DA766
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032698; cv=none; b=MWdINozt5rk1K5H32yGdfzbAutD7vRTeCiuruiGpz74gG3YPPbMCWSCMMfgO4QcJ1YKU4st1JpD5mX8XrG5EQ0bTWfI3vH7zGGne5is8V/igQN9Nl7NRNbMKd4iTxOmq3gDcSjGVbx9QqOg0z1mHBnbTehtJsf6Qx1NoWELK38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032698; c=relaxed/simple;
	bh=b77O1oHzVJc9Ti8JGlDRhvAzjUbmcBSv05XZUCJ8kF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttTVtasXacn/INn+AXaA43egX07p3n0I7/Uh34OrrAnEnmkhWLgIA18lnQryWu0cBUL4IRfrkpptEIj89EXCznZBvr3bDXHPDRbgk+TB3GAyQSep0jkT1+XmOkp/X/zvOPyqMROfbRSQT5UyTZLqZVG44U3cRP9wKzUVLwVyeq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBXs7b6p; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBXs7b6p"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so18543176d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751032695; x=1751637495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPp/ClYZgzM+1U+QFbDcHJs/6imwSQiPcKsdqOO410E=;
        b=JBXs7b6pBy3KS+n2S/t6J7lC7Jv0x8HLm9rZVu47yG7ixEhUGE3FASeXk7uYPbenYA
         Pmh2H6f9jPl3PYMZVUq2bdqK5XSpNDvjcVeBtKHqW2QSqfd1Arff429wWJ0PwA8ipU32
         InX+Gm87P2cFIaTGEsm4OtOPmykIsAAKxZt0/Kib+AUjxvyx4arey2W96wFQMPA+RGVD
         7xEwIJKi8XRU04stNkdhW2tqAbB9w4HVFrDO5v06ySoFijYQfXep4usnkgYNxSMB+siW
         H7+N2ESbaFdJsGynqBDqBidmd7Y3KXP9SjmSwE7NZh6ndJwdfcs605ZLVpa97rr2gHz/
         rkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032695; x=1751637495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPp/ClYZgzM+1U+QFbDcHJs/6imwSQiPcKsdqOO410E=;
        b=vixdxMeWTJ8dChFgrOaAC2KyUqplTP+zXNRynXEDKXFqSh07BHA7hbpmDI8xPHBUNl
         YClPKj+MviCxpAmHEmnzSzf46NRUH5mAAY3MCV3vo7z1EgDzFhhVK4VWb0mvl/cyzsNj
         O90Cqqk4XyK52Xto/VPa/uiECN+gGTBTnxMnpt3wPeFSCyABAs+wbADZfubu/eb3kb18
         qEPKXttuOyM1n8O5NPveKgd0E0azXH0XMO9Wd0yHglG105j/rm8mknfhV/hFjBWoVf0Y
         5w/OyhcDP3OVDw+Lo3dC0XBZgy7YBgg5yEJ45k7p4fxL8JMAafj4JvYWgfePY1gzfD3i
         A8HQ==
X-Gm-Message-State: AOJu0YylEwG0Ty8HH5VQuDOfYq1MDQwmoLLlcuqD438v1LEccv/JBr7+
	D192s3LyRVrpcMlqvv3qxJeIrHqxFTon1L31TjhQIq4PuY5pYaCxjwFW+vcaKUnuNH22wOTra9/
	NnzhjHliyw6TbKgHKq6bBAUJHq7bqYfo=
X-Gm-Gg: ASbGncvGEkVYxqOhbzBTKXp/ha9EE8DcSyjfFpnKDd3Px4+bYHZVwZC5W0Tprb10hRA
	qYauyOoLXF3S1YOQ8qJQ10Q82BH+xV/ZfsMho9xz/50ienV60p9/fH4R0/2MU4C4jLwfYo2fzvG
	m6zPi8eNeVq1iG5TpuTIUPCI7E/aidesQgSUl6IgSPLbZrB3s=
X-Google-Smtp-Source: AGHT+IFpz83flyurGfNPQ8AbMQA21CHaV6uWbep69Uq7TnkmpyxVeWsBqTGWH7RYjX9d4WBpwpvNCs9ZJfQpXumdBHY=
X-Received: by 2002:ad4:5bcf:0:b0:6fb:4caf:5d04 with SMTP id
 6a1803df08f44-700031c6a5bmr53652566d6.45.1751032694524; Fri, 27 Jun 2025
 06:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627115510.3273675-1-david@redhat.com> <20250627115510.3273675-3-david@redhat.com>
In-Reply-To: <20250627115510.3273675-3-david@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 27 Jun 2025 21:58:00 +0800
X-Gm-Features: Ac12FXzXEXO95rUOIhdNLv7ixexjXu4CIZwfTgmr5h-Nl8qkP697ay-q0c7YJ5k
Message-ID: <CABzRoyZKgWm=uQ2FioFyxStH+5z5OenX+BKEbfDQg+1546dsHg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 7:55=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> Let's clean up a bit:
>
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
>
> (2) Let's switch to "unsigned int" for everything
>
> (3) We can simplify the code by leaving the pte unchanged after the
>     pte_same() check.
>
> (4) Clarify that we should never exceed a single VMA; it indicates a
>     problem in the caller.
>
> No functional change intended.

Nice cleanup! Simplifying the loop and removing the temporary variables
makes the code much easier to follow.

Also, clarifying the caller's responsibility to stay within a single VMA
and page table is a nice change ;)

Feel free to add:
Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks,
Lance

>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 37 +++++++++++++++----------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 9690c75063881..ca6590c6d9eab 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -221,7 +221,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t p=
te, fpb_t flags)
>   * folio_pte_batch - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
>   * @addr: The user virtual address the first page is mapped at.
> - * @start_ptep: Page table pointer for the first entry.
> + * @ptep: Page table pointer for the first entry.
>   * @pte: Page table entry for the first page.
>   * @max_nr: The maximum number of table entries to consider.
>   * @flags: Flags to modify the PTE batch semantics.
> @@ -233,24 +233,24 @@ static inline pte_t __pte_batch_clear_ignored(pte_t=
 pte, fpb_t flags)
>   *               first one is dirty.
>   *
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> - * pages of the same large folio.
> + * pages of the same large folio in a single VMA and a single page table=
.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the=
 PFN,
>   * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is =
set) and
>   * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>   *
> - * start_ptep must map any page of the folio. max_nr must be at least on=
e and
> - * must be limited by the caller so scanning cannot exceed a single page=
 table.
> + * @ptep must map any page of the folio. max_nr must be at least one and
> + * must be limited by the caller so scanning cannot exceed a single VMA =
and
> + * a single page table.
>   *
>   * Return: the number of table entries in the batch.
>   */
> -static inline int folio_pte_batch(struct folio *folio, unsigned long add=
r,
> -               pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
> +static inline unsigned int folio_pte_batch(struct folio *folio, unsigned=
 long addr,
> +               pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>                 bool *any_writable, bool *any_young, bool *any_dirty)
>  {
> -       pte_t expected_pte, *ptep;
> -       bool writable, young, dirty;
> -       int nr, cur_nr;
> +       unsigned int nr, cur_nr;
> +       pte_t expected_pte;
>
>         if (any_writable)
>                 *any_writable =3D false;
> @@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *fol=
io, unsigned long addr,
>         max_nr =3D min_t(unsigned long, max_nr,
>                        folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn=
(pte));
>
> -       nr =3D pte_batch_hint(start_ptep, pte);
> +       nr =3D pte_batch_hint(ptep, pte);
>         expected_pte =3D __pte_batch_clear_ignored(pte_advance_pfn(pte, n=
r), flags);
> -       ptep =3D start_ptep + nr;
> +       ptep =3D ptep + nr;
>
>         while (nr < max_nr) {
>                 pte =3D ptep_get(ptep);
> -               if (any_writable)
> -                       writable =3D !!pte_write(pte);
> -               if (any_young)
> -                       young =3D !!pte_young(pte);
> -               if (any_dirty)
> -                       dirty =3D !!pte_dirty(pte);
> -               pte =3D __pte_batch_clear_ignored(pte, flags);
>
> -               if (!pte_same(pte, expected_pte))
> +               if (!pte_same(__pte_batch_clear_ignored(pte, flags), expe=
cted_pte))
>                         break;
>
>                 if (any_writable)
> -                       *any_writable |=3D writable;
> +                       *any_writable |=3D pte_write(pte);
>                 if (any_young)
> -                       *any_young |=3D young;
> +                       *any_young |=3D pte_young(pte);
>                 if (any_dirty)
> -                       *any_dirty |=3D dirty;
> +                       *any_dirty |=3D pte_dirty(pte);
>
>                 cur_nr =3D pte_batch_hint(ptep, pte);
>                 expected_pte =3D pte_advance_pfn(expected_pte, cur_nr);
> --
> 2.49.0
>
>
