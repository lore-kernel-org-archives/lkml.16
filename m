Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515F214A9E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055070; cv=none; b=f41oppRJBeukAq3POWrscnzmhzjdzWk3vqxJzMdQqpPdChlb2vIMmtSLCKy1XBuxk1KWw02wDt8gibp6szSakpHz7EXx0NBulM4djlMdkm86fH2njsXsEOVu4s5ywdicaOwal0Vig8JsV9vQx6UU08s4Kmn7LJ4K/GaI4Lhbbkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055070; c=relaxed/simple;
	bh=96Sm+KJUVZTvh6TLs4NU7XPPKCWIAA6BK8VYeB+8KPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToeJ3qfVrX3T9UTZ0OX7mG+0vMOKK8qfU+EuHwyxRXfcajAOBfugHHwE4+Xsjoes0ff+XNWtTjkFKDZga/AG6GWncNFm7b2Pz0Gvi9uPEgUTReuYOfNpLiMPKl9ipQL8PU/amLnqR0cGlYgs4sfbRORdkw6IO5FSiwdlmuoB84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjIG+qa3; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjIG+qa3"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d3805a551so102316241.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746055067; x=1746659867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMJjwbFob2j9uVvUPyLSbsFKQ78+Yo3uN+6VyHo6BnA=;
        b=AjIG+qa3KI7i3IkKbnkW9krkFU0IvvR+64zxzox6o4F8DqQOCi5SRRotsy6TgybNJT
         EqJk0bjJcmu+a91bHgcVja4UH/nUATlKYv8C87QBtzQ0WfpS2+eJ3qK7qG8qsEeC/pCg
         re0Y3X0votx1ZyYhi+DBMnVcOSJ2blmY4ik8Nep3QrWTfbrrfRTlKqzMaa/4CvM+tJDq
         Kz4IM7oXRb+ilT9y5BtAd8XEJimrqhpGUhJffKxVLSR/hyIQczxw4GkCdN8Enmpwlaf0
         HmRghle7jKxSlfIr9h1bXr+nNV6RUKzMhttUVtjDnQKd/yNXM9AGHFD1107Hs2jQWuqp
         Nqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055067; x=1746659867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMJjwbFob2j9uVvUPyLSbsFKQ78+Yo3uN+6VyHo6BnA=;
        b=oP8Wix1d7zVlPdbqYMv4b/CBk/4lwyuPbV0T8R1SV1kkHXZh+SJaiEWc4GEM/wxGtj
         MLlxnOw4ZviV8hStg/kvSRjvGO8bj6cySbeC1BgDzFY43Dnq+L4yIuv1o6pCLeApQVxc
         rvYMgZTFZ4UNiiesKf66zibOTXvjH+kGVrb550voPTd8gk7oVIempqXu0lGWkRcYlPDR
         wtHCx8JmJDZ7v2/XpTxwybyObZikj+4UDUobagcY/9NZ5RMAhJTHDD9mSbGDXnyTQcpw
         tUK1rG3AqaVH7h/kGSGiFlGigq7FV/nmge9XDonr/aFLE/G6au+g4Bmp0ajKmxYYSFiu
         tCLA==
X-Forwarded-Encrypted: i=1; AJvYcCV9xbmg4pwwzg7VEM1QLXqGOsJ+mD5G89rZ+xUi59Dwaw9/2DyS0KoNat0myO6lD6VVD+wOZC0zuazx5Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl07xw8rDLbmIcmHDst3prZdMbcNeI3meu+wsa2MrUQVaAxiGR
	p2aGyitDCeo3gqluNPxQGNi6cQh4Fk53jRZNXnkuvGm9gL1IrREVGDymrQjRXImC2Kbz0FmJsz4
	2X4qyM2to2EDksle1gBY2Yja3g3I=
X-Gm-Gg: ASbGncupMhpKsERyY1G/s6z6/diAgsD0gnzkSD1kHaYAhODFIWDcoHWXKcCe6OTpz+Q
	KX3v5aumHp9OMBpig5mKbrxwFb2M7Ujb9jKRjwu/maCNnnyi8RnVXElE3OoG3xS6Rf2JcWbEg35
	v/MMCT4twnuiiLzTVwuRAq8NpgNbL/n6fM
X-Google-Smtp-Source: AGHT+IHAA/waQcD+3hxTdxKRpBkAYVVBUimMufv/32HoNIa9AqwpHaAsPbictoZi3Fd+OWzRdB1CAALwrqwqZnkvdeI=
X-Received: by 2002:a05:6102:419e:b0:4c1:86bc:f959 with SMTP id
 ada2fe7eead31-4dad4908a42mr4199200137.8.1746055066988; Wed, 30 Apr 2025
 16:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com> <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com> <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
 <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com>
In-Reply-To: <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 1 May 2025 11:17:36 +1200
X-Gm-Features: ATxdqUFXh3YdyU0-rztRQ7pM2vEUs5U0Cj5bSFkPEYsEBo8shrXPHJ00fd8j578
Message-ID: <CAGsJ_4yGuH4vOFSZM2o3-Nev4DnZmzWKUh7CRXxA2U-FT2W0xA@mail.gmail.com>
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
>
> Hi all,
>
>
> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wrote:
> >On 15/04/2025 09:22, Xavier wrote:
> >> This commit optimizes the contpte_ptep_get function by adding early
> >>  termination logic. It checks if the dirty and young bits of orig_pte
> >>  are already set and skips redundant bit-setting operations during
> >>  the loop. This reduces unnecessary iterations and improves performanc=
e.
> >>
> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> ---
> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> index bcac4f55f9c1..0acfee604947 100644
> >> --- a/arch/arm64/mm/contpte.c
> >> +++ b/arch/arm64/mm/contpte.c
> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, u=
nsigned long addr,
> >>  }
> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> >>
> >> +/* Note: in order to improve efficiency, using this macro will modify=
 the
> >> + * passed-in parameters.*/
> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> >> +                            orig_pte =3D pte_mk##flag(orig_pte); \
> >> +                            break; \
> >> +            } \
> >> +    }
> >
> >I'm really not a fan of this macro, it just obfuscates what is going on.=
 I'd
> >personally prefer to see the 2 extra loops open coded below.
> >
> >Or even better, could you provide results comparing this 3 loop version =
to the
> >simpler approach I suggested previously? If the performance is similar (=
which I
> >expect it will be, especially given Barry's point that your test always =
ensures
> >the first PTE is both young and dirty) then I'd prefer to go with the si=
mpler code.
> >
>
> Based on the discussions in the previous email, two modifications were ad=
opted
> and tested, and the results are as follows:
>
> Modification 1
>
> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> {
>         pte_t pte;
>         int i;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
>                 if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
>                         if (pte_young(orig_pte))
>                                 break;
>                 }
>
>                 if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
>                         if (pte_dirty(orig_pte))
>                                 break;
>                 }
>         }
>
>         return orig_pte;
> }
>
> Modification 2
>
> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> {
>         pte_t pte;
>         int i;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
>                 if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
>                         for (; i < CONT_PTES; i++, ptep++) {
>                                 pte =3D __ptep_get(ptep);
>                                 if (pte_young(pte)) {
>                                         orig_pte =3D pte_mkyoung(orig_pte=
);
>                                         break;
>                                 }
>                         }
>                         break;
>                 }
>
>                 if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
>                         i++;
>                         ptep++;
>                         for (; i < CONT_PTES; i++, ptep++) {
>                                 pte =3D __ptep_get(ptep);
>                                 if (pte_dirty(pte)) {
>                                         orig_pte =3D pte_mkdirty(orig_pte=
);
>                                         break;
>                                 }
>                         }
>                         break;
>                 }
>         }
>
>         return orig_pte;
> }
>
> Test Code:
>
> #define PAGE_SIZE 4096
> #define CONT_PTES 16
> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> #define YOUNG_BIT 8
> void rwdata(char *buf)
> {
>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
>                 buf[i] =3D 'a';
>                 volatile char c =3D buf[i];
>         }
> }
> void clear_young_dirty(char *buf)
> {
>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
>                 perror("madvise free failed");
>                 free(buf);
>                 exit(EXIT_FAILURE);
>         }
>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
>                 perror("madvise free failed");
>                 free(buf);
>                 exit(EXIT_FAILURE);
>         }
> }
> void set_one_young(char *buf)
> {
>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PAGE_SIZE)=
 {
>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE];
>         }
> }
>
> void test_contpte_perf() {
>         char *buf;
>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE, =
TEST_SIZE);
>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE))=
 {
>                 perror("posix_memalign failed");
>                 exit(EXIT_FAILURE);
>         }
>
>         rwdata(buf);
> #if TEST_CASE2 || TEST_CASE3
>         clear_young_dirty(buf);
> #endif
> #if TEST_CASE2
>         set_one_young(buf);
> #endif
>
>         for (int j =3D 0; j < 500; j++) {
>                 mlock(buf, TEST_SIZE);
>
>                 munlock(buf, TEST_SIZE);
>         }
>         free(buf);
> }
> ---
>
> Descriptions of three test scenarios
>
> Scenario 1
> The data of all 16 PTEs are both dirty and young.
> #define TEST_CASE2 0
> #define TEST_CASE3 0
>
> Scenario 2
> Among the 16 PTEs, only the 8th one is young, and there are no dirty ones=
.
> #define TEST_CASE2 1
> #define TEST_CASE3 0
>
> Scenario 3
> Among the 16 PTEs, there are neither young nor dirty ones.
> #define TEST_CASE2 0
> #define TEST_CASE3 1
>
>
> Test results
>
> |Scenario 1         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    37912436160|     18303833386|     18731580031|
> |test time          |         4.2797|          2.2687|          2.2949|
> |overhead of        |               |                |                |
> |contpte_ptep_get() |         21.31%|           4.72%|           4.80%|
>
> |Scenario 2         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    36701270862|     38729716276|     36115790086|
> |test time          |         3.2335|          3.5732|          3.0874|
> |Overhead of        |               |                |                |
> |contpte_ptep_get() |         32.26%|          41.35%|          33.57%|
>
> |Scenario 3         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    36706279735|     38305241759|     36750881878|
> |test time          |         3.2008|          3.5389|          3.1249|
> |Overhead of        |               |                |                |
> |contpte_ptep_get() |         31.94%|          41.30%|          34.59%|
>
>
> For Scenario 1, Modification 1 can achieve an instruction count benefit o=
f
> 51.72% and a time benefit of 46.99%. Modification 2 can achieve an instru=
ction
> benefit of 50.59% and a time benefit of 46.38%.
>
> For Scenarios 2, Modification 2 can achieve an instruction count benefit =
of
> 1.6% and a time benefit of 4.5%. while Modification 1 significantly incre=
ases
> the instructions and time due to additional conditional checks.
>
> For Scenario 3, since all the PTEs have neither the young nor the dirty f=
lag,
> the branches taken by Modification 1 and Modification 2 should be the sam=
e as
> those of the original code. In fact, the test results of Modification 2 s=
eem
> to be closer to those of the original code. I don't know why there is a
> performance regression in Modification 1.
>
> Therefore, I believe modifying the code according to Modification 2 can b=
ring
> maximum benefits. Everyone can discuss whether this approach is acceptabl=
e,
> and if so, I will send Patch V4 to proceed with submitting this modificat=
ion.
>

modification 2 is not correct. if pte0~pte14 are all young and no one
is dirty, we are
having lots of useless "for (; i < CONT_PTES; i++, ptep++)"

                 if (pte_young(pte)) {
                         orig_pte =3D pte_mkyoung(orig_pte);
                         i++;
                         ptep++;
                         for (; i < CONT_PTES; i++, ptep++) {
                                 pte =3D __ptep_get(ptep);
                                 if (pte_dirty(pte)) {
                                         orig_pte =3D pte_mkdirty(orig_pte)=
;
                                         break;
                                 }
                         }
                         break;
                 }

Thanks,
Xavier
