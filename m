Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F57628FA97
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791768; cv=none; b=c3FZ8dEC43FfGrg6nYqoBLxBYSlbOgiQsywROjoScux92wXOfRUB2zR/4Mf5EmRiOcNZ3M2i9DwF+yF/3HLI0ZkZ4NmrFH8TXHT0K6jwSvfwbquJzJfsUDR/zmCZ8w4gyaqNu946HG56NjRLxIDj+Qw+WoyZerNHnmCHHOwx11c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791768; c=relaxed/simple;
	bh=LRbvViZoPclPGlN7A5PUm0tJDKLNRb0ymUi5CRfvQFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3i4M6DFvWucrv7PPcC084s3m8yWUcZeZ3SJ9z19HXT6/BveJrEp4vqpT1J6jk2mI5reKb/ECBEbVnEafk8cmZ1Eu1/1yeM/tX1P2MyD4yIN+VHyxxgJh5Sajt35OY8iCMEUi/mZlM2p7Sb0hATDNQeC+ITjTTmEhYGFyWIbZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGJeum7J; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGJeum7J"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5259327a93bso653488e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746791764; x=1747396564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqiFUbarWKLnCGJybuxJ4jR1QI/DeulSuNp7GD5UL+k=;
        b=VGJeum7J0DHcBI1vzo+JsCnabOk6KaRKYgN47Fsp2aCwfNQngAIw+A61d0GtgzNUqU
         ZTMczjPBWloY2IpACTHe7CQzowdWol4tkosmxK9I80446kO4/LrpaWWFbHEh3zbpqld6
         elA4LjIurCyiBbKxmE3lCRMitQjEaTuD+1C20Rq3XAS8m77Px4vjW3T0VFz48TEoR7Qy
         i0d8XVirJXeAosPa+tOhmiPwB0jarFAnobAVXw9i1J1SknAS+ryZNhOot5RBPZcxIeqE
         FSRu+VLRIovWYSMlclDptNCKU1jCiqgHpqqrBzjXvQaNPD3RJmMWyPvFiSWkOExfMOi4
         nGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791764; x=1747396564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqiFUbarWKLnCGJybuxJ4jR1QI/DeulSuNp7GD5UL+k=;
        b=I0f02teHxsnBRp9eklMNc8PES8JTRgC+XyuqThAslQ7YOFMjQ0yCpYqb0yvL9gZCPd
         s3Kzi7Fpnr67Rl+zwYTQqVEA3pKDPB5/gBjohiz+iZj/fke6rEYh6s/ma/8CekNqUn1m
         JxvxKmCccQVctLtVIkuH2MI/rLgirRO51CnOJh/066WWDd2c5phKUdtWmlgbkUZv/gPX
         7ZEuwTTIm43bCK1AH8KLQ9Jm8RUdQ0uupEGf9KvHI5gjIIaEJULKQ3qiLWXuMjM3x3eY
         1qQGgkvpBnmGEh2jyTGIl8Eg/tmpFMnwpdnq/+MqxU2G88901b3XHjz52M0tydFWDY8x
         BCCw==
X-Forwarded-Encrypted: i=1; AJvYcCUrWIr1fWTnkonxk+F6IRraVYMTF5yRGCgQ43uQOmquEvPnz0FqcRZQdsjv/dvUtXWzSGNvlJ7KVSC5ghU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIExluWd58BbA/7pSsOSvLtz9JPDkBNLO3/I8a99Z2zJfwVrP9
	irKTGS4QIDTgxPkXzm4PgKEFribXC3HCtGoqK08o7ebqGOmcHBzXGKNeL1Ks23U3udT2T6l7cwt
	9V36jbYSEhSG58scHi310G/FdHfw=
X-Gm-Gg: ASbGnctiAEOqun0EuXKEdV+uE8N0drNSh26KCtGzLU46BUdeOtxJdPPxaZ/YSRv8zke
	DIvLDlCLQV/Zfid0RNEZwJ9+Rjaw6/Oon/mQTrW9LUWQ4VTU3Gdr+mz3/8vRTCKQLW6DV8uHCAv
	aJMGXisYx/XPOxBMbKTMU6cA==
X-Google-Smtp-Source: AGHT+IE4Ed6/a+4uS9HMJKRiOEF/n4Rq6ihgHyAvRSMHkhfbU7+qPOoUdqDjBcie4Ml38P1gLswJ/LANpg2k2cnKh8c=
X-Received: by 2002:a05:6122:3bca:b0:518:6286:87a4 with SMTP id
 71dfb90a1353d-52c53b59146mr2604105e0c.4.1746791764042; Fri, 09 May 2025
 04:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_503130C3CD56569191396268CF4D12F09A06@qq.com>
In-Reply-To: <tencent_503130C3CD56569191396268CF4D12F09A06@qq.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 19:55:53 +0800
X-Gm-Features: AX0GCFtZjjwuWrSColvr5pJ5ezCWRnG-VQdyNvJnQtZjTcILpkAWnHY2kWMVZLc
Message-ID: <CAGsJ_4y2hHAsKWR9WLY79d5UDLcai=px+WbgDpoRJrysPqqQOw@mail.gmail.com>
Subject: Re: [PATCH v3] mm: remove obsolete pgd_offset_gate()
To: Feng Lee <379943137@qq.com>
Cc: david@redhat.com, akpm@linux-foundation.org, mingo@kernel.org, 
	jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, maobibo@loongson.cn, 
	trivial@kernel.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev, 
	anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:33=E2=80=AFPM Feng Lee <379943137@qq.com> wrote:
>
> Remove pgd_offset_gate() completely and simply make the single
> caller use pgd_offset().
>
> It appears that the gate area resides in the kernel-mapped segment
> exclusively on IA64. Therefore, removing pgd_offset_k is safe since
> IA64 is now obsolete.
>
> Signed-off-by: Feng Lee <379943137@qq.com>

You missed including the tags from v2 when sending v3.
These tags were already present in v2 and should have been carried over
to v3:

Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>

>
> ---
> Changes in v3:
>   - adopt more precise subject descriptions
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
