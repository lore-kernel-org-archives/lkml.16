Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF91C1EEA5D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272865; cv=none; b=alJTX15w82CZI/iy5c8sM4q+M4OWSForbumEBggZzZf6lmcjSH8oyu0T1Xop72UG+QNKvxH+PSe5Ls6nV5qSMn4mQpxedzOxfQGuoa8gAbpt5KTjAeZOJQx5zqck+pLQxBdvREkB0VmtxAqurTiiYeZBZy8ocnqPXWBBK0+qXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272865; c=relaxed/simple;
	bh=9fx3U+JgB8IubajJw1ty/cvaeSaU5rLDjt4aGJ4Fqb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEdmXQTkb55npC4Pu4PcK5Sj9jqKimhQk/5/0FjErx8OizBPNR8RggBFTd+qtMW8A1S+xU4dcC48YTUZIxIXhHLtt/ZTegn3hZHQQF3+qFoIFsi86bdrCK6VeDg8DRAsyRq+aqU/dikqLrr2hDW38BSYAwZC+tMIhnAKeqA12BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ih3fn9Lc; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih3fn9Lc"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so204832241.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744272862; x=1744877662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtxtEPm4AJ4x8N9WKm8NCFmZGdmUJB0tpx7bPjFWOsQ=;
        b=Ih3fn9Lc0EDl62blYASuZaNZXwRI3Zk+znICuPfYScza7V6BGpc7e/2pRLdQ6w3YTU
         v8AxRziaGzDbVWj7caKWZxomR0OxVMc/BmqnaNEh5H5/0uAXOE1oDbbolq6wY46n5R09
         CgeCFFHhh9VwgifTjd0XuT+TJtvjK8DVPRyiINxdRVaFk46BGthxfxxt7/grH2DFRANf
         RSMypBbIIq6i/+1IkG9GMsN1oqXaEcxAV7nibB/ZuVnpHXW4/eMjQyfAAVRoldSDId8c
         yk5aY3f1XRxFWxmftFfJzgJ6/9E5o9pFYywPSlaQEhpCHlHmhvC9u8POHpVzTowxjvEq
         IHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272862; x=1744877662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtxtEPm4AJ4x8N9WKm8NCFmZGdmUJB0tpx7bPjFWOsQ=;
        b=Ittw4lImjOdtXF9X8oLlX6w2//XvhNagG/JKW9OCBsSg+WWhOWIexByWGVJtrr1Sq1
         W9d2fTkUiyCHOIxlmaV5uHh9dFkRhrT4jbZ0hSlyq47eig/UvlfIRJA2Ow6aHLC483Uj
         5zCaEao1/UHwJRa7EvI5yPgdt2uDIIsgYdd4adjYUTz1mZ130zhNK94rEOV6dACMwVcx
         L3/IA8Du9zLMNU4nbc8kxOxTqpl8suQtJBvOvjiO0j9R4+cM/M8NPqLrjoUYuhoG3kl4
         wsCLY5l+emFPuwwh8AwwtMAAvI2e9ZpHOLeacNLCIoxexxoF6QBUWepTw7uGF5iY6hal
         K7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuzR4dvyI362/rZU2MKVSK2EluzAz4AF5smIxGkNTlcO2xv86JcWQmv8Jxrx7yX3xKoG9cwNCYwsK4pA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK656o955kZQTPC7mKdK8YG09atGRFAER/ERsWVKF2X8s/ii85
	DTdtbLErYxDEau0iRjfzH+/AJuWIoaqjGLiZFOxJrPjw4siYHr6Vh1V2mlzxrhzeIePoJrbHHuT
	gmqvFQkZGqubh03M881BRc9aL2Ms=
X-Gm-Gg: ASbGncswkLJUEcy4SefTy3L8pGm0AhKQMdXRCy58ekI9vR6X0LIQ4YsAFO4PtqmZdOE
	uCx0dDRAN5Ucjx8nYz9Rkp7zZ4Ogq0gGtYQL7c+YYNi0AWiS8X/h0pW07e4QbEvfVs9IRfS6yNL
	GwzEgQ11KpbjLEmxR3VrvVvA==
X-Google-Smtp-Source: AGHT+IEvvdv2zhbd2kmBRW/VXRKVNHK0VCLXKSsF936ydH1BymHDzBmNdbASxkp5/ld3dYzDQ87xGWs9lmDwJUlBsU4=
X-Received: by 2002:a05:6102:554b:b0:4c1:924e:1a1d with SMTP id
 ada2fe7eead31-4c9d637ce29mr444134137.18.1744272861494; Thu, 10 Apr 2025
 01:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 10 Apr 2025 20:14:10 +1200
X-Gm-Features: ATxdqUE1WBJVdkJVoCKU-96qwZBSus7wuVglO-eIEbf-QHWL-gLfppSUuTaAttE
Message-ID: <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com, 
	ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> When investigating performance issues during file folio unmap, I noticed =
some
> behavioral differences in handling non-PMD-sized folios and PMD-sized fol=
ios.
> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark=
 the
> folio as having seen activity, but this is not done for PMD-sized folios.
>
> This might not cause obvious issues, but a potential problem could be tha=
t,
> it might lead to more frequent refaults of PMD-sized file folios under me=
mory
> pressure. Therefore, I am unsure whether the folio_mark_accessed() should=
 be
> added for PMD-sized file folios?
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/huge_memory.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 6ac6d468af0d..b3ade7ac5bbf 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm=
_area_struct *vma,
>                                 zap_deposited_table(tlb->mm, pmd);
>                         add_mm_counter(tlb->mm, mm_counter_file(folio),
>                                        -HPAGE_PMD_NR);
> +
> +                       if (flush_needed && pmd_young(orig_pmd) &&
> +                           likely(vma_has_recency(vma)))
> +                               folio_mark_accessed(folio);

Acked-by: Barry Song <baohua@kernel.org>

I also came across an interesting observation: on a memory-limited system,
demoting unmapped file folios in the LRU=E2=80=94specifically when their ma=
pcount
drops from 1 to 0=E2=80=94can actually improve performance.

If others have observed the same behavior, we might not need to mark them
as accessed in that scenario.

>                 }
>
>                 spin_unlock(ptl);
> --
> 2.43.5
>

Thanks
barry
