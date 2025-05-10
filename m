Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6A2747B
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746861664; cv=none; b=SF5ixER2krbZZCZZhRCrF3TZ1bZTRSLX+GQQRLMfe4WNhl8FF3u+lOCg3PjNAL7fw4c0fAXJEHTaPrCSh4ft3y19aIWgh69cxqvBaB+elP4q5byhse8zSQNQBKPcADPmwmv3pJ9Txw3sY9mmw1VmvJbHSQF4AvYfy5N5Ycf6++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746861664; c=relaxed/simple;
	bh=+SsIuYIAzwt5P/t1bEfnMbPkPbGYU8CRSbU9u7ti+jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am5+t7z9Hppz8yMRupKBqua3b51TQZ/42HjVOvT4r52s6BKlUVS0aA3VU0/zusne62YSMiLHeWgmV6KOVRMwH9Db8nwAtyiSvT/xwgiQYSm78WpCSOig7S4Y5OpNPuEJ793976QKZKdFiwkWuWSc82RGC3kgjxpRTfUeoZrE0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo4u+p7y; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo4u+p7y"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4ddac386a29so1097467137.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746861661; x=1747466461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx0wskzF7lPGM0fMaqGpAOnWB1jjL0vEOGxjCFWL2CA=;
        b=mo4u+p7yka1Dox03lcQWtmqJ+IYyOrv3iC+hRV3VdXFlKcCQ0fk0Y0aPPK2Ub7tmUM
         C/CwScRbYbtYXqpmXUS4/IjJGUNViVoU/+uD8fkK+8vQhUdV5GkqRrBZOFbsZm0RWaLu
         Vu91XnZSEmb/oQJfMN5dp+4HaDoXfHUTOn67VV1tQITk8aIO19Yq7pQ4p1MEdfrzNN4p
         s1wIhkZfwGWlCcURuBxuEcmX9pGJqGfjCKe5hV6f+BDkl/frpBhja/vIjmsWJhnJfJm/
         CmOZGnjRho8wSUpxAU/UrgjYrKfvEKMI8Qw+xIEThxojQbsMPg4lIIIbjdHhdC4MJiPS
         zVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746861661; x=1747466461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nx0wskzF7lPGM0fMaqGpAOnWB1jjL0vEOGxjCFWL2CA=;
        b=NLijs7HR93RyeXBcJiPHef8mdaBjXFGMrCdP8HSQJfRjLliVW2Y/VKlzVGvji86gN9
         ZN7S3vNqyFGFA4rlKu8KVCxbN/40KtrMbiJuWuDp1izAHzagonVBt2y4IFYf/NfAw3oW
         EnLZDRxthaM8ETC27ggA2T8x6BnRorvAFaqWsWxyDpgDHKEApxV+YY+xxRkEf30S+WVw
         o3HuHBMFloE58uGMlAo+LiKO2fgwYtpACrJrWr9HqDLWUCK2GVoWDtX2XClAvSKtO/Sh
         2csjHTWmTu7uGmjRgjAHfYEh7Lz0QljtaO+Np4StxPg4Vgue3saAWdCNJ9RP8cPFdS/o
         orHw==
X-Forwarded-Encrypted: i=1; AJvYcCU3MhXB/WmS2ejqqKuL5e5za0lsX9Tu/m0oVZcqorMoSbz9xynr/BsktiDedMXXFd4hB86y84HWWxnScok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8KhGOFsVzQ95DIaxHsLhgZy2KNV0Fg279H33iNOnlXCdaGuI
	IMu67m6pr/2VxrozS/Sf/8MKcBbB2OEsCy8V4tzn0Tro5mLBzDS+V+SKrEQFiHVARyS1ujjoMbZ
	c6d/bMJ2acH/l8kFhQwaJpX+99Fc=
X-Gm-Gg: ASbGncuNNbTiFUcp2pYi2n308rirrVMKKlLNeTQcs/5Sw53fz8g0GmjOlY4GPGVrz18
	mLTATn8XAOAgoAZtT6sdceS2qozjJ+yjYzisBIAR/Rj/Mdnwa9Y4GdlPmCkmAySwSsI7YG+Ul/k
	j4DJyULexZ/aVEU7xvOYUW2E0wv+WRtKlk
X-Google-Smtp-Source: AGHT+IEXt5Ti5lUKkwRizUaWKeNerJpTRxZbpXYZNKWbPsLAOVGRmqul4dHQTeyVgguhthUDBeVC9TXVsHxKNX1to+o=
X-Received: by 2002:a05:6102:2c02:b0:4c1:8e07:40b8 with SMTP id
 ada2fe7eead31-4deed351f3dmr5634823137.6.1746861661022; Sat, 10 May 2025
 00:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509122728.2379466-1-xavier_qy@163.com>
In-Reply-To: <20250509122728.2379466-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 10 May 2025 15:20:48 +0800
X-Gm-Features: AX0GCFu_9RLyhTvQzpH-ZFel8zAHIad0gLC9B7J4ICA2NdsZuGGJzgfDT2omyvY
Message-ID: <CAGsJ_4wq0HD=Q-URO766zz=M8yyUxauhRoF9CTDkAgE5Favg-A@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier Xia <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:29=E2=80=AFPM Xavier Xia <xavier_qy@163.com> wrote=
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


You can probably consolidate the logic below into contpte_is_consistent(), =
which
would allow you to

1. Eliminate the repeated pattern: prot =3D
pte_pgprot(pte_mkold(pte_mkclean(pte)))
2. Remove the argument  "pgprot_t prot" for contpte_is_consistent().

 +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean(=
pte)));
 +
 +                               if (!contpte_is_consistent(pte, pfn,
prot, orig_prot))
 +                                       goto retry;

If performance takes precedence over code simplicity, and you're planning t=
o
send a new version with the above refinements, feel free to include:

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
> Changes in v5:
> - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is=
_consistent
>   for improved readability and clarity, as suggested by Barry.
> - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier=
_qy@163.com/
>
> Changes in v4:
> - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readabi=
lity.
> - Refactor contpte_ptep_get_lockless using the same optimization logic, a=
s suggested by Ryan.
> - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Corem=
ail.xavier_qy@163.com/
> ---
>  arch/arm64/mm/contpte.c | 74 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 65 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..1037450b68e9 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -169,17 +169,44 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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
> +static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
> +                                       pgprot_t prot, pgprot_t orig_prot=
)
> +{
> +       return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> +                       pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> +}
> +
>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  {
>         /*
> @@ -221,16 +248,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>                 pte =3D __ptep_get(ptep);
>                 prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
>
> -               if (!pte_valid_cont(pte) ||
> -                  pte_pfn(pte) !=3D pfn ||
> -                  pgprot_val(prot) !=3D pgprot_val(orig_prot))
> +               if (!contpte_is_consistent(pte, pfn, prot, orig_prot))
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
> +                               if (!contpte_is_consistent(pte, pfn, prot=
, orig_prot))
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
> +                               if (!contpte_is_consistent(pte, pfn, prot=
, orig_prot))
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
Barry
