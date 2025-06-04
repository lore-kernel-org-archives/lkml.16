Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04082864
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029921; cv=none; b=oeJm87ns5qUpXFtU/ch1xXtVE0IzVIYBf7u05/MyBgoStWYPCJlEbL757tyCTgtlTiucVRBi44wF8uLVR0vot82P9YDtISHPsEYHB6MEqfQw9AXHDq1o9Xw2jnMu0GWLyaMN92+vWzDW0YMn+DxFBU9vKihZI3l0tt8/3BUvygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029921; c=relaxed/simple;
	bh=bPEijz33OCflh30HN6mHlgTbhPKyHpd+EHrFxoyoVug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLDK4ZC+ihBR6+6tg2yWZLXUJu0vbJfwCxZgjPX8QSgjqFDrsgfZd4NKS5tLFztM4raShe9vxYychT6q69Qq+AcYFHhh9u2K4xzmdX3ikEuE5rMG3lt32ptLhLq0LhALm7mHWenQ0kt6aw8oPxPr80WdCFR6UxWR2fvPQ7xPxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUasG4cH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUasG4cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749029919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gpx6tDJBl4ZRNXlwEZ3goLD9Mt+7BJdqf7MbNFs2CXM=;
	b=eUasG4cHpU/hJC6BukWLzg/YzIMwF/teLRcjLvl2ia8Wv2bnzpn7/N2fdMcT+ZFUBBYTkM
	NfGkV68r9DedKKnQrWp6vXAhxIMr8Zq8vba3s3ykUaqszpEVqQ9/C3wLjeg6izRgbw5R03
	g5IISD2d41AeARL8pgsnmrQAezEL4hc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-DJ61s4Y7NsmBwLYXlDmjog-1; Wed, 04 Jun 2025 05:38:37 -0400
X-MC-Unique: DJ61s4Y7NsmBwLYXlDmjog-1
X-Mimecast-MFC-AGG-ID: DJ61s4Y7NsmBwLYXlDmjog_1749029917
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cf229025so18710745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029916; x=1749634716;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gpx6tDJBl4ZRNXlwEZ3goLD9Mt+7BJdqf7MbNFs2CXM=;
        b=RZJeNPICyDBlVDuLZQMJUlHc60KbqtzJbrKOqxIGY+nvaYDz99STOg1CGreOM3m+ex
         hZEUUplstvtrDDwFm6VP9IlKZhaBrfph/a4zOVHhQ8gqzRwFS2vCyZdS4j5oCB/D3GXm
         gCX4JmmC2U9gWyl+ssYW5pQFfj8CIxJUospCFNfkVYRQZ8tNyWVt7bUT89uY+pbi7bFt
         19ZJJD86U1HzjBAkAkyk1E3pPx1tsqAdQc/f+f0RCq/sOe3rSI9Ayvc4k8Ts1h78JATL
         MjVLsaQ+1x1a7q8KmkiOQ2dTijH1BsuFj9WMIpr/IhLy3vnRhUOOCuAYp6ucYBQ8fDnK
         CffA==
X-Forwarded-Encrypted: i=1; AJvYcCXwV0atatLLNbKDV+f0Ckjx4d/iJOzMNrau1UzpeA9l4Snnvmpr28KJ7DRKvpadFR5f6IkrbJ/RQWEFGAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZiENUXmakPXJ1uK3IKI3ZC3elu2S64n1dDXVflj/txZEnmt1
	4OXGe2jXD1Kha7DfGmlm5WLVw1oBTnJ5rrtbKZS/IBGSbARh0gMZLx84thBXL84rYFRV5b+ZMwc
	ls0Yc8uJVpYZZHcsEVBIBPjtcML+ley7Sxl54v22vtqkWEP66B6D3XWSg2Xr7STgmbQ==
X-Gm-Gg: ASbGnctaEtfVGDH1pykRc16g5zJ7J2eF6rYvi9kyvIhAuCjOtTjCbVfCSlGLspL0r0G
	td+Y6+yDvY5urz8kdEhx0W67cJbMlpk3piGL1FKZqBo/S+skndQfVL+Afv0nSdgzp6uGtJoiFK5
	sV6YnLBwP8tM5LzFBXTZA6lIz6j+ktHFD3KRCuy1c1Q4lU9+Tvq/QZ8c6nVVQUQ32bmELfnlDkT
	uUqA9BEdvScSzF69urStS0RItNo3JWblFBBiA54mzDFVZ8N7Uu0k5v3eQkSBAytcWFa5vVW3Ory
	cgbeVNSUQ7rngC6vQLBtlXAloAo4ubeBYOcKt1XisTqFekepeGgjH/NP+fMpsPAYlrkjE2O2B4C
	M/bgNoej8uH2EyWbunYC0r0PhWqCOS9Ti9mE1ggw=
X-Received: by 2002:a05:600c:4f50:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-451f0b3d1fcmr15529475e9.33.1749029916576;
        Wed, 04 Jun 2025 02:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhDvqnvGf6Bfa5YlLoHbj4qrKSXz6KWAdlhxSHlVgnJQCckFPOWc4xRbzkQI0ut0NbKaKj9A==
X-Received: by 2002:a05:600c:4f50:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-451f0b3d1fcmr15529125e9.33.1749029916092;
        Wed, 04 Jun 2025 02:38:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa23f4sm200336965e9.14.2025.06.04.02.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:38:35 -0700 (PDT)
Message-ID: <96f7d3a2-2d85-442c-a9f7-e558d4a2ba06@redhat.com>
Date: Wed, 4 Jun 2025 11:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.05.25 19:18, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> However, not all PFNs within this range necessarily belong to the same
> node—some may belong to other nodes. Additionally, due to the
> discontiguous nature of physical memory, certain sections within a
> `memory block` may be absent.
> 
> As a result, `memory blocks` that fall between a node’s start and end
> PFNs may span across multiple nodes, and some sections within those blocks
> may be missing. `Memory blocks` have a fixed size, which is architecture
> dependent.
> 
> Due to these considerations, the memory block registration is currently
> performed as follows:
> 
> for_each_online_node(nid):
>      start_pfn = pgdat->node_start_pfn;
>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>      for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>          pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>              if (get_nid_for_pfn(pfn) != nid):
>                  continue;
>              else
>                  do_register_memory_block_under_node(nid, mem_blk,
>                                                          MEMINIT_EARLY);
> 
> Here, we derive the start and end PFNs from the node's pg_data, then
> determine the memory blocks that may belong to the node. For each
> `memory block` in this range, we inspect all PFNs it contains and check
> their associated NUMA node ID. If a PFN within the block matches the
> current node, the memory block is registered under that node.
> 
> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
> a binary search in the `memblock regions` to determine the NUMA node ID
> for a given PFN. If it is not enabled, the node ID is retrieved directly
> from the struct page.
> 
> On large systems, this process can become time-consuming, especially since
> we iterate over each `memory block` and all PFNs within it until a match is
> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
> overhead of the binary search increases the execution time significantly,
> potentially leading to soft lockups during boot.
> 
> In this patch, we iterate over `memblock region` to identify the
> `memory blocks` that belong to the current NUMA node. `memblock regions`
> are contiguous memory ranges, each associated with a single NUMA node, and
> they do not span across multiple nodes.
> 
> for_each_memory_region(r): // r => region
>    if (!node_online(r->nid)):
>      continue;
>    else
>      for_each_memory_block_between(r->base, r->base + r->size - 1):
>        do_register_memory_block_under_node(r->nid, mem_blk, MEMINIT_EARLY);
> 
> We iterate over all memblock regions, and if the node associated with the
> region is online, we calculate the start and end memory blocks based on the
> region's start and end PFNs. We then register all the memory blocks within
> that range under the region node.
> 
> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement
> 
> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> 
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 15.621s (kernel) - 46% Improvement
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---

[...]

>   #ifdef CONFIG_NUMA
>   void memory_block_add_nid(struct memory_block *mem, int nid,
>   			  enum meminit_context context);
> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
>    * can sleep.
>    */
>   extern struct mutex text_mutex;
> -

^ Nit: unrelated change?

-- 
Cheers,

David / dhildenb

