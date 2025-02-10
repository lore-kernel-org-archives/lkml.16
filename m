Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C183632
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159111; cv=none; b=Zfp0qRvznOIokIUvHgtoHpGTb1pra/TctOXAdLNHFDFCJFMwf/4E/fiBxOBqwc139QpLpBftf37y4q+AHUwJ6HQ0wt3joweQTIMHYniZ38Dtk5ZnduJelj/j08OZTC1BVRZ9bujCWGLUydSPo4lFv33YwYC5O9V6lwvLwvUGqpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159111; c=relaxed/simple;
	bh=Fm6cVj/WjBgsuJPfNq1pGq8/DkCbL+Y8vlWkwYZ73Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BejKEyRQsxKiZRAv9LVEG0YTcCGLju4hiALvGLbGZX8vk7bL5TN0A2ZR9RaLo/BkBJeSXwZqSjRLIpjU4eJ1WiYP2l6O1egeS2VdsgIvhSC4dRC3ysS1RDR7J4AwQMBAhS1soBcnW9qQm/fM11DseiHAae7Iha/X8VXg095/kG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/OKBukF; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/OKBukF"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ba79f6c678so1113784137.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 19:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739159109; x=1739763909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrH3H45xGDQsKKJSfZ1ZGuXbNHSjoD6iw70B00N0f4U=;
        b=M/OKBukFxcPMV16AYy2zEt8dFiP41RQNfK6bC8EXXApBDpbsN1rbxamdEhyxdrvxmp
         +uUiq5Of9LOuvHUzUX2/TPkz5g1B1pebRioR18Nfen8VFVCRvJtuuF5ECgFRnwDPxf+b
         nkZ6YRs2S6Q1rfVqaxgZDtvZcylWMj8JT0VWqk4HY3VNSLBW4evsYaNdW/4GEoNv/gaD
         ExVmy6/KXKH8H+ldI5YnQnKVj4ty2LCKworVk9sIEHoTrxdzKt5vW30qY1bnrqSZOO3R
         H/msqpueEakeezoVp0L2Gp/fh4sdy16kpSAfDUfDoL/1XZ0a77WRQlOUBsVT0cTlw6Tq
         NSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739159109; x=1739763909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrH3H45xGDQsKKJSfZ1ZGuXbNHSjoD6iw70B00N0f4U=;
        b=fRbYfk93Ujb6BatvKv4s4Nw+khQ5iV2fKKDYU7QOHh3s6nmpIC7dua+66IOxFD8+TC
         sdmMeYr+Cb8yg8jsH5EqbOGJBW5LMiclKGBCO3v6CWVb3tbwxKTAZdAlwhFy01mUm6zk
         nFeU5q0b+LTVmQwx0xnEUVbMlHh+VxaWkkBhOkYl2xLtqoXKVsFL9E1CZeK9AyHVa0qm
         /dqDsBNQ33FJNA4UvaJGQYrr80qEHMZL07mLKc+C/D/pUtG01JolDNe7i3dBccFZECnz
         K7QSOITNPc6gn7mRPOLehSrX0cRxDcCAaoyCm2c6Zk4x23DuG5OadlStJ+x1RRh/I3xq
         V6cA==
X-Forwarded-Encrypted: i=1; AJvYcCWd7oWravNtBxBztULgfvZJpb+2IPEP5hfA/ghR6OaipHJgmpLtQGGciswQ4GYj/xnAfQql+TuI0IM3/Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGC8isEJu9lOKQzTllTVPbGRetpivWkLggiJxNa7rq1z3paeK
	LfLVbOsE4di16elEU+LzLzfCZY8fWOS2o5rfqy/d8Hpk3cRfTkJjZxASdw/DTy0rFQOK57mMcpe
	Zt/iuPWRCtVLNpn89tL6jPDqnGFw=
X-Gm-Gg: ASbGncs+hAIy3/iTPkPOr3xT6SLOWqoaPyYQzI66d//664mSMHWomvOj8vtiAfeg1ma
	dMSqGkIr+WKkEJTgNtQmiDgwu6Ea4iJT0NXZ7tep88zb7ExQu7kkOk93F7XU1Olh9JKvuo5/i3P
	5lpQXTa8wom5fi72z/2HY9h0zdkn1RVi0=
X-Google-Smtp-Source: AGHT+IEL/vT0c2/JjpJIapWwelliCNO8zWyTPXIfAdpD+v+MEPdjpOqc0GvFXRyd23qTFM1E2q1jL7qZ2Tmv4zPg7mo=
X-Received: by 2002:a05:6102:809d:b0:4b2:485b:e151 with SMTP id
 ada2fe7eead31-4ba85e1929emr7564766137.10.1739159108739; Sun, 09 Feb 2025
 19:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1739152566-744-1-git-send-email-yangge1116@126.com>
In-Reply-To: <1739152566-744-1-git-send-email-yangge1116@126.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 10 Feb 2025 16:44:58 +1300
X-Gm-Features: AWEUYZmJvDQL6PxmjmgrcMCGRqvblJVkLUq-BAD3C8C-jcdLwPdnVbLWcnB6LAg
Message-ID: <CAGsJ_4yobqDst0wwLAqgADa=q0OyUu5-U6iMYWbaQq6GyixPwQ@mail.gmail.com>
Subject: Re: [PATCH V2] mm/cma: using per-CMA locks to improve concurrent
 allocation performance
To: yangge1116@126.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	aisheng.dong@nxp.com, liuzixing@hygon.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:56=E2=80=AFPM <yangge1116@126.com> wrote:
>
> From: yangge <yangge1116@126.com>
>
> For different CMAs, concurrent allocation of CMA memory ideally should no=
t
> require synchronization using locks. Currently, a global cma_mutex lock i=
s
> employed to synchronize all CMA allocations, which can impact the
> performance of concurrent allocations across different CMAs.
>
> To test the performance impact, follow these steps:
> 1. Boot the kernel with the command line argument hugetlb_cma=3D30G to
>    allocate a 30GB CMA area specifically for huge page allocations. (note=
:
>    on my machine, which has 3 nodes, each node is initialized with 10G of
>    CMA)
> 2. Use the dd command with parameters if=3D/dev/zero of=3D/dev/shm/file b=
s=3D1G
>    count=3D30 to fully utilize the CMA area by writing zeroes to a file i=
n
>    /dev/shm.
> 3. Open three terminals and execute the following commands simultaneously=
:
>    (Note: Each of these commands attempts to allocate 10GB [2621440 * 4KB
>    pages] of CMA memory.)
>    On Terminal 1: time echo 2621440 > /sys/kernel/debug/cma/hugetlb1/allo=
c
>    On Terminal 2: time echo 2621440 > /sys/kernel/debug/cma/hugetlb2/allo=
c
>    On Terminal 3: time echo 2621440 > /sys/kernel/debug/cma/hugetlb3/allo=
c
>
> We attempt to allocate pages through the CMA debug interface and use the
> time command to measure the duration of each allocation.
> Performance comparison:
>              Without this patch      With this patch
> Terminal1        ~7s                     ~7s
> Terminal2       ~14s                     ~8s
> Terminal3       ~21s                     ~7s
>
> To slove problem above, we could use per-CMA locks to improve concurrent
> allocation performance. This would allow each CMA to be managed
> independently, reducing the need for a global lock and thus improving
> scalability and performance.
>
> Signed-off-by: yangge <yangge1116@126.com>

An allocation from one CMA region should not be blocked by an allocation fr=
om
another CMA region, especially since we may have multiple CMA regions or
even per-NUMA CMA regions.

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>
> V2:
> - update code and message suggested by Barry.
>
>  mm/cma.c | 7 ++++---
>  mm/cma.h | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/mm/cma.c b/mm/cma.c
> index 34a4df2..a0d4d2f 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -34,7 +34,6 @@
>
>  struct cma cma_areas[MAX_CMA_AREAS];
>  unsigned int cma_area_count;
> -static DEFINE_MUTEX(cma_mutex);
>
>  static int __init __cma_declare_contiguous_nid(phys_addr_t base,
>                         phys_addr_t size, phys_addr_t limit,
> @@ -175,6 +174,8 @@ static void __init cma_activate_area(struct cma *cma)
>
>         spin_lock_init(&cma->lock);
>
> +       mutex_init(&cma->alloc_mutex);
> +
>  #ifdef CONFIG_CMA_DEBUGFS
>         INIT_HLIST_HEAD(&cma->mem_head);
>         spin_lock_init(&cma->mem_head_lock);
> @@ -813,9 +814,9 @@ static int cma_range_alloc(struct cma *cma, struct cm=
a_memrange *cmr,
>                 spin_unlock_irq(&cma->lock);
>
>                 pfn =3D cmr->base_pfn + (bitmap_no << cma->order_per_bit)=
;
> -               mutex_lock(&cma_mutex);
> +               mutex_lock(&cma->alloc_mutex);
>                 ret =3D alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,=
 gfp);
> -               mutex_unlock(&cma_mutex);
> +               mutex_unlock(&cma->alloc_mutex);
>                 if (ret =3D=3D 0) {
>                         page =3D pfn_to_page(pfn);
>                         break;
> diff --git a/mm/cma.h b/mm/cma.h
> index df7fc62..41a3ab0 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -39,6 +39,7 @@ struct cma {
>         unsigned long   available_count;
>         unsigned int order_per_bit; /* Order of pages represented by one =
bit */
>         spinlock_t      lock;
> +       struct mutex alloc_mutex;
>  #ifdef CONFIG_CMA_DEBUGFS
>         struct hlist_head mem_head;
>         spinlock_t mem_head_lock;
> --
> 2.7.4
>
>

Thanks
Barry
