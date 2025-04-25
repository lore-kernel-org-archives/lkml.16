Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945C2749C3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594924; cv=none; b=F7Y8i5lhnUybVweqmwgKCNpChru9c+mc6e2WWsgFaSY/6YP4Cs9K/3cwmSny40xqwB4ZMtqK4Li81NZLkFE5T6yfA4PIzNa4phoPXXoK3wLlTU/Q4QPkcUrdRZfjtYwvpVuODUy2KIwuUfM8gXNGZi26RDN3gJ2cCrujAHf2PY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594924; c=relaxed/simple;
	bh=VaWxyn0ToHxWG3NlCJF/PoTlUbQR8YEADm27r7EkWMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iih3Pn2MI7LFEyEWEKp8WzUciu8nNJioIQJZD1kXBG7gw1/DTszf2XYNPBvm8g5r59cO4QpQREMshuldwVoxh/Fd9ZQBnSYPk8e8S38VFiOSOvauknt8ghq3XFhff7rF7kUSR8YUyVtgCJ3TzEH8wgO3q6gqvk8w1F1f6YPjQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMgD/8pg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMgD/8pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745594921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYreMA6jskYRTiTo4bjU+q/aoyL3CpRyN924JbDi7iw=;
	b=JMgD/8pgSLJuFQfJ5C3o9/mJJpSoqwfsS1lwx6sD63oRXZcWHHFrceivDBF7qGdKpo63Uq
	JkAiqMthbLMgvd4r8J9kUQqR4/eO1e7y82XJ9AjxbfgUfjgsimzytvmH0qkvaKCr3PJxxs
	gjs68odIacBlJbPW9/Bg6vmD56g1q0M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-Xz4k4OSKNQy4KyEMjYMewA-1; Fri, 25 Apr 2025 11:28:38 -0400
X-MC-Unique: Xz4k4OSKNQy4KyEMjYMewA-1
X-Mimecast-MFC-AGG-ID: Xz4k4OSKNQy4KyEMjYMewA_1745594918
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso389890785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594918; x=1746199718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYreMA6jskYRTiTo4bjU+q/aoyL3CpRyN924JbDi7iw=;
        b=ql+Va/FhWIh/EoEJ7baFBuRVi82Qshd4j8QF2B3P+moHOcBWl6qJyzNejHH5UELgJK
         J05JFAzxTIei/eievIguJqQdK0UGFwa/MmZv1a/RPMJevuWz8yoO65DBUEqSLdxyb8QZ
         FhPp1Skj1UE6g/6BNtBsqlwElqYdxp4sl6OEWcHoZjQ2z6wBq22Nqt3JtK3CoP9HpqLq
         83OYe6cSNTyu5dHNEcjnluDRxCsA5olmGYiV+CSkiM2S08D1PSpXF2PBFWgqJsYC8+qG
         RIVH4zT2As67JKzWWtjii05CP8tyxwi55C5Gygke2jDoFVZPOLv9C1jzAPLSUURYijA0
         wtGg==
X-Forwarded-Encrypted: i=1; AJvYcCXTE8LuEPsWnCTI5ev7RYVIU4lzHyeOnn6KKhg/Y2yGadwevVHy/cbn9pS7LMjP7/eC46FS9OFXrSuk8ww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsg3PxU045BD4qjnjvv14Mmuc8wnXuDqsAQGB1+vH8NPKgGy3l
	eaOi2v6DoNob2s56wUB+PULtb9ZqK7tjI3e5tIr3k4vAqLRvWEt3BfMH7HtPNfPxmdd/ldtWZIk
	b8CFBtI+h0snSu7JitzsYG+ghKYKwWDSDRbu9UuN9qBt+agEZpQRzI8V/qgOr7A==
X-Gm-Gg: ASbGnctSorc2G6qcg6lLXSVhWDcY7QW1CdfIVEIbmZ3KOccku947H0kFurxkEQ/bhG3
	9nlU/Juzm/PVTzF4F57EO6yWK8gUUhCemkD+vqoVKY3JrDabbpjZ0QJ1AEkMhC6VbOa2bkmdLKn
	5p6baOAcL1qq02iRAaXZolp4YOsZL7eU/y33hCUd/BXD5MUaF8CZf98YZEHBwLcbqeJHl6o8UAi
	1CfJlo4Y2ixtzG5hxSvZkLMn7jHCUKUp3zdeDeVoPmmcRfOM19OQ+I8NLzlzUMmKaEudwKTJASc
	fUA=
X-Received: by 2002:a05:620a:1787:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c9619e843fmr426982085a.37.1745594918124;
        Fri, 25 Apr 2025 08:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0+kA83s0dAM+lG7r8Afii/3p0skSZ5IKJzraHNvyfeodOjIegRxzU7hQoPcGyjWdGlk9Xw==
X-Received: by 2002:a05:620a:1787:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c9619e843fmr426979385a.37.1745594917809;
        Fri, 25 Apr 2025 08:28:37 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cdc4cesm230823485a.53.2025.04.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:28:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:28:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Ming Wang <wangming01@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn, gaojuxin@loongson.cn, chenhuacai@loongson.cn
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from
 huge_pte_offset() for none PMD
Message-ID: <aAuqIsKEjcVUU7jn@x1.local>
References: <20250424083037.2226732-1-wangming01@loongson.cn>
 <aAqHkdXt50van31B@x1.local>
 <b8fe05f1-23c2-423f-88cc-310996c6aad5@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fe05f1-23c2-423f-88cc-310996c6aad5@loongson.cn>

On Fri, Apr 25, 2025 at 10:47:24AM +0800, Ming Wang wrote:
> Hi Peter Xu,

Hi, Ming,

[...]

> You asked why the check involves pte_none() rather than huge_pte_none(), given that LoongArch
> provides the latter which correctly identifies the invalid_pte_table address.
> 
> That's a great question, and the crux seems to be in how the generic code path works. The crash
> originates within smaps_hugetlb_range() after the generic `is_swap_pte(ptent)` macro returns true.
> Looking at the definition of `is_swap_pte()` (in include/linux/mm.h or similar), it typically
> expands to `!pte_present(pte) && !pte_none(pte)`.
> 
> Critically, even though `smaps_hugetlb_range()` deals with HugeTLB entries (often PMDs cast to pte_t),
> the generic `is_swap_pte()` macro itself, when expanded, calls the **generic `pte_none()` macro**, not
> the specialized `huge_pte_none()`.
> 
> LoongArch's generic `pte_none()` macro is defined as:
> `#define pte_none(pte) (!(pte_val(pte) & ~_PAGE_GLOBAL))`
> This definition does *not* check for the `invalid_pte_table` address and thus returns false for it, 
> leading to `is_swap_pte()` incorrectly returning true.
> 
> So, while LoongArch does provide `huge_pte_none()` which *could* correctly identify the state, it's not
> actually invoked in the code path triggered by `is_swap_pte()` within `smaps_hugetlb_range()`.
> 
> This is why modifying `huge_pte_offset()` seems necessary and appropriate at the architecture level.
> By returning NULL when the underlying PMD entry is none (checked using the correct `pmd_none()`, which *does*
> check for invalid_pte_table on LoongArch), we prevent the invalid pointer and its problematic value from reaching
> `smaps_hugetlb_range()` and subsequently fooling the generic `is_swap_pte()` check that uses the generic `pte_none()`.
> 
> Regarding your point about generic page table walkers possibly needing `pte_none()` itself to handle `invalid_pte_table`
> in the future – I understand the concern. That might indeed be a separate, future enhancement needed for LoongArch's
> generic page table support. However, the current patch addresses the immediate crash within the existing hugetlb-specific
> walker (`smaps_hugetlb_range`) by stopping the problematic value at the source (`huge_pte_offset`), which seems like a
> necessary and correct fix for the present issue.
> 
> Does this explanation clarify the interaction between the generic macros and the arch-specific helpers in this context?

I see what's off here - I'm looking at Andrew's latest mm-unstable, which
contains your other fix already:

commit 2f46598ca15065ff7efac3dba466899608bfc659
Author: Ming Wang <wangming01@loongson.cn>
Date:   Wed Apr 23 09:03:59 2025 +0800

    smaps: fix crash in smaps_hugetlb_range for non-present hugetlb entries

So we're reading different code base..

Looks like the generic mm code used is_swap_pte() in multiple occurances on
hugetlb ptes already. Besides smap code you mentioned, I at least also see
page_vma_mapped_walk -> check_pte also does it.

I'm not sure what's the best to fix this, and if it means is_swap_pte()
should work on hugetlb pte_t's for all archs.  However you're right if
that's the case your current patch can fix all of them by fixing
huge_pte_offset() in loongarch's impl.  So it looks like at least the
simplest.

Acked-by: Peter Xu <peterx@redhat.com>

Maybe you want to ping the other patch to drop that in mm-unstable too, if
that's not your intention to merge.

Thanks,

-- 
Peter Xu

