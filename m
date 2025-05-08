Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7354B1E40
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746671018; cv=none; b=s00lKDyC+vGi36zdDuaxGnGcD6lYdtnk8ROZpO/mov51e+HvwwwEWPDgcT9xys/Vo994ffmIsi8IqU+85DMga3HXYMLriEhHJv2A/h2ZuLUqb7XPZSbBikiwKXj0wc55g/Hn8qOx49EEN+BMPHTU1bsrUlZSb7DaQUqVAgWo78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746671018; c=relaxed/simple;
	bh=DZJRLLX+U/ab5i93qpliOkMGcf+rkhmKOxB5F/WWlGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idRn6KPHADAvBVpDIP22MW5tWU/x238AhPHV/Ge6nH3TzMwgn3H8OHRKjAQBqbuQjU44N7XJ/eIrH4H2x0mIimY6LblsiLZ4BcE9OgUVIeLYDkpVo4mXWEEwBPo2isPbBzYjDn8Pg55aMmaLLMCx5Q3xdHh/l+mvnB7TJe3Hk60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=akUQ9jUY; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="akUQ9jUY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746671012; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tIv6gNodGfIal1cnwEB797QvJJYe8+nen/YUc9IXohc=;
	b=akUQ9jUYzpsZ6S/IHTbv5ZFHScxMX/7uJwBlwUkTu6v+pizirsUsf52Qq7QvzQF3w3teMy/kCnngdmrx9Qc/4Iw1bBqpUw/35DkxXGqTZmQ1RAbOFKQ9R9UDRd/7DPXfTV1Hgl68cVcQFp6u8jK6wue0GGzTuDecjwfYrepsOA8=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZyfJ2W_1746671008 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 10:23:30 +0800
Message-ID: <569e592c-1c30-4c03-bcee-c1670ac4e159@linux.alibaba.com>
Date: Thu, 8 May 2025 10:23:28 +0800
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
 <88060373-d0b8-404a-b53b-9b5a54f5ba6f@linux.alibaba.com>
 <aBuOjrH1UpyTf8I9@casper.infradead.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aBuOjrH1UpyTf8I9@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/8 00:47, Matthew Wilcox wrote:
> On Wed, May 07, 2025 at 08:36:54PM +0800, Baolin Wang wrote:
>> On 2025/5/7 20:10, Matthew Wilcox wrote:
>>> Because I see nowhere in this patch that you initialise 'page'.
>>
>> Please look at the following code in do_set_pmd(), and the 'page' will be
>> initialized before using.
>>
>>          if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags))
>>                  return ret;
>>
>>          if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>>                  return ret;
>>
>>          if (folio_order(folio) != HPAGE_PMD_ORDER)
>>                  return ret;
>>          page = &folio->page;
> 
> Ah, fair, I missed that.
> 
>>> And that's really the important part.  You seem to be assuming that a
>>> folio will never be larger than PMD size, and I'm not comfortable with
>>
>> No, I have no this assumption. But do_set_pmd() is used to establish PMD
>> mappings for the PMD-sized folios, and we already have PMD-sized checks to
>> validate the folio size:
>>
>>          if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>>                  return ret;
>>
>>          if (folio_order(folio) != HPAGE_PMD_ORDER)
>>                  return ret;
>>
>>> that assumption.  It's a limitation I put in place a few years ago so we
>>> didn't have to find and fix all those assumptions immediately, but I
>>> imagine that some day we'll want to have larger folios.
>>>
>>> So unless you can derive _which_ page in the folio we want to map from
>>
>> IMO, for PMD mapping of a PMD-sized folio, we do not need to know _which_
>> page in the folio we want to map, because we'll always map the entire
>> PMD-sized folio.
> 
> There's a difference between "Assert that the folio is PMD sized" inside
> the function because we know there are still problems, and "Change the
> interface so we can't specify which page inside the folio is the one
> we're actually interested in".

Fair enough. So how about adding a new 'folio' parameter to 
do_set_pmd(), similar to the set_pte_range() function prototype?

vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct 
page *page)

> I reiterate the NACK to this patch.
