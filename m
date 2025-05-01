Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2420EB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135185; cv=none; b=KCQ11tUDtaPKnEq/SoSZj5rmNyRZNveKuJ70OgkCKbhf9JorYGmC/kLIQyymKCsEZR1+OfmT9CUMa+L+Otj4Ymj2f1DW4pWyhoZkOoERDxcQUiDmhUz3a7L/ud4vbYXxO7tNUN22TteFlwCU1a5F3Uf9JLsDeOTEeQaSS/GaB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135185; c=relaxed/simple;
	bh=IMD18miDWQMtdvHT2EbxlL8J/8bAFJw+fYkibmWAbng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C23Lea9amyBqnIgEGRgocq0YvWrn0z26KRMJMGtMzGePpBJte3CXvP2DjS8mcAsaSk+lGrUOtlmOfnJSVrCM3ww+t/Cydc6WzwnmAs3f/CHbQXl/tTjRW/2n36ZUtBKAaQ8NkzGB3uPvkFQB/4gRdNWTK0ha0+29R6eGNk4eVbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOK4eB0R; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOK4eB0R"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52413efd0d3so414475e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135182; x=1746739982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxIgFWy+yrmsk9YhRhq0BcJ6oJeEkEMeJw8ONYuruhU=;
        b=LOK4eB0R9WM1q69DP97RSF0dnriixW5wntjQqJMySiTu0zb6WP0hQb9Ze3Ie3nXm6f
         zjZhnvfLKNg0rrSRo5Y7haZ6YkQ3mU52sDl7Dvt/4C7mpUcgDzEO4BknCGq0TTaDGLkv
         9FDywOCbRnJu2/xSZTD+tEWjqZODkQ2IwEkX+1eTe0n5x2EvUxsHg60LawRHdf4Iq3sg
         SRw5+LPNP/A6C1mEflvvdD7JxxCoDiAO7j6Ei3cgav3fHHkd1pCEI5x0HIZPM++7BJBt
         JK68EVHtLt02InofEuKvonQdXOJJrmODMUy2x4+cfdibXC216g9oSWuYwr0MjDWZUNCL
         Zy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135182; x=1746739982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxIgFWy+yrmsk9YhRhq0BcJ6oJeEkEMeJw8ONYuruhU=;
        b=PC92hKrb6lZuVe1Up3UhoLc7dn/LSioywNiofjOQiUIJsWvTsUpkPp/QnqS3DMSzj4
         rFmLjWTFynNkZ4b84PP8tsyTjtvm0qaJGKBLCIjd9iFaI63deyazcp54RMobjJ6XoOnz
         EpCyUGxsGNM9PigO8Y/ho8l1hhzGQtYeW41MlZKFnowRPe8d6uDgT8kkbY/pjtbTbqI4
         eLE4+H8xebynxlJSXwTGcQzzyUfwKHW/NMZjM0VAROhzEBzHQR6Cm0kCfRIIcPAS8DsD
         c1269RhGR3C3LHV/qgvmWKsGSAz4pCA/im1UuSa9yq4pPxsqsF1CndsL3NS50AnUyS/N
         KBtw==
X-Forwarded-Encrypted: i=1; AJvYcCVaYe68T7KiBKKRWEF9aSMvFyykGlCO+bi45+Z+EF0sg8kGuF+JWvTiDTgjiGJ4JwbEV+vOEgehr9n7e6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPGnTGwMQyRhwOz01Z9p4Fv7fZJzRXTUGHSwCVRLrddUJqIsY
	iYUicxZecWRIJZ4eKmOJV/oYCCnc0rJDwya4F3MBLC5eO7kjAMSlW6nrJxLFgOAykHlK02DCqHO
	PNEQnvO+bY9qmSw+hH2BsUdTSu9M=
X-Gm-Gg: ASbGncsB4gDi6LDpZI7IqUNIli6tK2Ekg0ATfwDcFLl4jkqRDKFYVSn2Vs+r1jM1Rnw
	EQ1wZRBnLDYU8p6KQuLXfnelPpWADA8kMrSJqxU1Go9UHyLreG3MgGCWQ8VDp3FB84vBWrERa4G
	jkgLQXuS/OKzHDHNDWdxObeA==
X-Google-Smtp-Source: AGHT+IF7H0Zp5xStnLQJzdNsJXX35CjKGZcK4ZL3R8hFZUDHyktaSLjDoLuE3KIXWfG83mUEVXlC6rXmoFAmaW/sWEg=
X-Received: by 2002:a05:6122:3d07:b0:524:2fe2:46ba with SMTP id
 71dfb90a1353d-52aed809264mr472952e0c.11.1746135182205; Thu, 01 May 2025
 14:33:02 -0700 (PDT)
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
In-Reply-To: <CAGsJ_4zKFiCEUnFjb3qThoM2FG4XCsmeU=JeTLDXjMU2KONu-Q@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 2 May 2025 09:32:50 +1200
X-Gm-Features: ATxdqUGv4h71dZvaOaQKIpzZwZ_TQdQvHLNNS5sR6O3OWhaupbo0UqWtYfzT_LU
Message-ID: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 9:19=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Fri, May 2, 2025 at 12:41=E2=80=AFAM Xavier <xavier_qy@163.com> wrote:
> >
> >
> >
> > Hi Barry,
> >
> >
> > At 2025-05-01 07:17:36, "Barry Song" <21cnbao@gmail.com> wrote:
> > >On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> wro=
te:
> > >>
> > >>
> > >> Hi all,
> > >>
> > >>
> > >> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wrote:
> > >> >On 15/04/2025 09:22, Xavier wrote:
> > >> >> This commit optimizes the contpte_ptep_get function by adding ear=
ly
> > >> >>  termination logic. It checks if the dirty and young bits of orig=
_pte
> > >> >>  are already set and skips redundant bit-setting operations durin=
g
> > >> >>  the loop. This reduces unnecessary iterations and improves perfo=
rmance.
> > >> >>
> > >> >> Signed-off-by: Xavier <xavier_qy@163.com>
> > >> >> ---
> > >> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> > >> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> > >> >>
> > >> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > >> >> index bcac4f55f9c1..0acfee604947 100644
> > >> >> --- a/arch/arm64/mm/contpte.c
> > >> >> +++ b/arch/arm64/mm/contpte.c
> > >> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *=
mm, unsigned long addr,
> > >> >>  }
> > >> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> > >> >>
> > >> >> +/* Note: in order to improve efficiency, using this macro will m=
odify the
> > >> >> + * passed-in parameters.*/
> > >> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> > >> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> > >> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> > >> >> +                            orig_pte =3D pte_mk##flag(orig_pte);=
 \
> > >> >> +                            break; \
> > >> >> +            } \
> > >> >> +    }
> > >> >
> > >> >I'm really not a fan of this macro, it just obfuscates what is goin=
g on. I'd
> > >> >personally prefer to see the 2 extra loops open coded below.
> > >> >
> > >> >Or even better, could you provide results comparing this 3 loop ver=
sion to the
> > >> >simpler approach I suggested previously? If the performance is simi=
lar (which I
> > >> >expect it will be, especially given Barry's point that your test al=
ways ensures
> > >> >the first PTE is both young and dirty) then I'd prefer to go with t=
he simpler code.
> > >> >
> > >>
> > >> Based on the discussions in the previous email, two modifications we=
re adopted
> > >> and tested, and the results are as follows:
> > >>
> > >> Modification 1
> > >>
> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> > >> {
> > >>         pte_t pte;
> > >>         int i;
> > >>
> > >>         ptep =3D contpte_align_down(ptep);
> > >>
> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> > >>                 pte =3D __ptep_get(ptep);
> > >>
> > >>                 if (pte_dirty(pte)) {
> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> > >>                         if (pte_young(orig_pte))
> > >>                                 break;
> > >>                 }
> > >>
> > >>                 if (pte_young(pte)) {
> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> > >>                         if (pte_dirty(orig_pte))
> > >>                                 break;
> > >>                 }
> > >>         }
> > >>
> > >>         return orig_pte;
> > >> }
> > >>
> > >> Modification 2
> > >>
> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> > >> {
> > >>         pte_t pte;
> > >>         int i;
> > >>
> > >>         ptep =3D contpte_align_down(ptep);
> > >>
> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> > >>                 pte =3D __ptep_get(ptep);
> > >>
> > >>                 if (pte_dirty(pte)) {
> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> > >>                                 pte =3D __ptep_get(ptep);
> > >>                                 if (pte_young(pte)) {
> > >>                                         orig_pte =3D pte_mkyoung(ori=
g_pte);
> > >>                                         break;
> > >>                                 }
> > >>                         }
> > >>                         break;
> > >>                 }
> > >>
> > >>                 if (pte_young(pte)) {
> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> > >>                         i++;
> > >>                         ptep++;
> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> > >>                                 pte =3D __ptep_get(ptep);
> > >>                                 if (pte_dirty(pte)) {
> > >>                                         orig_pte =3D pte_mkdirty(ori=
g_pte);
> > >>                                         break;
> > >>                                 }
> > >>                         }
> > >>                         break;
> > >>                 }
> > >>         }
> > >>
> > >>         return orig_pte;
> > >> }
> > >>
> > >> Test Code:
> > >>
> > >> #define PAGE_SIZE 4096
> > >> #define CONT_PTES 16
> > >> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> > >> #define YOUNG_BIT 8
> > >> void rwdata(char *buf)
> > >> {
> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> > >>                 buf[i] =3D 'a';
> > >>                 volatile char c =3D buf[i];
> > >>         }
> > >> }
> > >> void clear_young_dirty(char *buf)
> > >> {
> > >>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> > >>                 perror("madvise free failed");
> > >>                 free(buf);
> > >>                 exit(EXIT_FAILURE);
> > >>         }
> > >>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> > >>                 perror("madvise free failed");
> > >>                 free(buf);
> > >>                 exit(EXIT_FAILURE);
> > >>         }
> > >> }
> > >> void set_one_young(char *buf)
> > >> {
> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PAGE_=
SIZE) {
> > >>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE];
> > >>         }
> > >> }
> > >>
> > >> void test_contpte_perf() {
> > >>         char *buf;
> > >>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAGE_S=
IZE, TEST_SIZE);
> > >>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAGE_S=
IZE)) {
> > >>                 perror("posix_memalign failed");
> > >>                 exit(EXIT_FAILURE);
> > >>         }
> > >>
> > >>         rwdata(buf);
> > >> #if TEST_CASE2 || TEST_CASE3
> > >>         clear_young_dirty(buf);
> > >> #endif
> > >> #if TEST_CASE2
> > >>         set_one_young(buf);
> > >> #endif
> > >>
> > >>         for (int j =3D 0; j < 500; j++) {
> > >>                 mlock(buf, TEST_SIZE);
> > >>
> > >>                 munlock(buf, TEST_SIZE);
> > >>         }
> > >>         free(buf);
> > >> }
> > >> ---
> > >>
> > >> Descriptions of three test scenarios
> > >>
> > >> Scenario 1
> > >> The data of all 16 PTEs are both dirty and young.
> > >> #define TEST_CASE2 0
> > >> #define TEST_CASE3 0
> > >>
> > >> Scenario 2
> > >> Among the 16 PTEs, only the 8th one is young, and there are no dirty=
 ones.
> > >> #define TEST_CASE2 1
> > >> #define TEST_CASE3 0
> > >>
> > >> Scenario 3
> > >> Among the 16 PTEs, there are neither young nor dirty ones.
> > >> #define TEST_CASE2 0
> > >> #define TEST_CASE3 1
> > >>
> > >>
> > >> Test results
> > >>
> > >> |Scenario 1         |       Original|  Modification 1|  Modification=
 2|
> > >> |-------------------|---------------|----------------|--------------=
--|
> > >> |instructions       |    37912436160|     18303833386|     187315800=
31|
> > >> |test time          |         4.2797|          2.2687|          2.29=
49|
> > >> |overhead of        |               |                |              =
  |
> > >> |contpte_ptep_get() |         21.31%|           4.72%|           4.8=
0%|
> > >>
> > >> |Scenario 2         |       Original|  Modification 1|  Modification=
 2|
> > >> |-------------------|---------------|----------------|--------------=
--|
> > >> |instructions       |    36701270862|     38729716276|     361157900=
86|
> > >> |test time          |         3.2335|          3.5732|          3.08=
74|
> > >> |Overhead of        |               |                |              =
  |
> > >> |contpte_ptep_get() |         32.26%|          41.35%|          33.5=
7%|
> > >>
> > >> |Scenario 3         |       Original|  Modification 1|  Modification=
 2|
> > >> |-------------------|---------------|----------------|--------------=
--|
> > >> |instructions       |    36706279735|     38305241759|     367508818=
78|
> > >> |test time          |         3.2008|          3.5389|          3.12=
49|
> > >> |Overhead of        |               |                |              =
  |
> > >> |contpte_ptep_get() |         31.94%|          41.30%|          34.5=
9%|
> > >>
> > >>
> > >> For Scenario 1, Modification 1 can achieve an instruction count bene=
fit of
> > >> 51.72% and a time benefit of 46.99%. Modification 2 can achieve an i=
nstruction
> > >> benefit of 50.59% and a time benefit of 46.38%.
> > >>
> > >> For Scenarios 2, Modification 2 can achieve an instruction count ben=
efit of
> > >> 1.6% and a time benefit of 4.5%. while Modification 1 significantly =
increases
> > >> the instructions and time due to additional conditional checks.
> > >>
> > >> For Scenario 3, since all the PTEs have neither the young nor the di=
rty flag,
> > >> the branches taken by Modification 1 and Modification 2 should be th=
e same as
> > >> those of the original code. In fact, the test results of Modificatio=
n 2 seem
> > >> to be closer to those of the original code. I don't know why there i=
s a
> > >> performance regression in Modification 1.
> > >>
> > >> Therefore, I believe modifying the code according to Modification 2 =
can bring
> > >> maximum benefits. Everyone can discuss whether this approach is acce=
ptable,
> > >> and if so, I will send Patch V4 to proceed with submitting this modi=
fication.
> > >>
> > >
> > >modification 2 is not correct. if pte0~pte14 are all young and no one
> > >is dirty, we are
> > >having lots of useless "for (; i < CONT_PTES; i++, ptep++)"
> > >
> > >                 if (pte_young(pte)) {
> > >                         orig_pte =3D pte_mkyoung(orig_pte);
> > >                         i++;
> > >                         ptep++;
> > >                         for (; i < CONT_PTES; i++, ptep++) {
> > >                                 pte =3D __ptep_get(ptep);
> > >                                 if (pte_dirty(pte)) {
> > >                                         orig_pte =3D pte_mkdirty(orig=
_pte);
> > >                                         break;
> > >                                 }
> > >                         }
> > >                         break;
> > >                 }
> > >
> >
> > I didn't understand which part you referred to when you said there were=
 a lot of
> > useless loops. According to the scenario you mentioned, "if pte0~pte14 =
are all
> > young and no one is dirty", Modification 2 will enter the following bra=
nch when
> > judging pte0:
> >
> > if (pte_young(pte)) {
> >         orig_pte =3D pte_mkyoung(orig_pte);
> >         // The dirty status of pte0 has already been checked, skip it.
> >         i++;
> >         ptep++;
> >         // Then we only need to check whether pte1~pte15 are dirty.
> >         for (; i < CONT_PTES; i++, ptep++) {
> >                 pte =3D __ptep_get(ptep);
> >                 if (pte_dirty(pte)) {
> >                         // Exit as soon as a dirty entry is found.
> >                         orig_pte =3D pte_mkdirty(orig_pte);
> >                         break;
> >                 }
> >         }
> >         // Exit directly here without going through the outer loop agai=
n.
> >         break;
> > }
> >
> > In this scenario, the total number of judgments in Modification 2 is ne=
arly half less
> > than that of the original code. I should have understood it correctly, =
right?
>
> You're right=E2=80=94I missed the part where you're also taking a break, =
even though
> no one is dirty. Based on your data, modification 2 seems to be good.
>
> But I don't quite understand why you are doing
>          i++;
>          ptep++;
> before for (; i < CONT_PTES; i++, ptep++).
>
> it seems to be wrong. if i=3D=3D15, you will get i=3D16. you are skipping
> the pte_dirty
> check for i=3D=3D15. it is also true for any value between 0 and 15. My
> point is that
> you should drop it and re-test.

Sorry, I missed that you already checked pte_dirty(pte) before calling
pte_young(). So please ignore my comment. The code's a bit hard to
follow now. :-)

>
> >
> >
> > --
> >
> > Thanks,
> > Xavier
>

Thanks
barry
