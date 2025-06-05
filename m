Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB619CC11
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102893; cv=none; b=GDzLSXlbX1SC2fUFRIUF6kbhhMSq5X1F5qEydjKHQ9emqRuwwkssPAoSoPe5VqtrFXYjHyrsnxseATuS7QhF/JZcd40KHEHoBcPGV3aXJt5o6K9y/9L8AOXvV18L7bpC26V49dAhLsRofWlOIlqwrocmYdpvlEPmXc6DKkfJCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102893; c=relaxed/simple;
	bh=Qa6J9H0UkupTLAC5URfShUV2cDgRjGS537rXOE23X5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMDhaWfl3NBTCq/NJeuq4t8NPchZqsQw1OCazpEav1kgcnOkOqHwZDT8S9Z1vRVzccBBhcInSLebXbSxCloRoZwlcqjYUzuuA8C/Fm0KAfTBbhj4Vvcuv4u5AJ5mhR25179RThjVhEDLl8EfDe6O0w10jHHRTLGvA38K3yFOv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhvgiPJO; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhvgiPJO"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52f05bb975bso227362e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102890; x=1749707690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjoW9fqYDbdAgIJcygrRxaRvrAzlodyZzlebWAHe+B0=;
        b=hhvgiPJOy3O6eDEtabXrbv0yNtLUh3eEUQDReGlIlKEL/waYaRnT+dE87dRYJlEX8D
         jFPHMZOkL6L63fEIuaZTTTKIjPUDbjQDbPHEJ+N+zcq2mT0ccydzNy8jeYlEs2tLQdG3
         0XHUb+9WjGsrUlfDNQO1+esy6iezu8JxK5d7+OGCXsvkRtockbxXmwtf5vb+RN93qwm8
         uRLVjAt9A4aothkTD0kPjiKxbx56l+41BubATBewIakTJSN1NLevH/6rOPMTIVyATofC
         C0ZZnStSrq3F+EKf0QltX1h2ryoRh4ziKQMJZxpdt0n70Rk9xuM5N6m51mTMKgDj2Erk
         aXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102890; x=1749707690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjoW9fqYDbdAgIJcygrRxaRvrAzlodyZzlebWAHe+B0=;
        b=PyTtU5Rjf3QD7nAfmgMLQSu+qOMiWUZLmzYmlguqQonHgTj0csCih4c3zyFbrQ7iTv
         2POwrrYHOy5DUxBLhCiE2xO5f3RA2QutS6PzNSC0FdflVtT2S+lYGmYYrpDIJCVxdHfD
         pIjfZ0U8GLlR/1jKyVONlMvXxCftyc9ZWhJJ2t7Rb+LKQlca6Hen08djXI06jTGN1AaM
         BRnbj6hh7utm040i9F4j3l3OeJEKtGaGS6O/l2RsAxZxqEtIn3kklDqbIIBvv0g1u8Z4
         QyAK3+VaRZYrwxs7Fjcszc+oz2sAXvVufnvAbPQW35wIiFy5x7JpSegBlue4vttTq98K
         lCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfFGkmGnAmS2I4J1Gs4QF4qgWJAP1jsG+YmTWFssBoOr36OMqQOzAR7IBMVKWxW5s4OsiwGxSNfK88D6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5lWvlL2EWOl21hOTosxmE8w1kJa5j3hWalNUrrEElUWM1bly
	sM4VETGnuig+L7tYv7KueeQwEP5iRrQD88vv7Yf9j5QiuZwUvzRasiJC1AYnynmdJlajCig5OQn
	kQ6sxuS7lXbtUYVI/aL0YondoCtlIS/E=
X-Gm-Gg: ASbGnctSn1HybYQSHqMjG3UDujwIaZ0tAz/mu4oKnWMRtLUFL9Hyboini4Fngp85ZR/
	L1DVL6wSAxbkqvqUntA9M0VAVMM0sxryXedtlgmDWRDeq+URLlLwEnzSgIPXTVNkeMfZyaF/toO
	R1yBbxCbZ+IipA9XyHF1sVScNZXeEXfRu2g7RkOvBdFrU=
X-Google-Smtp-Source: AGHT+IGHkmhnOe/ChO5I7mBfEFWzYWFhL+wlRB45syXvKYQqTeZmaKk/TDtDJwJhE0PPYIFdmsygYwuPVWhJMdFnqeU=
X-Received: by 2002:a05:6122:32d0:b0:530:72da:d13d with SMTP id
 71dfb90a1353d-530c73159d2mr4234227e0c.1.1749102890022; Wed, 04 Jun 2025
 22:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
In-Reply-To: <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Thu, 5 Jun 2025 13:54:38 +0800
X-Gm-Features: AX0GCFtPY6x3OM3e1kDkzDNs9hUNTSh7pijFHunjo15MxF1T0wx51pniOzvmFXw
Message-ID: <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com, 
	ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com, Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

Thank you for your review, and for reproducing and verifying the test cases=
.
I am using a Gmail email to reply to your message, hoping you can receive i=
t.
Please check the details below.



On Thu, Jun 5, 2025 at 11:20=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 10/05/2025 13:59, Xavier Xia wrote:
> > This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockles=
s
> > function by adding early termination logic. It checks if the dirty and
> > young bits of orig_pte are already set and skips redundant bit-setting
> > operations during the loop. This reduces unnecessary iterations and
> > improves performance.
> >
> > In order to verify the optimization performance, a test function has be=
en
> > designed. The function's execution time and instruction statistics have
> > been traced using perf, and the following are the operation results on =
a
> > certain Qualcomm mobile phone chip:
> >
> > Test Code:
>
> nit: It would have been good to include the source for the whole program,
> including #includes and the main() function to make it quicker for others=
 to get
> up and running.

OK, I will pay attention to it in the future. This test case is quite
simple, so I didn't add it.

>
> >
> >       #define PAGE_SIZE 4096
> >       #define CONT_PTES 16
> >       #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >       #define YOUNG_BIT 8
> >       void rwdata(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >                       buf[i] =3D 'a';
> >                       volatile char c =3D buf[i];
> >               }
> >       }
> >       void clear_young_dirty(char *buf)
> >       {
> >               if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
> >               if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
>
> nit: MADV_FREE clears both young and dirty so I don't think MADV_COLD is
> required? (MADV_COLD only clears young I think?)

You're right, MADV_COLD here can probably be removed.

>
> >       }
> >       void set_one_young(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
> >                       volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
> >               }
> >       }
> >
> >       void test_contpte_perf() {
> >               char *buf;
> >               int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE,
> >                               TEST_SIZE);
> >               if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
> >                       perror("posix_memalign failed");
> >                       exit(EXIT_FAILURE);
> >               }
> >
> >               rwdata(buf);
> >       #if TEST_CASE2 || TEST_CASE3
> >               clear_young_dirty(buf);
> >       #endif
> >       #if TEST_CASE2
> >               set_one_young(buf);
> >       #endif
> >
> >               for (int j =3D 0; j < 500; j++) {
> >                       mlock(buf, TEST_SIZE);
> >
> >                       munlock(buf, TEST_SIZE);
> >               }
> >               free(buf);
> >       }
> >
> >       Descriptions of three test scenarios
> >
> > Scenario 1
> >       The data of all 16 PTEs are both dirty and young.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 0
> >
> > Scenario 2
> >       Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
> >       #define TEST_CASE2 1
> >       #define TEST_CASE3 0
> >
> > Scenario 3
> >       Among the 16 PTEs, there are neither young nor dirty ones.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 1
> >
> > Test results
> >
> > |Scenario 1         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    37912436160|     18731580031|
> > |test time          |         4.2797|          2.2949|
> > |overhead of        |               |                |
> > |contpte_ptep_get() |         21.31%|           4.80%|
> >
> > |Scenario 2         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36701270862|     36115790086|
> > |test time          |         3.2335|          3.0874|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         32.26%|          33.57%|
> >
> > |Scenario 3         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36706279735|     36750881878|
> > |test time          |         3.2008|          3.1249|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         31.94%|          34.59%|
> >
> > For Scenario 1, optimized code can achieve an instruction benefit of 50=
.59%
> > and a time benefit of 46.38%.
> > For Scenario 2, optimized code can achieve an instruction count benefit=
 of
> > 1.6% and a time benefit of 4.5%.
> > For Scenario 3, since all the PTEs have neither the young nor the dirty
> > flag, the branches taken by optimized code should be the same as those =
of
> > the original code. In fact, the test results of optimized code seem to =
be
> > closer to those of the original code.
>
> I re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
>
> Scenario 1: reduced to 56% of baseline execution time
> Scenario 2: reduced to 89% of baseline execution time
> Scenario 3: reduced to 91% of baseline execution time
>
> I'm pretty amazed that scenario 3 got faster given it is doing the same n=
umber
> of loops.

It seems that the data you obtained is similar to my test data. For
scenario 3, it's
faster even when running the same code, which I can't quite figure out eith=
er.

> >
> > It can be proven through test function that the optimization for
> > contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lock=
less
> > is similar to that of contpte_ptep_get, the same optimization scheme is
> > also adopted for it.
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > Signed-off-by: Xavier Xia <xavier_qy@163.com>
>
> I don't love the extra complexity, but this version is much tidier. While=
 the
> micro-benchmark is clearly contrived, it shows that there will be cases w=
here it
> will be faster and there are no cases where it is slower. This will proba=
bly be
> more valuable for 16K kernels because the number of PTEs in a contpte blo=
ck is
> 128 there:

Okay, this version has been revised multiple times based on your
previous feedback
and Barry's comments, and it seems much less complicated to understand now.=
 :)

>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
>
> > ---
> > Changes in v6:
> > - Move prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte))) into the contpt=
e_is_consistent(),
> >   as suggested by Barry.
> > - Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xavi=
er_qy@163.com/
> >
> > Changes in v5:
> > - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_=
is_consistent
> >   for improved readability and clarity, as suggested by Barry.
> > - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavi=
er_qy@163.com/
> >
> > Changes in v4:
> > - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better reada=
bility.
> > - Refactor contpte_ptep_get_lockless using the same optimization logic,=
 as suggested by Ryan.
> > - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Cor=
email.xavier_qy@163.com/
> > ---
> >  arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++------
> >  1 file changed, 64 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index bcac4f55f9c1..71efe7dff0ad 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >       for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >               pte =3D __ptep_get(ptep);
> >
> > -             if (pte_dirty(pte))
> > +             if (pte_dirty(pte)) {
> >                       orig_pte =3D pte_mkdirty(orig_pte);
> > -
> > -             if (pte_young(pte))
> > +                     for (; i < CONT_PTES; i++, ptep++) {
> > +                             pte =3D __ptep_get(ptep);
> > +                             if (pte_young(pte)) {
> > +                                     orig_pte =3D pte_mkyoung(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> > +
> > +             if (pte_young(pte)) {
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> > +                     i++;
> > +                     ptep++;
> > +                     for (; i < CONT_PTES; i++, ptep++) {
> > +                             pte =3D __ptep_get(ptep);
> > +                             if (pte_dirty(pte)) {
> > +                                     orig_pte =3D pte_mkdirty(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> >       }
> >
> >       return orig_pte;
> >  }
> >  EXPORT_SYMBOL_GPL(contpte_ptep_get);
> >
> > +static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
> > +                                     pgprot_t orig_prot)
> > +{
> > +     pgprot_t prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> > +
> > +     return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> > +                     pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> > +}
> > +
> >  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >  {
> >       /*
> > @@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >       pgprot_t orig_prot;
> >       unsigned long pfn;
> >       pte_t orig_pte;
> > -     pgprot_t prot;
> >       pte_t *ptep;
> >       pte_t pte;
> >       int i;
> > @@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >
> >       for (i =3D 0; i < CONT_PTES; i++, ptep++, pfn++) {
> >               pte =3D __ptep_get(ptep);
> > -             prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >
> > -             if (!pte_valid_cont(pte) ||
> > -                pte_pfn(pte) !=3D pfn ||
> > -                pgprot_val(prot) !=3D pgprot_val(orig_prot))
> > +             if (!contpte_is_consistent(pte, pfn, orig_prot))
> >                       goto retry;
> >
> > -             if (pte_dirty(pte))
> > +             if (pte_dirty(pte)) {
> >                       orig_pte =3D pte_mkdirty(orig_pte);
> > +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> > +                             pte =3D __ptep_get(ptep);
> > +
> > +                             if (!contpte_is_consistent(pte, pfn, orig=
_prot))
> > +                                     goto retry;
> > +
> > +                             if (pte_young(pte)) {
> > +                                     orig_pte =3D pte_mkyoung(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
>
> I considered for a while whether it is safe for contpte_ptep_get_lockless=
() to
> exit early having not seen every PTE in the contpte block and confirmed t=
hat
> they are all consistent. I eventually concluded that it is, as long as al=
l the
> PTEs that it does check are consistent I believe this is fine.

So, it looks like my changes here will be okay.

>
> > +             }
> >
> > -             if (pte_young(pte))
> > +             if (pte_young(pte)) {
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> > +                     i++;
> > +                     ptep++;
> > +                     pfn++;
> > +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> > +                             pte =3D __ptep_get(ptep);
> > +
> > +                             if (!contpte_is_consistent(pte, pfn, orig=
_prot))
> > +                                     goto retry;
> > +
> > +                             if (pte_dirty(pte)) {
> > +                                     orig_pte =3D pte_mkdirty(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> >       }
> >
> >       return orig_pte;
>
