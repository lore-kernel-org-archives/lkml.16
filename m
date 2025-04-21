Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B59210185
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226695; cv=none; b=N52J30Zw/JEmQenHSUQBugufW+52nYrmv3OJmCCLZKyhr8Aj+g4UX+bmZyBxm4nhpyWMF7rFc5hv6H/NPGD7jNequT5vrLb9UC4hVU+1rq6tFs6P+wdNICVI2aUlS8lBU26y/R4RjCg7e69OsBtL0VmSoU+8ucSqlQ6X7SaPVdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226695; c=relaxed/simple;
	bh=rRctHNDVct1fGlDOmCuJu2dtGc64Fe4UIG5bUhbjIFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XH3QjfgrEhwBLdJzdaYRocFeFPIlmhqAL2hvsBJ5Ten3nCiiR3+Hjz3BvvSlV5Y6zlCT+QIh0OVrjf03M6jq86Pyx65LS/JV/HyuEBYO/rKxd/aq4tga3w6G137tRQIgw6HwB6yeYQHsxsmGUisRwR+2jRkaEZoWF4mKEbpJ8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pm9wg5oI; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pm9wg5oI"
Message-ID: <1a52c747-3642-4f05-a662-c010240e9e4b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745226689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/En9Stu4OkS759SXeoMP2rUGBMH0kSmoju2wjtY+Rw=;
	b=Pm9wg5oIzV0PNml0dLOFVIRyLwwYT6th+yG+HaXmWxO9kM2ko5r4yWklEIk2Vo/h3wqPQY
	U/5HTaJIyHFdPh49OHmWMQw02LRpDFVgK2OaKbRXXI1bJOs3Nq0a+gCttrYl3moUbwpuLt
	VNK8VXRjbqfYjug1SiFwoQy3346Y3mA=
Date: Mon, 21 Apr 2025 17:11:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] mm/rmap: rename page__anon_vma to anon_vma for
 consistency
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Liam.Howlett@oracle.com,
 david@redhat.com, harry.yoo@oracle.com, riel@surriel.com, vbabka@suse.cz,
 liuye@kylinos.cn
References: <20250421015823.32009-1-ye.liu@linux.dev>
 <9b0bd289-40a8-4e4d-89e0-7eae922bd41a@lucifer.local>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <9b0bd289-40a8-4e4d-89e0-7eae922bd41a@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/21 14:03, Lorenzo Stoakes 写道:
> On Mon, Apr 21, 2025 at 09:58:23AM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Renamed local variable page__anon_vma in page_address_in_vma() to
>> anon_vma. The previous naming convention of using double underscores
>> (__) is unnecessary and inconsistent with typical kernel style, which uses
>> single underscores to denote local variables. Also updated comments to
>> reflect the new variable name.
>>
>> Functionality unchanged.
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Hi Ye,
>
> I see you're still getting used to the process :) this patch isn't correct,
> you're sending a single patch at v3 against a series with 2 patches in it
> [0], but you have sent it entirely separately - this is not correct.
>
> If you want to revise a series, you have a couple choices - you can write a
> 'fix patch' -in reply to- the patch you are altering, which provides the
> delta against that patch.
>
> This is the preferred way in mm, unless you have made such a big change
> that this is infeasible or if multiple files change at once or if so much
> has changed it would be a bit silly to do this.
>
> To do this, you use a client like mutt/neomutt/whatever you use (but one
> that can do the linux-y In-Reply-To stuff correctly) to reply directly to
> the mail, and then say something like 'hey here's a fix patch please apply,
> and add the output of the git format-patch that contains the delta against
> the file at the end after a single line with '----8<----' on it.
>
> See [1] for an example.
>
> Here, however, you've confused matters a bit by sending this as a v3 when
> it's not really a v3 properly, so I suggest in _this case_ you just resend
> the whole thing as a v3 with this correction in place.
>
> You should also propagate tags, I gave a reviewed-by tag here, so make sure
> to include this and others given when you resend the v3 series.
>
> Thanks!
>
> [0]: https://lore.kernel.org/all/20250418095600.721989-1-ye.liu@linux.dev/
> [1]: https://lore.kernel.org/linux-mm/13426c71-d069-4407-9340-b227ff8b8736@lucifer.local/
>
>> Changes in v3:
>> - Rename variable from page_anon_vma to anon_vma.
> Also _please_ copy/paste all changes for all versions each time, and add
> lore links for each prior version.
>
> You can figure out the lore link as https://lore.kernel.org/all/<message id
> from mail headers>/ - I always do this manually :) you can see I already
> figured it out for the v2 in [0] above.

Thank you very much for your detailed feedback and guidance! I sincerely
appreciate you taking the time to explain the correct workflow and the
options for revising the patch series.

I’ve taken your advice and resent the entire series as v3 with the
following updates:

- Incorporated the variable rename fix directly into the series.
- Propagated all relevant tags (including your Reviewed-by).
- Added complete version history with lore links for v1 and v2.

Your patience and clear instructions are incredibly helpful as I learn
the community’s processes. If there’s anything else that needs
adjustment, please let me know.

Thanks,
Ye Liu                                                                  

>> ---
>>  mm/rmap.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 67bb273dfb80..447e5b57e44f 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>>  		const struct page *page, const struct vm_area_struct *vma)
>>  {
>>  	if (folio_test_anon(folio)) {
>> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
>> +		struct anon_vma *anon_vma = folio_anon_vma(folio);
>>  		/*
>>  		 * Note: swapoff's unuse_vma() is more efficient with this
>>  		 * check, and needs it to match anon_vma when KSM is active.
>>  		 */
>> -		if (!vma->anon_vma || !page__anon_vma ||
>> -		    vma->anon_vma->root != page__anon_vma->root)
>> +		if (!vma->anon_vma || !anon_vma ||
>> +		    vma->anon_vma->root != anon_vma->root)
>>  			return -EFAULT;
>>  	} else if (!vma->vm_file) {
>>  		return -EFAULT;
>> @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
>>  		return -EFAULT;
>>  	}
>>
>> -	/* KSM folios don't reach here because of the !page__anon_vma check */
>> +	/* KSM folios don't reach here because of the !anon_vma check */
>>  	return vma_address(vma, page_pgoff(folio, page), 1);
>>  }
>>
>> --
>> 2.25.1
>>
