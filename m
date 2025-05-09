Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60841145FE0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755389; cv=none; b=LKczgUUTfboGgVrCa1BhJk8mbwu+cBJoF6pPyBrI8/nvwS3Ko90t1sV1gc9O4ePFLtUi6xv9P5VkYIoCp/4twfSfhDp55fwbAPWTpYwIzrcBMLe8VMmjORPU17ybkeQGsxnBCJTsqXxDINDKNl4r2lVNk8VUurxCV1R1M3u4J5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755389; c=relaxed/simple;
	bh=typg08yihAOg3+hBi4KO7/jhOAzdDaEG+sgxsJvoqY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV3zIJc0BXylCvjctEvum7rMEHBZ6ahWASVb3L6V8s8RZeqXxViE5p8rU75BETz7EEPjxAuZNMBDXPrZdRTLH4t4D1hZS/I1YAzybjG4Yrn8qhFWdTzN7kuTIPfdL0Ft6CjHd/ugtifaUgW4jEWIVvUMyEiCYbx16Hpkb83c46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbfzbuVT; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbfzbuVT"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ddac386a29so583213137.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 18:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746755386; x=1747360186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQt1rwY4PFbf8h+PqozLqumguYfEWib8McIXdx3bUa8=;
        b=SbfzbuVTDqlJz9nm5twbs58MtPVV/s98RKXx6pOg2b+xGJcMKLo7KD/KF9f6PmbKeD
         o12ITmyhg0jf1MWMPbIXzT/AjxS/nxbWY5jEWjAO3BzLrED8QSdKB27lfMRDR5StGfPe
         Rgz0gdi5wqLYLs5B79kuw9SSipn8bKN8mwFcTDasT9IUZUKkOG3/z7/oUIkPnVoZh7z1
         ijSjfePCYgCrHhYWCckBkSgTQeXqSWINuOJdLl+NHH63B7O3HfN8DyJE5wSE6+dtIihF
         lM+7g2u/HVcu0Jc/gXOnAN4WnzPj8ApnsVH5nA7ZgtJkOQGAtmYoX+N8gTieleuhIOg9
         o2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746755386; x=1747360186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQt1rwY4PFbf8h+PqozLqumguYfEWib8McIXdx3bUa8=;
        b=kjyoza2RZuPfJ5Rzi3Ib0BT6/2ecyBG9GbuLKDF5JGFzrgsRnrxtWJITjqK7ElX2Wt
         Ag/8P1Zd1ynEYunW90GRmFYbZQz6ZYzm1TGRJ4XykvtnDeEUTaQu64OvVyzYOUxpzrXf
         YkVakNDW/eH2wSnXckCtrUKk+CFL4qND0eKYM3tne9KSgkY4Oa7xs+hNTT10pob0j600
         JBcT3wAWAg1Vxxo1HFiZPeMTn4hBNlN6YZo7+MipNGcgLyOvZBZ3iFGrKx5yRFYIYqwt
         Z7ajsVVrntsJ6sKCTT/nSS5NDygi03/Qb1wAW2Ya/1qOATOt9Tp+UjpGAxIBQhWcYMHu
         JcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNxUYdCzaEoj3w3m6A2D0wCu1wB0N2UCcCL14RWmx1A6sxZasRJvcwAS0wEulDoeP6/K5Ouu7vHCLhjes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzCsZWsC5JLHsLrf+snpfphHsollHekFBXS9AHdgSVTV0+tWJ
	mXi5YMG6YYFHcRWyv6NHHJaNDYz47FwksfnAZ7lMDqdytnP/r9/N+LUskRGLS/VPgeMpzW5jGt+
	BQOgoqlLN5pk0nkgjQUaOIKtlcwUE7w==
X-Gm-Gg: ASbGncuY5NjgPXK736Ts9iR/9MTG3+OGPvPsJWNXOE8VDW48wQhoXcLeZyxGvb4ikWW
	vk96i0QU2m3jHkdGlpAAzpBE9U6wUWWohAVFhCj8pXDwZWiKqkrWk6or2DScjz24f0PHvJyg03J
	ayf7UFP8lXJAkw4tlLfpJqug==
X-Google-Smtp-Source: AGHT+IGHgO3CwnsYQdmBlOCEoBZ9NfbDHGjySYoPcsUOR9lgnJEUUZYla5RWiyZFqecWW3cjtAO720t2pDTj9gZ3pVw=
X-Received: by 2002:a05:6102:919:b0:4dd:ad20:a333 with SMTP id
 ada2fe7eead31-4deed3588ddmr1438927137.10.1746755386098; Thu, 08 May 2025
 18:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 13:49:35 +1200
X-Gm-Features: AX0GCFs6pvJ9hATtVh9T0ceY_VjmRD6FtNEjr5sgU-0RHAyKZmp_LNouCCvyxeY
Message-ID: <CAGsJ_4wydRHkt07YgxM-AETv=-Y5kXS+acnZvacos7C99c-ieg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:45=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> When I tested the mincore() syscall, I observed that it takes longer with
> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range(=
)
> still checks each PTE individually, even when the PTEs are contiguous,
> which is not efficient.
>
> Thus we can use pte_batch_hint() to get the batch number of the present
> contiguous PTEs, which can improve the performance. I tested the mincore(=
)
> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
> obvious performance improvement:
>
> w/o patch               w/ patch                changes
> 6022us                  549us                   +91%
>
> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
> see any obvious regression for base pages.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
> Changes from v2:
> - Re-calculate the max_nr, per Barry.
> Changes from v1:
> - Change to use pte_batch_hint() to get the batch number, per Ryan.
>
> Note: I observed the min_t() can introduce a slight performance regressio=
n
> for base pages, so I change to add a batch size check for base pages,
> which can resolve the performance regression issue.
> ---
>  mm/mincore.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/mm/mincore.c b/mm/mincore.c
> index 832f29f46767..42d6c9c8da86 100644
> --- a/mm/mincore.c
> +++ b/mm/mincore.c
> @@ -21,6 +21,7 @@
>
>  #include <linux/uaccess.h>
>  #include "swap.h"
> +#include "internal.h"
>
>  static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned lon=
g addr,
>                         unsigned long end, struct mm_walk *walk)
> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned lon=
g addr, unsigned long end,
>         pte_t *ptep;
>         unsigned char *vec =3D walk->private;
>         int nr =3D (end - addr) >> PAGE_SHIFT;
> +       int step, i;
>
>         ptl =3D pmd_trans_huge_lock(pmd, vma);
>         if (ptl) {
> @@ -118,16 +120,26 @@ static int mincore_pte_range(pmd_t *pmd, unsigned l=
ong addr, unsigned long end,
>                 walk->action =3D ACTION_AGAIN;
>                 return 0;
>         }
> -       for (; addr !=3D end; ptep++, addr +=3D PAGE_SIZE) {
> +       for (; addr !=3D end; ptep +=3D step, addr +=3D step * PAGE_SIZE)=
 {
>                 pte_t pte =3D ptep_get(ptep);
>
> +               step =3D 1;
>                 /* We need to do cache lookup too for pte markers */
>                 if (pte_none_mostly(pte))
>                         __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>                                                  vma, vec);
> -               else if (pte_present(pte))
> -                       *vec =3D 1;
> -               else { /* pte is a swap entry */
> +               else if (pte_present(pte)) {
> +                       unsigned int batch =3D pte_batch_hint(ptep, pte);
> +
> +                       if (batch > 1) {
> +                               unsigned int max_nr =3D (end - addr) >> P=
AGE_SHIFT;
> +
> +                               step =3D min_t(unsigned int, batch, max_n=
r);
> +                       }
> +
> +                       for (i =3D 0; i < step; i++)
> +                               vec[i] =3D 1;
> +               } else { /* pte is a swap entry */
>                         swp_entry_t entry =3D pte_to_swp_entry(pte);
>
>                         if (non_swap_entry(entry)) {
> @@ -146,7 +158,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned lon=
g addr, unsigned long end,
>  #endif
>                         }
>                 }
> -               vec++;
> +               vec +=3D step;
>         }
>         pte_unmap_unlock(ptep - 1, ptl);
>  out:
> --
> 2.43.5
>
