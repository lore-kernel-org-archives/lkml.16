Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9E41862BB;
	Fri, 20 Jun 2025 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401544; cv=none; b=M25BDclarW5t2Vk6GbvF5T+rQh80K/nukJlhehPhxZ/eP2SJLiynjDIFNQlPlWUE/AB7UXtoeplk5eGPVO7t9dsNVvmZHOsOOSNeb/9Z7+wJjLLbiPgcT4b+BCRWWlToBXpB43u3K2hxDJWYWKzHiMAslCJ6p6T74YPoJTjYZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401544; c=relaxed/simple;
	bh=/ptI5ptVQJSQJ7tjc/dgplKqb2ZyGoA/keLmq6sWAlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqHAY2m6ZDeG1DFJLzYodtjJRiPEOwBKf3OQdZv+4vfp6H4AecVjCcnufG8iLwi5iyeq09rGpfBxnIdZ7Z+ywlgljLs7GsVhAWCQUDZhBb/MEkuVYy3rZSkckyEUddjYVZ54IJklBLiounPDqLIHx2DuRArI4DRLiQ1Iydf6O4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C2CA176A;
	Thu, 19 Jun 2025 23:38:41 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F1A3F66E;
	Thu, 19 Jun 2025 23:38:57 -0700 (PDT)
Message-ID: <e5aaaed3-6742-409e-96d9-aa41b9365cb1@arm.com>
Date: Fri, 20 Jun 2025 12:08:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mm@kvack.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com> <aFQMvEMzXNQjLvp-@pathway.suse.cz>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFQMvEMzXNQjLvp-@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19/06/25 6:42 PM, Petr Mladek wrote:
> On Wed 2025-06-18 20:46:38, Andy Shevchenko wrote:
>> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
>>> Add a new format for printing page table entries.
>>
>>> Cc: Petr Mladek <pmladek@suse.com>
>>> Cc: Steven Rostedt <rostedt@goodmis.org>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: linux-doc@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: linux-mm@kvack.org
>>
>> Please. move these to be after the '---' cutter line below. Just leave SoB tag
>> alone. This will have the same effect w/o polluting commit message.
>>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>
>> (somewhere here is a good place for all your Cc: tags)
>>
>> ...
>>
>>> +        %ppte
>>
>> I believe you can take %pte.
> 
> We should think about the future. If we added "pte", people would want
> to add also "pmd", "pud", ...
> 
> It might actually be a good idea to keep them under the %pp prefix.

Agreed.

The first 'p' here is for being pointer and second 'p' is from 'p'xx.
Then last two letters to differentiate between page table levels. 

