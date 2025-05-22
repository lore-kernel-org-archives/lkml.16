Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769F29D19
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915751; cv=none; b=Obzt5HpBrQJoUVz0wIH5RTpU37GgK7AsLu45SQAuL54b5/g9OwoY0gzPI3TfV6OP1Z8hlV/e/0PFR4THrzbDWis04kJr95osSM9CQuuP7s5+Dx91eCH99uraVgSuqWJYsaVv5iv9+bfvoCqjj9Rm9sZWI9H3xP1sO0JLgWrRsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915751; c=relaxed/simple;
	bh=2OT71y3KG48GLuGZJvhlpAWuITT+Slde3w+fhiNxFe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM8mtbGQqK/eKXv6YskVfzJsSSAvk49oybIXFhhE+/MvaC3hwwFW61cVkKPg4zwCOegRHmE/GhxhC2UG09tiOqf5arhNvxlZhTCdfwO8Vy585WLDLmNn/bCjU8hIQDPDmbd8tFdaNe+YfSy0+hVVI5gJ1QB6kL1OOVGOfXL4S0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVdR7dlY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVdR7dlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747915748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h44IAMVeMtd/tY4Uko+zGeVBMuEmJ/4cWrA7K+kWhWw=;
	b=jVdR7dlYcxLeX6fLI3wL8PeY8SfOo5uUCAkXhsOjygpQl3oWmnKZmhXTb7VlD4WmTV+I9t
	F0BN6MU20SEAVr9y75xeCM8ZErk/WiItW0mfNhAnb4WwiPYqeXpJKrVkH8nWQj1GkicfgA
	Qzha18vX/dmYyCK4cLsepqyW7jQtX+g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-gZLYHpm5MKSVsEf7MWPB5Q-1; Thu, 22 May 2025 08:09:07 -0400
X-MC-Unique: gZLYHpm5MKSVsEf7MWPB5Q-1
X-Mimecast-MFC-AGG-ID: gZLYHpm5MKSVsEf7MWPB5Q_1747915746
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a364d121ccso2796389f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915746; x=1748520546;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h44IAMVeMtd/tY4Uko+zGeVBMuEmJ/4cWrA7K+kWhWw=;
        b=eybkzUUBEYjNM1DvGw7nmW02uQRTobZ4+8ORoisFxY/7Dk0CGjjDcTS0GoxYKmST0g
         h2bCihmJiTtHMjTgrX3Z4orpozGSoylEZpbaROFh4ch0CzcHCICQ19kttNHo40a9WLGD
         sWyozQtzTQLABtllZEmKX2vHGttdPEHlUdwOb4ST20LGbhsFVVL8f2WQowIWPc+yG57B
         ZHG1e5FfYgNr3+l2ZfI4vztq/NuGJmPGO+m+UloD/KfkdZShGFNr8u5DgJKDZ0r9zFqr
         AbQ/dQJRVezkcdXLZSDEaFdDRDSInFnpvHmZn9Krp3mK+/ExubdwdItBMymQG8GM2AGH
         9MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS5SzcWjZCqLTLctIiXt3JP3arkCK6pzgrabWibnLlIb2bQMHiyVzbXXYHAe2m624AO7znShBIuvdRtf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRizPB64aUe7Z7tIrF0mIUcBe4MBAa7EnxYq9qCVWBzXbHxqGi
	GRVgej5DtA8gsjKt/mxznHjmYdW0h8xbeXT01qSRMmx3R0kbGusHd/xAaQHl4rhEbbzUXmDgw3T
	OwFBiIyhd8awDPAWfLjcOQjK2BOF5JWXg0LfatmVrKPsAlIQ3ALEdldgxYClC3oVBmA==
X-Gm-Gg: ASbGncvFsrW3VJRLuPoWXSL4rH2SvG4+xIJ9eTvxjXWwn3suOi9fDJpsf/fg8E0wSGg
	WgdA3Zr4jaeYJPQSz1ISWBIZjMsevGuDPhWxZGgvYQml6QAAOG+1aObOCLXNBy6R6g22LOKHmNk
	u+jGcVBSnsQFaMyBRYxglHHMd0pOqtYD/fazDqSQ5lKRZ21h8DP/RDV934qzUkVju+AzhQeNJ2e
	vr/YSsRwjTQp7mh7QAshtUi7btBu+bOpIdC6t7Ghjud7ssulmQuwJLkCX/a/Es13V/AC8xPUryO
	kTbrp7NY+nk65uesIRhiJk6lyqO6KQLZXxxUN3Ff43t/cmZ9nAuNz4R8tcQLpuJv5iI5RkA8HxD
	7n6fFdY6k5ZOefLAD1joXofjwThb/03acW4byYMA=
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a3655ed55cmr16869564f8f.47.1747915745830;
        Thu, 22 May 2025 05:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKStihXpAyFUJRGyp/g+Aoh3dtnhX6R0nZva9Bp5MgYHL9Vip9LjX4p7dLEH2zhm4rLg30Cw==
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a3655ed55cmr16869513f8f.47.1747915745275;
        Thu, 22 May 2025 05:09:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm100300165e9.27.2025.05.22.05.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:09:04 -0700 (PDT)
Message-ID: <aeb5cfd2-ca8c-4e69-b27e-74c6ab4de520@redhat.com>
Date: Thu, 22 May 2025 14:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drivers/base/node: Optimize memory block
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
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.05.25 11:17, Donet Tom wrote:
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
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> v4 -> v5
> 
> 1. Moved all helpers(memory_block_id(), pfn_to_block_id(), and phys_to_block_id())
>     into memory.h and exported sections_per_block.
> 2. register_memory_blocks_early() moved out of for_each_online_node().
>     Now we iterate over all memory regions at once and register the
>     memory blocks.
> 
>     Tested corner cases where memory blocks span across multiple memblock regions; it
>     is working fine.
> 
>     #cd /sys/devices/system/node/
>     # find node1/  |grep memory0
>     node1/memory0
>     # find node0/  |grep memory0
>     node0/memory0
>     # find node0/  |grep memory0
>     node2/memory0
>     # cat node0/memory0/valid_zones
>     none
> 
> V4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
> V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>   drivers/base/memory.c  | 21 ++++----------------
>   drivers/base/node.c    | 45 ++++++++++++++++++++++++++++++++++++++++--
>   include/linux/memory.h | 19 +++++++++++++++++-
>   include/linux/node.h   |  3 +++
>   4 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 19469e7f88c2..39fcc075a36f 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -22,6 +22,7 @@
>   #include <linux/stat.h>
>   #include <linux/slab.h>
>   #include <linux/xarray.h>
> +#include <linux/export.h>
>   
>   #include <linux/atomic.h>
>   #include <linux/uaccess.h>
> @@ -48,22 +49,8 @@ int mhp_online_type_from_str(const char *str)
>   
>   #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
>   
> -static int sections_per_block;
> -
> -static inline unsigned long memory_block_id(unsigned long section_nr)
> -{
> -	return section_nr / sections_per_block;
> -}
> -
> -static inline unsigned long pfn_to_block_id(unsigned long pfn)
> -{
> -	return memory_block_id(pfn_to_section_nr(pfn));
> -}
> -
> -static inline unsigned long phys_to_block_id(unsigned long phys)
> -{
> -	return pfn_to_block_id(PFN_DOWN(phys));
> -}
> +int sections_per_block;
> +EXPORT_SYMBOL(sections_per_block);
>   
>   static int memory_subsys_online(struct device *dev);
>   static int memory_subsys_offline(struct device *dev);
> @@ -632,7 +619,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>    *
>    * Called under device_hotplug_lock.
>    */
> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>   {
>   	struct memory_block *mem;
>   
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..e8b6f6b9ce51 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -20,6 +20,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/swap.h>
>   #include <linux/slab.h>
> +#include <linux/memblock.h>
>   
>   static const struct bus_type node_subsys = {
>   	.name = "node",
> @@ -850,6 +851,41 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>   			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>   }
>   
> +/*
> + * register_memory_blocks_under_node_early : Register the memory blocks
> + *                 under the nodes.

"register_memory_blocks_under_nodes"

> + *
> + * This function iterates over all memblock regions, and if the node associated with

"the node" does not apply.

> + * the region is online, calculates the start and end memory blocks based on the
> + * region's start and end PFNs. Then, registers all the memory blocks within that
> + * range under the region node.

More like "registers all memory blocks under the corresponding nodes 
..." then clarify that a block might get registered under multiple nodes 
etc.

> + */
> +static void register_memory_blocks_under_node_early(void)
> +{
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		const unsigned long start_block_id = phys_to_block_id(r->base);
> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
> +		unsigned long block_id;
> +
> +		if (!node_online(r->nid))
> +			continue;
> +
> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +			struct memory_block *mem;
> +
> +			mem = find_memory_block_by_id(block_id);
> +			if (!mem)
> +				continue;
> +
> +			do_register_memory_block_under_node(r->nid, mem, MEMINIT_EARLY);
> +			put_device(&mem->dev);
> +		}
> +
> +	}
> +}
> +
>   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>   				       unsigned long end_pfn,
>   				       enum meminit_context context)
> @@ -971,11 +1007,16 @@ void __init node_dev_init(void)
>   
>   	/*
>   	 * Create all node devices, which will properly link the node
> -	 * to applicable memory block devices and already created cpu devices.
> +	 * to already created cpu devices.
>   	 */
>   	for_each_online_node(i) {
> -		ret = register_one_node(i);
> +		ret =  __register_one_node(i);
>   		if (ret)
>   			panic("%s() failed to add node: %d\n", __func__, ret);
>   	}
> +
> +	/*
> +	 * Link the node to memory block devices
> +	 */
> +	register_memory_blocks_under_node_early();
 >   }> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 12daa6ec7d09..2a61088e17ad 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -171,12 +171,30 @@ struct memory_group *memory_group_find_by_id(int mgid);
>   typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>   int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>   			       struct memory_group *excluded, void *arg);
> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>   #define hotplug_memory_notifier(fn, pri) ({		\
>   	static __meminitdata struct notifier_block fn##_mem_nb =\
>   		{ .notifier_call = fn, .priority = pri };\
>   	register_memory_notifier(&fn##_mem_nb);			\
>   })
>   
> +extern int sections_per_block;
> +
> +static inline unsigned long memory_block_id(unsigned long section_nr)
> +{
> +	return section_nr / sections_per_block;
> +}
> +
> +static inline unsigned long pfn_to_block_id(unsigned long pfn)
> +{
> +	return memory_block_id(pfn_to_section_nr(pfn));
> +}
> +
> +static inline unsigned long phys_to_block_id(unsigned long phys)
> +{
> +	return pfn_to_block_id(PFN_DOWN(phys));
> +}
> +
>   #ifdef CONFIG_NUMA
>   void memory_block_add_nid(struct memory_block *mem, int nid,
>   			  enum meminit_context context);
> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
>    * can sleep.
>    */
>   extern struct mutex text_mutex;
> -

Unrelated change.


Apart from that LGTM

-- 
Cheers,

David / dhildenb

