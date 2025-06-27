Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E111F9A8B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004885; cv=none; b=NqBys3Y6HWKgy8JlEjk7Zc+t1YnfEFBsZYuAi3oG3t/vRzvRqyOfSAjNJbZ+TqfOLegFhkKcpB62I1HoQW/gW8U9DAG/R69c8KusTL0NZ3wVcDrcmqM5a70yN5zRB1yX+RVG8cJnKW7JqA3WxlM12Lw8kpcCgTqIl5l2HTSCxF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004885; c=relaxed/simple;
	bh=s20/Ee1rJ6rBoOY7u3AJ4u2WbhNf9ZVzZJHhv8LQ6K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqrqelLZTOICKVoQfv5t7faS8uoW+oaZwN+YthOuZCaKj9M8cX6opNgK7kinp20hwJrZubbhFMPCt9+AksRHWxDnf6ooS2I4F+BAYZn+3n/1xd54Wb9hC5fvc+wC/vryLXwiPZU0VPOLCYrxtjQtwbZBasKgPW63FSDKbeEbUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YfudznCY; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YfudznCY"
Message-ID: <e33bbf93-ed78-4cbd-9ed7-1e36453549c0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751004880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIqr1G8w341JdjB67nlcBhtQ9EOdz3z9dERZmNVdkZk=;
	b=YfudznCYk3WoX9DBBDdaJTY5VlTsRNSRfpU+C/HCgg4VyCUC021HG0XVnTunKtN57mjv5I
	P9Md7kHGGVfC0XgIc8DZFDdo/bVJqb8S9fohOQPbyv4PUceTJBy2Cwl1fATsK446rJr5f1
	YBewEH6Gy68GWtDSCHkKRwOtL6+xozs=
Date: Fri, 27 Jun 2025 14:14:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, Lance Yang <ioworker0@gmail.com>
References: <20250627025214.30887-1-lance.yang@linux.dev>
 <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/27 13:02, Barry Song wrote:
> On Fri, Jun 27, 2025 at 2:53 PM Lance Yang <ioworker0@gmail.com> wrote:
>>
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> can read past the end of a PTE table if a large folio is mapped starting at
>> the last entry of that table.
>>
>> So let's fix the out-of-bounds read by refactoring the logic into a new
>> helper, folio_unmap_pte_batch().
>>
>> The new helper now correctly calculates the safe number of pages to scan by
>> limiting the operation to the boundaries of the current VMA and the PTE
>> table.
>>
>> In addition, the "all-or-nothing" batching restriction is removed to
>> support partial batches. The reference counting is also cleaned up to use
>> folio_put_refs().
>>
>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> 
> I'd prefer changing the subject to something like
> "Fix potential out-of-bounds page table access during batched unmap"

Yep, that's much better.

> 
> Supporting partial batching is a cleanup-related benefit of this fix.
> It's worth mentioning that the affected cases are quite rare,
> since MADV_FREE typically performs split_folio().

Yeah, it would be quite rare in practice ;)

> 
> Also, we need to Cc stable.

Thanks! Will do.

