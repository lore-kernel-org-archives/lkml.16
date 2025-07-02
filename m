Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90334C7F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446830; cv=none; b=S3R3uadhOmgdCC1bx0fcpd8Q0cAAyPysYvcfUWtFRpglrK/iKNXPDXFP6RCGCQvUiH6jZu9yunbm1zWtXEZV0YLyWLGzzZ76FTWnM1aRynL5b+t9dCHSNieirOuKsK0hlOU1NNoTLYX1xRz57FC3tQzh8njQ8m8ZK8/RgwOaNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446830; c=relaxed/simple;
	bh=o2XzYIeWxYTyoVE5bSvKyj9GQtoL+DJtjUQ/a4maLwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jl8+XPnEW2w9DfcVBCkp/qSIE9bNL1mHvZwsa+oRNEONT7fqZYl8+M6Lcdq0e4QR2+7m1h67qWXbTrWC/9POSdj0L5HLAA+zc3oFd2YUvOcozOQzBiECWFJ40Y/Y1C9oMWodBc9QdMQhDSVXbp82sxKJhu/pNhZPGwfw/YAappo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCr9emOy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCr9emOy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso10949538a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751446827; x=1752051627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rucETxapXKXGBN7PtyHY+EQo5NyBaPuYKngjv1dJ15E=;
        b=lCr9emOyS5927vqLrReTBlibZ3opdfVQBcsNT0vaZQE6OEbfVgGno/vhFSGQ3V0wBZ
         pWaaad2+T4xqsWgL2Ay5BnJ4Qms90Nq+gBJuVtiRKeOJY2E3uX3qd2pEY298ABEo2aVm
         +N8z40gEQrA8nLfDgz/B3AlJ432ySx4OAfyqgQhQdBruwDMor37g+L9cBGbyUDwIfr5B
         t6WKzP1JLDNR6tca1IOhlp9rx9zBsq8XFqkPqfR+tdA5fPPPUDlKpSsGJBxmHT2Osk0i
         OFZ6u5LZhbdWhtnYDNqPi3R2I0buNM1vJ4H8/mCI32l7/qvJ5S2/gDiJyfcMcVo9S/vy
         yqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446827; x=1752051627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rucETxapXKXGBN7PtyHY+EQo5NyBaPuYKngjv1dJ15E=;
        b=YWoK34BlS59sbyQ4q9x7m3gRPCcO23YTc9inWSGf1FyZsVtYr4AwOQt3r9g0C/UMd6
         Y44l6v5v0J1isZ6Oe7LejXud8PTRJam/WKN9MWmfFlqgHEhQGXAadEEwMjmWnpxP5nEU
         1NYv5ZCZijXqT7H+lWJI4GyHQ22o4IPkkcjoDj1gIPa9uHIQ5kDpoJo/hqWwPECmbeWf
         IW/XefBN8x8kBz0aaQrnCQf4rFyejbcwS2d7Ab608ciiGm4oRHTqSxQYSKPtjzzlx8pe
         7fkadmP4JW7hWGzYeRz631OBF0P0cC3z+P+J1v+oWr7fDWXr0reczi+Kbmvm617j78F4
         cHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Tw5dESOtOkc92fwGmh92CIn2gvQ5IiCR6WkhduwSBGStFlLlQFBZUGEE0zPFvwK5iVuid8TiJWD1llM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYzuQ14U7qT52Fplvc4NXhwuohoq5R5oZXcmzLaOSaM/xq1vL
	V9xzJPRvfuhKyerdrQswLqn8oq0cSLdfvaGz7p9A1mi5aDZB/cPs7FGOpEpGPPw/2JWE3inZHut
	KRHGgsVsXCf3vAUTlpcSELoGqxRoB1/8=
X-Gm-Gg: ASbGncu7ao52L0HWCa9pOBzau2mY405N3lPHktiETwAPkeVbvAoaQ4curLfeRyDCScN
	CjCl3WyVSNWxwyBYN+dGAEr9ggPqLvGeFR7CXORuxq7u/ZdocNkZoguT90NuzzKXMAnKZiOlHQp
	3LENkcZRWtIDwnzLQ4hpWP/UBLDcrWnINVEIIgeJhle1I=
X-Google-Smtp-Source: AGHT+IEdvImO4hnAYVqt+jmktPUdIKdat3t90Sg7JU0s+cTJ/+BkwrzVe7PRmsWiA+2BUv1OZ2j0hvm0CoGRXeNnOMo=
X-Received: by 2002:a17:907:daa:b0:ae0:14e0:1d62 with SMTP id
 a640c23a62f3a-ae3c2da9576mr208513766b.55.1751446826630; Wed, 02 Jul 2025
 02:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com> <aGPpohrc8APQad-v@arm.com>
In-Reply-To: <aGPpohrc8APQad-v@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Wed, 2 Jul 2025 17:00:14 +0800
X-Gm-Features: Ac12FXwk-GXgGl7lpWXoZ7Ko4kCXGQR4cPY2sOiuMeJ3c4KkhJBtDKSH3jCiC6o
Message-ID: <CAEmg6AVrJ0A9QsnDZApdnq4gu=x0_1soqrhNv9oBMQKNGtsKqw@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com, 
	ioworker0@gmail.com, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org, 
	xavier_qy@163.com, ziy@nvidia.com, Barry Song <baohua@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Catalin,


On Tue, Jul 1, 2025 at 9:59=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Tue, Jun 24, 2025 at 11:25:49PM +0800, Xavier Xia wrote:
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
> >       #include <stdlib.h>
> >       #include <sys/mman.h>
> >       #include <stdio.h>
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
> >       int main(void)
> >       {
> >               test_contpte_perf();
> >               return 0;
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
> >
> > Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> >
> > Scenario 1: reduced to 56% of baseline execution time
> > Scenario 2: reduced to 89% of baseline execution time
> > Scenario 3: reduced to 91% of baseline execution time
>
> Still not keen on microbenchmarks to justify such change but at least
> the code is more readable than the macro approach in some earlier
> version.
>
> Do you have any numbers to see how it compares with your v1:
>
> https://lore.kernel.org/all/20250407092243.2207837-1-xavier_qy@163.com/
>
> That patch was a lot simpler.
>

You can check the comparison data via:

https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@16=
3.com/

The v1 only optimizes Scenario 1 case (where all PTEs are both young and di=
rty),
but it degrades performance in other scenarios. Although the current
version increases
code complexity, its optimization results are notably significant.

--

Thanks,
Xavier
