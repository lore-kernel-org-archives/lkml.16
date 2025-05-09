Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C265F8F77
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756585; cv=none; b=COnf8TGIJSdruD0qHXns9RMR16IRtEj2xJKzxfGFF4KvLWk+2PPwsOG2Ku9aLH0T2Glw+FaLDQ3q4bmqDdZ8PiobIub5ovhbvj0QWIZvurraScTU8jp9JvLBG4VYypn4Trz65TW+uzi5qqJfiHvBA3I5f8IFqTl/jE0vhoq4hJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756585; c=relaxed/simple;
	bh=1z/uPz1LW73dA7dxDwr4kLQymfjy+GoBANeMMPLQGrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVlUu5OGJNxRKtVSSDN9gpkuh0KL0UBhorRB651DphNiAtqToTigK+sdqC3W3HnML/gHOpR8jtWHXj6Z0RTJeosw94n2tVWHLrMBfxyi2B6iK5WGAdCpaTDCo6VyXX0CMoySQTlB3LnglJCezDvBZc3dd/PIWtFNh2BuRdmPEr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFXIGG+y; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFXIGG+y"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f54079e54bso13805146d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746756582; x=1747361382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJWILqSuQUqMcjyRYENm/e5hp/+befMiV/pFyfxyYOw=;
        b=aFXIGG+y875msMSCQ4f0oehwvQYIXHbVB9cdDAnS+leYT6e7uQYGVDBxg4Lv9n5x3S
         H2PNYxYbunx74y5j7S+F6g8UsMa4a+WsxCtl21fn8AIreTdzn116QRsoRkNbh5rdvBHL
         zz1BgUhZ+AaQaqlH1xvqEXyG5qSOKmd/w3bmDnEWyIQCQPWFB7beLMAyHouoL8nw3IyD
         FNuiVXj7D899VPmwVsy5FnzOP3a8wQ/lDcrCg/gG0tCk0aUn6q9E1hvRTSWfdO5Lgzb4
         OSSqk4cbuXhlaeyyAP1P3IWrpb1H6tcziLMJjr2LzY3qwpxN/e+ak12f0Nw6pFDLI+wP
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746756582; x=1747361382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJWILqSuQUqMcjyRYENm/e5hp/+befMiV/pFyfxyYOw=;
        b=ShKhf4aydgunElEue3/CuYj/FpgWbilp9/7E3r8Iho7QvBIRgAzdMoe5SCmw2Mt8Yb
         V1a9k1OuLfLpMw5JE0tVmKjfP2HBCoTQsbSLqcaLfAHstLHxtxCOvhH5NeJbzaL3YzgL
         caMqe9hCdRRnejT3MsL6JXIhiZUHsYywrWdt0vadhtKojcVpLQsamkFTWMfApc9eRoI2
         9XgashL45K4oxTmSt71YJ35d4bjgmYfiuPFobP9FdrIcmH1FTo38kIxnr1Y1KhpWbNAV
         xvM7/o80xgS67ikRSSpUz4AYJieFhoE2PZSd0eEb1biXmp7NBesGOhOj6FAa35DImVim
         EO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXd/ZEKdV8LBIh+p/PkovlNJzK5j8QV2QZevK1gt+KS4kdPHmlCcx+GZrxU/VksTtm5BTQa8NQd3vGSM/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+oeIjoIAAQGx/F6LYZJ/+3RAY93LlgzH3TviYJRqoFvn2JU2v
	iPDK2yWE51tdeaLS9uQVXAb3aQftUWszFaMbZo2bRd7iVmDCUcvhZVJxXQ63e1hZa2O6DvCRQug
	ZVsWIxZJAJd96AcVS/mV2YnyANm7ucmUo
X-Gm-Gg: ASbGncuQzaNWmPOEHfJ41dCQGAGn5JQ0pZ4picaOZSxjGDTgB3yU9vh6Z7HC3+5dIXp
	hD7G2p9woq7aEwMZJ/s8l0uFIyA8dUwuFKSm817qkeMTRyJ3BBDWtzDto8r4CVpQEP5YFqQXKNM
	dNOf6QlRQ/Ne6IHrXhQFimmiX8UZB+uP0H
X-Google-Smtp-Source: AGHT+IHnDz0AopexNXOEOqaKPyIa2CirpYwBoeddjpfAfctDH6n6tzTj0r1o3P1bA5PLo6dWzzL84x+IkacDuDaZbA8=
X-Received: by 2002:a05:6102:3fa9:b0:4de:ed21:480a with SMTP id
 ada2fe7eead31-4deed404d57mr1682001137.25.1746756572306; Thu, 08 May 2025
 19:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
In-Reply-To: <20250508070353.2370826-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 14:09:21 +1200
X-Gm-Features: AX0GCFucevbRFctKcPJOmiahNkLZmoUip90mOFFWmStQgaEASz-Ses9gLPs8cN4
Message-ID: <CAGsJ_4y9tC-=8dv7W1Q=D+bBA2Qr=TLiMDJ-TGv506w=iGe42w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier Xia <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:04=E2=80=AFPM Xavier Xia <xavier_qy@163.com> wrote=
:
>
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
>
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
>
> Test Code:
>
>         #define PAGE_SIZE 4096
>         #define CONT_PTES 16
>         #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
>         #define YOUNG_BIT 8
>         void rwdata(char *buf)
>         {
>                 for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
>                         buf[i] =3D 'a';
>                         volatile char c =3D buf[i];
>                 }
>         }
>         void clear_young_dirty(char *buf)
>         {
>                 if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
>                         perror("madvise free failed");
>                         free(buf);
>                         exit(EXIT_FAILURE);
>                 }
>                 if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
>                         perror("madvise free failed");
>                         free(buf);
>                         exit(EXIT_FAILURE);
>                 }
>         }
>         void set_one_young(char *buf)
>         {
>                 for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
>                         volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
>                 }
>         }
>
>         void test_contpte_perf() {
>                 char *buf;
>                 int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE,
>                                 TEST_SIZE);
>                 if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
>                         perror("posix_memalign failed");
>                         exit(EXIT_FAILURE);
>                 }
>
>                 rwdata(buf);
>         #if TEST_CASE2 || TEST_CASE3
>                 clear_young_dirty(buf);
>         #endif
>         #if TEST_CASE2
>                 set_one_young(buf);
>         #endif
>
>                 for (int j =3D 0; j < 500; j++) {
>                         mlock(buf, TEST_SIZE);
>
>                         munlock(buf, TEST_SIZE);
>                 }
>                 free(buf);
>         }
>
>         Descriptions of three test scenarios
>
> Scenario 1
>         The data of all 16 PTEs are both dirty and young.
>         #define TEST_CASE2 0
>         #define TEST_CASE3 0
>
> Scenario 2
>         Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
>         #define TEST_CASE2 1
>         #define TEST_CASE3 0
>
> Scenario 3
>         Among the 16 PTEs, there are neither young nor dirty ones.
>         #define TEST_CASE2 0
>         #define TEST_CASE3 1
>
> Test results
>
> |Scenario 1         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    37912436160|     18731580031|
> |test time          |         4.2797|          2.2949|
> |overhead of        |               |                |
> |contpte_ptep_get() |         21.31%|           4.80%|
>
> |Scenario 2         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36701270862|     36115790086|
> |test time          |         3.2335|          3.0874|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         32.26%|          33.57%|
>
> |Scenario 3         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36706279735|     36750881878|
> |test time          |         3.2008|          3.1249|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         31.94%|          34.59%|
>
> For Scenario 1, optimized code can achieve an instruction benefit of 50.5=
9%
> and a time benefit of 46.38%.
> For Scenario 2, optimized code can achieve an instruction count benefit o=
f
> 1.6% and a time benefit of 4.5%.
> For Scenario 3, since all the PTEs have neither the young nor the dirty
> flag, the branches taken by optimized code should be the same as those of
> the original code. In fact, the test results of optimized code seem to be
> closer to those of the original code.
>
> It can be proven through test function that the optimization for
> contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockle=
ss
> is similar to that of contpte_ptep_get, the same optimization scheme is
> also adopted for it.
>
> Signed-off-by: Xavier Xia <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 71 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..e9882ec782fc 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -169,17 +169,41 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
> -
> -               if (pte_young(pte))
> +                       for (; i < CONT_PTES; i++, ptep++) {
> +                               pte =3D __ptep_get(ptep);
> +                               if (pte_young(pte)) {
> +                                       orig_pte =3D pte_mkyoung(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
> +
> +               if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +                       i++;
> +                       ptep++;
> +                       for (; i < CONT_PTES; i++, ptep++) {
> +                               pte =3D __ptep_get(ptep);
> +                               if (pte_dirty(pte)) {
> +                                       orig_pte =3D pte_mkdirty(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
>         }
>
>         return orig_pte;
>  }
>  EXPORT_SYMBOL_GPL(contpte_ptep_get);
>
> +#define CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot) \
> +       (!pte_valid_cont(pte) || pte_pfn(pte) !=3D pfn || \
> +               pgprot_val(prot) !=3D pgprot_val(orig_prot))

maybe make it a static inline function to improve readability. Also,
the name appears to
be not good: CHECK_CONTPTE_CONSISTENCY is actually checking for inconsisten=
cy,
not consistency.

it might be:

static inline bool contpte_is_consistent(...)
{
        return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
               pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
}

or another better name.

> +
>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  {
>         /*
> @@ -221,16 +245,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>                 pte =3D __ptep_get(ptep);
>                 prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
>
> -               if (!pte_valid_cont(pte) ||
> -                  pte_pfn(pte) !=3D pfn ||
> -                  pgprot_val(prot) !=3D pgprot_val(orig_prot))
> +               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot))
>                         goto retry;
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
> -
> -               if (pte_young(pte))
> +                       for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +                               pte =3D __ptep_get(ptep);
> +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean=
(pte)));
> +
> +                               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, p=
rot, orig_prot))
> +                                       goto retry;
> +
> +                               if (pte_young(pte)) {
> +                                       orig_pte =3D pte_mkyoung(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
> +
> +               if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +                       i++;
> +                       ptep++;
> +                       pfn++;
> +                       for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +                               pte =3D __ptep_get(ptep);
> +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean=
(pte)));
> +
> +                               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, p=
rot, orig_prot))
> +                                       goto retry;
> +
> +                               if (pte_dirty(pte)) {
> +                                       orig_pte =3D pte_mkdirty(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
>         }
>
>         return orig_pte;
> --
> 2.34.1
>

Thanks
barry
