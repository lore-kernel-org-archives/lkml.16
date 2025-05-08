Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C254A33
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696283; cv=none; b=IlChvo167qwIRi3VihR31EgVPQTpfDU1kALOWzjMuj12p8nyrSS1qdqdXUr7B6zExjOsqLtIY8UAbsMHNuHPKtIpqIf1oLWtlUhjSEhWuWiQK9X64tvlZr2CScJYuKZgYUbFc1RfT5DiyxRc6BCLwlvAgkvvrhJ4ym2Ae1MhdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696283; c=relaxed/simple;
	bh=GaqiCVOyHORd4kY5r0I19G8yYgj9xrHamtEhxHjqCEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xdytgnsd5zMVU3mvf+sIT7JruzivNvsxd8x3bRSmuu0asXje4u/yYHc6gePQE1QwHbPnV7pNYa/Ibbe6N7RiYpI/TuW4JVRdlMYfnZp5BC7bONHT5+C92HvsNbjA/UjSHOGE+zY2+DxZ1be6MljAClb0Fb4cP8i5N7wIr95/JqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EBICmJJq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EBICmJJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746696279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/dlxqAxUZaAt7g7clMdPr7lyvtO4KusfnEelUIQBrfU=;
	b=EBICmJJq11RxKnbsTJh5iUTGmk46MvdURVWfbSqVh+vrpoT0MBlHqckm70bKJX4TRmzkBK
	tQIQIQ+VTJubqWvmz955LleUOTg1P98euAWldrzIGUqCh8vD1/ItA++Fe4PXq+8UhQo2qo
	1/5Xi1xY8cuUk7ESRzt1kPDS1GSSGmA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-Gwj38Q4hM0aPdC2j3R0syA-1; Thu, 08 May 2025 05:24:38 -0400
X-MC-Unique: Gwj38Q4hM0aPdC2j3R0syA-1
X-Mimecast-MFC-AGG-ID: Gwj38Q4hM0aPdC2j3R0syA_1746696277
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-441c122fa56so3187165e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746696277; x=1747301077;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/dlxqAxUZaAt7g7clMdPr7lyvtO4KusfnEelUIQBrfU=;
        b=oTQ5hr/GvO5EPNxRADL0VjE9FYDKYBuT9Ud0w9Urw1NyQ9XtDrN9Z1H2BPwx0cp9vL
         YrXbWMfcuMnXigSVV+ukcp7uACU+gSGC2IuKDg5O388f72ioD/wZa+/PXIHkmUWzKaoC
         RgKVtDTTnVDzej7lQ1ODJ4h9BmvF3KKhQbP0H904UBTNEsP90dKODeLKpRKUCSseKau4
         bRhrNskokkuSGYnBGWAUwZ4ATFz8042C14eXmwht/510WkSrKZ3S2SZkjmGRSBIIBlQ0
         tJr4yNF6yRMu+hRH3GjtcTcoSBtZ+N051vk3YRNF6BdvuoPNqLo5qfsdzKDm2B6Ghyya
         Gibg==
X-Gm-Message-State: AOJu0YzxL0K1OtlDqKLPVWfEpnXbNkOQU1i/z0eeAH7R2fjeiqqw2Cjt
	X2svh+VrmWVJjt88jljAnUOXq7eZjjqVlskt6lG2hBegzmtsOF944AlxeQwL2M8ZZ8KXSSJnOb2
	PYH52NiVWz7RcfEEWzVczKsCIKAuNE//g5ApEev+3QeEiUr86BF4ZHGy3rmhKbQ==
X-Gm-Gg: ASbGncuoVh3Fw1bB23DdukhuW3W+Iu+XRsMUMeDP7Pacu1zLw7clTV0xIueMkA5yh4j
	C36Gyzhe7FXwWE14Nu1KejNn6olA3wbRi5nBb5H5D4EUx0O+bZvsJM0uBWoOvLcAUj8ENP7sZV0
	BdYx0GmkpDcWWLchliuM9pKbiGiVDfAvfh8UZrBzF0OH89MbGY5RfdAEjc+kGKR/6HVvtaaKL9N
	59ub/OqQAe1DelLmT0u1gzijh5q53JXX4fmKGD/iQ+C2Y+Hum3gAApqpOVX0WiUrCovQ5U9W8iR
	OyGkmkVRWJyojrwiXf6VwOVVhE0yGgHOi9h7OMS+Sofl5aJIrq0/6ITlT6rTeitZHps4eyD3HI5
	/o6lizMSPAA9APJik4JDOKfFhPavZXK/pmz+SNLI=
X-Received: by 2002:a05:600c:8186:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442ccf9f153mr46315295e9.16.1746696277298;
        Thu, 08 May 2025 02:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmkno/mhxrd9N4OZqFeNahYtTVQaRZNkJxl/ggkkKu2E6OOqDo4H2zrQWAIVF+FLCz9vkkNg==
X-Received: by 2002:a05:600c:8186:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442ccf9f153mr46315005e9.16.1746696276924;
        Thu, 08 May 2025 02:24:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bef4sm31036855e9.24.2025.05.08.02.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 02:24:36 -0700 (PDT)
Message-ID: <0e00e429-01d8-4504-8238-565e1bca5ad3@redhat.com>
Date: Thu, 8 May 2025 11:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>
References: <20250508090735.39756-1-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508090735.39756-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.05.25 11:07, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> As David pointed out, what truly matters for mremap and userfaultfd
> move operations is the soft dirty bit. The current comment and
> implementation—which always sets the dirty bit for present PTEs
> and fails to set the soft dirty bit for swap PTEs—are incorrect.
> This patch updates the behavior to correctly set the soft dirty bit
> for both present and swap PTEs in accordance with mremap.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950afb9afcc@redhat.com/
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   mm/userfaultfd.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e8ce92dc105f..bc473ad21202 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1064,8 +1064,13 @@ static int move_present_pte(struct mm_struct *mm,
>   	src_folio->index = linear_page_index(dst_vma, dst_addr);
>   
>   	orig_dst_pte = folio_mk_pte(src_folio, dst_vma->vm_page_prot);
> -	/* Follow mremap() behavior and treat the entry dirty after the move */
> -	orig_dst_pte = pte_mkwrite(pte_mkdirty(orig_dst_pte), dst_vma);
> +	/* Set soft dirty bit so userspace can notice the pte was moved */
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +	orig_dst_pte = pte_mksoft_dirty(orig_dst_pte);
> +#endif
> +	if (pte_dirty(orig_src_pte))
> +		orig_dst_pte = pte_mkdirty(orig_dst_pte);
> +	orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
>   
>   	set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
>   out:
> @@ -1100,6 +1105,9 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
>   	}
>   
>   	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +	orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
> +#endif
>   	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
>   	double_pt_unlock(dst_ptl, src_ptl);

Yeah, I think that should be the right thing to do.

-- 
Cheers,

David / dhildenb

