Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5EE28C2B6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926709; cv=none; b=Us+fHMhM4O3gP6P+ccMQhr1YrKjnNAPyF3ysaGxf0ujy4W8pcvztDoS+d2R2k2YgFtzdXnh/QX2vd79gEMdgIYcrcbiGIZnjjiRGKqf0WSGtUCSi8Z5tklEzMmrTlLhye+XbiLpGlsJ8gcGsoXGUnMZsEPEbXYPpIDNquf1UNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926709; c=relaxed/simple;
	bh=z4fXzBUgIsErwyKGNpzT6v1rVL0xTsjOd7VTRE/toWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMB4M+gVvVMl3yLoTvty/pRnBGY6mDpjzo10oqlUoS/5bcGdSeIKQ83APiqk49DKjYc3nTFmz5rvgvDnUuxf7A8wMIsCy/35aQ5iKIBCTBn0BEfZDV+jSfFv2XHQzYU3F69LT/4EpMVx9FwSZCK+OYcJQt7vRh2C8epEngPlMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=e+peWWNz; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="e+peWWNz"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-477282401b3so87645561cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747926705; x=1748531505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkuVu6TLTcH1UO6MtsNK3yTXBjsaezcw9faGJub9wRA=;
        b=e+peWWNz0FNKpccoCdFYZOejZIJMszNq4omBEIz9V3iWvx3Jy8g2xg0GdHAA3bb3XN
         zaKnWL7xJwP2y6emks0ZUR5uuNohdTFx5zP4fvULPZorakTpsGqgoxPqV+25LGA6RBf2
         XuGWeesP7d3lbcB8ZDYXSnAdXWvgzFGwpe05PSLbkWtTfg/jV7NfCDBxWNBasn7gE8Tb
         RUqPPhHjjXVSz7DfcxFDU4qDs49ZH8QSOUTPVOs94FDvg6QVY1BcUXO+xYNgh0boBNGY
         qIdoKW0voakfm//Sp6XHkaCwJ6tRTOg2AvaUvj348YX095KGA0fzZpIy5AxZmWc9TiiV
         j+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926705; x=1748531505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkuVu6TLTcH1UO6MtsNK3yTXBjsaezcw9faGJub9wRA=;
        b=v76kscyCplkZqxF7LQ1F1W6puLBFv+xe07WuHlmUHO35Q5c8zSIMQs4BNrY33Zoos6
         7nBlc0uJBFESHfvZButKulBYsucCaVeeJB0iRr3u55Cwjk+nhEoLQGfkqTkRxoqwGneR
         hw5SZiWJp2YunjvYTeZMEqUrrAvmOQnTKKhaUnT32sEtljkKCa+a1fQz/0SNCc/u7MkX
         xrDs5lwshDAICQ+bNPFHM1B9txnHaPsmb5pD5AN7lt9bbmeFaTEsuE5rPaTv2koWkfy6
         BX/i7xLblqC8Kp0JiwxIVuY/dNvZd3Re1PukuFUlFF1R7ppU7lfUQUBINH05YgxRXFHS
         Yx9A==
X-Forwarded-Encrypted: i=1; AJvYcCUQz77PBYlRqbzM7N7ZE6Dbo/TNSWE/AvnGLMlR5oSBb7KiyZls8D4TMdL9zrMW922NHWQB9oBkA8bA5Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3W1yMzRnHQwHVweBqtUYzxEE3HDxwUxxN2baNBd66pTMogXCr
	usJDvvYktIYLueSHPLL5Gt/cqO+oWu9pwyeVRQEpGE4n9PFrxgrCTLFft4utq7Lin9C79B1TH6z
	y9k80QubHPlDNDd3PKp3twIQnUhvQhDhKoDQ0+vOBgw==
X-Gm-Gg: ASbGncshdMWiXRh2xZs43XFBvwSbzoZgOFkqMgYcVIhfd1lyrxbA5Sc3wf6mYY9LJ+/
	PM7r5nwRybxEHOUoxZ89CnelZLpo4A45i8wyY2yTX0L7Xb04YkDIipkA/Vn/3njSdpKjC1rrnPG
	xbO6QhSGbYtU54miB+L3YL9e3M/nChe1ceEg==
X-Google-Smtp-Source: AGHT+IFK4Yt+2cgSXArAeoi1XDZ64HrD1KARb24Tr3q9Foi+yx0/cRfeLxf+ZZaw0XgkdGlmSGMsnojlGKBoJ8/RNnQ=
X-Received: by 2002:a05:622a:424d:b0:494:784a:ee41 with SMTP id
 d75a77b69052e-494ae445618mr415065331cf.42.1747926705384; Thu, 22 May 2025
 08:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702102637.9074-1-mchitale@ventanamicro.com>
 <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
 <CAN37VV6DMpsRWnH-1tN2AfT8HXbEFh2We4Yw0XYkuCNvF75o4w@mail.gmail.com> <8faad7be-d7a5-4f71-b020-960ea443f751@ghiti.fr>
In-Reply-To: <8faad7be-d7a5-4f71-b020-960ea443f751@ghiti.fr>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 22 May 2025 20:41:09 +0530
X-Gm-Features: AX0GCFuj4FI4Iq8tzF2Vm8xgvRmc5GtroFmXxMR9iejG5iUtnCgIPoQ5G81Q79o
Message-ID: <CAN37VV4ohoi48BAM1-OTdSGe9yD=2Eh84pKsHLsWQSaRadJ7tw@mail.gmail.com>
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, 
	samuel.holland@sifive.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, May 20, 2025 at 10:25=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
>
> Hi Mayuresh!
>
> On 7/30/24 10:43, Mayuresh Chitale wrote:
> > On Wed, Jul 24, 2024 at 8:20=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.=
com> wrote:
> >> On Tue, 02 Jul 2024 03:26:37 PDT (-0700), mchitale@ventanamicro.com wr=
ote:
> >>> The Svinval extension splits SFENCE.VMA instruction into finer-graine=
d
> >>> invalidation and ordering operations and is mandatory for RVA23S64 pr=
ofile.
> >>> When Svinval is enabled the local_flush_tlb_range_threshold_asid func=
tion
> >>> should use the following sequence to optimize the tlb flushes instead=
 of
> >> Do you have any performance numbers for the optimization?  As per here
> >> <https://lore.kernel.org/all/mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508=
@palmer-ri-x1c9a/>.
> > No, currently there are no numbers available for comparison but the
> > rationale for the optimization is described in the spec. The extension
> > is mandatory for the RVA23S64 profile but any platform that doesn't
> > support this extension will not be impacted as the code executes only
> > if the svinval extension is enabled at the boot up.
>
>
> So I finally have some numbers! I tested this patchset on the BananaPi:
> I measured the number of cycles when flushing 64 entries (which is our
> current threshold) and I made sure to touch the entries beforehand.
>
> Here they are:
>
> * svinval:
>
> #cycles: 364920
> #cycles: 365856
> #cycles: 367993
>
> * !svinval:
>
> #cycles: 663585
> #cycles: 663105
> #cycles: 664073
>

That's awesome !! Thank you so much for getting the data.

> So that's roughly /2 using svinval. To me that's good enough to merge
> that for 6.16 :)
>
> Sorry for the very very long delay and thanks again for the multiple
> revisions!
>
> Alex
>
>
> >>> a simple sfence.vma:
> >>>
> >>> sfence.w.inval
> >>> svinval.vma
> >>>    .
> >>>    .
> >>> svinval.vma
> >>> sfence.inval.ir
> >>>
> >>> The maximum number of consecutive svinval.vma instructions that
> >>> can be executed in local_flush_tlb_range_threshold_asid function
> >>> is limited to 64. This is required to avoid soft lockups and the
> >>> approach is similar to that used in arm64.
> >>>
> >>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >>> ---
> >>> Changes in v8:
> >>> - Fix line wrap
> >>> - Add RB tag
> >>>
> >>> Changes in v7:
> >>> - Use existing svinval macros in the insn-def.h
> >>> - Rename local_sinval_vma_asid to local_sinval_vma
> >>>
> >>> Changes in v6:
> >>> - Rebase on latest torvalds/master
> >>>
> >>> Changes in v5:
> >>> - Reduce tlb flush threshold to 64
> >>> - Improve implementation of local_flush_tlb* functions
> >>>
> >>> Changes in v4:
> >>> - Rebase and refactor as per latest changes on torvalds/master
> >>> - Drop patch 1 in the series
> >>>
> >>> Changes in v3:
> >>> - Fix incorrect vma used for sinval instructions
> >>> - Use unified static key mechanism for svinval
> >>> - Rebased on torvalds/master
> >>>
> >>> Changes in v2:
> >>> - Rebased on 5.18-rc3
> >>> - update riscv_fill_hwcap to probe Svinval extension
> >>>
> >>>   arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
> >>>   1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> >>> index 9b6e86ce3867..782147a63f3b 100644
> >>> --- a/arch/riscv/mm/tlbflush.c
> >>> +++ b/arch/riscv/mm/tlbflush.c
> >>> @@ -6,6 +6,27 @@
> >>>   #include <linux/hugetlb.h>
> >>>   #include <asm/sbi.h>
> >>>   #include <asm/mmu_context.h>
> >>> +#include <asm/cpufeature.h>
> >>> +
> >>> +#define has_svinval()        riscv_has_extension_unlikely(RISCV_ISA_=
EXT_SVINVAL)
> >>> +
> >>> +static inline void local_sfence_inval_ir(void)
> >>> +{
> >>> +     asm volatile(SFENCE_INVAL_IR() ::: "memory");
> >>> +}
> >>> +
> >>> +static inline void local_sfence_w_inval(void)
> >>> +{
> >>> +     asm volatile(SFENCE_W_INVAL() ::: "memory");
> >>> +}
> >>> +
> >>> +static inline void local_sinval_vma(unsigned long vma, unsigned long=
 asid)
> >>> +{
> >>> +     if (asid !=3D FLUSH_TLB_NO_ASID)
> >>> +             asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asi=
d) : "memory");
> >>> +     else
> >>> +             asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memo=
ry");
> >>> +}
> >>>
> >>>   /*
> >>>    * Flush entire TLB if number of entries to be flushed is greater
> >>> @@ -26,6 +47,16 @@ static void local_flush_tlb_range_threshold_asid(u=
nsigned long start,
> >>>                return;
> >>>        }
> >>>
> >>> +     if (has_svinval()) {
> >>> +             local_sfence_w_inval();
> >>> +             for (i =3D 0; i < nr_ptes_in_range; ++i) {
> >>> +                     local_sinval_vma(start, asid);
> >>> +                     start +=3D stride;
> >>> +             }
> >>> +             local_sfence_inval_ir();
> >>> +             return;
> >>> +     }
> >>> +
> >>>        for (i =3D 0; i < nr_ptes_in_range; ++i) {
> >>>                local_flush_tlb_page_asid(start, asid);
> >>>                start +=3D stride;
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
