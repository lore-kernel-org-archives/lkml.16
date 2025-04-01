Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530A2040A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530165; cv=none; b=uZC+q8D9LINJ90TXB9ELafalf6UAXCkqAPT/4mRUCTUSg1IFoJj1YYNFDfs3ZociwOTdg7CCAUBMSe9/bfbWABoFqA38JwRA8XUHOoYZXSMqByTeUtQdOZ+kX0KlhDzuOAkzDEszsz3Wz3mHGkYF31kPTukWVuiZ8ac1P9dFYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530165; c=relaxed/simple;
	bh=i5hn9a8H/v3n4+W99nGhL574JuJveqR7/t6FjhRVuRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtBD6jaO4F1b+oTnFMlLjUtyhpjoxe21CTTtthLjaJg8Fn1td8WAa3bHLOMWo8MbnfraBGRf8NygDwiRQV2G+PB/v9ywll0PSd7ux/ZU0DZgRGZM4rtYFUrbqWRw7kFNHV9BTjzWsIcIG0Joy/Cpqsl2Wff/80UwcDheBe0oRmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSF8ZLfZ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSF8ZLfZ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso7825591a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530163; x=1744134963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGSHngqKdQ6JAAV9PdN+ZqX5Z98Ode3U7b6CpgYXwAs=;
        b=aSF8ZLfZFPFD0bpLrPB2ySz4WrnM6FBrsHgQxJJ83646EXnUE4rFpE6HDH6ixEN9Zm
         xM5k+WwB1FXOLY5twEHZO+TVHrOGk5yB5e/+YGmbIw2mvS3CbATlqKz5n5huOs7xiOVd
         DGcov2Bp8hiO6ITVkk3KujEeFoe68arn2eZDm61mLs7XBiJ1GGaPfzfI8+2s51jzsuqt
         qDfHP9BUxaRxHMQBdMKa+y71mpvf2MBXzs6VU9YZHeSfJo03XhdT+kMcKpz4FNHgIdmb
         O8dryywSe4sR9B29mioaY7YVmV2/MUy8wQ0AmxlwVwHd8Ykuu3dFTwzqwdu27ns29cNv
         0BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530163; x=1744134963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGSHngqKdQ6JAAV9PdN+ZqX5Z98Ode3U7b6CpgYXwAs=;
        b=RQJiovobup4tkR76GwnWa2bTayM0W3HUihiZwuZSTDa1xAp+Xhq7dbFUH3W148iHOZ
         t+HdQcUX5rfrEYLOOAOXBWcZJeRd14VNQKu29jzRKBSQWvk0QNDWZSEQ7SfIzcuL0U09
         ezKOFXmE42dG3XOv+GszByLbVgGsIIJDITmJ2i440uQYARX/Y5x2dp+fXeFRM5ZjMrng
         dRVVaFW7E5z+n4PNYlpv1qFzqS80GSMxy111UrvJOpxuFv52r7YKPHFU8z7GonM/YZbj
         Ub/0aCPwFqhyrL4zn8M7EPqoiC9LIsJDy2T4oG/whH831hIu0uop76V6A9zwUrmNxL2L
         Csww==
X-Forwarded-Encrypted: i=1; AJvYcCUZMGyoK/bREjMPR3uOqpIONaFw0phmopceohWuS5T3tNtbd+diPkLQLnLZfB2BVn4UMa5rsJdnjCSqvKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/esbrKUqVjlmY1YuCBLkTLJrihpFhC/FIH4C2gR7rZ8fCpfE
	L5dR26UYrPhfFrfQonPYEU1CrDsyYJxYqwM2u5XOq/+BvA4JBuOS
X-Gm-Gg: ASbGncsWjzhRW1mDma+o9BVlzS9OSvU1gAR1i67eBoxhHRI7/6+ied2TouqsbENQsgg
	UVcJeKgURxM4fFYmkSFVg1uJMffjkqPC6FOL4EkDYE2dOhO4MDwq+iy2ZEO/da3MFGE50yhuU/m
	jqzNwXKc4ztTcHOxsV7WAUDgUDGebKfY6cpkb5g3miOQc+DcfwyHfvPoxseKqxWAOAPDdHUROFP
	gYCCWC5Ut8dBMYnbmOSf3soLJrvhjBVz4fLqYJYj/buo4jMde+YWAGXa6entPDgUfDfQ9zIoI0y
	VOk60TNTCdReyDlbz4Ube6sK16WJO5WkHivrTvvYHwvfp+K8EbYFcRwisBnJvBHfVBT6zFuRuQS
	1
X-Google-Smtp-Source: AGHT+IFzxtb6Up8TviTRMN1Nyki5B4XWY7+F8iD6e9OmgHWH22s1bsVdwRo8/VpoHce14lVmZji6DQ==
X-Received: by 2002:a17:90b:4d0a:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-3053215d85amr18235332a91.31.1743530163398;
        Tue, 01 Apr 2025 10:56:03 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b2ebbsm11914226a91.41.2025.04.01.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:56:02 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:55:59 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, muchun.song@linux.dev,
	Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [PATCH] mm/compaction: Fix bug in hugetlb handling pathway
Message-ID: <Z-wor4KyJ-var3kp@fedora>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
 <Z-v_YnBV_XJ89NnO@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-v_YnBV_XJ89NnO@localhost.localdomain>

On Tue, Apr 01, 2025 at 04:59:46PM +0200, Oscar Salvador wrote:
> On Mon, Mar 31, 2025 at 07:10:24PM -0700, Vishal Moola (Oracle) wrote:
> > The compaction code doesn't take references on pages until we're certain
> > we should attempt to handle it.
> > 
> > In the hugetlb case, isolate_or_dissolve_huge_page() may return -EBUSY
> > without taking a reference to the folio associated with our pfn. If our
> > folio's refcount drops to 0, compound_nr() becomes unpredictable, making
> > low_pfn and nr_scanned unreliable.
> > The user-visible effect is minimal - this should rarely happen (if ever).
> 
> So, with compound_order() we either return the real order of the
> compound page or '0', right?

Yup. There's a world in which that folio could be freed and reallocated
as part of another large order page as well (where it would return the
order of that folio).

> > Fix this by storing the folio statistics earlier on the stack (just like
> > the THP and Buddy cases).
> > 
> > Also revert commit 66fe1cf7f581 ("mm: compaction: use helper compound_nr
> > in isolate_migratepages_block")
> > to make backporting easier.
> > 
> > Fixes: 369fa227c219 ("mm: make alloc_contig_range handle free hugetlb pages")
> > Cc: Miaohe Lin <linmiaohe@huawei.com>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> 
> Acked-by: Oscar Salvador <osalvador@suse.de>
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
