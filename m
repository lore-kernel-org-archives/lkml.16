Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B51E515
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744338743; cv=none; b=AWj5oOEIg1gLxYIdMlFnMxHbGAfbeRwToDucBqgno32juoqmVuu9HIRTrUtf38TroWs6b+7UwhCmQoj8Wi4NRzXzhujAKF0nt5Emv90TLYmu2liSjuKYnZ4tGDCkw4LLmEEw6obYbXGANd3NUna7RqEUqZ2cqzxCjyoBHRDvxxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744338743; c=relaxed/simple;
	bh=/hqxGD9W0FgD1JUxPPTz0p/0Ql2HWWia3BMkg5Ue2sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOje3of58RElN0itGJR1Ds99CaE6+90mu4+4mobFVPIyv52QJ6Fh12vxF9xaetY0E72L4ujIshcLVDhOiR76YqNkdHrF0TIlyNLChzI2zlckAsTaRX+Lw14UKg/3Ve3FsR4R8j2MD4jhglkf4Y6F7Z2J3K/UKZqGIK+Du/+NG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI3F3QB3; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI3F3QB3"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5259327a937so700125e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744338741; x=1744943541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oet4xjacdRFK4mL9zn9UPqlVTgqYSPvEuBC6Nv1MA+Y=;
        b=QI3F3QB3oTlLmCj4wfxkj107ekxRz6f0DZ+ihhMs9o9IWtS1lffpyLWim7ynpjeno3
         9WihDKMdgT3ymcmO+RHEm4R8M4LcnvkFLwv4ewtKS/Zu8tIvAZIq3OheFQQPPDQrcRum
         pRZ8foR8nUct7NYtc0ERn2QbypKhWr1WZgTwLx1u5HcyRJ7mlXFjblnxhZZblASzqIx4
         zbkdQ/EhHIkowW3suvFwHSCXqvhcgsS27y4ZRV3pie1F8d01YnH64Z8S2UygBNRvHEaO
         puOcO1c1XfnjCVXpm2XrWT7YwXlEud9hSpFNWtF9Blpo/HRC3hcy9wTV3yyReJu4WYdX
         6+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744338741; x=1744943541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oet4xjacdRFK4mL9zn9UPqlVTgqYSPvEuBC6Nv1MA+Y=;
        b=m4SYxbAIKEmyU1Ekshcbi8KdBMrAAp1HxegJ2/nO1VJh5LnO2pBuIpcy4unRY59KqH
         9JIGq287EGB/Y0w1lT3eikDeN5kn7vr635eAXEe8RYZNj4sjPcPCRj4EbAhZJsrL2wo8
         CK9Ojo+ZPA+Js6bYnfijsbJjtzdOXzsKVU7q7RtB3K+ixhLcfSbpQZLLi0KNv5k9JY0h
         CIXOf8ORzv6r+FYNL4AT706iT+3x2rxdBfEcFshpkfTqpWxBHNdj9lM9mjAq6sYMoXdv
         hWVEJmZhHJspyJ9Z5M7ykDljoEAxvRAG5Okzfr951YLZ0ktWcx8ZvZBfLX/fLkTZ1q+k
         c8jw==
X-Forwarded-Encrypted: i=1; AJvYcCU1aRUpitV3ywDlGXI9or4ayY2lZNekHoO4KtkdWPuWvtDgPEddkYTO0Ve99InsknUXVlGZ2loWX7Tt530=@vger.kernel.org
X-Gm-Message-State: AOJu0YztKdVF9coeQmA4n8Lhw1aZmfmGMhnvIRYrTPXejG7ADj79JdEt
	ILhmiAkiPipDtVizuHLf12NBm1nuZ0Uv16Vp+7J/4jzqv7BMSAWFnXD/BGGJ4+qrP4xeuMX06sH
	8t0YJQNSTbH8CeeovtVkzdnUSg6Y=
X-Gm-Gg: ASbGncv5YsmXbsdzaiLlLSZoW0VIAcEwh50gSxy6mwmFy+O6+fOO5FLF02OUKli8H8p
	tgH6YCXKgzBqCtTe+VQzy3lrLsqEETomkSEukheCIj4evroqxMCBekuYUfvW60A+WTUt4G9Aa3g
	x76gAMReXykfoAn95uTxhZPw==
X-Google-Smtp-Source: AGHT+IFS99NpqnJe3fPiO2Vv75HJy/9VPWWWpqc65/yb2pIMNMR1uoR8eXOmQFl7vyUVhjZU1EnZ5wZh+gKzO+rO5HI=
X-Received: by 2002:a05:6102:3308:b0:4bb:c9bd:8dc5 with SMTP id
 ada2fe7eead31-4c9e4ec0b6amr610595137.3.1744338740694; Thu, 10 Apr 2025
 19:32:20 -0700 (PDT)
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
 <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
In-Reply-To: <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 14:32:09 +1200
X-Gm-Features: ATxdqUEMrypm2hClmam6_ErnN-OnEZ-4nRiV_TqVcIdUvz9QDxN6rk0epTgE5kE
Message-ID: <CAGsJ_4zDG0w4X0WJBZzjO0TedEeA0Su25T8VxWonB3cgP2NvUg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, willy@infradead.org, 
	david@redhat.com, ryan.roberts@arm.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 1:20=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/11 05:56, Barry Song wrote:
> > On Fri, Apr 11, 2025 at 3:13=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >>
> >> On 10 Apr 2025, at 6:29, Barry Song wrote:
> >>
> >>> On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
> >>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/4/10 16:14, Barry Song wrote:
> >>>>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
> >>>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>>
> >>>>>> When investigating performance issues during file folio unmap, I n=
oticed some
> >>>>>> behavioral differences in handling non-PMD-sized folios and PMD-si=
zed folios.
> >>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed() =
to mark the
> >>>>>> folio as having seen activity, but this is not done for PMD-sized =
folios.
> >>>>>>
> >>>>>> This might not cause obvious issues, but a potential problem could=
 be that,
> >>>>>> it might lead to more frequent refaults of PMD-sized file folios u=
nder memory
> >>>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed()=
 should be
> >>>>>> added for PMD-sized file folios?
> >>>>>>
> >>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>> ---
> >>>>>>    mm/huge_memory.c | 4 ++++
> >>>>>>    1 file changed, 4 insertions(+)
> >>>>>>
> >>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
> >>>>>> --- a/mm/huge_memory.c
> >>>>>> +++ b/mm/huge_memory.c
> >>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, st=
ruct vm_area_struct *vma,
> >>>>>>                                   zap_deposited_table(tlb->mm, pmd=
);
> >>>>>>                           add_mm_counter(tlb->mm, mm_counter_file(=
folio),
> >>>>>>                                          -HPAGE_PMD_NR);
> >>>>>> +
> >>>>>> +                       if (flush_needed && pmd_young(orig_pmd) &&
> >>>>>> +                           likely(vma_has_recency(vma)))
> >>>>>> +                               folio_mark_accessed(folio);
> >>>>>
> >>>>> Acked-by: Barry Song <baohua@kernel.org>
> >>>>
> >>>> Thanks.
> >>>>
> >>>>> I also came across an interesting observation: on a memory-limited =
system,
> >>>>> demoting unmapped file folios in the LRU=E2=80=94specifically when =
their mapcount
> >>>>> drops from 1 to 0=E2=80=94can actually improve performance.
> >>>>
> >>>> These file folios are used only once? Can folio_set_dropbehind() be =
used
> >>>> to optimize it, which can avoid the LRU activity movement in
> >>>> folio_mark_accessed()?
> >>>
> >>> For instance, when a process, such as a game, just exits, it can be e=
xpected
> >>> that it won't be used again in the near future. As a result, demoting
> >>> its previously
> >>> unmapped file pages can improve performance.
> >>
> >> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_RE=
AD
> >> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
> >> Will it work?
> >
> > Actually took a more aggressive approach and observed good performance
> > improvements on phones. After zap_pte_range() called remove_rmap(),
> > the following logic was added:
> >
> > if (file_folio && !folio_mapped())
> >      deactivate_file_folio();
> >
> > This helps file folios from exiting processes get reclaimed more quickl=
y
> > during the MGLRU's min generation scan while the folios are probably
> > in max gen.
> >
> > I'm not entirely sure if this is universally applicable or worth submit=
ting as
> > a patch.
>
> IMHO, I'm afraid this is not universally applicable. Although these file
> folios have been unmapped, it's not certain that they won't be accessed
> again. These file folios might be remapped and accessed again soon, or
> accessed through read()/write() operations using a file descriptor.

This might apply to interactive systems such as desktops and Android phones=
.
When an app exits, it's unlikely to be reopened very soon. For
example, Firefox=E2=80=99s
text and other file handles are of no use to LibreOffice. So, if we
can help reclaim
Firefox=E2=80=99s files promptly (rather than promoting them), we may be ab=
le to assist
LibreOffice in getting memory more efficiently.

Imagine a desktop system with limited memory that can only hold either Fire=
fox
or LibreOffice at a time. When Firefox exits, its files are still
relatively "young"
in memory. If they=E2=80=99re marked as recently accessed, it becomes harde=
r to reclaim
Firefox=E2=80=99s exclusive files.

Consider the current LRU list:

active --------------------------------------------------------------------=
>
inactive

firefox files - common .so file - firefox file - common .so file

If we demote Firefox=E2=80=99s files, the LRU could instead look like this:

active --------------------------------------------------------------------=
>
inactive

common .so files - common .so files - firefox files - firefox files

With this arrangement, when launching LibreOffice, the system can quickly
reclaim Firefox's files, rather than spending time evicting the commonly
used .so files that LibreOffice may also need.

>
> I agree with Zi's suggestion. Using some kind of madvise() hint to mark
> these file folios as those that won't be accessed after being unmapped,
> seems can work?

The issue is that userspace doesn=E2=80=99t know why or when it should call
madvise(). From its perspective, it=E2=80=99s simply the app exiting.

But I agree=E2=80=94there are always exceptions to the pattern I described =
above.
Just don't know how to tell the kernel the proper pattern.

Thanks
Barry
