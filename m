Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA28221290
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372325; cv=none; b=umb5hyQtS0SjadasICwFmRkLEMa9BGTfcCt8to6rb1pXejmbnT7dOviI+06V764+4CmncLokeeZlygI8yhLcW2MT2KUFugnVedZjBEorh/E+wK2L86GYsJC90B+s9darVXwk7PK8PdyM2ON5CMARImbV1q6P10cHUs3gkqVd+T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372325; c=relaxed/simple;
	bh=Eajgik+N6//ffIn0YucNc3GOldAx5lVsL+zuUh2MgfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY3d7sPZ/pBmVVuZ//M4FjL/u2O3+9Y0fTwTiqb+/qLZBOoMajRsR2WKlWRPglmb0b1Z5p9cPdXqIXHwBT+Rd0nDg+YiFATCE6HOQCpYIFRk/RqkTPV5a4hdabiU1/4ajuj7ldQXk9NqcNaT1EPk+row5mq/ahc8IyptJRmgc4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6Ncgnyk; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6Ncgnyk"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5259327a93bso827043e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744372323; x=1744977123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOnn2mdi5+2ZqdQMT84rbE8zhldAP+l3K0C3RepRef4=;
        b=U6NcgnyksUcIgJwTSXIli6qvNY/EetYhFZGkdOaMmOBfgrfOLwL1p0d1s5C0smxKYT
         PfWfXXtq7eHuMVTcFFFxep5rNcT/g/7RKDoLD9A7f+ZPvwXrLogP/PuW8n4qsbM3SgoF
         vBS9qiQ927QtVOkjGaODAHfg/PA0btiiH+1UM1Gj1xenOG+o5IHNyX4ou36B9RtqXz5D
         oigAWtzmVO+GT/B6MpoVqZ/DFNR4XqcxebKoGg8o0aVtKkWxK1D1exNV0XA7Qvbe8xeP
         JjNh/DwBSILs7XOpg94PbWcYq5ASWTA9EQBLjc7C8U8h80qashVTDG1YqpN/QLkNTs78
         KElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372323; x=1744977123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOnn2mdi5+2ZqdQMT84rbE8zhldAP+l3K0C3RepRef4=;
        b=NWe1vj2eREyb3GoGXoeQVb2YTargYrPJfXEPEbQwUiwKPhDIOff0k4J/y+OhaljqQQ
         LYXNbXvO8x/FvdvqzP5tYxmIATFy/jPNL7gWh9w8jlfAm35MYALy3JyJF5V5cI9vbdxF
         NWoMZPZh/MAAmzXNm0pz8gMjymTjhDf40ieB+lUMu3jjWgPgorI5dJpt6TeI5fkeSmmE
         nY4LcuX4T8IuPuZYQw33xVceJf+xxveXCwszvj+RPJ0npWXQuUb6KPm2E5Dal5Pz9jz5
         tM2jh/gWlPhufvzcKIIOMR4UK6Bk83HPPVuCb5TZQqCXcfNDNEZeYwcYo4h3KYKAa5Fk
         4coA==
X-Forwarded-Encrypted: i=1; AJvYcCUcmAIU4HJRcGdtQZdV3nXuYHXaxiN59wYBEX+5XLGtvtvRXt0xzDUpm6yPIoX3wfxkeC7WWRt+VyAf1AM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3A5+GKC3y9oc1mlCI2IbfIOwYmNl/9z3N/Iqso+FwpbcknNFt
	zTyvyxGDG+O+kusOCfUPNhiud50IAafpqGvH309hoY+zvTrQBSLbgniqXxcE/D7qro9OVLYKIwG
	os0iqC+Wp/bPMCT9N9AoIaFrB+H8=
X-Gm-Gg: ASbGnctpINGPy9iF4EC7Wwhp8FBI/0x7vdrM9Jf1jGuMCWd0Jd15ABIxs0nAzTWMmKl
	cBmZw3EMdNEZi8nZ793eZ2tUJbQmHAkRU/3I0lZJJx0+gU/lAQ8E7les3a4ihoSiazxo85INkYH
	3d8TUYNry3/SAx01s/RW/8j/w1jVZ7j3E8
X-Google-Smtp-Source: AGHT+IHUfu+oUJPp0B+gr6jUIlqDlQhVTAv6qGqFN5vBWXJ6q1aPP9DLVECfjV0kO+UZLmK9R6j1PuK+CrR19z8Ujn4=
X-Received: by 2002:a05:6122:178a:b0:518:6286:87a4 with SMTP id
 71dfb90a1353d-527c34b2550mr1508731e0c.4.1744372322682; Fri, 11 Apr 2025
 04:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com> <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
 <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com> <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
 <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com> <6b532646-041f-4077-b09f-ff6d43aa4a81@redhat.com>
In-Reply-To: <6b532646-041f-4077-b09f-ff6d43aa4a81@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 19:51:50 +0800
X-Gm-Features: ATxdqUHPHj25JVtaUNa2HuEUKQTNqHQAFH4Qp16JvBEmbecGmh0X-vJRlHJBAp0
Message-ID: <CAGsJ_4zYV78RV+9a13Tyy2ykTDYMH_-ePP_ESEedGqb_LqBkeg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
	akpm@linux-foundation.org, willy@infradead.org, ryan.roberts@arm.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:42=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 11.04.25 03:20, Baolin Wang wrote:
> >
> >
> > On 2025/4/11 05:56, Barry Song wrote:
> >> On Fri, Apr 11, 2025 at 3:13=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>>
> >>> On 10 Apr 2025, at 6:29, Barry Song wrote:
> >>>
> >>>> On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
> >>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 2025/4/10 16:14, Barry Song wrote:
> >>>>>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
> >>>>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>>>
> >>>>>>> When investigating performance issues during file folio unmap, I =
noticed some
> >>>>>>> behavioral differences in handling non-PMD-sized folios and PMD-s=
ized folios.
> >>>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed()=
 to mark the
> >>>>>>> folio as having seen activity, but this is not done for PMD-sized=
 folios.
> >>>>>>>
> >>>>>>> This might not cause obvious issues, but a potential problem coul=
d be that,
> >>>>>>> it might lead to more frequent refaults of PMD-sized file folios =
under memory
> >>>>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed(=
) should be
> >>>>>>> added for PMD-sized file folios?
> >>>>>>>
> >>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>>> ---
> >>>>>>>     mm/huge_memory.c | 4 ++++
> >>>>>>>     1 file changed, 4 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
> >>>>>>> --- a/mm/huge_memory.c
> >>>>>>> +++ b/mm/huge_memory.c
> >>>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, s=
truct vm_area_struct *vma,
> >>>>>>>                                    zap_deposited_table(tlb->mm, p=
md);
> >>>>>>>                            add_mm_counter(tlb->mm, mm_counter_fil=
e(folio),
> >>>>>>>                                           -HPAGE_PMD_NR);
> >>>>>>> +
> >>>>>>> +                       if (flush_needed && pmd_young(orig_pmd) &=
&
> >>>>>>> +                           likely(vma_has_recency(vma)))
> >>>>>>> +                               folio_mark_accessed(folio);
> >>>>>>
> >>>>>> Acked-by: Barry Song <baohua@kernel.org>
> >>>>>
> >>>>> Thanks.
> >>>>>
> >>>>>> I also came across an interesting observation: on a memory-limited=
 system,
> >>>>>> demoting unmapped file folios in the LRU=E2=80=94specifically when=
 their mapcount
> >>>>>> drops from 1 to 0=E2=80=94can actually improve performance.
> >>>>>
> >>>>> These file folios are used only once? Can folio_set_dropbehind() be=
 used
> >>>>> to optimize it, which can avoid the LRU activity movement in
> >>>>> folio_mark_accessed()?
> >>>>
> >>>> For instance, when a process, such as a game, just exits, it can be =
expected
> >>>> that it won't be used again in the near future. As a result, demotin=
g
> >>>> its previously
> >>>> unmapped file pages can improve performance.
> >>>
> >>> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_R=
EAD
> >>> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
> >>> Will it work?
> >>
> >> Actually took a more aggressive approach and observed good performance
> >> improvements on phones. After zap_pte_range() called remove_rmap(),
> >> the following logic was added:
> >>
> >> if (file_folio && !folio_mapped())
> >>       deactivate_file_folio();
> >>
> >> This helps file folios from exiting processes get reclaimed more quick=
ly
> >> during the MGLRU's min generation scan while the folios are probably
> >> in max gen.
> >>
> >> I'm not entirely sure if this is universally applicable or worth submi=
tting as
> >> a patch.
> >
> > IMHO, I'm afraid this is not universally applicable. Although these fil=
e
> > folios have been unmapped, it's not certain that they won't be accessed
> > again. These file folios might be remapped and accessed again soon, or
> > accessed through read()/write() operations using a file descriptor.
> >
> > I agree with Zi's suggestion. Using some kind of madvise() hint to mark
> > these file folios as those that won't be accessed after being unmapped,
> > seems can work?
>
> Is that similar to MADV_COLD before unmap?

I'm not convinced that's the case. Although the previous app exits,
its exclusive
folios aren't useful to the newly launched app. For instance, Firefox's tex=
t and
other exclusive file-backed folios have no relevance to LibreOffice. If a u=
ser
terminates Firefox and then launches LibreOffice, marking Firefox=E2=80=99s=
 young
PTE-mapped folios as accessed=E2=80=94thus activating them in the LRU=E2=80=
=94is
meaningless for LibreOffice.

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
