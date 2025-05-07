Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863F2F44
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621741; cv=none; b=JkWCE3WLoW6myRyYJOArqyITRMZUalsLOFK7/baS2a12opijIL1IuagKMmNITpZ23TvPe71JEEq31W6Y8EThq6qOMX84/FwW/aZ2CFo+k7Oc90XI+DuN1kcAHWG7sE66RZA+cJFGzW0oQbZ/68alc2tcaCtOoZZ1yhjADSjVUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621741; c=relaxed/simple;
	bh=29PmLEqS9rYUerAzIeBWl6BPxYcfGJYmg9/Yb6ohn0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qjmu0JvjYcgOgbLEFBEomkcUDL6xcJB8fWRi+/EZDjt1606IbWWuyw+uKXpnXSuqwYLqGoMTYsgLn1NFumkarxOh4SGIZXQx8/eeXeNjb942YjmtB1Cv3f9bHPYaLZ3dXcXNdYIJplgxSEvzZhleoEJWLqpaPUiKQMwWK/M2Trc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rgbRYpRq; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rgbRYpRq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746621734; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iksVT4KdA3eRwi4f/udJVWEktX0tvkyCe8oTkZzS2Yk=;
	b=rgbRYpRqoGWeffFc3pRPkVim32WsIGD9B4KTBVsByfTqDwGbH7ymZavnfJGgFDnI1XnvGue/fvs8MUqJet/4glRSjnbop6t8+I1E1TMC6079XJ40RiJkG0HALo9zG5BeP2SJsqCCojSyDNwZEjWOYA6CERTNup+kuapldxAYNzU=
Received: from 30.0.158.159(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZqoxFK_1746621414 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 20:36:55 +0800
Message-ID: <88060373-d0b8-404a-b53b-9b5a54f5ba6f@linux.alibaba.com>
Date: Wed, 7 May 2025 20:36:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aBtNrQNlL7hjLrTZ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/7 20:10, Matthew Wilcox wrote:
> On Wed, May 07, 2025 at 05:26:13PM +0800, Baolin Wang wrote:
>> In do_set_pmd(), we always use the folio->page to build PMD mappings for
>> the entire folio. Since all callers of do_set_pmd() already hold a stable
>> folio, converting do_set_pmd() to take a folio is safe and more straightforward.
> 
> What testing did you do of this?

I did mm selftests, tmpfs/xfs PMD-sized mmap() tests.

> 
>> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
>>   {
>> -	struct folio *folio = page_folio(page);
>>   	struct vm_area_struct *vma = vmf->vma;
>>   	bool write = vmf->flags & FAULT_FLAG_WRITE;
>>   	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>>   	pmd_t entry;
>>   	vm_fault_t ret = VM_FAULT_FALLBACK;
>> +	struct page *page;
> 
> Because I see nowhere in this patch that you initialise 'page'.

Please look at the following code in do_set_pmd(), and the 'page' will 
be initialized before using.

         if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags))
                 return ret;

         if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
                 return ret;

         if (folio_order(folio) != HPAGE_PMD_ORDER)
                 return ret;
         page = &folio->page;


> And that's really the important part.  You seem to be assuming that a
> folio will never be larger than PMD size, and I'm not comfortable with

No, I have no this assumption. But do_set_pmd() is used to establish PMD 
mappings for the PMD-sized folios, and we already have PMD-sized checks 
to validate the folio size:

         if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
                 return ret;

         if (folio_order(folio) != HPAGE_PMD_ORDER)
                 return ret;

> that assumption.  It's a limitation I put in place a few years ago so we
> didn't have to find and fix all those assumptions immediately, but I
> imagine that some day we'll want to have larger folios.
> 
> So unless you can derive _which_ page in the folio we want to map from

IMO, for PMD mapping of a PMD-sized folio, we do not need to know 
_which_ page in the folio we want to map, because we'll always map the 
entire PMD-sized folio.

> the vmf, NACK this patch.
