Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69775230BFF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406231; cv=none; b=c2yGo7biJKIRfxE6q/ngpPNxXCkBzmHB+l27JrL2DFo5cHep7aculMumOlH+y7SOVW/JQOdgrLY/uUy6v1Rm8ZpiVPsOVv9/fdTGjZP/8WaQob3S/KzzJjlVqHTOW6IAJqgx+uctlUYOXEVQ/irWA62GVvMspfG6/HihbYVRsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406231; c=relaxed/simple;
	bh=E66FO4TlDEMveG8Mp/qvgJsOs0+3QC7n9o4L6TQe5yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VaNV66rhQm7MK7LJepVs5aF3xbqDoOAN8uUaMAzPL0mGJumppkUu9UmR5U3yJfG4T9DP920sV/jq2DKaugI2rEY+7PT7d99PbimtrMUMkmUxufxVUqGuJQ8hlisin8io4Tku4H+6HjrIuePIAJgCMU846RyRlsLSBsk3DLVXGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYwnn9oG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYwnn9oG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-addda47ebeaso321703666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750406228; x=1751011028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbjPmpN4k4kj61gbTaIz/v/P03tQOZqrCSncxNOLHhc=;
        b=WYwnn9oGggNGT4nr71o4bola0aZP22pwwZQK30ba79HbnEvlwpr6B+Spso0ZHSac4o
         eV4/w3arh3XDQSdo17VCgH2maY/4gXjebZrk7D05//keveqDu5r0NMblOwDZETGkEcFy
         6B9CExSvt2xzy705AtFlfxpN1nTJ+Sm/rBbV1QYIdpRChvo0NX/WsiEg02Dosj3e1Z6X
         pyu97eM3QO1pigW8JWkEcuZqBWium02LMZGWuYMLnsCoDucukamum5b7CftOJ3/ZNCyz
         8LxMuwwlsMnFBTOZhWqs5/ydrz9UsurI8+iDSZ9+ExAFju/4T+a8+tvuhsa3nq/dVk8e
         0j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406228; x=1751011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbjPmpN4k4kj61gbTaIz/v/P03tQOZqrCSncxNOLHhc=;
        b=EiwsjuMxBOWfmfsbOb6NnrKwJwtrwqLDTbg9I3bDd8G3ijTlir4+OsBZAwzX2FdYpy
         Aoa86jDKDXp+PaoFxk04p3rEhSbBdPeLaoTnSYaG4VpvlxPYyYzLTGZcMw0LCVmSyqyw
         QgOtF4rxfD9azEz9HSuxJxtQmC98mpkWNZnzV1xarSO6YpLPclms6gIrMxcyB3OSF3fY
         0g5KnvK4kCJ1PzOXO/Y7Y8jeg7P2NsitiYU9XC8rI617stp1FEh2rhwEtFI2edgwijT/
         fsgqrLdCtVAbyrCyYULl1w2gfDkqa9z8A9q7Ign2zaxPueZvMqueS3gfL7QpGXr4VPTD
         BRzg==
X-Forwarded-Encrypted: i=1; AJvYcCXocNGZuOIjVqSg0LoqFn8F/yG+agWtD0Z3stCoxX7hIeJ/Ha1xQtPMtH+pQmcBIYSR+blTsYag3whTZRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kApEGxKVI678QxaTEU4ea6Tdr7nVCgPeKXyD7Q6WPwmR39En
	+JB/eosTzwk2clKb8X8nrHTDFUmm3QIeXVAsMN8aoOUBnBcYL2WJJ4/iPlqXCgO8Vu2KA0CTdri
	L1V9stpiEJ/7UkaunyRQdQfRXp054ueW/eyxH
X-Gm-Gg: ASbGncuzgrmO5q7md7/upg0la1bMdtJk6TB2IqrkW8DDqlS4rOdnNDA9jECRwpskrGd
	gGuHEIU2g6HiSrdZojUEfjtIw1Bz5CyG0qYGPzIQKQ58sRaDuwlHKgUDFK9w0m2pfl+9S2LfBDX
	6dWlrDwKIDkYsdhP+8NQtNH8Z1BXC3BkTVBzvkFlv41/8=
X-Google-Smtp-Source: AGHT+IF+6VAuUMy2Nvt0MZJBmp7cJebHTpZAwXCTt5iJxnNBDyghc8/sLzCVmrIXjVnN1BmUqSI7tUkqqvgBuxrWVds=
X-Received: by 2002:a17:906:d7e3:b0:ad5:1bfd:30d2 with SMTP id
 a640c23a62f3a-ae057c1b50fmr165637966b.55.1750406227316; Fri, 20 Jun 2025
 00:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
 <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com> <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
In-Reply-To: <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Fri, 20 Jun 2025 15:56:55 +0800
X-Gm-Features: AX0GCFvm3O18WCJzWjEGbk5vI8Iresz2_k3HB_QhB7hJ_3Y61_BnRY6cB-c-gac
Message-ID: <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org
Cc: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com, 
	ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

May I follow up: Does this patch require any further changes? Is it
now meeting the merging criteria?

--

Thanks,
Xavier

On Thu, Jun 5, 2025 at 3:16=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 05/06/2025 06:54, Xavier Xia wrote:
> > Hi Ryan,
> >
> > Thank you for your review, and for reproducing and verifying the test c=
ases.
> > I am using a Gmail email to reply to your message, hoping you can recei=
ve it.
> > Please check the details below.
>
> Ahh yes, this arrived in my inbox without issue!
>
> Thanks,
> Ryan
>
>
> >
> >
> >
> > On Thu, Jun 5, 2025 at 11:20=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
> >> On 10/05/2025 13:59, Xavier Xia wrote:
> >>> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockl=
ess
> >>> function by adding early termination logic. It checks if the dirty an=
d
> >>> young bits of orig_pte are already set and skips redundant bit-settin=
g
> >>> operations during the loop. This reduces unnecessary iterations and
> >>> improves performance.
> >>>
> >>> In order to verify the optimization performance, a test function has =
been
> >>> designed. The function's execution time and instruction statistics ha=
ve
> >>> been traced using perf, and the following are the operation results o=
n a
> >>> certain Qualcomm mobile phone chip:
> >>>
> >>> Test Code:
> >>
> >> nit: It would have been good to include the source for the whole progr=
am,
> >> including #includes and the main() function to make it quicker for oth=
ers to get
> >> up and running.
> >
> > OK, I will pay attention to it in the future. This test case is quite
> > simple, so I didn't add it.
> >
> >>
> >>>
> >>>       #define PAGE_SIZE 4096
> >>>       #define CONT_PTES 16
> >>>       #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >>>       #define YOUNG_BIT 8
> >>>       void rwdata(char *buf)
> >>>       {
> >>>               for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >>>                       buf[i] =3D 'a';
> >>>                       volatile char c =3D buf[i];
> >>>               }
> >>>       }
> >>>       void clear_young_dirty(char *buf)
> >>>       {
> >>>               if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >>>                       perror("madvise free failed");
> >>>                       free(buf);
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>>               if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >>>                       perror("madvise free failed");
> >>>                       free(buf);
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>
> >> nit: MADV_FREE clears both young and dirty so I don't think MADV_COLD =
is
> >> required? (MADV_COLD only clears young I think?)
> >
> > You're right, MADV_COLD here can probably be removed.
> >
> >>
> >>>       }
> >>>       void set_one_young(char *buf)
> >>>       {
> >>>               for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * =
PAGE_SIZE) {
> >>>                       volatile char c =3D buf[i + YOUNG_BIT * PAGE_SI=
ZE];
> >>>               }
> >>>       }
> >>>
> >>>       void test_contpte_perf() {
> >>>               char *buf;
> >>>               int ret =3D posix_memalign((void **)&buf, CONT_PTES * P=
AGE_SIZE,
> >>>                               TEST_SIZE);
> >>>               if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * P=
AGE_SIZE)) {
> >>>                       perror("posix_memalign failed");
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>>
> >>>               rwdata(buf);
> >>>       #if TEST_CASE2 || TEST_CASE3
> >>>               clear_young_dirty(buf);
> >>>       #endif
> >>>       #if TEST_CASE2
> >>>               set_one_young(buf);
> >>>       #endif
> >>>
> >>>               for (int j =3D 0; j < 500; j++) {
> >>>                       mlock(buf, TEST_SIZE);
> >>>
> >>>                       munlock(buf, TEST_SIZE);
> >>>               }
> >>>               free(buf);
> >>>       }
> >>>
> >>>       Descriptions of three test scenarios
> >>>
> >>> Scenario 1
> >>>       The data of all 16 PTEs are both dirty and young.
> >>>       #define TEST_CASE2 0
> >>>       #define TEST_CASE3 0
> >>>
> >>> Scenario 2
> >>>       Among the 16 PTEs, only the 8th one is young, and there are no =
dirty ones.
> >>>       #define TEST_CASE2 1
> >>>       #define TEST_CASE3 0
> >>>
> >>> Scenario 3
> >>>       Among the 16 PTEs, there are neither young nor dirty ones.
> >>>       #define TEST_CASE2 0
> >>>       #define TEST_CASE3 1
> >>>
> >>> Test results
> >>>
> >>> |Scenario 1         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    37912436160|     18731580031|
> >>> |test time          |         4.2797|          2.2949|
> >>> |overhead of        |               |                |
> >>> |contpte_ptep_get() |         21.31%|           4.80%|
> >>>
> >>> |Scenario 2         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    36701270862|     36115790086|
> >>> |test time          |         3.2335|          3.0874|
> >>> |Overhead of        |               |                |
> >>> |contpte_ptep_get() |         32.26%|          33.57%|
> >>>
> >>> |Scenario 3         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    36706279735|     36750881878|
> >>> |test time          |         3.2008|          3.1249|
> >>> |Overhead of        |               |                |
> >>> |contpte_ptep_get() |         31.94%|          34.59%|
> >>>
> >>> For Scenario 1, optimized code can achieve an instruction benefit of =
50.59%
> >>> and a time benefit of 46.38%.
> >>> For Scenario 2, optimized code can achieve an instruction count benef=
it of
> >>> 1.6% and a time benefit of 4.5%.
> >>> For Scenario 3, since all the PTEs have neither the young nor the dir=
ty
> >>> flag, the branches taken by optimized code should be the same as thos=
e of
> >>> the original code. In fact, the test results of optimized code seem t=
o be
> >>> closer to those of the original code.
> >>
> >> I re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> >>
> >> Scenario 1: reduced to 56% of baseline execution time
> >> Scenario 2: reduced to 89% of baseline execution time
> >> Scenario 3: reduced to 91% of baseline execution time
> >>
> >> I'm pretty amazed that scenario 3 got faster given it is doing the sam=
e number
> >> of loops.
> >
> > It seems that the data you obtained is similar to my test data. For
> > scenario 3, it's
> > faster even when running the same code, which I can't quite figure out =
either.
> >
> >>>
> >>> It can be proven through test function that the optimization for
> >>> contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lo=
ckless
> >>> is similar to that of contpte_ptep_get, the same optimization scheme =
is
> >>> also adopted for it.
> >>>
> >>> Reviewed-by: Barry Song <baohua@kernel.org>
> >>> Signed-off-by: Xavier Xia <xavier_qy@163.com>
> >>
> >> I don't love the extra complexity, but this version is much tidier. Wh=
ile the
> >> micro-benchmark is clearly contrived, it shows that there will be case=
s where it
> >> will be faster and there are no cases where it is slower. This will pr=
obably be
> >> more valuable for 16K kernels because the number of PTEs in a contpte =
block is
> >> 128 there:
> >
> > Okay, this version has been revised multiple times based on your
> > previous feedback
> > and Barry's comments, and it seems much less complicated to understand =
now. :)
> >
> >>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >>> ---
> >>> Changes in v6:
> >>> - Move prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte))) into the cont=
pte_is_consistent(),
> >>>   as suggested by Barry.
> >>> - Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xa=
vier_qy@163.com/
> >>>
> >>> Changes in v5:
> >>> - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpt=
e_is_consistent
> >>>   for improved readability and clarity, as suggested by Barry.
> >>> - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xa=
vier_qy@163.com/
> >>>
> >>> Changes in v4:
> >>> - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better rea=
dability.
> >>> - Refactor contpte_ptep_get_lockless using the same optimization logi=
c, as suggested by Ryan.
> >>> - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.C=
oremail.xavier_qy@163.com/
> >>> ---
> >>>  arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++----=
--
> >>>  1 file changed, 64 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >>> index bcac4f55f9c1..71efe7dff0ad 100644
> >>> --- a/arch/arm64/mm/contpte.c
> >>> +++ b/arch/arm64/mm/contpte.c
> >>> @@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_=
pte)
> >>>       for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>>               pte =3D __ptep_get(ptep);
> >>>
> >>> -             if (pte_dirty(pte))
> >>> +             if (pte_dirty(pte)) {
> >>>                       orig_pte =3D pte_mkdirty(orig_pte);
> >>> -
> >>> -             if (pte_young(pte))
> >>> +                     for (; i < CONT_PTES; i++, ptep++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +                             if (pte_young(pte)) {
> >>> +                                     orig_pte =3D pte_mkyoung(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>> +
> >>> +             if (pte_young(pte)) {
> >>>                       orig_pte =3D pte_mkyoung(orig_pte);
> >>> +                     i++;
> >>> +                     ptep++;
> >>> +                     for (; i < CONT_PTES; i++, ptep++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +                             if (pte_dirty(pte)) {
> >>> +                                     orig_pte =3D pte_mkdirty(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>>       }
> >>>
> >>>       return orig_pte;
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(contpte_ptep_get);
> >>>
> >>> +static inline bool contpte_is_consistent(pte_t pte, unsigned long pf=
n,
> >>> +                                     pgprot_t orig_prot)
> >>> +{
> >>> +     pgprot_t prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >>> +
> >>> +     return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> >>> +                     pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> >>> +}
> >>> +
> >>>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >>>  {
> >>>       /*
> >>> @@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >>>       pgprot_t orig_prot;
> >>>       unsigned long pfn;
> >>>       pte_t orig_pte;
> >>> -     pgprot_t prot;
> >>>       pte_t *ptep;
> >>>       pte_t pte;
> >>>       int i;
> >>> @@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_pte=
p)
> >>>
> >>>       for (i =3D 0; i < CONT_PTES; i++, ptep++, pfn++) {
> >>>               pte =3D __ptep_get(ptep);
> >>> -             prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >>>
> >>> -             if (!pte_valid_cont(pte) ||
> >>> -                pte_pfn(pte) !=3D pfn ||
> >>> -                pgprot_val(prot) !=3D pgprot_val(orig_prot))
> >>> +             if (!contpte_is_consistent(pte, pfn, orig_prot))
> >>>                       goto retry;
> >>>
> >>> -             if (pte_dirty(pte))
> >>> +             if (pte_dirty(pte)) {
> >>>                       orig_pte =3D pte_mkdirty(orig_pte);
> >>> +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +
> >>> +                             if (!contpte_is_consistent(pte, pfn, or=
ig_prot))
> >>> +                                     goto retry;
> >>> +
> >>> +                             if (pte_young(pte)) {
> >>> +                                     orig_pte =3D pte_mkyoung(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>
> >> I considered for a while whether it is safe for contpte_ptep_get_lockl=
ess() to
> >> exit early having not seen every PTE in the contpte block and confirme=
d that
> >> they are all consistent. I eventually concluded that it is, as long as=
 all the
> >> PTEs that it does check are consistent I believe this is fine.
> >
> > So, it looks like my changes here will be okay.
> >
> >>
> >>> +             }
> >>>
> >>> -             if (pte_young(pte))
> >>> +             if (pte_young(pte)) {
> >>>                       orig_pte =3D pte_mkyoung(orig_pte);
> >>> +                     i++;
> >>> +                     ptep++;
> >>> +                     pfn++;
> >>> +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +
> >>> +                             if (!contpte_is_consistent(pte, pfn, or=
ig_prot))
> >>> +                                     goto retry;
> >>> +
> >>> +                             if (pte_dirty(pte)) {
> >>> +                                     orig_pte =3D pte_mkdirty(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>>       }
> >>>
> >>>       return orig_pte;
> >>
>
