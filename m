Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D32E542E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950444; cv=none; b=l9I8ncnRRaKhKsZCIzDd0BA0rBkxk/EP/Y6BmUF/cgNsjfjZKIiFhiIYqVMnsL6PuabjvDrw/gkkpgRUF+oT5L9spstVnxWeE+3um+9pcvdlryXr1Dm2p7n5B7RWsvnEY4uaI5l+upnSbZm+xlVxrLMOBiPgM32BVGHtdtK9YI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950444; c=relaxed/simple;
	bh=GtrABZ4P7bhXpnNFwbg9AuRNgTcVzRhV4VQHPFE0O/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idPubFQ3SBpbO6R9B0Z5R4xwunRMy6g7a2Z5O1svOvV6h/Xq1L7aYqK+c151oKAwQRmPatgKHNLbPdcWvY4pV3eGZZkkt3Zi31K8wyuwBCji6GnVXHtirMuvcX8F/Wsv4s2j3ohDERtzKsmHAXwPZPAO/FI1T2OW0h6PfeNLNlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rwXJthZv; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rwXJthZv"
Message-ID: <424599d3-9bd0-4cd5-9ad7-37cebdc765e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750950438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBC/1zbAsFpTgrTOlWvqmN/0W6sOeRbe2I8GaEuZn+U=;
	b=rwXJthZvAow/TQ7NghrfNCplJc1HKGgRLL2BT/VCLAVS9iExHzIvFe76KM5Ym+drnT9iNK
	I7eq87HK3WMGi/9Y+aMJIQQOZ4EVrCIDZNQKaKIUbL0aGyMz4LGpRNYOOURq7W4o4CbUDK
	om962XvRHAyMXkvg+foBGCsYMvV/vvI=
Date: Thu, 26 Jun 2025 23:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
 <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
 <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/26 22:39, David Hildenbrand wrote:
[...]
>>>> @@ -1870,12 +1870,13 @@ static inline unsigned int
>>>> folio_unmap_pte_batch(struct folio *folio,
>>>>            return 1;
>>>>        /* ... where we must be able to batch the whole folio. */
>>>
>>> Why is that still required? :)
>>
>> Sorry ... I was still stuck in the "all-or-nothing" mindset ...
>>
>> So, IIUC, you mean we should completely remove the "max_nr < nr_pages"
>> check and just let folio_pte_batch handle whatever partial batch it
>> safely can.
>>
>>>
>>>> -    if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>>>> folio_nr_pages(folio))
>>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>>>>            return 1;
>>>> -    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>>>> fpb_flags,
>>>> -                 NULL, NULL, NULL);
>>>> -    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
>>>> +                 fpb_flags, NULL, NULL, NULL);
>>>> +
>>>> +    return (max_nr != nr_pages) ? 1 : max_nr;
>>>
>>> Why is that still required? :)
>>
>> Then simply return the number of PTEs that consecutively map to the
>> large folio. Right?
> 
> Yes. Any part of the large folio. Just return folio_pte_batch() ...
> 

Ah, got it. Thanks!

