Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D012676FF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638494; cv=none; b=L2CL8Tv2iIYxGci3/J/gD9+v0v8TQ0vkdSpWZdNJKQfeqDPUHxTirCJB8DNgUo7tApekqDU1te8DhcMiUZOfTxqd9jxe3yQP3EroUImRXtd+wozN3TO+C6d+TYZrtEIDlkzmymgEPq0b3AKna/VjLpVjRRcEB5C9yHTTRDgighM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638494; c=relaxed/simple;
	bh=pQyWID0prpRf3gQUWpov9tb2xD6qKVQjIcoV8giEDhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVSfbKfx7fd1p3Yf4WnacK2zsObMC6o9wEezzRshWJgp32XXzCzp4sQ413AWythhS3jtJ1smlpsPSCLX0IBNZ1ixbPeYSK5g8X7WbhFiuBKfkOUcb9FB1m7tGae9EOrd/3DhtbSY8nx/qpcQV+FTKL00a8G+cROrJNM5qmRXVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLHIaZW4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLHIaZW4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so3844117a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747638492; x=1748243292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sWesAb8GctBh29etQ8vM8G+6YOZQngZ5ZA5hsC5Ces=;
        b=GLHIaZW4tjW1cgUhlfGjhqsby+2mFd2bgK6W/6exNDP1NzGf1wwoCIQHbBBFx/8rjr
         HvVkWPll4hNQ7k/a7kSx7umBV0omvRdm1l8NhBQMf6KoWBQ0kvA7A9eAkBTbDhYJixDD
         OK/Eac/MoshP4UolY2FfG6ZKO/oEy9n+2Ow1SIMvuYs+fuMfJG/5U+Gyx+EcPGcyX4EB
         1r+F9cgZGu3vBJN7BAvjQot692zJp6aFj6KaZGwsH2FPA5gSTqNbFzB15wc4WOKWlHsF
         kQPEVzyafNWltn6UAJiptGGZm3tODGzyqO8ofgjdJHqSJHFC9iqbA2TCrNzVpXm7K1qU
         m0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638492; x=1748243292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sWesAb8GctBh29etQ8vM8G+6YOZQngZ5ZA5hsC5Ces=;
        b=XtS+Bj8kJv7twIu5g+ESrL0iAPLYIUYl4GJpb097U3SM9PuCnoa6eNV/bFC3IB1Myw
         /6muXcOEASuxD/dbqAtcxfUl94A+nAaqeoVHHkFbHDGuvFaCivF2Egi1FxujydfXM0IV
         cFPySNtmNi5a+/Vc11jp6RtM3ULXjEiX2bV1icgDoOPGXrN3wMXSJYirvC377P9kpyI0
         SO8CD3AQf9TtqxQXxPerKbL3nHu5BGYAlk9RZTtApfdcbPJMCN9qYElQW1TI4LcMh7A0
         qwHEXQOarUygtwpmFyk0oroJiyTNJwhS//1BKCFOGq+EG7RJFA2uz0Vmv3Be4LIIvpDq
         eOiw==
X-Forwarded-Encrypted: i=1; AJvYcCXIG3l0m8uNCyt/OuIYLxC95+IGl4GVFUeINTuDerqNttbBfStyTWr7H36LeUCDF/FOHmixosE92ol8yHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpY9+jqWe3Wf02vxzq0O60z3wltXu4JfqslnaLJat26z2NkwW
	ECaPhwCcsL/sVF5zA93pMb/bD6qg6KHDvP/qe7fWD5wHLXMs1W0iZUR0/mSlRQ==
X-Gm-Gg: ASbGncuOqWnra7J04TQNsqmA2hzmXu8jOXVWMHeBPOsotEJGBkhZ81Sy4EV/0VB76sQ
	X5cYorkPkgUcbn3FlR4/IjlcVP01s8Oh7sEVzpS5T6BU5+DYVUfv8TdKRebgY8QWu+kvP/FEaRn
	0lL5hOkjQZmAICSIbMEX6v/7qp/STjQoE+dEz7a7Cg8mHEZwbM4Bwn7+CRUS0BC8k0j+nNrIV7z
	jrP8BbvOCSpvs0o61ruLGujUUsxX4R+EzFoSIbuQg8zQ97JP2RkxZAB4oEIrviO/Xef9hmNRKtH
	RLbJJ0oB98mPPhvnmgwwmexVPi1Z+Jp2fRMBUirp5zSBv0bZ3pTbDbLaDHrnLeUXg3l3kw==
X-Google-Smtp-Source: AGHT+IGqbYDQNVakoHdggMT98Fn1F+E21285CGJezIFSeBUKgUkfyMh775fMoUPoeCPtwgYke5SWjQ==
X-Received: by 2002:a17:90b:574c:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-30e7d5b6f64mr16025077a91.26.1747638491891;
        Mon, 19 May 2025 00:08:11 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.138.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7b2dc8ebsm6009284a91.43.2025.05.19.00.08.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 May 2025 00:08:11 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: ryncsn@gmail.com
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	chrisl@kernel.org,
	david@redhat.com,
	hannes@cmpxchg.org,
	hughd@google.com,
	kaleshsingh@google.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	ryan.roberts@arm.com,
	shikemeng@huaweicloud.com,
	tim.c.chen@linux.intel.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	yosryahmed@google.com
Subject: Re: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP swapin check
Date: Mon, 19 May 2025 19:08:01 +1200
Message-Id: <20250519070801.2588-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250514201729.48420-12-ryncsn@gmail.com>
References: <20250514201729.48420-12-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Kairui Song <kasong@tencent.com>


> -static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_pages)
> +static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep,
> +			   unsigned long addr, unsigned int nr_pages)

> +	if (unlikely(addr < max(addr & PMD_MASK, vmf->vma->vm_start) ||
> +		     addr_end > pmd_addr_end(addr, vmf->vma->vm_end)))


> @@ -4731,27 +4732,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  	page_idx = 0;
>  	address = vmf->address;
>  	ptep = vmf->pte;
> +
>  	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
> -		int nr = folio_nr_pages(folio);
> +		unsigned long nr = folio_nr_pages(folio);
>  		unsigned long idx = folio_page_idx(folio, page);
> -		unsigned long folio_start = address - idx * PAGE_SIZE;
> -		unsigned long folio_end = folio_start + nr * PAGE_SIZE;
> -		pte_t *folio_ptep;
> -		pte_t folio_pte;
> +		unsigned long folio_address = address - idx * PAGE_SIZE;
> +		pte_t *folio_ptep = vmf->pte - idx;
>  
> -		if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
> -			goto check_folio;

We are handling a corner case a large folio is remapped to an unaligned address.
For example,

A 64KiB mTHP at address:  XGB + 2MB +4KB,

Its start address will be XGB + 2MB - 60KB which is another PMD.

The previous code will return false; now your can_swapin_thp() will return true
as you are using XGB + 2MB - 60KB as the argument "addr" in can_swapin_thp().

> -		if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
> -			goto check_folio;
> -
> -		folio_ptep = vmf->pte - idx;
> -		folio_pte = ptep_get(folio_ptep);
> -		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
> -		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
> +		if (!can_swapin_thp(vmf, folio_ptep, folio_address, nr))


Thanks
Barry
