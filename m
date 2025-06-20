Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1054B2248AE;
	Fri, 20 Jun 2025 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402437; cv=none; b=aQHkkPIsGJ9Z3kOpoWkk+jy17E7BEEsfABXVtgEGGgYeWVe2yAWJi5XP6fZISxhlvo3IWSsjNMHaxTXdH8JwgYMaUwsXgr4ce6CsnwIkwShiofd21mEtkJ7F3JexUjw4oMEgTJNN/60pcwrny+7xFfnmdk5GUtzFmv7k57L34Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402437; c=relaxed/simple;
	bh=kyK0UqsUZUVJN9QD+HtqwYYQTPrhE9A1IVF6VjtuSPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HORqKeszjDd+g5b+7KjuNPrgMexfGuO6hgCpgv94Jsgpa1N0bdLJmF/DyVpIUo+WkTSivj6dGAtvYwlhlQo9uyOWwBSkvr4k5asHnKlLkJInwcjsml4MsZwn6ks1/8+9oo7WNjVWcOh12580MVmyJiY9af/dB4lIurr8uzvTYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F9F176A;
	Thu, 19 Jun 2025 23:53:34 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADD2D3F673;
	Thu, 19 Jun 2025 23:53:50 -0700 (PDT)
Message-ID: <92a89dbb-7031-459a-ad5a-69b29b08cfc8@arm.com>
Date: Fri, 20 Jun 2025 12:23:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mm@kvack.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com>
 <0d437b3e-37b5-4e98-90bc-afa6c8150e77@arm.com>
 <aFP7wwKD_yeRRuI_@black.fi.intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFP7wwKD_yeRRuI_@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19/06/25 5:30 PM, Andy Shevchenko wrote:
> On Thu, Jun 19, 2025 at 03:05:10PM +0530, Anshuman Khandual wrote:
>> On 18/06/25 11:16 PM, Andy Shevchenko wrote:
>>> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
>>>> Add a new format for printing page table entries.
>>>
>>>> Cc: Petr Mladek <pmladek@suse.com>
>>>> Cc: Steven Rostedt <rostedt@goodmis.org>
>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: linux-doc@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: linux-mm@kvack.org
>>>
>>> Please. move these to be after the '---' cutter line below. Just leave SoB tag
>>> alone. This will have the same effect w/o polluting commit message.
>>>
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>
>>> (somewhere here is a good place for all your Cc: tags)
>>
>> Is not it better to also capture the Cc: list in the commit message.
> 
> No it's worse. One may easily get the same from lore. Can you give a good
> justification for the polluting message with 8 lines over a single line of the
> useful information, please?

Will drop the Cc: list from the commit message and move it below '---'
cutter line as suggested earlier.

> 
>> Seems like such has been the practice for various patches on the MM
>> list. But not sure if that is an expected standard for all patches.
> 
> It's not an MM subsystem.
> 
> ...
> 
>>>> +Print standard page table entry pte_t.
>>>> +
>>>> +Passed by reference.
>>>> +
>>>> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
>>>
>>> What does this mean?
>>
>> 64 bit address containing value the 0xc0ffee
> 
> Please, make it 64-bit address. The example as is is quite confusing.
Agreed it is some what confusing - will fix it.

> 
>>>> +        %ppte   0x00c0ffee
>>>
>>> Can it be ever 64-bit?
>> I am sorry - did not get that. pte_t contained value can be 64
>> bits if that's what you meant.
> 
> Yes, see above why I have such a question.

Got it.

> 
> ...
> 
>>>> +			spec.field_width = 10;
>>>> +			spec.precision = 8;
>>>> +			spec.base = 16;
>>>> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
>>>
>>> Do not duplicate code we have already in the file.
>> I am sorry - did not get that. Is the above flag combination some
>> how wrong ?
> 
> It's dup. Please, take your time to find the very similar piece of code in one
> of the helper functions we have.

Are you referring to special_hex_number() ?

> 
> I recommend you to look at the history of the changes in this file for when the
> new specifier was added and how it is implemented> 
> ...
> 
>> Could you please kindly elaborate on the code duplication problem
>> you have mentioned earlier. I might not understand your concern
>> here correctly.
> 
> Just find the same or similar pieces of code elsewhere in the same file.
> Use them.
> Will go through previous print format additions and re-work the patches
accommodating various suggestions. Thanks for your review.

