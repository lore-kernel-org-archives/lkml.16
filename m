Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B445D2309AF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281763; cv=none; b=feqD2jRVIaE7HhZdl0o9wkygmShzXMZA5RUTwzde89ounxO1MdAJpDwI3ZNnRpP0VJG6kqbAw0RYNXYSYrWfpSfm+0tODUJYlkKwskZKxF6lCNQ9vsNlRIQehUwDkn+iRRp9++lMJrnJZDkmS/un/SFq2waeXLOyliLnhAn0kXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281763; c=relaxed/simple;
	bh=WaCcRr9zQWuvSZGkfH5Zl4CyXdd0NQyE96206quq+KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhuE4Fw5v0D3p40716+UVTdM7Rw+BzaBcEUogymO8Zrg7xm7egNaDw9jjgdXfxgu2vWC1nUBNqQCB3EhHycRjcDhZ1l72H8lQImbAe5t4tLVYFaOsJEQjMUt1IXJwA0HXH7dbnrIaZkLSwubvyifpVVvQuHTZEfcycQL1+BM4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QsHDyDZn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsHDyDZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739281760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z04xieTVSSjqGVmSfNHpRvbeVxnt/OPpjlijd1d2zec=;
	b=QsHDyDZn7K17xmqzGJUFA8Y7eorhjf8CXLAxKRmisvoL0aXrGEqWTqgviu+NJYFDPBZzXx
	NrqwZ076TFwmiVFYAsp//2PVEiq5oUuGhQpSOhncFyy9OGbPxxZTo49ZokNRzE6qJ7/+TM
	bACVdoGApjGKBNLGs3sJOjdvd/5hFJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-9D6KSg33NV2WlZDJNgysbQ-1; Tue, 11 Feb 2025 08:49:17 -0500
X-MC-Unique: 9D6KSg33NV2WlZDJNgysbQ-1
X-Mimecast-MFC-AGG-ID: 9D6KSg33NV2WlZDJNgysbQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso14802705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739281756; x=1739886556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z04xieTVSSjqGVmSfNHpRvbeVxnt/OPpjlijd1d2zec=;
        b=SXO+2SkkMCiGTk/07B4rFO+lJhODOH+C9bNevcuA94/JJSJb1XxOb6zyDX7q+q0CDB
         1TAZQRKgWQt2C1ZaEE1BeY7RrzrJvWpKdsQSZ7XdOvpf79x6GzGrTxKRPNYvFkBq1e0a
         N8gA4g+fmpQhLeeIc2fgwv4Se1rgwapLn1aaPLOccjNOo+eyMBsTBs7NE1zgI5nYI+pv
         psFHzj7BrsMQqf5dPA1ac5W5jOrdASyWELegQ3heI9jBJXMgo6B6/DPiNpzl07LBRnn/
         b3jA/XxPza6MekfdAPhNyvztMqQE0oGyCiEUzePI6jqJfPCGSoZVJFQyYX7P9IxJZBa7
         Bz1w==
X-Forwarded-Encrypted: i=1; AJvYcCX5ul2hAmOHoU6PQaQ/a3dRKW3RMi6eTdLdR1drs/hFV0F1Z/07huosK8wGpz2sMa3aKtXARzgQfGMlufg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSMCm2feOSUAfmk3Qr/v5e+UGsIwuap1g5IXKU8WXfxCLq8USC
	tMhhumjJhqhhEmcp66o3cinpEw+RzyKRH2eoePwMVpCi3iXzlYsmoRga7abVbl6MQspsbRo0UIo
	4iSEWOVxirdIeObRh0F9p96DpC5wWDOGJ8k1HiD1oHWVQuHCVPXh5FjF6Zpzzgw==
X-Gm-Gg: ASbGnctVTufm2kfJWWTmAJ4Z87ekU+NCD0DyRmjeErdF0TEPIR0hfiX/SLndvc7O8pY
	dwHrE89ABEU/dP1GmW1Wp91/wN9g9F4CG+lWppqm8GMzf8kcvFrc33Gkk0ILz6UueGtr2ieHeaK
	p1D6i5iJmjB40kToiNcmqVUe7c0M+XkI2ct81eWLWk2UsTqJ+RaHeWVku5SjxPPbytgz1DZDIAL
	W3PAeIOtJyne7NcAUH9rS/kySY3EKPVYQ/DQCILxxyvh3w2at+NC2xEZ3NAq9cPNHdQjtumeHmo
	YVRDuEaxjxjUuDEuaNAW2aU/7c7cQP1U4bqDD6M=
X-Received: by 2002:a05:600c:3494:b0:439:43b1:e60 with SMTP id 5b1f17b1804b1-43943b1108bmr86923725e9.17.1739281756432;
        Tue, 11 Feb 2025 05:49:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEka9WjkWk9QCTideeilCnodZcw9Xoe1YTaw59e/8HoaZM5k1CJr4YcGufrqrhch2iJbw1nNQ==
X-Received: by 2002:a05:600c:3494:b0:439:43b1:e60 with SMTP id 5b1f17b1804b1-43943b1108bmr86923485e9.17.1739281756082;
        Tue, 11 Feb 2025 05:49:16 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm74374905e9.23.2025.02.11.05.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:49:15 -0800 (PST)
Message-ID: <1f9f5fb4-27cd-4981-aa60-789a33376598@redhat.com>
Date: Tue, 11 Feb 2025 14:49:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: hugetlb: avoid fallback for specific node allocation
 of 1G pages
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 yaozhenguo1@gmail.com, muchun.song@linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, rppt@kernel.org
References: <20250211034856.629371-1-luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250211034856.629371-1-luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 04:48, Luiz Capitulino wrote:
> When using the HugeTLB kernel command-line to allocate 1G pages from
> a specific node, such as:
> 
>     default_hugepagesz=1G hugepages=1:1
> 
> If node 1 happens to not have enough memory for the requested number of
> 1G pages, the allocation falls back to other nodes. A quick way to
> reproduce this is by creating a KVM guest with a memory-less node and
> trying to allocate 1 1G page from it. Instead of failing, the allocation
> will fallback to other nodes.
> 
> This defeats the purpose of node specific allocation. Also, specific
> node allocation for 2M pages don't have this behavior: the allocation
> will just fail for the pages it can't satisfy.
> 
> This issue happens because HugeTLB calls memblock_alloc_try_nid_raw()
> for 1G boot-time allocation as this function falls back to other nodes
> if the allocation can't be satisfied. Use memblock_alloc_exact_nid_raw()
> instead, which ensures that the allocation will only be satisfied from
> the specified node.
> 
> Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>   mm/hugetlb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 65068671e460..163190e89ea1 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3145,7 +3145,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>   
>   	/* do node specific alloc */
>   	if (nid != NUMA_NO_NODE) {
> -		m = memblock_alloc_try_nid_raw(huge_page_size(h), huge_page_size(h),
> +		m = memblock_alloc_exact_nid_raw(huge_page_size(h), huge_page_size(h),
>   				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
>   		if (!m)
>   			return 0;

Yeah, documentation says "The node format specifies the number of huge 
pages to allocate on specific nodes."

Likely the patch simply copied the memblock_alloc_try_nid_raw() call; 
memblock_alloc_exact_nid_raw() seems to be the right thing to do

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

