Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205B1FC8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746667787; cv=none; b=VCkxDG/CSFRfeaYisaVsA3bvt/GKbVvGI5llYdbforF1FkGrOZqxz8HEBLByXjgBEL2Z/jcLQDgZ4iZtcKLpDUQ46RiWTkz37Dq4wL3EGkiM1N44T9qXNSo3vPmdppPwPMsDs3gOpklRdffegZbSG9rHU2YczwK3sJUqPiTcXwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746667787; c=relaxed/simple;
	bh=Iqn3M5EpsDxeYdudGFInKdgRj1UAJ3z04G2Ef3bLbPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jS3N5bWnV3Y+QoBN6J0ZstcpxtIjK1iB5sHBY2YVRluUUEWLVnkUZoiDdZoCDthAgORGmXVs65Taw4Q9s2gT9oCud01cLvvOM8BiKYJtDXE9/yr3OMtGgcFOy54yLpl+n7+rdpXnhICcl0/bsoGn8K5Ape2PyARv6Qq4RqYqTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcCHogtF; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcCHogtF"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-527b70bd90dso174604e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 18:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746667784; x=1747272584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVJzNTCKEauhBAcQiyH5AThCTr+uy9aWK1SGxWCuAN0=;
        b=dcCHogtFm7Tt4HarE1OeMqeMTCvUquRYcN+kDKC6QzTqm8Zy2m9naMnZ5s+4V20jB5
         o1sonk9J5T2GFAWu/+kx7fmSwpVJunQ17RXMdFj3GdoVW3WUHOJdl/6lchkP4JEOAoZK
         vt80h28Go3VWUjz3sILdMcqNQnfQCDBCJ3VXCTyG67bVouoMTaB6rSiNbLVGRMra2w6t
         93OoDwkRQ0emcF4B23CQp4Es1v+70OKiNyn9N/QsXm1Z/lNqQmk4bnKjKZ56DM7SM00a
         7rVbdI9t0F1kvi7L7mxO+w5PR5bNcaTvr8TRP4m2Ns8XP2QdboBD7k1fRo/eIlwOhuRP
         MyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746667784; x=1747272584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVJzNTCKEauhBAcQiyH5AThCTr+uy9aWK1SGxWCuAN0=;
        b=UMIZqQKXVz+3eBjS+SpkTmxOSKvFBg+SqJbkongZGH7bbGSHpFWO53G/B6V0xjkVen
         coQevnIgeBpFGiJAmQwVLBRU/rl//1rvZ+y8NLYCfO7Zk1XL8hzXjNjj2yEK5SDHh2iK
         OrkjH6UKMyVZwESePRiLmG0iUdFWwYTio85z5zg/tTwBeBz2RGrP/RhuKPa0arPuVjUm
         PwM9LafqPtxZdVe1hwf6r+kfrZG3EErlTomaxJD6SirzADo/CZBL0czLOXiiujL7iKjK
         yKKSHDTM+yiLefL82k+1CV7oe/YQnQ8GQ5giG/uofVC22reJDGtwdNIRizKSP+B7gXFP
         VEyw==
X-Forwarded-Encrypted: i=1; AJvYcCX6nDO1HWFeY1zPZn/uuoTHpzrhpBZwWXSAjYXi5j1N+JoRLACIDYDcHEPHUZlILywvOMppfvy5plDApYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq30WuIhbYtzY6PENyYPSEw5QOKx5x7h1B8gzdGd0tKUYesMt6
	jmKzE5WD69wjitp8AxSrHpYznxVixcUEM7q91t85QTT7amOcA6BxF/X8gapzhF3jzaLS4yc4Aav
	yLojk0Vka5iFgvPU9D6Sh7oFJmT8=
X-Gm-Gg: ASbGncvPJidIuCLRDhW02L2BXoKaKCgyn03u+meZjnS6CfW7kY85hbJeJ5g534HlnAA
	Asy+2Wj4bLx8HHg7Wzc6TufaCY4FpolXdCoYpp0ym8OPOuuPzxsfKscGUS3WPQBSLtca0aS2yxt
	IwoBLXWO9CLvyYf+saTyAzhg==
X-Google-Smtp-Source: AGHT+IHgStb+NWeETA2WAAJKh7FpoD/R+H14jNrUYPJYK4dDnHHCkuB7EbVeH/lxQLNHjnZkeqV2P50przmWRQHomps=
X-Received: by 2002:a05:6122:168c:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-52c44224230mr1289143e0c.11.1746667783964; Wed, 07 May 2025
 18:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com> <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com> <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
 <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com> <CAGsJ_4yGuH4vOFSZM2o3-Nev4DnZmzWKUh7CRXxA2U-FT2W0xA@mail.gmail.com>
 <1a8020d3.1f27.1968bdc27d8.Coremail.xavier_qy@163.com> <CAGsJ_4zKFiCEUnFjb3qThoM2FG4XCsmeU=JeTLDXjMU2KONu-Q@mail.gmail.com>
 <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com> <5a98b8dc.755.1969929a1ea.Coremail.xavier_qy@163.com>
In-Reply-To: <5a98b8dc.755.1969929a1ea.Coremail.xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 8 May 2025 13:29:30 +1200
X-Gm-Features: ATxdqUFhlyl8SqQgJ0lXPoL-pbd7ZQNqvTin0Pnx-17OQStXuYTz0eR2gvvxI68
Message-ID: <CAGsJ_4wUZrxqdzObpEk_gpcHEO6e75ai=8q-fsv4eXN2wNEbOw@mail.gmail.com>
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 2:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:

> At 2025-05-02 05:32:50, "Barry Song" <21cnbao@gmail.com> wrote:
> >On Fri, May 2, 2025 at 9:19=E2=80=AFAM Barry Song <21cnbao@gmail.com> wr=
ote:
> >>
> >> On Fri, May 2, 2025 at 12:41=E2=80=AFAM Xavier <xavier_qy@163.com> wro=
te:
> >> >
> >> >
> >> >
> >> > Hi Barry,
> >> >
> >> >
> >> > At 2025-05-01 07:17:36, "Barry Song" <21cnbao@gmail.com> wrote:
> >> > >On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> =
wrote:
> >> > >>
> >> > >>
> >> > >> Hi all,
> >> > >>
> >> > >>
> >> > >> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wro=
te:
> >> > >> >On 15/04/2025 09:22, Xavier wrote:
> >> > >> >> This commit optimizes the contpte_ptep_get function by adding =
early
> >> > >> >>  termination logic. It checks if the dirty and young bits of o=
rig_pte
> >> > >> >>  are already set and skips redundant bit-setting operations du=
ring
> >> > >> >>  the loop. This reduces unnecessary iterations and improves pe=
rformance.
> >> > >> >>
> >> > >> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> > >> >> ---
> >> > >> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> >> > >> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >> > >> >>
> >> > >> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> > >> >> index bcac4f55f9c1..0acfee604947 100644
> >> > >> >> --- a/arch/arm64/mm/contpte.c
> >> > >> >> +++ b/arch/arm64/mm/contpte.c
> >> > >> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struc=
t *mm, unsigned long addr,
> >> > >> >>  }
> >> > >> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> >> > >> >>
> >> > >> >> +/* Note: in order to improve efficiency, using this macro wil=
l modify the
> >> > >> >> + * passed-in parameters.*/
> >> > >> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> >> > >> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> >> > >> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> >> > >> >> +                            orig_pte =3D pte_mk##flag(orig_pt=
e); \
> >> > >> >> +                            break; \
> >> > >> >> +            } \
> >> > >> >> +    }
> >> > >> >
> >> > >> >I'm really not a fan of this macro, it just obfuscates what is g=
oing on. I'd
> >> > >> >personally prefer to see the 2 extra loops open coded below.
> >> > >> >
> >> > >> >Or even better, could you provide results comparing this 3 loop =
version to the
> >> > >> >simpler approach I suggested previously? If the performance is s=
imilar (which I
> >> > >> >expect it will be, especially given Barry's point that your test=
 always ensures
> >> > >> >the first PTE is both young and dirty) then I'd prefer to go wit=
h the simpler code.
> >> > >> >
> >> > >>
> >> > >> Based on the discussions in the previous email, two modifications=
 were adopted
> >> > >> and tested, and the results are as follows:
> >> > >>
> >> > >> Modification 1
> >> > >>
> >> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> > >> {
> >> > >>         pte_t pte;
> >> > >>         int i;
> >> > >>
> >> > >>         ptep =3D contpte_align_down(ptep);
> >> > >>
> >> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >> > >>                 pte =3D __ptep_get(ptep);
> >> > >>
> >> > >>                 if (pte_dirty(pte)) {
> >> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >> > >>                         if (pte_young(orig_pte))
> >> > >>                                 break;
> >> > >>                 }
> >> > >>
> >> > >>                 if (pte_young(pte)) {
> >> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >>                         if (pte_dirty(orig_pte))
> >> > >>                                 break;
> >> > >>                 }
> >> > >>         }
> >> > >>
> >> > >>         return orig_pte;
> >> > >> }
> >> > >>
> >> > >> Modification 2
> >> > >>
> >> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> > >> {
> >> > >>         pte_t pte;
> >> > >>         int i;
> >> > >>
> >> > >>         ptep =3D contpte_align_down(ptep);
> >> > >>
> >> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >> > >>                 pte =3D __ptep_get(ptep);
> >> > >>
> >> > >>                 if (pte_dirty(pte)) {
> >> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >>                                 pte =3D __ptep_get(ptep);
> >> > >>                                 if (pte_young(pte)) {
> >> > >>                                         orig_pte =3D pte_mkyoung(=
orig_pte);
> >> > >>                                         break;
> >> > >>                                 }
> >> > >>                         }
> >> > >>                         break;
> >> > >>                 }
> >> > >>
> >> > >>                 if (pte_young(pte)) {
> >> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >>                         i++;
> >> > >>                         ptep++;
> >> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >>                                 pte =3D __ptep_get(ptep);
> >> > >>                                 if (pte_dirty(pte)) {
> >> > >>                                         orig_pte =3D pte_mkdirty(=
orig_pte);
> >> > >>                                         break;
> >> > >>                                 }
> >> > >>                         }
> >> > >>                         break;
> >> > >>                 }
> >> > >>         }
> >> > >>
> >> > >>         return orig_pte;
> >> > >> }
> >> > >>
> >> > >> Test Code:
> >> > >>
> >> > >> #define PAGE_SIZE 4096
> >> > >> #define CONT_PTES 16
> >> > >> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >> > >> #define YOUNG_BIT 8
> >> > >> void rwdata(char *buf)
> >> > >> {
> >> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >> > >>                 buf[i] =3D 'a';
> >> > >>                 volatile char c =3D buf[i];
> >> > >>         }
> >> > >> }
> >> > >> void clear_young_dirty(char *buf)
> >> > >> {
> >> > >>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >> > >>                 perror("madvise free failed");
> >> > >>                 free(buf);
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >> > >>                 perror("madvise free failed");
> >> > >>                 free(buf);
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >> }
> >> > >> void set_one_young(char *buf)
> >> > >> {
> >> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
> >> > >>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
> >> > >>         }
> >> > >> }
> >> > >>
> >> > >> void test_contpte_perf() {
> >> > >>         char *buf;
> >> > >>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE, TEST_SIZE);
> >> > >>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
> >> > >>                 perror("posix_memalign failed");
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >>
> >> > >>         rwdata(buf);
> >> > >> #if TEST_CASE2 || TEST_CASE3
> >> > >>         clear_young_dirty(buf);
> >> > >> #endif
> >> > >> #if TEST_CASE2
> >> > >>         set_one_young(buf);
> >> > >> #endif
> >> > >>
> >> > >>         for (int j =3D 0; j < 500; j++) {
> >> > >>                 mlock(buf, TEST_SIZE);
> >> > >>
> >> > >>                 munlock(buf, TEST_SIZE);
> >> > >>         }
> >> > >>         free(buf);
> >> > >> }
> >> > >> ---
> >> > >>
> >> > >> Descriptions of three test scenarios
> >> > >>
> >> > >> Scenario 1
> >> > >> The data of all 16 PTEs are both dirty and young.
> >> > >> #define TEST_CASE2 0
> >> > >> #define TEST_CASE3 0
> >> > >>
> >> > >> Scenario 2
> >> > >> Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
> >> > >> #define TEST_CASE2 1
> >> > >> #define TEST_CASE3 0
> >> > >>
> >> > >> Scenario 3
> >> > >> Among the 16 PTEs, there are neither young nor dirty ones.
> >> > >> #define TEST_CASE2 0
> >> > >> #define TEST_CASE3 1
> >> > >>
> >> > >>
> >> > >> Test results
> >> > >>
> >> > >> |Scenario 1         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    37912436160|     18303833386|     187315=
80031|
> >> > >> |test time          |         4.2797|          2.2687|          2=
.2949|
> >> > >> |overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         21.31%|           4.72%|           =
4.80%|
> >> > >>
> >> > >> |Scenario 2         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    36701270862|     38729716276|     361157=
90086|
> >> > >> |test time          |         3.2335|          3.5732|          3=
.0874|
> >> > >> |Overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         32.26%|          41.35%|          3=
3.57%|
> >> > >>
> >> > >> |Scenario 3         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    36706279735|     38305241759|     367508=
81878|
> >> > >> |test time          |         3.2008|          3.5389|          3=
.1249|
> >> > >> |Overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         31.94%|          41.30%|          3=
4.59%|
> >> > >>
> >> > >>
> >> > >> For Scenario 1, Modification 1 can achieve an instruction count b=
enefit of
> >> > >> 51.72% and a time benefit of 46.99%. Modification 2 can achieve a=
n instruction
> >> > >> benefit of 50.59% and a time benefit of 46.38%.
> >> > >>
> >> > >> For Scenarios 2, Modification 2 can achieve an instruction count =
benefit of
> >> > >> 1.6% and a time benefit of 4.5%. while Modification 1 significant=
ly increases
> >> > >> the instructions and time due to additional conditional checks.
> >> > >>
> >> > >> For Scenario 3, since all the PTEs have neither the young nor the=
 dirty flag,
> >> > >> the branches taken by Modification 1 and Modification 2 should be=
 the same as
> >> > >> those of the original code. In fact, the test results of Modifica=
tion 2 seem
> >> > >> to be closer to those of the original code. I don't know why ther=
e is a
> >> > >> performance regression in Modification 1.
> >> > >>
> >> > >> Therefore, I believe modifying the code according to Modification=
 2 can bring
> >> > >> maximum benefits. Everyone can discuss whether this approach is a=
cceptable,
> >> > >> and if so, I will send Patch V4 to proceed with submitting this m=
odification.
> >> > >>
> >> > >
> >> > >modification 2 is not correct. if pte0~pte14 are all young and no o=
ne
> >> > >is dirty, we are
> >> > >having lots of useless "for (; i < CONT_PTES; i++, ptep++)"
> >> > >
> >> > >                 if (pte_young(pte)) {
> >> > >                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >                         i++;
> >> > >                         ptep++;
> >> > >                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >                                 pte =3D __ptep_get(ptep);
> >> > >                                 if (pte_dirty(pte)) {
> >> > >                                         orig_pte =3D pte_mkdirty(o=
rig_pte);
> >> > >                                         break;
> >> > >                                 }
> >> > >                         }
> >> > >                         break;
> >> > >                 }
> >> > >
> >> >
> >> > I didn't understand which part you referred to when you said there w=
ere a lot of
> >> > useless loops. According to the scenario you mentioned, "if pte0~pte=
14 are all
> >> > young and no one is dirty", Modification 2 will enter the following =
branch when
> >> > judging pte0:
> >> >
> >> > if (pte_young(pte)) {
> >> >         orig_pte =3D pte_mkyoung(orig_pte);
> >> >         // The dirty status of pte0 has already been checked, skip i=
t.
> >> >         i++;
> >> >         ptep++;
> >> >         // Then we only need to check whether pte1~pte15 are dirty.
> >> >         for (; i < CONT_PTES; i++, ptep++) {
> >> >                 pte =3D __ptep_get(ptep);
> >> >                 if (pte_dirty(pte)) {
> >> >                         // Exit as soon as a dirty entry is found.
> >> >                         orig_pte =3D pte_mkdirty(orig_pte);
> >> >                         break;
> >> >                 }
> >> >         }
> >> >         // Exit directly here without going through the outer loop a=
gain.
> >> >         break;
> >> > }
> >> >
> >> > In this scenario, the total number of judgments in Modification 2 is=
 nearly half less
> >> > than that of the original code. I should have understood it correctl=
y, right?
> >>
> >> You're right=E2=80=94I missed the part where you're also taking a brea=
k, even though
> >> no one is dirty. Based on your data, modification 2 seems to be good.
> >>
> >> But I don't quite understand why you are doing
> >>          i++;
> >>          ptep++;
> >> before for (; i < CONT_PTES; i++, ptep++).
> >>
> >> it seems to be wrong. if i=3D=3D15, you will get i=3D16. you are skipp=
ing
> >> the pte_dirty
> >> check for i=3D=3D15. it is also true for any value between 0 and 15. M=
y
> >> point is that
> >> you should drop it and re-test.
> >
> >Sorry, I missed that you already checked pte_dirty(pte) before calling
> >pte_young(). So please ignore my comment. The code's a bit hard to
> >follow now. :-)
> >
>
> The modification 2 is indeed a bit difficult to understand, but this is a=
lso to improve
> the execution efficiency. Thanks for your careful review. :-)

Agreed. Personally, I have no objections to Modification 2, as it demonstra=
tes
performance improvements in nearly all cases according to your data.

>
> --
> Thanks,
> Xavier

Thanks
Barry
