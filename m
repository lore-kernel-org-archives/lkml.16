Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F8D2356B4;
	Fri, 20 Jun 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407183; cv=none; b=iLFmklkuO5D/1/CDWr8zYf3OqqQBGupd+wWG1gfXwJTJmnCJaPTjmLq941SyCZvK0+uei60YlNqJeP7WX22dr7hWsqZ6BAgWtgrha4w5BGZ1MkC4K156kUzcicuE9PE/Om7soG7Z93nC5SSpoYGCyjJRxUyKbBehSPCAJr2aluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407183; c=relaxed/simple;
	bh=z8UDxO/OcLukhXKZ6GZRQPrtUnvInsX/2UomE+yR66s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1y2ootx5OHA7J2s2l4+y3X/iYDCtMb7ksq14bVrDKXp+HcG81/CEAD6aWLH0xxV1oPSLGjuJWQyjiw+8hsfrWqpBajSl9AcxRqMmGdR06x8S3ZFPAafXVI6bTk0RgTgWFrEqnwv2GJzeC+dUbwws5fm5oX+IDMY5NCB0l9yLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE77176A;
	Fri, 20 Jun 2025 01:12:40 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1382A3F66E;
	Fri, 20 Jun 2025 01:12:55 -0700 (PDT)
Message-ID: <d5a86ef8-a58c-4abc-8312-08406c847edc@arm.com>
Date: Fri, 20 Jun 2025 13:42:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFQP8LzVMctf6XH5@casper.infradead.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFQP8LzVMctf6XH5@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/25 6:56 PM, Matthew Wilcox wrote:
> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
>> +++ b/mm/memory.c
>> @@ -522,9 +522,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>>  	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
>>  	index = linear_page_index(vma, addr);
>>  
>> -	pr_alert("BUG: Bad page map in process %s  pte:%08llx pmd:%08llx\n",
>> -		 current->comm,
>> -		 (long long)pte_val(pte), (long long)pmd_val(*pmd));
>> +	pr_alert("BUG: Bad page map in process %s  pte:%ppte pmd:%ppte\n",
>> +		 current->comm, &pte, pmd);
> 
> Unfortunately, the one example you've converted shows why this is a bad
> idea.  You're passing a pmd_t pointer to a function which is assuming a
> pte_t pointer.  And a pmd_t and a pte_t are sometimes different sizes!
> (eg sometimes one is 64 bit and the other 32 bit).

As discussed on a separate thread, this might be addressed via separate
printf formats for each page table level e.g %ppte, %ppmd, and %ppud etc. 

> 
> So no, NACK.
> 


