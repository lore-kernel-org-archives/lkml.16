Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC221CC5B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135978; cv=none; b=ihf8rmW4ZTeShBEsiwo1EPvAVDJ0LPdubu8IC3IpLRPLufOSYVKUPxdGwgqKC1DeJ8D+ABW9RD8dIuslOXR4lmwvYm5/8IIENmU+aKxGwZVSoqMDasMmqXpySGg9PhNzRizprkptJesW+6Ifga3/4gFqE84d/H5XPKS34pJEz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135978; c=relaxed/simple;
	bh=yLIQ36zIxHl6/3BZOxrKEQwBOchAamPk7ksDmr6vsZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AcwO/mNPzcE9ULJDH1A5tTQgIoG1RJphw9zYTh6aNcKTCv2ZuYdyPuKaizKfKKDlDcVKp6HN5AzcQNruaHHBG2/Dk4mxqvVVNMQn/tQC18bmRxFa0vS/SPvZYrk23RRF6PBQet2oeU3pJOFKrGeTm9t+2Wz5c5YUdJ2sb54YSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOh60h4F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOh60h4F"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so35255535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747135975; x=1747740775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NeexaecluE3glhmFl8HKTpyUz8DvxBD8WiwioUAmIpk=;
        b=MOh60h4FN64VCaneNrvTgaVREvysj/nNemA6dR1KfZ6gc1P1J6ru4iYQcGDA6kKq8Z
         CJzU69S7eGvfUo4cCp+pCPlyKNDgIkV1bkvhhPAwEFQiGLjoKugYNrs740mQsPHSULRg
         x+uDpTu1lDZUKwNsMdDZgsT1BJvR61fcAdUvWYoiLng6K3xkvsW9jWHJFIzt+5JtE3c/
         +wfP/gFsWFKqlZTZLW+kFHZiKtSjDjjc/dCzJKRfXNpi2XuOw5b58JVCxL86OQue1RpL
         HMkNLc9QaqPhB8qtiiMspjiRk5FCtRZffepu9GF8qWnP/VnHDWpiZW9TiAt6gMvTnbxZ
         CB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135975; x=1747740775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeexaecluE3glhmFl8HKTpyUz8DvxBD8WiwioUAmIpk=;
        b=hWvK2sOMkt6bi279U8gCtVfULmirTRt66Uz86kdHUKSSZq8PTfFOK9apZI0ZTndb8L
         K8WIolE/lLVjMwZ66uSCDjLktcm3hQVOH/WzZIZzdbl9XUzeGqqFApRO2TlLNWsBQ2fE
         Ll9osqDWzvBdA7GLGzlEomXygu2Xm4kzYZSgzW7q4KCLaiYV270y82t5tDGDymf6GCbv
         +MAM7YH23PdHXPWbgPqj1rGZwz+6koKdtV6bOXY0Efkj+rbIZKSBt0LHIEcJLczsilQ2
         9erBhrXn0MPl3KWluZTk58NkmUoSwlgj7DIsivfP1jUCJZOgFIqZ6hLFsApcBnU40EPz
         fzCw==
X-Forwarded-Encrypted: i=1; AJvYcCUUFxL7yZLidWVhjqptjntqX+uSrTWjvCpyZocG0AFjcGyXwNeya9zO3ElWCrABCB7wYRrSWKAXSCZv+xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2+SO6jwZlKRPYxi1Zjt+DxZGZeRvgSs62V2t+dEd1hwRvIzQ
	Zn6sploVjdD4xZO/8VjVwccKyJKKiL1fwj6ZEghpzlooijP9ZQ4WHCdomboJC77OJZvBaXaTfMG
	G5/LtDvjqsA==
X-Google-Smtp-Source: AGHT+IFzCGSQh3ByDHwJXSdwYGbHNrC1JP3Tr4kzTTUBlnbRVi877ck0vyMtS6ENFgUpgpql1htKkmzxuZA6/A==
X-Received: from wmbjh9.prod.google.com ([2002:a05:600c:a089:b0:43d:abd:278f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e07:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-442d6dd2164mr128953535e9.25.1747135974867;
 Tue, 13 May 2025 04:32:54 -0700 (PDT)
Date: Tue, 13 May 2025 11:32:52 +0000
In-Reply-To: <20250509200111.3372279-2-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509200111.3372279-1-ziy@nvidia.com> <20250509200111.3372279-2-ziy@nvidia.com>
X-Mailer: aerc 0.20.0
Message-ID: <D9V00HM1BVDZ.106ALY0AVVHFK@google.com>
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
From: Brendan Jackman <jackmanb@google.com>
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Richard Chang <richardycc@google.com>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Zi,

I hope you don't mind me jumping in on a late revision like this...

On Fri May 9, 2025 at 8:01 PM UTC, Zi Yan wrote:
> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_migrate_skip, so that migratetype is not lost during pageblock
> isolation. pageblock bits needs to be word aligned, so expand
> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.

Forgive my ignorance but can you help me confirm if I'm following this -
Do you just mean that NR_PAGEBLOCK_BITS must divide the word size? Or is
there something else going on here?

> +#ifdef CONFIG_MEMORY_ISOLATION
> +	PB_migrate_isolate = 7, /* If set the block is isolated */
> +			/* set it to 7 to make pageblock bit word aligned */
> +#endif

I feel I'm always just asking for commentary so please feel free to
complain if this is annoying. But I think it would be worth adding the 
context from the commit message into the code here (or somewhere else),
e.g:

/*
 * Page isolation is represented with a separate bit, so that the other
 * bits can store the migratetype that the block had before it was
 * isolated.
 */

Just adding in that detail about the intent will help readers a lot IMO.

>  
> +unsigned long get_pageblock_migratetype(const struct page *page)
> +{
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
> +			MIGRATETYPE_MASK);
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +#endif
> +	return flags;
> +}

Can we just do get_pageblock_migratetype(page, page_to_pfn(page)) here?

>  static __always_inline int get_pfnblock_migratetype(const struct page *page,
>  					unsigned long pfn)
>  {
> -	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, pfn,
> +			MIGRATETYPE_MASK);
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +#endif
> +	return flags;
>  }
