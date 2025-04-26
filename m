Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3EE224888
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662431; cv=none; b=eAqhEVbGPoekuh/L7Q8Cy73CmoziLpyseEYiSAJfFNXsvPOOajm5WSRWVLbuvSLMgOEd30fJZKjJ1Zs8D86ymHek5tKiMFC51OzE4Du3c3Ki7n/SK9W0PJKq/0qFZJvbLkQUgydAguDF7e4Y6/Qs3bfyJ+7h7aNmRdtYF5NWkZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662431; c=relaxed/simple;
	bh=EQiqrKqTukWbVBL5IGd2hbGdeBS1OCfXZkEgYDGooII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+Bt0/MhB7+OjuiNBncjhM8QJIazDxWuMRe9xNjlvKUCh0wiOc2CMQzLTeVtpC6UB82+1Q4zhZLHj5VFZ+Fz8PA5s3k67KArh57RQJzN3H0rX38z+yHLrJalC1wi2A4KprTQ/3sUNjEVHHPotreGhPXCDEodGHi7VatqjRmfLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNQ9VUyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNQ9VUyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF018C4CEE8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662430;
	bh=EQiqrKqTukWbVBL5IGd2hbGdeBS1OCfXZkEgYDGooII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BNQ9VUyfS5WR1b7FJVwWXUXcEDM4rrJs6y2qRQhNsnXyjop7hn02vYciIuwI1yRDv
	 Fc+dCAEoHBo1j0z8CjJS4s+//R+na9qdZPEWD1OeDtJQTloaBMcXcdbXRPBVG8zxd3
	 n3xheH9U8a50OFztZTeSv0ss4k4qtqE6fHMin1nOlTWXQmL4p3z/7Zu4WOpiTOFX3Y
	 NsSfiDbqS2hS1UnAbqZu5HEicVXrxQHN9w8dOEAFYldPjvzYGr2BFP0i5//1zRcGWM
	 D2DnF/FUXED191BTZ0JkYAJUWvxm24HzOFwSN48T5jjOIMKJCH/qFppdKWPImRlbRq
	 PZBubzKMiCdHQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so494643466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl9Uo8Ech3lmTh3yHjXnLVoSWPzUYqyqUmdnUntp7te0qROdlwSINdkssEJYhG9rvCRxPaGSVH5yZ0fak=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3egPSwJe7QLH93BKms9GLW7/IBiTptj+NlLZzPDo+aCYSyn+
	RvKhWnT7+5gxKExYRDla+NNUFU1Z8RkiXzI/5TtQvVRn4VksRX1h4WU7pWUwZKKiuRyrkLYOrIo
	VnoOzOrUfEq7i/xRDjv+51cTG5nY=
X-Google-Smtp-Source: AGHT+IEZjc2EQqDCixMAOSJTMEsc3fcgtaBnZPEL4M3yGy4i7IUGdVWlnt55DQeCJrxyp75W4qKPWFCvnRYdM3ug334=
X-Received: by 2002:a17:907:86ac:b0:aca:c7c6:b218 with SMTP id
 a640c23a62f3a-ace848c28femr196158566b.1.1745662429435; Sat, 26 Apr 2025
 03:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424083037.2226732-1-wangming01@loongson.cn>
In-Reply-To: <20250424083037.2226732-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:13:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4uiJC0dz+MDUvXEQa0wx78L9U=-XVXZ-xC5AhV_J+gaQ@mail.gmail.com>
X-Gm-Features: ATxdqUFMJA4o5CR-fsncn0k0L2x8oe7F61DzM3fg9Z4yooOUjlJawEIGteazZqA
Message-ID: <CAAhV-H4uiJC0dz+MDUvXEQa0wx78L9U=-XVXZ-xC5AhV_J+gaQ@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from huge_pte_offset()
 for none PMD
To: Ming Wang <wangming01@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Hongchen Zhang <zhanghongchen@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lixuefeng@loongson.cn, gaojuxin@loongson.cn, chenhuacai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 24, 2025 at 4:30=E2=80=AFPM Ming Wang <wangming01@loongson.cn> =
wrote:
>
> LoongArch's huge_pte_offset() currently returns a pointer to a PMD slot
> even if the underlying entry points to invalid_pte_table (indicating no
> mapping). Callers like smaps_hugetlb_range() fetch this invalid entry
> value (the address of invalid_pte_table) via this pointer.
>
> The generic is_swap_pte() check then incorrectly identifies this address
> as a swap entry on LoongArch, because it satisfies the !pte_present()
> && !pte_none() conditions. This misinterpretation, combined with a
> coincidental match by is_migration_entry() on the address bits, leads
> to kernel crashes in pfn_swap_entry_to_page().
>
> Fix this at the architecture level by modifying huge_pte_offset() to
> check the PMD entry's content using pmd_none() before returning. If the
> entry is none (i.e., it points to invalid_pte_table), return NULL
> instead of the pointer to the slot.
>
> Co-developed-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>  arch/loongarch/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbp=
age.c
> index e4068906143b..cea84d7f2b91 100644
> --- a/arch/loongarch/mm/hugetlbpage.c
> +++ b/arch/loongarch/mm/hugetlbpage.c
> @@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned l=
ong addr,
>                                 pmd =3D pmd_offset(pud, addr);
>                 }
>         }
> -       return (pte_t *) pmd;
> +       return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
>  }
>
>  uint64_t pmd_to_entrylo(unsigned long pmd_val)
> --
> 2.43.0
>
