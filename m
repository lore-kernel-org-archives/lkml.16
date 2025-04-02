Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95B29A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743562177; cv=none; b=a1nwISqZTrTn7ICu5thFOe9lmnWfp0X4/u1E7NV/tp8fGwfYtuEx/T5JgLqbG07Mf4ayeoGLU3VU3lctfQmhGrrVBVQzO8yjx2Mqmpq2dP5sQ2OvN1P3wHyxoquNk03p09Gwh4BxGhvQR63uTI9P4TSrSKrDDPw0hhd+AQn/VTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743562177; c=relaxed/simple;
	bh=aTL4FNA8QNZKN83QLAV4YPGttM0hIgQPX7bbmhjKx9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxN4m7NZhzFid7680/fIE9zEO/F22IBIjamgHQWvKmNLpmxR5k19BSZqiC+oGs+IHGg/v3v23UlYwbXFqckGZqLLz40cxeWuFiIbzX4sypWzbi9MrtkkPswKmxn0EAlzIBQ0PSXyE3aERlru/hd3bUGXFE8/1uXiOc8uP6FuBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SbItZ3fr; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SbItZ3fr"
Message-ID: <6cd78595-f9d3-4f26-8ca3-d1a0bf4e8dff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743562171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShkV8Eez8zF2yiacsvlXmljeTgs0yVxUyt2LGsKil6c=;
	b=SbItZ3fr5KIGsi/J/LEd8siyokZSoxxjxgcV51j1Rh7ilbJDtvKRPgVYJZ4guZtGI3TbD6
	S7BiSRlrUzRwRO/4+2uzOrsVUnKcUmWzuFEdtDijsUmuX0pH/ZmX4NElF+SxLoek4HJYQm
	GSukYhXHv1LULJFGiNlurgs+BLWHGww=
Date: Wed, 2 Apr 2025 10:49:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
 Ye Liu <liuye@kylinos.cn>, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <Z-q71LlcCQ5I-2D-@casper.infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <Z-q71LlcCQ5I-2D-@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/3/31 23:59, Matthew Wilcox 写道:
> On Mon, Mar 31, 2025 at 08:08:01PM +0800, Ye Liu wrote:
>> 在 2025/3/28 22:29, Matthew Wilcox 写道:
>>> On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
>>>> Consolidate the handling of unlikely conditions in the 
>>>> page_expected_state() function to reduce code duplication and improve 
>>>> readability.
>>> I don't think this is an equivalent transformation.
>> Could you explain it in detail?
> page_expected_state() is called both at free and alloc.  I think
> the correct behaviour on encountering a HWPOISON page should be
> different at alloc and free, don't you?
In the alloc process, this patch does not modify the code behavior.
Regarding the free process, the if (unlikely(PageHWPoison(page)) && !order)
code handles the case where order is 0. When order is not 0, it does not
matter if __ClearPageBuddy is used to process the last page of the compound
page, because page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP; will also clear it.
Is that right?                                                             

>>> Please, stop with these tweaky patches to incredibly sensitive core code.
>>> Fix a problem, or leave it alone.  We are primarily short of reviewer
>>> bandwidth.  You could help with that by reviewing other people's patches.
>>> Sending patches of your own just adds to other people's workload.
>> Thank you for your feedback. I understand the sensitivity of core code
>> and respect the limitations on reviewer bandwidth. However, I believe
>> that reasonable optimizations should not be rejected solely because
>> they involve core code. If an improvement enhances performance,
>> readability, or maintainability without introducing risks, wouldn't
>> it be worth considering for review?
> If it's a reasonable optimisation, absolutely!  But if it's an
> optimisation, it should be accompanied with a benchmark showing an
> improvement.  As far as improving readability, I'm not yet convinced
> that you have the expertise to make that call.  Every change that is
> made invalidates everybody else's mental model of "how this works".
> So all changes carry a cost.  Sometimes that cost is worth paying,
> other times it isn't.
So we need to discuss the technical aspects first, right?
>> Regarding the reviewer shortage, I’d be happy to help by reviewing
>> other patches as well. Could you please share the process for becoming
>> a reviewer? What are the requirements or steps to get involved?
> There is no process!  Choose a patch, read it, think about it.  What
> problems might there be with it?  What may have been overlooked?
> Is the commit message unclear to you, how could it be improved?
> When you're done, send a Reviewed-by: tag (read the kernel process
> documents for the full meaning of that tag).
>
Thanks for your advice, I will try.


Thanks,

Ye



