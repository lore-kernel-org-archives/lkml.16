Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70586279333
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379359; cv=none; b=ktBkVUvPIDHddmJuq/KFI6UM74AxKpLGncS+yxUTzZOPV2IIeEpXJhZYJT9uayuc9ivb1dWWeD11GiFes+gDuW1ThN6h4vpCaMYr1W8t9HRZODFxeS8CyD34FhKGvrOSih5DTfqOF/66XmkjROhSfyY4KLzbLNzYnpTHuaQBkgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379359; c=relaxed/simple;
	bh=GJP7Xa/2ev6INSY+ZGt6Xkxf+i9v+ytOpFJCc009TJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOe0w9UcgIizyu4IRV0R3+JtR5caEwh3HglBVCjK/u9kFxA4F9pdmp8HXPWbp5L0WRm7+qRIxvOQGkz03SH7hjPwoDSnHqXBIFLWP5UCpfuSBScNF2yzFRmRuQKQBfXMIKSbm6Ilz9rubBzITZ45BZXIjc03c4/DXrv7AswXN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rwerCEIA; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rwerCEIA"
Message-ID: <0a96ce38-163e-4566-b666-b074bd82c75a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751379345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbwuurgTDZ+BaZBkyMf18Zq8IPSFXnHhnJxSaiCg6gM=;
	b=rwerCEIAJb39fesv0EF8pOU/ob/YjbEMZ4v0sWNU2xHq0OxhcXljvBD2n5VH+/cKs1v5qS
	GEq/jLdRP4QJopKUgt18uPvXuzdrO+Gw3KUgU3FysEGlvfuCeVyGbBJd7yShJDeT+1GSXC
	8ObslLOB3iUPbBIQR6Kfi8w4SylwS7k=
Date: Tue, 1 Jul 2025 22:15:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Barry Song <baohua@kernel.org>, Lance Yang <ioworker0@gmail.com>
References: <20250630011305.23754-1-lance.yang@linux.dev>
 <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/7/1 22:03, David Hildenbrand wrote:
> On 30.06.25 03:13, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio's PTE mappings
>> are not fully contained within a single page table.
>>
>> While this scenario might be rare, an issue triggerable from userspace 
>> must
>> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
>> access by refactoring the logic into a new helper, 
>> folio_unmap_pte_batch().
>>
>> The new helper correctly calculates the safe batch size by capping the 
>> scan
>> at both the VMA and PMD boundaries. To simplify the code, it also 
>> supports
>> partial batching (i.e., any number of pages from 1 up to the calculated
>> safe maximum), as there is no strong reason to special-case for fully
>> mapped folios.
>>
>> [1] https://lore.kernel.org/linux-mm/ 
>> a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large 
>> folios during reclamation")
>> Cc: <stable@vger.kernel.org>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Suggested-by: David Hildenbrand <david@redhat.com>
> 
> Realized this now: This should probably be a "Reported-by:" with the 
> "Closes:" and and a link to my mail.

Got it. Both tags (Reported-by/Closes) will be in the next commit ;)

