Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F17081A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744448581; cv=none; b=MgPttdESW4GQO0jiaQpPTiiGmty/kafRNRr1W/pycmkg3/i0yuVt5nPRS2qWNIAi8ha38fGCeSvqzICBiALJIrt06VNsOCZpPyirPnQpFXiNjfvmadt8Upac1aK3KujQ4xsuPZSB7d1dwE0rB+XN6j9mzDsDJ3C0gEeA+q+effc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744448581; c=relaxed/simple;
	bh=NfyFYlxXadPcnXbmMnXUpvYOVsSFpGn8QxVbr5BLKFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRUL+LuCAsOYfQwvyr/XB3Tn+ftDWemDsUEt7mE4rJyzkacalU2Tq869rvVw75zrunB7+o+NUYvkPouizgZ8Tje4I+FlXyvLfS+a9mrITwDukwVUSmRCfmy91bYGk9/taqkybSnYJv5PA26eMl5cLyPLOT56FkPJaXAZbraDNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HARVlw3w; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HARVlw3w"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so1178627241.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744448578; x=1745053378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcxM14nNo3Z+3rUutFNIH54ijwMGULjVVnVvsuIXthI=;
        b=HARVlw3w7aFVs+iS4IsXQ485IQfyBNIWyBzBjgiVEGGaXat9AT14tOaJ1q9Slgn1+I
         1RQwceXLzoMimaGB4gjM0wlnKCqspleqTOe0ZH78dRkad5/O30Z+yOikx211G1QmzDx4
         6BuZqcq4MhozVfUvMJAJGe/0Otr88xXOLn/SLQ/9rstVOxuUXzFoLsClWNtL1VA1MKvj
         FJ4A/64QJ234GoF6jgS3SF/I1atSfpIW4WvV67ssY5PLpEkfJiMcIO3IX/bxfIG+9S//
         1+mrQBLXziww73c+YXDBmT0X6RdbYx+V+khAQnupxLiUy6K85BgbUMWkchVfyR2YdlwV
         ylTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744448578; x=1745053378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcxM14nNo3Z+3rUutFNIH54ijwMGULjVVnVvsuIXthI=;
        b=F6SISQhm3nnUPOzNdf8jDUN5nnu0WT94ksaWUnXHuWnieWygDQpL2Rv/NGcnoOk7Ez
         AIA75FI2hZCD49GSH1MlwTMI3tFcbFW/3fAFEx1Yuvl5EjBoVy2wXsg2S8CglUE21/t3
         cfKBIqCIaYMWHptnKQbSbsNIK5xWOYTwagpYAzi65E8RB4SJslgOayczVnJtSS6sdoNa
         Fyy/XG0JJZOyklsNsPcq8o/5ZQ0mZa4rsKgZcSv3sy3S2keYnZOGFz270LXWT+Eu+JuC
         CU2amxFgT2jLnNJQ52qg+ovO5bwCiPYcwIdJH9ak1aJcTO0Hwqv0JGJRBv7+/hmJoi5k
         VpAw==
X-Forwarded-Encrypted: i=1; AJvYcCUF/ddYEPtRjtyUoMCZHIJ1qUyv3Om9qNYEzYL/zewwPu+czApP+xv0gW1qjUl8fdtujUJ+/l4sz9trPOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVkbHRhGtW+oARcKCIf4vF41qoL85JhS/uhL3AJoRPU81K2Su
	Lbi+hqtFiB3BnsUMA/o+kdGKe2M1LOcVpp5NcJHxw4aWzTH5IWyPDypUASEO+9VeYYLQ7Q/2q7h
	gUQ1Pi4PeU8cFlQ3czqQzTBGGbv0=
X-Gm-Gg: ASbGnct16r7+52Rb8JG6dc+7EABpH5O+cH4/tQcd9JolLysdKSiIh7MGWCsBfphL2Tv
	F8iV/w9doMu+0t2KEM6x6+42es61ac3CvsEsnPDTQJDy0TjlmyIrngzwUyPnUxN1LabeVKfa+RG
	bQZTMxtSL+p33o7f7HdYHXoA==
X-Google-Smtp-Source: AGHT+IFKEHm38FW1BLZY43Uv5Acmmj03PHFFGggtglzAfaW2DUquwBcB+ek/HbM4yTVcIwweOt3Z3CTvzGnfNUr3yPM=
X-Received: by 2002:a05:6102:b15:b0:4bb:db41:3b6c with SMTP id
 ada2fe7eead31-4c9e4f1210emr4606535137.12.1744448578282; Sat, 12 Apr 2025
 02:02:58 -0700 (PDT)
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
 <CAGsJ_4zYV78RV+9a13Tyy2ykTDYMH_-ePP_ESEedGqb_LqBkeg@mail.gmail.com> <97612A28-8654-46C1-A2AA-C953C7EAAE4E@nvidia.com>
In-Reply-To: <97612A28-8654-46C1-A2AA-C953C7EAAE4E@nvidia.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 12 Apr 2025 21:02:47 +1200
X-Gm-Features: ATxdqUEIwclTDxyLrLgUY4k55kLkOb5lByl0eDFeGugzaoZDeukHbu7lBF_OIBU
Message-ID: <CAGsJ_4yyR6X+rjkCvD-SK6Be=z+FpEUBg5CSiJnxMaPUiD+vqw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	akpm@linux-foundation.org, willy@infradead.org, ryan.roberts@arm.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:44=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 11 Apr 2025, at 7:51, Barry Song wrote:
>
> > On Fri, Apr 11, 2025 at 4:42=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 11.04.25 03:20, Baolin Wang wrote:
> >>>
> >>>
> >>> On 2025/4/11 05:56, Barry Song wrote:
> >>>> On Fri, Apr 11, 2025 at 3:13=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrot=
e:
> >>>>>
> >>>>> On 10 Apr 2025, at 6:29, Barry Song wrote:
> >>>>>
> >>>>>> On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
> >>>>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 2025/4/10 16:14, Barry Song wrote:
> >>>>>>>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
> >>>>>>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>>>>>
> >>>>>>>>> When investigating performance issues during file folio unmap, =
I noticed some
> >>>>>>>>> behavioral differences in handling non-PMD-sized folios and PMD=
-sized folios.
> >>>>>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed=
() to mark the
> >>>>>>>>> folio as having seen activity, but this is not done for PMD-siz=
ed folios.
> >>>>>>>>>
> >>>>>>>>> This might not cause obvious issues, but a potential problem co=
uld be that,
> >>>>>>>>> it might lead to more frequent refaults of PMD-sized file folio=
s under memory
> >>>>>>>>> pressure. Therefore, I am unsure whether the folio_mark_accesse=
d() should be
> >>>>>>>>> added for PMD-sized file folios?
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>>>>> ---
> >>>>>>>>>     mm/huge_memory.c | 4 ++++
> >>>>>>>>>     1 file changed, 4 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>>>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
> >>>>>>>>> --- a/mm/huge_memory.c
> >>>>>>>>> +++ b/mm/huge_memory.c
> >>>>>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb,=
 struct vm_area_struct *vma,
> >>>>>>>>>                                    zap_deposited_table(tlb->mm,=
 pmd);
> >>>>>>>>>                            add_mm_counter(tlb->mm, mm_counter_f=
ile(folio),
> >>>>>>>>>                                           -HPAGE_PMD_NR);
> >>>>>>>>> +
> >>>>>>>>> +                       if (flush_needed && pmd_young(orig_pmd)=
 &&
> >>>>>>>>> +                           likely(vma_has_recency(vma)))
> >>>>>>>>> +                               folio_mark_accessed(folio);
> >>>>>>>>
> >>>>>>>> Acked-by: Barry Song <baohua@kernel.org>
> >>>>>>>
> >>>>>>> Thanks.
> >>>>>>>
> >>>>>>>> I also came across an interesting observation: on a memory-limit=
ed system,
> >>>>>>>> demoting unmapped file folios in the LRU=E2=80=94specifically wh=
en their mapcount
> >>>>>>>> drops from 1 to 0=E2=80=94can actually improve performance.
> >>>>>>>
> >>>>>>> These file folios are used only once? Can folio_set_dropbehind() =
be used
> >>>>>>> to optimize it, which can avoid the LRU activity movement in
> >>>>>>> folio_mark_accessed()?
> >>>>>>
> >>>>>> For instance, when a process, such as a game, just exits, it can b=
e expected
> >>>>>> that it won't be used again in the near future. As a result, demot=
ing
> >>>>>> its previously
> >>>>>> unmapped file pages can improve performance.
> >>>>>
> >>>>> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND=
_READ
> >>>>> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
> >>>>> Will it work?
> >>>>
> >>>> Actually took a more aggressive approach and observed good performan=
ce
> >>>> improvements on phones. After zap_pte_range() called remove_rmap(),
> >>>> the following logic was added:
> >>>>
> >>>> if (file_folio && !folio_mapped())
> >>>>       deactivate_file_folio();
> >>>>
> >>>> This helps file folios from exiting processes get reclaimed more qui=
ckly
> >>>> during the MGLRU's min generation scan while the folios are probably
> >>>> in max gen.
> >>>>
> >>>> I'm not entirely sure if this is universally applicable or worth sub=
mitting as
> >>>> a patch.
> >>>
> >>> IMHO, I'm afraid this is not universally applicable. Although these f=
ile
> >>> folios have been unmapped, it's not certain that they won't be access=
ed
> >>> again. These file folios might be remapped and accessed again soon, o=
r
> >>> accessed through read()/write() operations using a file descriptor.
> >>>
> >>> I agree with Zi's suggestion. Using some kind of madvise() hint to ma=
rk
> >>> these file folios as those that won't be accessed after being unmappe=
d,
> >>> seems can work?
> >>
> >> Is that similar to MADV_COLD before unmap?
> >
> > I'm not convinced that's the case. Although the previous app exits,
> > its exclusive
> > folios aren't useful to the newly launched app. For instance, Firefox's=
 text and
> > other exclusive file-backed folios have no relevance to LibreOffice. If=
 a user
> > terminates Firefox and then launches LibreOffice, marking Firefox=E2=80=
=99s young
> > PTE-mapped folios as accessed=E2=80=94thus activating them in the LRU=
=E2=80=94is
> > meaningless for LibreOffice.
>
> In terms of marking VMAs, can you do it in exit_mmap() by passing a new
> parameter, like bool dying_vma, to unmap_vmas()? So that unmap_vmas()
> can change exclusive file-backed VMAs to !vma_has_recency() to avoid
> folio_mark_accessed().

Good idea. Alternatively, we could infer the process's exiting or OOM-reape=
d
state from its mm struct, removing the need for a new parameter as the RFC
I sent just now:

https://lore.kernel.org/linux-mm/20250412085852.48524-1-21cnbao@gmail.com/

>
>
> Best Regards,
> Yan, Zi

Thanks
Barry
