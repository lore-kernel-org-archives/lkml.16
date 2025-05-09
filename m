Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC321CFFA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746758679; cv=none; b=H7RtNvDRqi86jyUb89HSTW/45/Sa/k5Z4Gy9NauDroQr8T22O1KlaOsvXTHK3mObhTlxeFm9HB0Kib7UHrkhwM7wv5TmWPwQvNHJHL9ElqfyY4o1vvfSnLzocdOemWF0/N50H0eOldET7I4P+oIv1Zh8L+KLUZzjMq/zkpXgAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746758679; c=relaxed/simple;
	bh=9RPpMIHS6Yf3v1StZtqE3gpsPteFqRSN4YhOjypjRxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYZmL+EpZ9mFqDTaKszbEs4v5ab607DVuatNArxJ7B2cUA3HEJV//jTvr1rPks3cqszpKcnMsJcONtuNT96M80HIGs746YcSTMYrwFRMYTnUz1US9J8bMayBBC9zg5I2fME/jZNyNmCCVplbZC4lJVm/tWec8/NY23U9qjhBfGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfZj6Fbk; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfZj6Fbk"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c4e1f16833so511848137.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746758676; x=1747363476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhwQ021WoX11b7d+iITjWgoVSr3Nzxd9UUacYTrQMbc=;
        b=PfZj6FbkSvH5LVOoZABO9rLAfJSRI5Q/4X+BADQ1a4eW8yngCX5gM0XRCvRN+jB6V1
         R22pGALCjWyJugBAPgM1IO0yy/MOTzt3MSe2kTBlUVHlUQ0hlTUda5druUCcJ4Ok5iwO
         JlsJos8tvXAliD/mD/8H1p876ZEV4iWdINiiyjvsCGK/K+J4TdwcGzrjzM7S57+vXhqV
         oKV/PJZwAEs5G/t/tfCVCDLZA3q9dMDM3grsf9Hq84wEq+RLi/L7+1i2TiQnGG/WtRfe
         VD3dmfzZAvL6eqe+oiMDRk5zcZarb9xvLv1DhbedJ0+Mz+rVj/pflF3EdtdP9IJf+s9X
         +WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746758676; x=1747363476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhwQ021WoX11b7d+iITjWgoVSr3Nzxd9UUacYTrQMbc=;
        b=Z+sZ0cd22NVbNxJcZqc8BvpcWE+fFcoNy2SPYUNbY6RFPTMSoetH4/bbaFVmSVckPV
         cEGHuuwboEQCWzgVaVslJpkWr3wH87HTckWknmO+lGzZkzdaGL/NR6BP7Yb+O390IyXR
         3ODneKN5u924mBgAbDNV0e7ZUDWCC7JoSLkXocGSLIPz988xjjEZH+edh8QOP1JTQj0e
         tfPW9wq1po19t5xx3w94qZbvrQUC/zQN0aGXZ2J7gBc6UaSGs1kXA6xtTbeYqP/P37YL
         vrFhHlpfZ90GjZPenusaUW4oO33e9rdZy5vvI5XS0F2PfJ5tpZMhSvW/i7S9MuFXkaey
         EulQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwSnr8usJa/t7tYGZ9rrgd9gNR3EcdAW84P9/AEhz6vsu+cReEOqxl9bgDkdKqXlmQBJCdkJrzMztDuq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAH2jOV/TocBkOSaeX3B41yoU2iwKvKyxl0bXHEuV3PlIF4EfA
	QfBMKDGpxN9pjtIdE6w8+dnSShRXatjXmCh0Uxg+tEeccIDPRm3n4l3VOj6vlyW6rCtqIZFSOei
	PRuCsodqj0VdEXypuq9Qw+qGmtKA=
X-Gm-Gg: ASbGnctik+lzRuxeUsrgCsU1sxRm5l5gKxQ/d+qJWoBVutrDhg+Jvjkjg/aWw2JTbgB
	N4lINjUILanzJpXDaEvsQWZmc0KUlsID3nrwrMByxbVQS0Sn1nlYXhfWkxgt2+EGwhy+iExULGI
	HYzTSDInam8RIlaULN+dKoNdFRbYR4VUsL
X-Google-Smtp-Source: AGHT+IE47FPUz5/BnIb2DO47zCfE4KOhLMfUoBcCgBQwpo9OziunDh4bO23QRCXei7xi8gJSxjP1hJZm1XvF3qWz55A=
X-Received: by 2002:a05:6102:4a8c:b0:4db:154f:aa02 with SMTP id
 ada2fe7eead31-4deed30ce38mr2019530137.1.1746758676366; Thu, 08 May 2025
 19:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_0B227ECF6D12D91A3070FE8D41568AD10206@qq.com>
In-Reply-To: <tencent_0B227ECF6D12D91A3070FE8D41568AD10206@qq.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 14:44:25 +1200
X-Gm-Features: AX0GCFv4rNg7UEufyZvK318eL1k82uFmT4TjkV1NLH5iMvntfUagn5i2y4t1PaM
Message-ID: <CAGsJ_4yLyXefpjycf05MYEnUis1UkEmH+kKVeKDnCsZzgGNUMw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: clean up redundant code
To: Feng Lee <379943137@qq.com>
Cc: david@redhat.com, akpm@linux-foundation.org, mingo@kernel.org, 
	jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, maobibo@loongson.cn, 
	trivial@kernel.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev, 
	anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 1:54=E2=80=AFPM Feng Lee <379943137@qq.com> wrote:
>
> Remove pgd_offset_gate() completely and simply make the single
> caller use pgd_offset()

 "."

>
> It appears that the gate area resides in the kernel-mapped segment
> exclusively on IA64. Therefore, removing pgd_offset_k is safe since
> IA64 is now obsolete.
>
> Signed-off-by: Feng Lee <379943137@qq.com>
>

Better to rename the subject to be more specific, e.g.  "mm: remove
obsolete  pgd_offset_gate()" or similar. Otherwise,

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
> Changes in v2:
>   - remove pgd_offset_gate completely
>   - remove pgd_offset_k from the get_gate_page function completely
> ---
>  include/linux/pgtable.h | 4 ----
>  mm/gup.c                | 5 +----
>  2 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..f1e890b60460 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1164,10 +1164,6 @@ static inline void arch_swap_restore(swp_entry_t e=
ntry, struct folio *folio)
>  }
>  #endif
>
> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
> -#define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
> -#endif
> -
>  #ifndef __HAVE_ARCH_MOVE_PTE
>  #define move_pte(pte, old_addr, new_addr)      (pte)
>  #endif
> diff --git a/mm/gup.c b/mm/gup.c
> index f32168339390..0685403fe510 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1101,10 +1101,7 @@ static int get_gate_page(struct mm_struct *mm, uns=
igned long address,
>         /* user gate pages are read-only */
>         if (gup_flags & FOLL_WRITE)
>                 return -EFAULT;
> -       if (address > TASK_SIZE)
> -               pgd =3D pgd_offset_k(address);
> -       else
> -               pgd =3D pgd_offset_gate(mm, address);
> +       pgd =3D pgd_offset(mm, address);
>         if (pgd_none(*pgd))
>                 return -EFAULT;
>         p4d =3D p4d_offset(pgd, address);
> --
> 2.49.0
>

Thanks
barry
