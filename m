Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D8195FE8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690192; cv=none; b=rAfPQ2CFFlaIkRcez4S7D1hxAGDvbo/RqaKBKl9zCAeBO0IlyX9XUFKvCHgD1aIuFhKnqQpUGPIPp4GQzaKY6YvFeZLiz2ksWBpZ3a40z/tuYo7eN412XJ6XKfTtPH952W996a91for07ZH9eNh+qaTy/dArkL5vHgdM6oDEURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690192; c=relaxed/simple;
	bh=TBBFZTMlODgXtoBuDYQZVQz4zetWAVb7VUqV0hyrOog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h79HUgFdmKbN1mqA/v3auUz6kcFGemcw9GCBaBVdgTk/dMhzGvzmIg/1Qfj3nNd/Dl7Br+9eLkUOuBK1Y+2lSE+Z+sH3Z65XdKEuzZRGNoLRsS8CA4iHSgZkJSdPO6f3Bhb8YTQ6TdNi6NRkoomqASYhX3p/TsLWDLvb9VEC4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaujTMY1; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaujTMY1"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso532811e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690189; x=1747294989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5+KEBtT2aBtAcU9qUPvo+iC2dk60rp413TigGZQUQQ=;
        b=FaujTMY12nrUvnXEwimeO+FHIeUlDO1B+x9YBmcUh1IAkmh0dRSMKstf9j3gM75MjT
         a6iLdMZzElTL746/dK2zOdisGIwUGQLu5p4ACA4MMT/SOZXO78ODRbZGRG1awLX3T4Dc
         njMp4qaKy+Tah9+i6BWWHmuWS+Yx28glelIpthb+QwCJ+6ExESokQx+nLdtCYr5PnEID
         bACl0vks6ko2NELh96RoivfGareltyVv375o4FSaRtcH0F7J7swz9UHcls/wtCjTbdly
         EgMxrvmYwD9H3TXA9PHe3fqIKyUrRB4Ox0bgSh1wc8FbIInt+fDKWQWGJNzYUoYA0K/0
         z0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690189; x=1747294989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5+KEBtT2aBtAcU9qUPvo+iC2dk60rp413TigGZQUQQ=;
        b=O5JamUy4wBWpqKquIcnqkeSJ92BoPxN5P5nLO6eIr7rUhFvf0U1Kzgn7On7XbWIIvI
         PUwnlbozsGvrRexCiBsAczdhYpkGHP2erlRZgSOdKEDuSeHLbOXgfpufCFh738RUOjLx
         Carzd1Mu5aAxS29hihauPPebSawGrHljoZ9ICegp6VjxFb0B/B5v5mW1l8JyHxj5GgP/
         4vbPvIU6f179Xd4ECefhpI7kb0X9tMZ7R0T2TlWKMg8ZpTB8JiafirqMQ8Q9Ks0JywEb
         idasrwnMqJ4cTkx48KWVoV4APNOBykXFjFWI2Q2rBTmjA9T+nJf+dffWwrvyk7hpK+z0
         +wew==
X-Forwarded-Encrypted: i=1; AJvYcCVv9SQ1khqJCb8xxJKHH36ojTWgJoCwEWOCynnhvSWeoWMKidnI1MnIGfHyfiN04D6F6T5ao91RCWnDy4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNYiVev5N6Llc1tZorSAlK4oqJVDLzectRm7XQ5LRFRLq+PXr
	ApfoM8ATF8Mswg8v5x8wF2Vlo881dcKWHzitl1DMe/ubn/Y2r1AsNT9xtggaMon4Y6ugoBFpDzK
	8c2isDzZhFzlGVYKnifepbUHi/7E=
X-Gm-Gg: ASbGncsfNK/GhHcJVr7NKHavQgEMwYVGG634MYrcJ+uOXt3WsAfcDXphUfxx64ihz/2
	18pGonLdINWGr1VC2B80z4DNa6c2oK5zmgax7X3gtzgwSg4tu68qxKvFjIhhFBJeDJI77UbaAZC
	aLqNVpbF1BMi3lTGXuco23Mg==
X-Google-Smtp-Source: AGHT+IF7FWWXPxXOzLHYQKMnXVAoo5udvCIuu3X6taFvK22+XbMCcckbKjoLMt4SURdp+f1isPMZgS+Ysji5V4+Nfl0=
X-Received: by 2002:a05:6122:1e06:b0:529:1a6a:cc2f with SMTP id
 71dfb90a1353d-52c37a8bcd2mr4989998e0c.7.1746690189473; Thu, 08 May 2025
 00:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e89f3af69104c18e45362c6c48058edd2bddf501.1746677237.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <e89f3af69104c18e45362c6c48058edd2bddf501.1746677237.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 8 May 2025 19:42:58 +1200
X-Gm-Features: ATxdqUFV5fNeTsnqzRFZ9aw0PQBuboIh4qamDRWp2kWChzFg5jO55dnGwi3pWkE
Message-ID: <CAGsJ_4wKCpDi7ov0rx4C=rfi90nSGQrDx=4JyKgug4NXC4cYgQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 4:09=E2=80=AFPM Baolin Wang
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
> ---
> Changes from v1:
>  - Change to use pte_batch_hint() to get the batch number, per Ryan.
>
> Note: I observed the min_t() can introduce a slight performance regressio=
n
> for base pages, so I change to add a batch size check for base pages,
> which can resolve the performance regression issue.
> ---
>  mm/mincore.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/mm/mincore.c b/mm/mincore.c
> index 832f29f46767..2e6a9123305e 100644
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
> @@ -118,16 +120,23 @@ static int mincore_pte_range(pmd_t *pmd, unsigned l=
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
> +                       if (batch > 1)
> +                               step =3D min_t(unsigned int, batch, nr);

Not quite sure if nr should be (end - addr) / PAGE_SIZE as nr
is always the initial value. For example, nr =3D 50, and we have
scanned 48 PTEs, then we have 2 ptes left. No?

> +
> +                       for (i =3D 0; i < step; i++)
> +                               vec[i] =3D 1;
> +               } else { /* pte is a swap entry */
>                         swp_entry_t entry =3D pte_to_swp_entry(pte);
>
>                         if (non_swap_entry(entry)) {
> @@ -146,7 +155,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned lon=
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

Thanks
Barry
