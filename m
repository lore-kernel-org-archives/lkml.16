Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45337083A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134364; cv=none; b=pug9xC3E6IhtQ6Sy7UjHLsLFuQkbvg0YUKhJEXiTW0bFv7Kdjt7C9gG2gLYSf1u/JKWFdlbxoffemSt63rqXtIfZUPi0thC9AtWes1J3IbP9O2KaKpVwhVWRVAvUhZiGBxfK8CYJt587l/fazHbS1K5/0HC6iyeW7ZC2SfO1dbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134364; c=relaxed/simple;
	bh=MpLWPuAzL+yJCf9Fm1hxqGtlv5BHdUFMuUbaod/UDP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duNtHc5qh/AneVsXLjubbi4We9B6T4ntehl7D/gaNgBB3YTZxh7L7shicQ+Dn90EKNyx+MJUZZVfN61HoXpF4kZmaCV5n5cRUEakgeBYQfF7/TfwIggeWB68bN8GFoa52TUqFMI8nuvtwpRBQ5p6p4XfL1meT7BIOSaAAkITxgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzradtG3; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzradtG3"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c32d6ddd50so407914137.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746134361; x=1746739161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWSPVKoDF2DSjIr6FKMML4yzLY983kMFfeYVU0zakEQ=;
        b=LzradtG3CaIKQKRXi8VJ1DWtq9iGz/2BHwwMa6zMUZZSMGZrAuT23FBqfrp402SWaI
         dksRrcQMlnBzRmomJ+w38riP0MNbkEjiDeu5r1kCdtOPdfKKZNXte6EiRTD19TGhEjI4
         b4NMnCuz+Z7pCY0OdKqs69kDSE8rpDx4MPvM4Ozf5ylz1PHl/5sht2dQNDW3pRk1DvN9
         kCxVAE7AjqQSpliLv4x/SqdCvBvzKkPuYh+A6cXfrLLkZCkGV9u4XXMg6nAR+8sRw6A5
         V8ql4QTXfDyIPHOTxQ9CjsFDer8af0TbhF41tnSrEmdNU9dBPsy/RaObmKAyXRC/T8DQ
         oAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746134361; x=1746739161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWSPVKoDF2DSjIr6FKMML4yzLY983kMFfeYVU0zakEQ=;
        b=dz26Bu4qF8Gm4FWZQ2FcOrDjBWF8NZYq83R7vxeu/prOhkPVK/33kblxlJOoEmxcC/
         OD8/RzlcbmmcgGUdmpoWZryt+h8Zfa1hjA6hPQQZLgYBk3TUeoAqbui1dR/ozvHhpRUD
         bJe2Bcu/2wmja6VS2yLSWqJLFAq/i4CBrrYJVCMP6s7BRHNYq8FBhvvycZDEBLygas3e
         rGSfOmpEGcOtQzS9IAGHpSY9P52jdIxU5/yRsfKW34PT4bfalNZDcGg7bJC7KM7Xg38z
         C4uAog0PIzEWN+0mlicj66jMLaJDHZzG4My2Fevd9738bMKZsV4l7KlYB6wN5NjrKNGz
         aakA==
X-Forwarded-Encrypted: i=1; AJvYcCWxky47qJkY/383ox4Oh2ndKpSluoaiHl+PujV/sqR5z/4m0rYXZaFhTf+QpBhR9rbCWxKHU+ZSLcBhUC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1dz4L3tobS3ZdoYR93zh64MJBwNW2TT1KDbHLJ3iBlPyxCHn
	/wyN8duBgBvKD26aAWdWyU9SlyR63Tm/eAk5IGsYXOtEx/lLZ8G4JTD9dcOTJ+o7nmnEIgsElQH
	PjAkGfc9IXlc+mM+cpSjSsyahdDI=
X-Gm-Gg: ASbGncu4YIk5HeMYXa/4CrMszDuzRNmaZHA+dz5k76uzcTMgvS6E8kgOIPm9XQ1Oeb1
	IjOOg1xUXYpdohMIQpON6c9TKcfuqvzBqJ5w4Vfc3e+J/Vi9qPwr+ZW94gCgu6aO31Fi9kbatVA
	6dPHiw1ZiADPslGhYu12x4YA==
X-Google-Smtp-Source: AGHT+IG7gzh8xj+aQyo7V84PruhAGCrDVfDV5+MtNL2tephwGWisSfEc28tPVuI/W+ToXA0UoxjtbWjc9XpqVM6Nl6Y=
X-Received: by 2002:a05:6102:9d7:b0:4da:e629:58c5 with SMTP id
 ada2fe7eead31-4dafb6d37c1mr527425137.23.1746134361200; Thu, 01 May 2025
 14:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com> <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com> <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
 <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com> <CAGsJ_4yGuH4vOFSZM2o3-Nev4DnZmzWKUh7CRXxA2U-FT2W0xA@mail.gmail.com>
 <1a8020d3.1f27.1968bdc27d8.Coremail.xavier_qy@163.com>
In-Reply-To: <1a8020d3.1f27.1968bdc27d8.Coremail.xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 2 May 2025 09:19:09 +1200
X-Gm-Features: ATxdqUHXxDXadmBhfaYD6vygAodsLavItWHiCyY3Xi77Nh4XMyHtuplB65naIH4
Message-ID: <CAGsJ_4zKFiCEUnFjb3qThoM2FG4XCsmeU=JeTLDXjMU2KONu-Q@mail.gmail.com>
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 12:41=E2=80=AFAM Xavier <xavier_qy@163.com> wrote:
>
>
>
> Hi Barry,
>
>
> At 2025-05-01 07:17:36, "Barry Song" <21cnbao@gmail.com> wrote:
> >On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> >>
> >>
> >> Hi all,
> >>
> >>
> >> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wrote:
> >> >On 15/04/2025 09:22, Xavier wrote:
> >> >> This commit optimizes the contpte_ptep_get function by adding early
> >> >>  termination logic. It checks if the dirty and young bits of orig_p=
te
> >> >>  are already set and skips redundant bit-setting operations during
> >> >>  the loop. This reduces unnecessary iterations and improves perform=
ance.
> >> >>
> >> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> >> ---
> >> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> >> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> >> index bcac4f55f9c1..0acfee604947 100644
> >> >> --- a/arch/arm64/mm/contpte.c
> >> >> +++ b/arch/arm64/mm/contpte.c
> >> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm=
, unsigned long addr,
> >> >>  }
> >> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> >> >>
> >> >> +/* Note: in order to improve efficiency, using this macro will mod=
ify the
> >> >> + * passed-in parameters.*/
> >> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> >> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> >> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> >> >> +                            orig_pte =3D pte_mk##flag(orig_pte); \
> >> >> +                            break; \
> >> >> +            } \
> >> >> +    }
> >> >
> >> >I'm really not a fan of this macro, it just obfuscates what is going =
on. I'd
> >> >personally prefer to see the 2 extra loops open coded below.
> >> >
> >> >Or even better, could you provide results comparing this 3 loop versi=
on to the
> >> >simpler approach I suggested previously? If the performance is simila=
r (which I
> >> >expect it will be, especially given Barry's point that your test alwa=
ys ensures
> >> >the first PTE is both young and dirty) then I'd prefer to go with the=
 simpler code.
> >> >
> >>
> >> Based on the discussions in the previous email, two modifications were=
 adopted
> >> and tested, and the results are as follows:
> >>
> >> Modification 1
> >>
> >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> {
> >>         pte_t pte;
> >>         int i;
> >>
> >>         ptep =3D contpte_align_down(ptep);
> >>
> >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>                 pte =3D __ptep_get(ptep);
> >>
> >>                 if (pte_dirty(pte)) {
> >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >>                         if (pte_young(orig_pte))
> >>                                 break;
> >>                 }
> >>
> >>                 if (pte_young(pte)) {
> >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >>                         if (pte_dirty(orig_pte))
> >>                                 break;
> >>                 }
> >>         }
> >>
> >>         return orig_pte;
> >> }
> >>
> >> Modification 2
> >>
> >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> {
> >>         pte_t pte;
> >>         int i;
> >>
> >>         ptep =3D contpte_align_down(ptep);
> >>
> >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>                 pte =3D __ptep_get(ptep);
> >>
> >>                 if (pte_dirty(pte)) {
> >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >>                         for (; i < CONT_PTES; i++, ptep++) {
> >>                                 pte =3D __ptep_get(ptep);
> >>                                 if (pte_young(pte)) {
> >>                                         orig_pte =3D pte_mkyoung(orig_=
pte);
> >>                                         break;
> >>                                 }
> >>                         }
> >>                         break;
> >>                 }
> >>
> >>                 if (pte_young(pte)) {
> >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >>                         i++;
> >>                         ptep++;
> >>                         for (; i < CONT_PTES; i++, ptep++) {
> >>                                 pte =3D __ptep_get(ptep);
> >>                                 if (pte_dirty(pte)) {
> >>                                         orig_pte =3D pte_mkdirty(orig_=
pte);
> >>                                         break;
> >>                                 }
> >>                         }
> >>                         break;
> >>                 }
> >>         }
> >>
> >>         return orig_pte;
> >> }
> >>
> >> Test Code:
> >>
> >> #define PAGE_SIZE 4096
> >> #define CONT_PTES 16
> >> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >> #define YOUNG_BIT 8
> >> void rwdata(char *buf)
> >> {
> >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >>                 buf[i] =3D 'a';
> >>                 volatile char c =3D buf[i];
> >>         }
> >> }
> >> void clear_young_dirty(char *buf)
> >> {
> >>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >>                 perror("madvise free failed");
> >>                 free(buf);
> >>                 exit(EXIT_FAILURE);
> >>         }
> >>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >>                 perror("madvise free failed");
> >>                 free(buf);
> >>                 exit(EXIT_FAILURE);
> >>         }
> >> }
> >> void set_one_young(char *buf)
> >> {
> >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PAGE_SI=
ZE) {
> >>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE];
> >>         }
> >> }
> >>
> >> void test_contpte_perf() {
> >>         char *buf;
> >>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZ=
E, TEST_SIZE);
> >>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZ=
E)) {
> >>                 perror("posix_memalign failed");
> >>                 exit(EXIT_FAILURE);
> >>         }
> >>
> >>         rwdata(buf);
> >> #if TEST_CASE2 || TEST_CASE3
> >>         clear_young_dirty(buf);
> >> #endif
> >> #if TEST_CASE2
> >>         set_one_young(buf);
> >> #endif
> >>
> >>         for (int j =3D 0; j < 500; j++) {
> >>                 mlock(buf, TEST_SIZE);
> >>
> >>                 munlock(buf, TEST_SIZE);
> >>         }
> >>         free(buf);
> >> }
> >> ---
> >>
> >> Descriptions of three test scenarios
> >>
> >> Scenario 1
> >> The data of all 16 PTEs are both dirty and young.
> >> #define TEST_CASE2 0
> >> #define TEST_CASE3 0
> >>
> >> Scenario 2
> >> Among the 16 PTEs, only the 8th one is young, and there are no dirty o=
nes.
> >> #define TEST_CASE2 1
> >> #define TEST_CASE3 0
> >>
> >> Scenario 3
> >> Among the 16 PTEs, there are neither young nor dirty ones.
> >> #define TEST_CASE2 0
> >> #define TEST_CASE3 1
> >>
> >>
> >> Test results
> >>
> >> |Scenario 1         |       Original|  Modification 1|  Modification 2=
|
> >> |-------------------|---------------|----------------|----------------=
|
> >> |instructions       |    37912436160|     18303833386|     18731580031=
|
> >> |test time          |         4.2797|          2.2687|          2.2949=
|
> >> |overhead of        |               |                |                =
|
> >> |contpte_ptep_get() |         21.31%|           4.72%|           4.80%=
|
> >>
> >> |Scenario 2         |       Original|  Modification 1|  Modification 2=
|
> >> |-------------------|---------------|----------------|----------------=
|
> >> |instructions       |    36701270862|     38729716276|     36115790086=
|
> >> |test time          |         3.2335|          3.5732|          3.0874=
|
> >> |Overhead of        |               |                |                =
|
> >> |contpte_ptep_get() |         32.26%|          41.35%|          33.57%=
|
> >>
> >> |Scenario 3         |       Original|  Modification 1|  Modification 2=
|
> >> |-------------------|---------------|----------------|----------------=
|
> >> |instructions       |    36706279735|     38305241759|     36750881878=
|
> >> |test time          |         3.2008|          3.5389|          3.1249=
|
> >> |Overhead of        |               |                |                =
|
> >> |contpte_ptep_get() |         31.94%|          41.30%|          34.59%=
|
> >>
> >>
> >> For Scenario 1, Modification 1 can achieve an instruction count benefi=
t of
> >> 51.72% and a time benefit of 46.99%. Modification 2 can achieve an ins=
truction
> >> benefit of 50.59% and a time benefit of 46.38%.
> >>
> >> For Scenarios 2, Modification 2 can achieve an instruction count benef=
it of
> >> 1.6% and a time benefit of 4.5%. while Modification 1 significantly in=
creases
> >> the instructions and time due to additional conditional checks.
> >>
> >> For Scenario 3, since all the PTEs have neither the young nor the dirt=
y flag,
> >> the branches taken by Modification 1 and Modification 2 should be the =
same as
> >> those of the original code. In fact, the test results of Modification =
2 seem
> >> to be closer to those of the original code. I don't know why there is =
a
> >> performance regression in Modification 1.
> >>
> >> Therefore, I believe modifying the code according to Modification 2 ca=
n bring
> >> maximum benefits. Everyone can discuss whether this approach is accept=
able,
> >> and if so, I will send Patch V4 to proceed with submitting this modifi=
cation.
> >>
> >
> >modification 2 is not correct. if pte0~pte14 are all young and no one
> >is dirty, we are
> >having lots of useless "for (; i < CONT_PTES; i++, ptep++)"
> >
> >                 if (pte_young(pte)) {
> >                         orig_pte =3D pte_mkyoung(orig_pte);
> >                         i++;
> >                         ptep++;
> >                         for (; i < CONT_PTES; i++, ptep++) {
> >                                 pte =3D __ptep_get(ptep);
> >                                 if (pte_dirty(pte)) {
> >                                         orig_pte =3D pte_mkdirty(orig_p=
te);
> >                                         break;
> >                                 }
> >                         }
> >                         break;
> >                 }
> >
>
> I didn't understand which part you referred to when you said there were a=
 lot of
> useless loops. According to the scenario you mentioned, "if pte0~pte14 ar=
e all
> young and no one is dirty", Modification 2 will enter the following branc=
h when
> judging pte0:
>
> if (pte_young(pte)) {
>         orig_pte =3D pte_mkyoung(orig_pte);
>         // The dirty status of pte0 has already been checked, skip it.
>         i++;
>         ptep++;
>         // Then we only need to check whether pte1~pte15 are dirty.
>         for (; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>                 if (pte_dirty(pte)) {
>                         // Exit as soon as a dirty entry is found.
>                         orig_pte =3D pte_mkdirty(orig_pte);
>                         break;
>                 }
>         }
>         // Exit directly here without going through the outer loop again.
>         break;
> }
>
> In this scenario, the total number of judgments in Modification 2 is near=
ly half less
> than that of the original code. I should have understood it correctly, ri=
ght?

You're right=E2=80=94I missed the part where you're also taking a break, ev=
en though
no one is dirty. Based on your data, modification 2 seems to be good.

But I don't quite understand why you are doing
         i++;
         ptep++;
before for (; i < CONT_PTES; i++, ptep++).

it seems to be wrong. if i=3D=3D15, you will get i=3D16. you are skipping
the pte_dirty
check for i=3D=3D15. it is also true for any value between 0 and 15. My
point is that
you should drop it and re-test.

>
>
> --
>
> Thanks,
> Xavier

Thanks
barry
