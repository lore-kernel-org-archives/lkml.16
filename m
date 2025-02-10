Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8463596B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176496; cv=none; b=l6IIPxdYfazX28yQ8hgb9fpj+DAzWxgi1OKSeX/92ImfkA7fG76SM+5wYCp8nvTyR346Aq/FzYGd3zmcfjvYOzvSmzS9I0Ld9PDma7q4/PJJhC+gyUc62WNj6c2U5Ovja0AxjOa41Yz5Qiz3REKcftcTSv48WC10ZInXre7xlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176496; c=relaxed/simple;
	bh=BxzRWTEDVIi8Fw7be2FyvwNPwHU7Hr9NCj/rNLWawlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8NPmATe5i44hKcUJNaRE52ME38G8PzbQ355GnDtFeUlDWmCFjUVYBVXUZ+LnOqlumGqGqnrbomjYOq/HLgM+lig/8xCw4KOwSkJzJRoaz+nMdtHPkWX06j2vBgK/QbaXb2E9FcSlPb3jKSpQ4CVZpafxNoO0VotnO+G78s879U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gU6O0BmA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gU6O0BmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739176492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Bi9cBbJd2CYHdeWl6fezKOHWGpeyWheLrEO+oIR3dZY=;
	b=gU6O0BmApni9rOOLoELpA+i0TxEk/5BKOX7WVfKP/BCyNzsZSvqQsqwjUr6lVU8OfjBh5V
	KkWwzTifMPoP5jhAIgcScwCCX6dwRcyEsxgphHNJlL1J7nD9fCFM+Lv7kGKw+qHLWpg0Q2
	oAJpWQTKpfZ9cjJ5KhcUEXx9NZsacrE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-_UbCXuz_PTCqpsQvB8btzQ-1; Mon, 10 Feb 2025 03:34:50 -0500
X-MC-Unique: _UbCXuz_PTCqpsQvB8btzQ-1
X-Mimecast-MFC-AGG-ID: _UbCXuz_PTCqpsQvB8btzQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dd8d11139so955857f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176489; x=1739781289;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bi9cBbJd2CYHdeWl6fezKOHWGpeyWheLrEO+oIR3dZY=;
        b=fQW5zfRRwVCFUAj240wTHKr8OV/Igyr+1hDy7M8MNhmBdnEqVlGXcRZdbC6djYLKYI
         A3nZ78VJHxi2B79czAH5MURABA1GucnkJ9ZjYsAZm7cIMiaQ7n+/QS04FJW9BGM/oze8
         SAyVMY6Cyj/uP3xS3r0kN+FaDegw1QP86AwGSqjt73hYi6Jv/93ZXtP5oq3JqiMqZ8b+
         zConMK2rPfe2U5s2rENz6evobnEs34XhoDcBe4oDhoaQABaSkU3xMU6Q0Dik4p/oYeRb
         7pOjnwm1iLRe/avWiqmL+SZ2CPNyKxDjtfGYMn5UzMGv22+g1Tr8GYlQCGi9lq2gU11p
         Gn3w==
X-Forwarded-Encrypted: i=1; AJvYcCVP0VjM0YYQ3LVYbdtjphTqB+FjNIc5vgWoEzDfLR6z8w4kaw9BfBYabo2C8Wb+RAozoIjYDvcfsKaBOIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyIeV3pu5EedRpGh5g0I1WDhK+tAoLx/4gkYVQe4U8qWdGbG0
	fqz6SxTIPNetjhpu0f3l57qJ741F5tME+QLTmIEwXsFea4k9huqBk6SvCfBuqRteEN2xAt0Ts5I
	h0lHPb8pf+RvHGYphsNRwgTQQQ3JSfdBrP1Nn/tOHYRw8JYBF43tWaH3HM/WhSg==
X-Gm-Gg: ASbGncswPE3P8GD5uUXLyKGbWbBPbcfE8OBBUrstEdQzaPc8Y8kf5i6TU1jb73/5+hS
	LoJ7eOXJk6j/9s3Z1O7s2yU9cm61l2HBvQwtLFvL5zsYXDg4Pium2PtXJMAvH5eUpzPCnZ6b/Ax
	Kb+l0rox6Wfc81VXe3mydaqoTnCBeHxT0YvauvhUOIv0w2fmXklb9LQmIsIwEgRFYaXEiHYuZ39
	EBJRs33eqSwDe1fwfaR3iQfh2rFaxp5nieCzy7mwzxmF+SC87TsVMkXSVHkXyqbKYUKuzeTnIQt
	zSscVW8TImn12uFvVqeTwOSJCpLP+gkPUaAbbqFwSe6hkQwhnLMjHI9H3MmNwEGsAwa9iHUTNYp
	5j2gL3RgdYGu9jtK5lbkdlL20WT3Hh6FX
X-Received: by 2002:a05:6000:1848:b0:38d:d3f7:74b0 with SMTP id ffacd0b85a97d-38dd3f777acmr5763437f8f.20.1739176489370;
        Mon, 10 Feb 2025 00:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjPw6diuMoqrOoG6rFj42cR6H2IlYtHABZ92gOCnABi7uh08xnI+qrE4vxXjEvaRxSmjYFCA==
X-Received: by 2002:a05:6000:1848:b0:38d:d3f7:74b0 with SMTP id ffacd0b85a97d-38dd3f777acmr5763403f8f.20.1739176488943;
        Mon, 10 Feb 2025 00:34:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc565d62dsm10391540f8f.93.2025.02.10.00.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:34:47 -0800 (PST)
Message-ID: <51514ffd-a1ca-4eb4-90ab-c6871ab92c95@redhat.com>
Date: Mon, 10 Feb 2025 09:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/cma: using per-CMA locks to improve concurrent
 allocation performance
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, aisheng.dong@nxp.com, liuzixing@hygon.cn
References: <1739152566-744-1-git-send-email-yangge1116@126.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1739152566-744-1-git-send-email-yangge1116@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.02.25 02:56, yangge1116@126.com wrote:
> From: yangge <yangge1116@126.com>
> 
> For different CMAs, concurrent allocation of CMA memory ideally should not
> require synchronization using locks. Currently, a global cma_mutex lock is
> employed to synchronize all CMA allocations, which can impact the
> performance of concurrent allocations across different CMAs.
> 
> To test the performance impact, follow these steps:
> 1. Boot the kernel with the command line argument hugetlb_cma=30G to
>     allocate a 30GB CMA area specifically for huge page allocations. (note:
>     on my machine, which has 3 nodes, each node is initialized with 10G of
>     CMA)
> 2. Use the dd command with parameters if=/dev/zero of=/dev/shm/file bs=1G
>     count=30 to fully utilize the CMA area by writing zeroes to a file in
>     /dev/shm.
> 3. Open three terminals and execute the following commands simultaneously:
>     (Note: Each of these commands attempts to allocate 10GB [2621440 * 4KB
>     pages] of CMA memory.)
>     On Terminal 1: time echo 2621440 > /sys/kernel/debug/cma/hugetlb1/alloc
>     On Terminal 2: time echo 2621440 > /sys/kernel/debug/cma/hugetlb2/alloc
>     On Terminal 3: time echo 2621440 > /sys/kernel/debug/cma/hugetlb3/alloc
> 

Hi,

I'm curious, what is the real workload you are trying to optimize for? I 
assume this example here is just to have some measurement.

Is concurrency within a single CMA area also a problem for your use case?


> We attempt to allocate pages through the CMA debug interface and use the
> time command to measure the duration of each allocation.
> Performance comparison:
>               Without this patch      With this patch
> Terminal1        ~7s                     ~7s
> Terminal2       ~14s                     ~8s
> Terminal3       ~21s                     ~7s
> 
> To slove problem above, we could use per-CMA locks to improve concurrent
> allocation performance. This would allow each CMA to be managed
> independently, reducing the need for a global lock and thus improving
> scalability and performance.
> 
> Signed-off-by: yangge <yangge1116@126.com>
> ---
> 
> V2:
> - update code and message suggested by Barry.
> 
>   mm/cma.c | 7 ++++---
>   mm/cma.h | 1 +
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 34a4df2..a0d4d2f 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -34,7 +34,6 @@
>   
>   struct cma cma_areas[MAX_CMA_AREAS];
>   unsigned int cma_area_count;
> -static DEFINE_MUTEX(cma_mutex);
>   
>   static int __init __cma_declare_contiguous_nid(phys_addr_t base,
>   			phys_addr_t size, phys_addr_t limit,
> @@ -175,6 +174,8 @@ static void __init cma_activate_area(struct cma *cma)
>   
>   	spin_lock_init(&cma->lock);
>   
> +	mutex_init(&cma->alloc_mutex);
> +
>   #ifdef CONFIG_CMA_DEBUGFS
>   	INIT_HLIST_HEAD(&cma->mem_head);
>   	spin_lock_init(&cma->mem_head_lock);
> @@ -813,9 +814,9 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
>   		spin_unlock_irq(&cma->lock);
>   
>   		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
> -		mutex_lock(&cma_mutex);
> +		mutex_lock(&cma->alloc_mutex);
>   		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
> -		mutex_unlock(&cma_mutex);
> +		mutex_unlock(&cma->alloc_mutex);


As raised, a better approach might be to return -EAGAIN  in case we hit 
an isolated pageblock and deal with that more gracefully here (e.g., try 
another block, or retry this one if there are not others left, ...)

In any case, this change here looks like an improvement.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

