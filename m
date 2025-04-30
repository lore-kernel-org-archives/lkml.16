Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5DC2983E9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046346; cv=none; b=SI3U2gup6oGp3U/WH7WSU6K/WGiTf406V3Ck5ypbiDF9dQWBKv//PwKk1btDbq+fHiDlCqOiEDaNmzWFpsiaAq9WysHPbzOikT8LsNMnqiGuZxXc2ouPniYcMc0HnDDC0Q1gSYDEalThvHy2++6JDgtjGbTul+YERVIvkKdWVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046346; c=relaxed/simple;
	bh=wvJwBMeNEG6L7qXV18iRAqNdKebQ0TFLRjuHZzWsT1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFapJsG8eCtyuSQDQLJIywbyeN+azTHTUD0BUhhNA032ec7WYznJ/3nSKpzOwR3XCJN7BBwsv6+tN9H0+XZndiqzFxw77cls0nRz6NbMl37W/ISwbL8N7guP9OQwVmK1sinPzp4jBzj/bas0cqOHEGnU1pYKHRXqHM+ALouChv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBv5s+cw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBv5s+cw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so683a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746046343; x=1746651143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23hiVYsmBQF9yQXvvKwFVuWz0LAimBGXKxbs767cKCA=;
        b=aBv5s+cw/XctSCZu6pwYFKwdU6d7P6yf6nVNz5g5QczjdtX69wvQHtF9mqbzFcyJtS
         sAJionMGrxXuGiZYhgLgqHF5dG8ueogcAz7LNbtLItJwLLUXAiwXpNEn0ZzL+rQqDgmm
         5ozMMKfuCGFxMeQxXOiLEEfdk/UvutTognVUiajVNO4khkskmuAN25svgnj/Zak6RXfx
         zOAHOJKdauZuDpUiS6XMaRux5HYUJ4xSsPJ58RzqNKJvonCadBg+xVXIimF51ptBqFYJ
         I+Xswz6xgLbfUZWHjBHBwcvwGaozX/Ncvw91qgm/4kY6PcwPlQiG6TmQJhZDk3A2Yq9U
         VOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746046343; x=1746651143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23hiVYsmBQF9yQXvvKwFVuWz0LAimBGXKxbs767cKCA=;
        b=a5Zetslg+PQ8ONBY39/Kgxe4NsTHIDKIry44MTiM03X7GyOEISjQI1htN4pVFFYw18
         fQsWf/kO5gCJny2jDaFzGW6pMM6/3dMxbbnabMUfp5Um7d/G6Vo/X/qy9TcrJmiGCsdx
         9MDNTNl9A2tiklt+6z49x2WEF7ApAMNqtEw1ZVum0XHGbMfzxA6JiVCkdYF2LU+i8CsX
         B6O1UE7k7ufE9SRNVmOuDeH3KBdcylVElg5DU5Douxoxidqg/MLEJH9lYiU3xp603SZw
         DFNIo9MIZQv8GVO1x0LxRmP1LC+WJrtibRte2zfTJW+BL9w3S2XwansRIeHq7yo0t+eT
         F2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ghvXFJiPIriCDqte+rTyHly7+eAlWKiUakUJp6uwS/pEdYkEqT23gM8tSoiMZrvd7iTH5Wpl/7UoxJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEaUCyVCmPOnIWwvb+WpTN32AfwGuqjmVyFaL4NmxucazKbau
	j0Uwhvhf9nwHSekxqWjcpMTstFVqyKSeb+lwO1DfFjnMj2FlhqGw6cOFalM2VuqFblCvaMxVAq1
	qrlEhcHwVR+5u5yQri2g6offoIiKVmPqdcCVb
X-Gm-Gg: ASbGncu+Ac3csrb7mg+bouz1LE+qn4afr2Yx0EBxgIsStMdj0PgBRdxA3BNNPKgu8AX
	kJ+/kakJLWBMaE6O6H+pDWKhNMlOdRzbDVQh7j24OVRY3R1OwReA6xbHF81dJ3PJ4gUNj3t5pEH
	vqi9UDOZJQROPkKlkkB5QmyJmBfLuD2IwaWomkMT9IT3zCkvnlecg=
X-Google-Smtp-Source: AGHT+IE2B3xe/+DPD2M7lWdvwY8uHQG2L+pnPzy2O9bW24VKqvrt3dxQEMF9lvotWS4qoTaaP5jcihl9aeV++lrP6Is=
X-Received: by 2002:a50:d783:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5f918c2b650mr1378a12.5.1746046342783; Wed, 30 Apr 2025 13:52:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-8-npache@redhat.com>
In-Reply-To: <20250428181218.85925-8-npache@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Apr 2025 22:51:46 +0200
X-Gm-Features: ATxdqUHTpwiuUHFPjjOCSAtuFNVfWyscjbmOvS8EHiScAhewMiIQNRRDtNrYr8E
Message-ID: <CAG48ez2oge4xs1pSz_T9L46g=wQnFyC63kQKsXwbHGRWAxQ+aw@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] khugepaged: add mTHP support
To: Nico Pache <npache@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:12=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
> Introduce the ability for khugepaged to collapse to different mTHP sizes.
> While scanning PMD ranges for potential collapse candidates, keep track
> of pages in KHUGEPAGED_MIN_MTHP_ORDER chunks via a bitmap. Each bit
> represents a utilized region of order KHUGEPAGED_MIN_MTHP_ORDER ptes. If
> mTHPs are enabled we remove the restriction of max_ptes_none during the
> scan phase so we dont bailout early and miss potential mTHP candidates.
>
> After the scan is complete we will perform binary recursion on the
> bitmap to determine which mTHP size would be most efficient to collapse
> to. max_ptes_none will be scaled by the attempted collapse order to
> determine how full a THP must be to be eligible.
>
> If a mTHP collapse is attempted, but contains swapped out, or shared
> pages, we dont perform the collapse.
[...]
> @@ -1208,11 +1211,12 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
>         vma_start_write(vma);
>         anon_vma_lock_write(vma->anon_vma);
>
> -       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
> -                               address + HPAGE_PMD_SIZE);
> +       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, _address=
,
> +                               _address + (PAGE_SIZE << order));
>         mmu_notifier_invalidate_range_start(&range);
>
>         pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> +
>         /*
>          * This removes any huge TLB entry from the CPU so we won't allow
>          * huge and small TLB entries for the same virtual address to

It's not visible in this diff, but we're about to do a
pmdp_collapse_flush() here. pmdp_collapse_flush() tears down the
entire page table, meaning it tears down 2MiB of address space; and it
assumes that the entire page table exclusively corresponds to the
current VMA.

I think you'll need to ensure that the pmdp_collapse_flush() only
happens for full-size THP, and that mTHP only tears down individual
PTEs in the relevant range. (That code might get a bit messy, since
the existing THP code tears down PTEs in a detached page table, while
mTHP would have to do it in a still-attached page table.)
