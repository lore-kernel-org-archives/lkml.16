Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254321B81C1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230687; cv=none; b=WQQSsVOp2BlIyeA5Kk7d494Lq3N9+5EHwxttMR6177I2hh6db68NiMp46TydYHceWQL4WkCqs9yXesS7RFZviPfP2dws2hBpafAxaJqw4231DGeeTI10kKq1zv/o7GZalW+5opoFg1R10sy9yAgripQjJglrqqqxmNNKTfSGY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230687; c=relaxed/simple;
	bh=8UIe0mbcZxGl6HAVuQAu9CV5p9fg006dvocNfZQuaCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fy3fYW6bZneJavaaVRrCDpN+MpwXz7C53jS1AczuevTcc45u5XMfxCrOhHDmFHw/IgQuWXrqCys6Ka6IMqiyCbBKeVJnUSJr6aCz1vhrmgkkfUIgjn+kBUuZJtJMQ3RJk9pVWO1z13x7RDu2neLdDlTAjLR67SyhtZgBoykuReQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ig49FL93; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ig49FL93"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43675b1155bso6442065e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738230684; x=1738835484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
        b=ig49FL93FUTKyaZR5mLb/s/6QJvkiglhHIfcLiwX8A4vGHHp+43HY4Dp6cKu6Nwtj4
         lVbJ7ABeiC3KHCNqndAZ9Rs6EFxAbjue3hFGqZ7Jm95b8lhCVnOUEf1u4GXTGqAv2Nyk
         r8FqqNLn8v7Fu4l2T+pkYJFhyq5LfQsJVbtPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738230684; x=1738835484;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
        b=K/Y+BekhGnX3cD90ME5d3BeioSqXkOl1fuvHX+SkDQs3x3hloqgCGWjXcvLAE4DC6d
         o4PIf2cSuSiykjfymylvE0tF3i7ybpLzCBbA8rgVji2jdsvH3qrJJozumTCVgugxsPld
         SkqMfWWJ6LYX+WrnYqhbFY7PmyYWbN4+zkcnrEtF+AgUtv9sKGY5lhG2++4ZzptA2iZO
         EYWzEm/2hqaaPqI9++FRUDy1Gv1/MZWmWUhLsRg4420zKTuolI2hNht9khnpunbYrrGL
         DdS1uwR3Xr6IiEIDHmUGVNWmlWSuJV+yrhKviGb78F67xD7Vn5Kc/Nk3xttRvbGX8RHL
         LuRg==
X-Gm-Message-State: AOJu0YypX3MgLgYgihtZDFPTLqQ3Iv79/5t3LhAdx9A4CSH9l6tfL8Rp
	IH39hrEJdY0Vo4wl73BGoSySoYjkllh1mVx5kLCHBvgTAg+Fpf0bIPsUYcqV/uQ=
X-Gm-Gg: ASbGncshlg4tA3i7ksmusOQOjsgTNvrgj+QaIF3LQj0yIVVXsdhvZg/EKIGafhwUVco
	Gy6np1bakpEuc/aHTJeBvsk4i62jpfx6z+JjJaErLCzVQWBGZJqOKstMJToyd/6NZZZ8BzKqg2t
	fQDZrrTZ+y0stuQWXLbGgqxD1XqkmBQz5AitnoP59IrjlLhHyfb+UDTVzvRIne5pwj825ofCThy
	2TLbf+jDXbjB8AQh7Mljj43q7HsXSVFLeasEPgBrgXavBNO/8TdjJvkQbuf7OEOA26xHvZKuAld
	RM7kRGEz1fcZiQcNF+DGacG+ARI=
X-Google-Smtp-Source: AGHT+IF1314un3GQgKorQlU7Ooz/rQrCyj9j2D9rJRU+9J5toI9CX1diHYvVJ9K+Omvgaz97Oy+yBw==
X-Received: by 2002:a05:600c:1d82:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-438e298e709mr9982485e9.1.1738230684290;
        Thu, 30 Jan 2025 01:51:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm16833505e9.33.2025.01.30.01.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:51:23 -0800 (PST)
Date: Thu, 30 Jan 2025 10:51:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-6-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> Let's do it just like mprotect write-upgrade or during NUMA-hinting
> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> can_change_pte_writable().
> 
> Set the PTE only dirty if the folio is dirty: we might not
> necessarily have a write access, and setting the PTE writable doesn't
> require setting the PTE dirty.

Not sure whether there's much difference in practice, since a device
exclusive access means a write, so the folio better be dirty (unless we
aborted halfway through). But then I couldn't find the code in nouveau to
do that, so now I'm confused.
-Sima

> With this change in place, there is no need to have separate
> readable and writable device-exclusive entry types, and we'll merge
> them next separately.
> 
> Note that, during fork(), we first convert the device-exclusive entries
> back to ordinary PTEs, and we only ever allow conversion of writable
> PTEs to device-exclusive -- only mprotect can currently change them to
> readable-device-exclusive. Consequently, we always expect
> PageAnonExclusive(page)==true and can_change_pte_writable()==true,
> unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
> can_change_pte_writable() for now is cleaner.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 03efeeef895a..db38d6ae4e74 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  	struct folio *folio = page_folio(page);
>  	pte_t orig_pte;
>  	pte_t pte;
> -	swp_entry_t entry;
>  
>  	orig_pte = ptep_get(ptep);
>  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
>  	if (pte_swp_soft_dirty(orig_pte))
>  		pte = pte_mksoft_dirty(pte);
>  
> -	entry = pte_to_swp_entry(orig_pte);
>  	if (pte_swp_uffd_wp(orig_pte))
>  		pte = pte_mkuffd_wp(pte);
> -	else if (is_writable_device_exclusive_entry(entry))
> -		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> +
> +	if ((vma->vm_flags & VM_WRITE) &&
> +	    can_change_pte_writable(vma, address, pte)) {
> +		if (folio_test_dirty(folio))
> +			pte = pte_mkdirty(pte);
> +		pte = pte_mkwrite(pte, vma);
> +	}
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
