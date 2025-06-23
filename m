Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE5D256C6C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685512; cv=none; b=SlffSLRzgy3oRwPjBv/c743HHWOsajMBlaLPmIxcOhBkiDzrZqitX8C0Z5j+5aRHUFwt8XcxkiPTMFeI2k3iZm8jYj2c1gcIrKr3W8s5oj2shMYV2+FvZZUoPziN3o1nLJvqBsL8PtGn7t4PX3KsX49SzBc+dCYvCbpO4ULG00U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685512; c=relaxed/simple;
	bh=d3CjObu7ti7j2leHXsCAQMHwoeOMPWVu3hazULI9Ykc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7oYUq18n0ZQj453jz2ILaDjZQd7hx++BaSuAQeRKUjsrohkKB8TIewY2JkGe8513tLkb+jOvJIWW89/NRXvSkP3RZBMUp0nOcKnrGtyAnYgrvZbhQCFHbkqCJ6ZFBzeF45GI/XU/xQMqK/w1+toBqypyyS4zCEa/R0oQC7jfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91D2A113E;
	Mon, 23 Jun 2025 06:31:32 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E265D3F58B;
	Mon, 23 Jun 2025 06:31:49 -0700 (PDT)
Message-ID: <cb71d9f4-aaae-4240-88f5-50a745717f22@arm.com>
Date: Mon, 23 Jun 2025 14:31:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250623075721.2817094-1-agordeev@linux.ibm.com>
 <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
 <aFlQv4dx7wFU5Cql@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aFlQv4dx7wFU5Cql@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:03, Alexander Gordeev wrote:
> On Mon, Jun 23, 2025 at 01:37:11PM +0100, Ryan Roberts wrote:
>> On 23/06/2025 08:57, Alexander Gordeev wrote:
>>> Function vmap_pages_pte_range() enters the lazy MMU mode,
>>> but fails to leave it in case an error is encountered.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
>>> Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>
>> Ouch, sorry about that! The patch looks good to me so:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>> I wonder an aditional Fixes: should be added for Commit 2ba3e6947aed
>> ("mm/vmalloc: track which page-table levels were modified") though? That's the
>> one that added the "*mask |= PGTBL_PTE_MODIFIED;" which would have also been
>> skipped if an error occured before this patch.
> 
> Good catch! I think it certainly needs to be reported with Fixes
> and I even doubt whether your commit should be mentioned at all?

Well I would certainly argue that my patch is broken as is. So happy to have 2
Fixes: tags. But I'm not really sure what the rules are here...

> 
>> Thanks,
>> Ryan
> 
> Thanks!

