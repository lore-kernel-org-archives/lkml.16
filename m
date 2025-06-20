Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D097215A8;
	Fri, 20 Jun 2025 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750399256; cv=none; b=i5Gw+bN/SxRn5BbKMRppw1iOIr79FG/Z76SHWu9tuyNM8Lm3RaC9qyKZ5vp1sWTF74UK6378ZKs9y1HX8fLxfVNeeKUeYB8Osgy7dyZAaRMPZTxgjOLa/fdOTjGVUURNzIvZhnlQrur9yG7kHo4bDFay/0hJJrkWqMSWy0lvfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750399256; c=relaxed/simple;
	bh=7YKn9rIqYNQmQxOunpyDKEKMAmTTgsAH/S8GgLWFWHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfQAZsFOXwGSPHe8JnYFl8SjS6UtMElANSgocmET0okcp9I+2O84B6Cx09crHTM63QkDI96cvrQVfrG/+KdK5A+yy79S1Ebs0SMndK/fa+etQuB1l/zOkwD3r+MDbggOccclvncr5wMLo3w9vPNSAdICBZGWObZ6/onl6/p9BZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48362176A;
	Thu, 19 Jun 2025 23:00:34 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518583F66E;
	Thu, 19 Jun 2025 23:00:50 -0700 (PDT)
Message-ID: <9f3fdc4f-2f44-4a3b-9b8b-425003b0be99@arm.com>
Date: Fri, 20 Jun 2025 11:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Petr Mladek <pmladek@suse.com>, Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
 <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
 <dc5fb92c-6636-4dce-bc66-181345f79abf@redhat.com>
 <ihe6ueejcemrscqzuieunap6sk2z2yb7xr7szr77nue6qpcvm3@qnwvbvqlwdn5>
 <aFQLtrSGxcscq9No@pathway.suse.cz>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFQLtrSGxcscq9No@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/06/25 6:38 PM, Petr Mladek wrote:
> On Wed 2025-06-18 19:16:00, Pedro Falcato wrote:
>> On Wed, Jun 18, 2025 at 10:44:20AM +0200, David Hildenbrand wrote:
>>> On 18.06.25 10:37, Anshuman Khandual wrote:
>>>>
>>>>
>>>> On 18/06/25 1:48 PM, David Hildenbrand wrote:
>>>>> On 18.06.25 06:12, Anshuman Khandual wrote:
>>>>>> Add a new format for printing page table entries.
>>>>>>
>>>>>> Cc: Petr Mladek <pmladek@suse.com>
>>>>>> Cc: Steven Rostedt <rostedt@goodmis.org>
>>>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>> Cc: linux-doc@vger.kernel.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> Cc: linux-mm@kvack.org
>>>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>> ---
>>>>>>    Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>>>>>>    lib/vsprintf.c                            | 20 ++++++++++++++++++++
>>>>>>    mm/memory.c                               |  5 ++---
>>>>>>    scripts/checkpatch.pl                     |  2 +-
>>>>>>    4 files changed, 37 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>>>>>> index 4b7f3646ec6ce..75a110b059ee1 100644
>>>>>> --- a/Documentation/core-api/printk-formats.rst
>>>>>> +++ b/Documentation/core-api/printk-formats.rst
>>>>>> @@ -689,6 +689,20 @@ Rust
>>>>>>    Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>>>>>>    Do *not* use it from C.
>>>>>>    +Page Table Entry
>>>>>> +----------------
>>>>>> +
>>>>>> +::
>>>>>> +        %ppte
>>>>>> +
>>>>>> +Print standard page table entry pte_t.
>>>>>> +
>>>>>> +Passed by reference.
>>>>>
>>>>> Curious, why the decision to pass by reference?
>>>>
>>>> Just to make this via %p<> based address mechanism. But wondering
>>>> will it be better for the pte to be represented via value instead
>>>> of reference ?
>>>
>>> We commonly pass ptes to functions through value, not reference, that's why
>>> I am asking.
>>
>>
>> All printf/printk extensions in the kernel follow %p<some letters> and use
>> pointers because %p takes pointers, so it lets us use -Wformat with no issues.
>>
>> So yes, taking a pte_t * is required.
> 
> Correct. But the pointer is usually needed because the %pxx format
> need to access a structure.

Right.

> 
> Passing a pointer is another potential source of errors. I mean that
> the callers might pass an invalid pointer by mistake...

Agreed - could be a source of error when not used properly.

> 
> Another aspect is performance. It is likely not a big deal for classic
> printk() which is a slow path. But trace_printk() tries to optimize
> the speed by deferred formatting where possible, see vbin_printf()
> and bstr_printf().
> 
> I think that this is not a blocker for this patchset. But you should
> know that using %pxx has a cost.
Got it - thanks for the explanation.

