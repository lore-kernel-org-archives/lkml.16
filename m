Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C71D7E1
	for <linux-kernel@vger.kernel.org>; Tue, 18 Feb 2025 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739863483; cv=none; b=NlJGZVlUr37ynxpGp0j5D+EdUpuGP8WFWMspB057EWJT2LZaZEqTU6jsnEmJB0Ay45KAipWZTBVWzBOQh1LbhkbVvwXl3g2vCWKoiLFxcdLettbtCPIbukXB+/Jy3Ht4x3r4U+kv+NjLgnysXMviF9Jvkpk3hIS8RcWtx3ywDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739863483; c=relaxed/simple;
	bh=GW/AhHzTMNJXQYgjELxH20WtXeMjZHvfL6S/q87rwHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFomksWdqo7aMnABVurmpFS6k5x+lsxN98DglT88rUpJshPRG3eDkmpkNTkpQSY0NbZXB2IM+NUpENBMB4EQgx0uH/BSkl6MmPz5xI0PTdgVLdt+d281r+Kor8A95uSRr4Bm8x+/AE9ddjcL1qbwzNLNLFEs1BQgs3VXGZ/82+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=DlmEPedK; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="DlmEPedK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=ZJscg99EXRdekigVGw2UnRJFfVqZBq30pvvZtMt7gLg=;
	b=DlmEPedKd1MgySe1dQhnY1hyC8nAYKX/Haiu/nGNY+nkDGsrjZ1dZe7iYVGMaT
	qMm5oT9Bz4npiZjA9JwCTy132xPlw8Xcin82DQR0SsYLdCHehSSU9N6GrzH8A6jW
	etZxIC5V+NeZCovSPHLLFWyle2nmtd6Af5uoD7adnRRWM=
Received: from [172.19.20.199] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3twWSNbRnMZhbBA--.38403S2;
	Tue, 18 Feb 2025 15:24:03 +0800 (CST)
Message-ID: <1ea2c7b0-790c-4f60-a713-9029252a0837@126.com>
Date: Tue, 18 Feb 2025 15:24:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/hugetlb: wait for hugepage folios to be freed
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 david@redhat.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
References: <1739604026-2258-1-git-send-email-yangge1116@126.com>
 <20250217203417.9689a271f792a4e23da322aa@linux-foundation.org>
From: Ge Yang <yangge1116@126.com>
In-Reply-To: <20250217203417.9689a271f792a4e23da322aa@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3twWSNbRnMZhbBA--.38403S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar48uF4UCrWUArWDWrW3Jrb_yoW8tr1rpF
	WUKr47GFWDJr9akrnrXwnY9r10krZ8ZrW5Gr1Iqw13uan8Jr1xKFyIywn0qay5Cr10krWI
	qrWjvw1DZF1UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjOJ5UUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbifhn3G2e0I135pQACs4



在 2025/2/18 12:34, Andrew Morton 写道:
> On Sat, 15 Feb 2025 15:20:26 +0800 yangge1116@126.com wrote:
> 
>> From: Ge Yang <yangge1116@126.com>
>>
>> Since the introduction of commit b65d4adbc0f0 ("mm: hugetlb: defer freeing
>> of HugeTLB pages"), which supports deferring the freeing of HugeTLB pages,
>> the allocation of contiguous memory through cma_alloc() may fail
>> probabilistically.
>>
>> In the CMA allocation process, if it is found that the CMA area is occupied
>> by in-use hugepage folios, these in-use hugepage folios need to be migrated
>> to another location. When there are no available hugepage folios in the
>> free HugeTLB pool during the migration of in-use HugeTLB pages, new folios
>> are allocated from the buddy system. A temporary state is set on the newly
>> allocated folio. Upon completion of the hugepage folio migration, the
>> temporary state is transferred from the new folios to the old folios.
>> Normally, when the old folios with the temporary state are freed, it is
>> directly released back to the buddy system. However, due to the deferred
>> freeing of HugeTLB pages, the PageBuddy() check fails, ultimately leading
>> to the failure of cma_alloc().
>>
>> Here is a simplified call trace illustrating the process:
>> cma_alloc()
>>      ->__alloc_contig_migrate_range() // Migrate in-use hugepage
>>          ->unmap_and_move_huge_page()
>>              ->folio_putback_hugetlb() // Free old folios
>>      ->test_pages_isolated()
>>          ->__test_page_isolated_in_pageblock()
>>               ->PageBuddy(page) // Check if the page is in buddy
>>
>> To resolve this issue, we have implemented a function named
>> wait_for_hugepage_folios_freed(). This function ensures that the hugepage
>> folios are properly released back to the buddy system after their migration
>> is completed. By invoking wait_for_hugepage_folios_freed() before calling
>> PageBuddy(), we ensure that PageBuddy() will succeed.
>>
>> Fixes: b65d4adbc0f0 ("mm: hugetlb: defer freeing of HugeTLB pages")
> 
> Do you feel that this issue is serious enough to justify a -stable
> backport of the fix?
Yes, I will add 'CC: stable@vger.kernel.org' in the next patch, thanks.

