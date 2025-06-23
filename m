Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D7D2566F5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689034; cv=none; b=gUJtsOSTG7FkPrQlbjrllHIidaHAcOoOKt/sWp7sIrPUt5VWv+J2xqMdKFbMYoLvlH1AQQSQShUYOS8mlpDWjCw/Fbnscpll2/9ZJDkSyLPeoZEhC5jueizC5rdELLia1t7fuBlWdXtt4k56c0t5nJaLDbTPiQMm1L7F3VokQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689034; c=relaxed/simple;
	bh=q1cPnjP5LDmCwkLjQNxQ71alVvth8kIaai6E10d1Io8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thG4/IIUb6FbWWoXQt2ba+EE4/7vYG+bSTYPHfEDeKhqgQO8HaMCDFitqmwuXDOwoG3/0cncGHG90oMEyg3iRmJzKC0nbj0/Q7Y2LAlTzKPJ/HlQlF094rIxIYAt2kB8lXfXqe+4y6W4nFT/qVpHiYrlwS1GcdZjwnAASR6iKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770D7113E;
	Mon, 23 Jun 2025 07:30:12 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB3D43F66E;
	Mon, 23 Jun 2025 07:30:29 -0700 (PDT)
Message-ID: <e45fa35c-315a-45ea-a14f-030c5258f533@arm.com>
Date: Mon, 23 Jun 2025 15:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250623075721.2817094-1-agordeev@linux.ibm.com>
 <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
 <aFlQv4dx7wFU5Cql@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <cb71d9f4-aaae-4240-88f5-50a745717f22@arm.com>
 <9214718e-97d0-4e8f-b223-59351e664707@suswa.mountain>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9214718e-97d0-4e8f-b223-59351e664707@suswa.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:53, Dan Carpenter wrote:
> On Mon, Jun 23, 2025 at 02:31:48PM +0100, Ryan Roberts wrote:
>> On 23/06/2025 14:03, Alexander Gordeev wrote:
>>> On Mon, Jun 23, 2025 at 01:37:11PM +0100, Ryan Roberts wrote:
>>>> On 23/06/2025 08:57, Alexander Gordeev wrote:
>>>>> Function vmap_pages_pte_range() enters the lazy MMU mode,
>>>>> but fails to leave it in case an error is encountered.
>>>>>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>>> Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
>>>>> Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
>>>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>>>
>>>> Ouch, sorry about that! The patch looks good to me so:
>>>>
>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>
>>>> I wonder an aditional Fixes: should be added for Commit 2ba3e6947aed
>>>> ("mm/vmalloc: track which page-table levels were modified") though? That's the
>>>> one that added the "*mask |= PGTBL_PTE_MODIFIED;" which would have also been
>>>> skipped if an error occured before this patch.
>>>
>>> Good catch! I think it certainly needs to be reported with Fixes
>>> and I even doubt whether your commit should be mentioned at all?
>>
>> Well I would certainly argue that my patch is broken as is. So happy to have 2
>> Fixes: tags. But I'm not really sure what the rules are here...
> 
> I would only list the older commit 2ba3e6947aed ("mm/vmalloc: track
> which page-table levels were modified").  The static checker warning
> came later, but it's not really the important bit.  It's just one bug.

Given smatch caught the locking bug, I wonder if it could be taught to look for
lazy_mmu issues? i.e. unbalanced enter/leave, nesting and read hazards. I think
Alexander previously found a read hazard so I wouldn't be surprised if there are
more.

> 
> We'll have to hand edit the commit if we want to backport it so that's
> a separate issue.
> 
> regards,
> dan carpenter
> 

