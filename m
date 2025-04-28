Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5D11F872A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875307; cv=none; b=fWo0+b+zKMLUCaaauhTR1qZB764+o5ZR60UFKKKDijYRQsgbSKyC5/eC4XEOIiUBCPdwZTN3fWJz40gN+sgqCBTElcPGaGLMEewMpszr6TqQadersks4Ll0o7jYlk+i/z2yyvh393SKgy/XBKGcwwSmMpYxeRkqkOp8udYefFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875307; c=relaxed/simple;
	bh=7WaXuIFzLdlxyzdma1jRJN3pKfcvm4z81SZLxyEIKUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZYf/RfrU00H4vGG/SqkDCthFQPXqGZor/E9uDTAotKIMAFfiocItN5Tt55E7pHfB3T2dfx1d1CFA4DVzpfcy7trqi3vONuWAQwSp8OdAO/bnw0qulTLq2OGV6peD3m8AZOplV+hpKY1glwJmjBXQ1FZ03kPd3wGTiFxloR7dtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3aKs8Xd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3aKs8Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745875303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=29uqGi5Hs/CP0VQIvu7uqD9+Q4yErINjONc9IqNAHik=;
	b=C3aKs8XdSez+0Ec4MNg/0KYCgLFJQaN5IDQoyyZzsYMoAgZnH8Sptt0htZ+0VukwAEax/i
	tyGTrrUF8iQ1CXk1BJ33Ymb/QH6RxkUAt80R/gmfvog+RbxqJiKkN/3LZvg2bZJRDmuhI2
	nb63U+Z9i2+cQU+n4z5QWesbVmm8sCE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-53y1EuZ3M_eSY0RvnUWaVw-1; Mon, 28 Apr 2025 17:21:42 -0400
X-MC-Unique: 53y1EuZ3M_eSY0RvnUWaVw-1
X-Mimecast-MFC-AGG-ID: 53y1EuZ3M_eSY0RvnUWaVw_1745875301
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so3293539f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875301; x=1746480101;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=29uqGi5Hs/CP0VQIvu7uqD9+Q4yErINjONc9IqNAHik=;
        b=nfbPS+xwXF7GIB+nKAeOcV1VUakbsu9BZNYrTQzTOTxH7dTA50HHXDjjxsVbxQuwQz
         AR9Yjsq1nJW23Md3XbGCPiECAucYnP21P/3dV5H4vVs00rE+SUdI8v6wNKXWQnhmtlJi
         wxnNPo6nst+OwwYoxBvJjr+4pfuML5c0NZbBLuB2SY2XOCfjf8lu8Vy81S8hCzyNf/+1
         bbaBEhqAKre+rFgiP01Unsa1nCyu3uGMVthEjOyWZAiGgTtCFpowHjlW1M7hytvh7Wz9
         Sn1nR/4ZZ2n4LoR+gyUXzuBww+6ZKkCv6ab4zjrq1Cs1QMTl1iAO7YOeOmgZBnpBS7p7
         4D8w==
X-Forwarded-Encrypted: i=1; AJvYcCW6g0t+nH4IOL//SyXjGsA9DXXkPKCkcZBJEr0CRMOXetl+ly4/7ASwaHUqSGZFpjXYXH/xl3r7D7xkK44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zJKf0xdO+VzvkkiMsjXegRY1iWuelqbaEeosU1AUUPAgjksi
	pdpOp3UOwxQ8f2E1wULlgvSXsF5EBFtkZSp1FQgrZEzY+aE4wi4LZ/p5f+5qM08ZMNSSmjH+E36
	siWMVzrXXoJLUfxpVtLYJVVvckpEnSXr6CwvA7ikUjKEHKfGxV4Wcpqn+JoGJug==
X-Gm-Gg: ASbGncvjStRLOBs+3U3h6M7HMr8Of6rlvbbbsNm4LkI1VNkvZ5BNxG7zm1m5cqOl8SI
	qLYwA+F2X3da20yoHL0G5GiD9GFktfv0aywiRAcmy3CBEHOis9F1mnIpEyrKvlOnCxDR70hr36t
	ZBvh3aB+Vn5rsoxqmsCFwAEQqBc9EHaHzhqIebGIzNRuUHsgg9rRoxZNIhD+Y0ynQ7ftqOP09/U
	Xj3aok7wHNw0FehZS602K9E5T9F0LrkJRBWi1xtzTXJ79SG+LYV+TjE2uLnJY32Pr92hmy1wOPu
	z/A/1g1hgU0UvH7M0oCZGPA6CIjGqag9LBXcrqTQ2w==
X-Received: by 2002:a05:6000:4211:b0:3a0:80a2:3c5d with SMTP id ffacd0b85a97d-3a080a23c98mr4799594f8f.19.1745875301055;
        Mon, 28 Apr 2025 14:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwml6+v2Mz4VSekLRfftWEZlEY5QxzUP4+d3tpmpp1jCJSSZN0BAbLdzX4H5xvstQ7Xsc8Cg==
X-Received: by 2002:a05:6000:4211:b0:3a0:80a2:3c5d with SMTP id ffacd0b85a97d-3a080a23c98mr4799573f8f.19.1745875300619;
        Mon, 28 Apr 2025 14:21:40 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23ddd.dip0.t-ipconnect.de. [79.242.61.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm12037251f8f.87.2025.04.28.14.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:21:40 -0700 (PDT)
Message-ID: <7b63f0d4-b1d7-4f91-8a80-3a147aeab46a@redhat.com>
Date: Mon, 28 Apr 2025 23:21:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
To: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 19:03, Donet Tom wrote:

Nit: I'd call this patch

	"driver/base: remove register_mem_block_under_node_early()"

And then just naturally remove get_nid_for_pfn() with it, as it is the 
last user and it resides in the same file.

> The functions register_mem_block_under_node_early and get_nid_for_pfn
> are not used, as register_memory_blocks_under_node_early is now used
> to register memory blocks during early boot. Therefore, these unused
> functions have been removed.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>   drivers/base/node.c | 54 +--------------------------------------------
>   1 file changed, 1 insertion(+), 53 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 4869333d366d..59ec507fc97d 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
>   }
>   
>   #ifdef CONFIG_MEMORY_HOTPLUG
> -static int __ref get_nid_for_pfn(unsigned long pfn)
> -{
> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> -	if (system_state < SYSTEM_RUNNING)
> -		return early_pfn_to_nid(pfn);
> -#endif
> -	return pfn_to_nid(pfn);
> -}
> -
>   static void do_register_memory_block_under_node(int nid,
>   						struct memory_block *mem_blk,
>   						enum meminit_context context)
> @@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(int nid,
>   				    ret);
>   }
>   
> -/* register memory section under specified node if it spans that node */
> -static int register_mem_block_under_node_early(struct memory_block *mem_blk,
> -					       void *arg)
> -{
> -	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
> -	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> -	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
> -	int nid = *(int *)arg;
> -	unsigned long pfn;
> -
> -	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
> -		int page_nid;
> -
> -		/*
> -		 * memory block could have several absent sections from start.
> -		 * skip pfn range from absent section
> -		 */
> -		if (!pfn_in_present_section(pfn)) {
> -			pfn = round_down(pfn + PAGES_PER_SECTION,
> -					 PAGES_PER_SECTION) - 1;
> -			continue;
> -		}
> -
> -		/*
> -		 * We need to check if page belongs to nid only at the boot
> -		 * case because node's ranges can be interleaved.
> -		 */
> -		page_nid = get_nid_for_pfn(pfn);
> -		if (page_nid < 0)
> -			continue;
> -		if (page_nid != nid)
> -			continue;
> -
> -		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> -		return 0;
> -	}
> -	/* mem section does not span the specified node */
> -	return 0;
> -}
> -
>   /*
>    * During hotplug we know that all pages in the memory block belong to the same
>    * node.
> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>   {
>   	walk_memory_blocks_func_t func;
>   
> -	if (context == MEMINIT_HOTPLUG)
> -		func = register_mem_block_under_node_hotplug;
> -	else
> -		func = register_mem_block_under_node_early;
> +	func = register_mem_block_under_node_hotplug;
>   
>   	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
>   			   (void *)&nid, func);

You can pass func directly here and avoid the temporary variable.

Very nice!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

