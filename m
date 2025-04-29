Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4A524F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929463; cv=none; b=f+e4JyU1sNE6SiuxXxu1VPcmtfu5+g71QczZnAe4CruKIVQdvEx3HD0R5RgBVVZ4S3FyArW0hbJ5o1VWJLzGkWcEpJZBB0dwGAbu6dYVaQsorASB4IDJKtBUXzi6WuggE1aJ376bz7ODHb1vd/+JuHH3/rCt0fG6M4NRjXhiI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929463; c=relaxed/simple;
	bh=qmMGWA/AIFo6ntAEJl+Qb+o22lKemZQZVjbDbsxSyps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jopOXnn3qjbGzVqfXJlCDiyW1N9cMk8ReHu+iXvusJNRZ6t37nUh9I65QXij299OTd4KvoMqkxN1WFX5kUa7ucuFRUvy1K9GrtUu6Lrt+gRVnuHgURzqYe1Ich3TlSrWgBza7zjOk+OsKIdzfyusZ0ny2uxVnHJnnrNXd4fLSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AldBfz7f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AldBfz7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745929460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mFCOqPchENkCt7pSLEqwciB6yES/jFgTN8NWHGJtHGI=;
	b=AldBfz7fvnWW26yBLT1Y6RVMPPwm55F5gPHyCASzMSOBxZu3YoS2tMytBhLPF3OMj28aHX
	sJ1bo5I5zvOgzFV7ecOyFlV1vEm/+ylbQL4LcZ7JNPtU3ILa8oKv2fRKKczdVCLRH0Bz0s
	tm5n8Z0NQhHTpILVFHXU9nOsgilL2lk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-9vZh6eR9NdePAOl4zQFbjg-1; Tue, 29 Apr 2025 08:24:19 -0400
X-MC-Unique: 9vZh6eR9NdePAOl4zQFbjg-1
X-Mimecast-MFC-AGG-ID: 9vZh6eR9NdePAOl4zQFbjg_1745929458
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d01024089so39580815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929458; x=1746534258;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mFCOqPchENkCt7pSLEqwciB6yES/jFgTN8NWHGJtHGI=;
        b=aN8Sb3t4OXvAciBmIIhJZm2RitsAFrdJUltL/eyuMz1IzXdM+mw8Kse4mBkz4+Ui71
         VwigGEfiOGJkI32A/baPXmADjrBo3Jh3PaDlf1Gaf5EjWlOhKRRKBUcDDTSAGqOju1SQ
         4VFkBXB/h3hrtNZh0HJRkBmgASzZX3TpfkEtwWafv4EKJZshN7ruZcXV6afaMakUCniD
         K0s1WYn/9wPbeMnEy2KV1OJAEB60aX8hWnNgxVHlvYgKL17MYygUCR0x27Z6Hho5hlB/
         7nQoyNDGcYb99UNrYZcFTr0R4Bw54G/rA/CpoSJyOeCCHm0aCZ4Ot4GoD2Y3ruUBkJgE
         s7pw==
X-Forwarded-Encrypted: i=1; AJvYcCX1gfe3URSFom1lsHkr3QpGeUHMC7o5h53JHElYwx8OkIGH52zIhMlgQfWDhKPu2dKCrvGevaZEGmCyC3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRpGwmovKbH3AibQSp5kShkAHrexZ8SeGNAbZ6e/8+pltartrg
	cFk0W8Y2OR5Vj4mvPHKU1r3i2q425NSFCS/qKxi7DlidkTAvgT+Er6zLlLHIoUcmU/iwo/XDIfc
	z8yEWlAMIjtOdmHI4Len7oiof+/91WWCQ3ndnqdgjP/Hm9zreJO2zZOXWDSINIA==
X-Gm-Gg: ASbGncvMEKP83o3IcY4bEJBf3jMbggDeABYKyiWSR0sZRR4yHf53VAFZWEsQ6oDz9+F
	TaNSvxdyl1aY/9vLZrmCAxEj43uYAa5YqRucS3CDcOFALK8ZmQGqNzeCtMO6kTSrL8eqqV2fojC
	069I/inEQKRHP6QtDqklZT2U18WYnBhqxnisSX90oa2pijH0Vhg0pg6H+H0xMvvS5gVOXTb6jDW
	JNJg+EgtSriB7hYvM2NeXTT5fE040mllAzrsvp9FV57ZT7mxameelupz7GiYeyxDB0sagmESNBn
	dJJoAFTpTc2AhTTyTSY4ik7HmaIa1+Em5E0TN8OZdkfdNPYw2v/YaqZdgpaJK7K8a2pQFEh+UZQ
	NKugonrWVvELPpTzqtvdPXEvQXwy6Y8vRfhyt5d0=
X-Received: by 2002:a05:600c:ccc:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-440ab76a757mr127614135e9.3.1745929458065;
        Tue, 29 Apr 2025 05:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB58JE5GowtO4QYchEok3cHSeflvTfBzriOg4o+ZqIS+VlarLKiblTC7Qc6GXW6gJFSyvDqQ==
X-Received: by 2002:a05:600c:ccc:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-440ab76a757mr127613815e9.3.1745929457630;
        Tue, 29 Apr 2025 05:24:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d88cdsm186505745e9.25.2025.04.29.05.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 05:24:17 -0700 (PDT)
Message-ID: <78487605-8b83-4b77-8147-9e34e4f8fda2@redhat.com>
Date: Tue, 29 Apr 2025 14:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
References: <20250429114949.41124-1-ryncsn@gmail.com>
 <20250429114949.41124-6-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429114949.41124-6-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 13:49, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> There are no remaining users of folio_index() outside the mm subsystem.
> Move it to mm/swap.h to co-locate it with swap_cache_index(), eliminating
> a forward declaration, and a function call overhead.
> 
> Also remove the helper that was used to fix circular header dependency
> issue.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   include/linux/pagemap.h | 20 --------------------
>   mm/memfd.c              |  1 +
>   mm/migrate.c            |  1 +
>   mm/swap.h               | 23 +++++++++++++++++++++++
>   mm/swapfile.c           |  6 ------
>   5 files changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 1dc3416a9c0d..47b5746d5a65 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -884,26 +884,6 @@ static inline struct page *grab_cache_page_nowait(struct address_space *mapping,
>   			mapping_gfp_mask(mapping));
>   }
>   
> -extern pgoff_t __folio_swap_cache_index(struct folio *folio);
> -
> -/**
> - * folio_index - File index of a folio.
> - * @folio: The folio.
> - *
> - * For a folio which is either in the page cache or the swap cache,
> - * return its index within the address_space it belongs to.  If you know
> - * the page is definitely in the page cache, you can look at the folio's
> - * index directly.
> - *
> - * Return: The index (offset in units of pages) of a folio in its file.
> - */
> -static inline pgoff_t folio_index(struct folio *folio)
> -{
> -	if (unlikely(folio_test_swapcache(folio)))
> -		return __folio_swap_cache_index(folio);
> -	return folio->index;
> -}
> -
>   /**
>    * folio_next_index - Get the index of the next folio.
>    * @folio: The current folio.
> diff --git a/mm/memfd.c b/mm/memfd.c
> index c64df1343059..ab367e61553d 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -20,6 +20,7 @@
>   #include <linux/memfd.h>
>   #include <linux/pid_namespace.h>
>   #include <uapi/linux/memfd.h>
> +#include "swap.h"
>   
>   /*
>    * We need a tag: a new tag would expand every xa_node by 8 bytes,
> diff --git a/mm/migrate.c b/mm/migrate.c
> index f3ee6d8d5e2e..662e5dc44b33 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -50,6 +50,7 @@
>   #include <trace/events/migrate.h>
>   
>   #include "internal.h"
> +#include "swap.h"
>   
>   bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>   {
> diff --git a/mm/swap.h b/mm/swap.h
> index 6f4a3f927edb..91439d0ce50b 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -50,6 +50,24 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
>   	return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
>   }
>   
> +/**
> + * folio_index - File index of a folio.
> + * @folio: The folio.
> + *
> + * For a folio which is either in the page cache or the swap cache,
> + * return its index within the address_space it belongs to.  If you know
> + * the folio is definitely in the page cache, you can look at the folio's
> + * index directly.
> + *
> + * Return: The index (offset in units of pages) of a folio in its file.
> + */
> +static inline pgoff_t folio_index(struct folio *folio)
> +{
> +	if (unlikely(folio_test_swapcache(folio)))
> +		return swap_cache_index(folio->swap);
> +	return folio->index;
> +}
> +
>   void show_swap_cache_info(void);
>   void *get_shadow_from_swap_cache(swp_entry_t entry);
>   int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
> @@ -125,6 +143,11 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
>   	return 0;
>   }
>   
> +static inline pgoff_t folio_index(struct folio *folio)
> +{
> +	return folio->index;
> +}
> +

Could we just have a single generic function that does something like:

static inline pgoff_t folio_index(struct folio *folio)
{
	if (unlikely(IS_ENABLED(CONFIG_SWAP) &&
		     folio_test_swapcache(folio)))
		return swap_cache_index(folio->swap);
	return folio->index;
}


-- 
Cheers,

David / dhildenb

