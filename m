Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3172F2C51
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627698; cv=none; b=tVsNAycNr8t6OlqKttsH8xySbmpzehBqJLuE8hmM/4pjWWrgNmilImP0CWG/HFWK8wnRxRHALDYdq01JIXp2dhRvYqwPiUnAiZDxYBQUNYrwjiLNJ+ncejU+BE0wqg7QoeinbV6MLY9E/j9lSQno4/7+XvWGkJDr9wav2Hwo5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627698; c=relaxed/simple;
	bh=aeh1nOA1SMQr8YGkZbceQh16hunVzrfgNaZojwqdgdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFCvci9nkeqLYZ2bJ0mvZRRmMLbcIP69No6wCRK9oWp0AO5IcI5ljCz6/L7RbPHXoeLMxvtHtg9mwPE4ZOMzvcylBEt6+HUi4l5keZTxif5OU3y5nZSsw6pOBnwJz8ZgjL9XIqicfVbhFs/8jXgdH9OReWYEx44T8NvJX4oNog8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fz8tmhDD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fz8tmhDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751627696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pLkebcs37QdmleDdjVVPJ2wuIzkHavJTHX9ult+c/4=;
	b=fz8tmhDDSshK+EjFSq0lM/oyEUG2AUqTRwMyWtxFTBQ/sbu5jVj7rlPhy4YfuoHtMxKYsH
	2Y/uWW/tLbjhd8EQy0CYDGRAIwqZWLbjSKAX2wdR0RIknCbezFKgdLZOFYptKGtzrCtocb
	/86zRVny/HqdIEtu+RMkFigPDtGJCU4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-FDfYn8YTMjO2MgzMdIdYUA-1; Fri, 04 Jul 2025 07:14:54 -0400
X-MC-Unique: FDfYn8YTMjO2MgzMdIdYUA-1
X-Mimecast-MFC-AGG-ID: FDfYn8YTMjO2MgzMdIdYUA_1751627693
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-553d7f16558so630131e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627693; x=1752232493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pLkebcs37QdmleDdjVVPJ2wuIzkHavJTHX9ult+c/4=;
        b=MIJdpxojcs17xq2ozSMr7AXKjB7jC4WfJof7M2uc4+khfzNgDaE0yTQ3dazFJMROBK
         iDZM3HEFRr/N7BYKhHcFkCIErrklV3w0n+0lidMUdaqPzlcfs5a+mcEPP6UpIhQXLxN4
         tkQP/QuBCxF2emgaJpQs2f+4CXmIBzITdNk6RNgUHliy23zuKJyAvZwIglK+dpjV/yYF
         UASpphxXd4becmfKUjjL6qDinREd9KouYvJRHutYN5Q8iObCmh66D01+oYjDFAMxXHYS
         Ld4YdGAi81Y6lVW+JZnI4+zAmW1kjGA7esG9RT2i3k6OBvPlZDQbfGAONNci8oz9APgR
         Nciw==
X-Forwarded-Encrypted: i=1; AJvYcCVh7fWOj2DtqC9W++w1jcWP+ehrxSquRXsey4Xjf2mVCw1isGmPv71Q4CaxsN6oOAmBcrod9PW5h0bazmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxROkTZKwQTP4DADOJeOO6br/Mh/fhIPEjk1s8tLN7FDaJ5COm4
	OMblrr65XQJr1wbGku5lxpD1otxxFu8f6tBcfeiPMXH3OUwBjJzF7f48JW5BX9Nah5HzU9doWA9
	6nfqpTVle3Rz5uKwXWvnur2rfsSZO/Ny6NpRUC78+fj2iQjsLQ7UX34KKIohc2uR0
X-Gm-Gg: ASbGncs8DnaPOrx7TTX1t0RUpxHxyBZLErF85czaZwkRlFFHMfk9ez8TvKpapCF3Hpn
	IXBWzSn1+dpOmJazmSqEPv6ZdL/bp2fEOasnUq8JUdNEnZ3EIRV1FFMjD+nMeDt+OVSul5iJ2mJ
	5xnDAi/y1aR+vpWOptvP4GznFFAvQiGck3U1p4vvTJ5/PEY3RPD2vvDHhKAn11tETW/b3NNg44N
	sl9nTmVhkXXaEuLx8/d+xrWUrbzNsQKLVFbJxuuusckV/XimPulatRwSOvyZ3viO/m/+KAfmPfA
	QWhRHixeQ6ePnciHJE1PayizaznQ7jLnVLqn24wxJv6DX/ha
X-Received: by 2002:a05:6512:318e:b0:54f:c2ca:d33 with SMTP id 2adb3069b0e04-556dc742f53mr678707e87.20.1751627692865;
        Fri, 04 Jul 2025 04:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe+mZzhbF/GPrjdqWw0ErCtUNIJiy+8KwW1WlvJgTONYdWorAud9n79hHADokc/A80A0fAMA==
X-Received: by 2002:a05:6512:318e:b0:54f:c2ca:d33 with SMTP id 2adb3069b0e04-556dc742f53mr678687e87.20.1751627692356;
        Fri, 04 Jul 2025 04:14:52 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5563cfb2e3bsm196542e87.215.2025.07.04.04.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:14:51 -0700 (PDT)
Message-ID: <173510d4-61b5-42c0-97a4-0cce8081b40b@redhat.com>
Date: Fri, 4 Jul 2025 14:14:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 07/12] mm/memremap: add folio_split support
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-8-balbirs@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250703233511.2028395-8-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 7/4/25 02:35, Balbir Singh wrote:
> When a zone device page is split (via huge pmd folio split). The
> driver callback for folio_split is invoked to let the device driver
> know that the folio size has been split into a smaller order.
>
> The HMM test driver has been updated to handle the split, since the
> test driver uses backing pages, it requires a mechanism of reorganizing
> the backing pages (backing pages are used to create a mirror device)
> again into the right sized order pages. This is supported by exporting
> prep_compound_page().
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/memremap.h |  7 +++++++
>  include/linux/mm.h       |  1 +
>  lib/test_hmm.c           | 42 ++++++++++++++++++++++++++++++++++++++++
>  mm/huge_memory.c         | 14 ++++++++++++++
>  mm/page_alloc.c          |  1 +
>  5 files changed, 65 insertions(+)
>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 11d586dd8ef1..2091b754f1da 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>  	 */
>  	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>  			      unsigned long nr_pages, int mf_flags);
> +
> +	/*
> +	 * Used for private (un-addressable) device memory only.
> +	 * This callback is used when a folio is split into
> +	 * a smaller folio
> +	 */
> +	void (*folio_split)(struct folio *head, struct folio *tail);
>  };
>  
>  #define PGMAP_ALTMAP_VALID	(1 << 0)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ef40f68c1183..f7bda8b1e46c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1183,6 +1183,7 @@ static inline struct folio *virt_to_folio(const void *x)
>  void __folio_put(struct folio *folio);
>  
>  void split_page(struct page *page, unsigned int order);
> +void prep_compound_page(struct page *page, unsigned int order);
>  void folio_copy(struct folio *dst, struct folio *src);
>  int folio_mc_copy(struct folio *dst, struct folio *src);
>  
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 95b4276a17fd..e20021fb7c69 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1646,9 +1646,51 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
> +{
> +	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
> +	struct page *rpage_tail;
> +	struct folio *rfolio;
> +	unsigned long offset = 0;
> +	unsigned int tail_order;
> +	unsigned int head_order = folio_order(head);
> +
> +	if (!rpage) {
> +		tail->page.zone_device_data = NULL;
> +		return;
> +	}
> +
> +	rfolio = page_folio(rpage);
> +
> +	if (tail == NULL) {
> +		folio_reset_order(rfolio);
> +		rfolio->mapping = NULL;
> +		if (head_order)
> +			prep_compound_page(rpage, head_order);
> +		folio_set_count(rfolio, 1 << head_order);
> +		return;
> +	}
> +
> +	offset = folio_pfn(tail) - folio_pfn(head);
> +
> +	rpage_tail = folio_page(rfolio, offset);
> +	tail->page.zone_device_data = rpage_tail;
> +	clear_compound_head(rpage_tail);
> +	rpage_tail->mapping = NULL;
> +
> +	tail_order = folio_order(tail);
> +	if (tail_order)
> +		prep_compound_page(rpage_tail, tail_order);
> +
> +	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
> +	tail->pgmap = head->pgmap;
> +	folio_set_count(page_folio(rpage_tail), 1 << tail_order);
> +}
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops = {
>  	.page_free	= dmirror_devmem_free,
>  	.migrate_to_ram	= dmirror_devmem_fault,
> +	.folio_split	= dmirror_devmem_folio_split,
>  };
>  
>  static int dmirror_device_init(struct dmirror_device *mdevice, int id)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index f29add796931..d55e36ae0c39 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3630,6 +3630,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  			if (release == origin_folio)
>  				continue;
>  
> +			if (folio_is_device_private(origin_folio) &&
> +					origin_folio->pgmap->ops->folio_split)
> +				origin_folio->pgmap->ops->folio_split(
> +					origin_folio, release);

Should folio split fail if pgmap->ops->folio_split() is not defined? If not then at least the >pgmap pointer copy should be in the common code.

> +
>  			folio_ref_unfreeze(release, 1 +
>  					((mapping || swap_cache) ?
>  						folio_nr_pages(release) : 0));
> @@ -3661,6 +3666,15 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  		}
>  	}
>  
> +	/*
> +	 * Mark the end of the split, so that the driver can setup origin_folio's
> +	 * order and other metadata
> +	 */
> +	if (folio_is_device_private(origin_folio) &&
> +			origin_folio->pgmap->ops->folio_split)
> +		origin_folio->pgmap->ops->folio_split(
> +			origin_folio, NULL);
> +
>  	/*
>  	 * Unfreeze origin_folio only after all page cache entries, which used
>  	 * to point to it, have been updated with new folios. Otherwise,
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4f55f8ed65c7..0a538e9c24bd 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -722,6 +722,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>  
>  	prep_compound_head(page, order);
>  }
> +EXPORT_SYMBOL_GPL(prep_compound_page);
>  
>  static inline void set_buddy_order(struct page *page, unsigned int order)
>  {

