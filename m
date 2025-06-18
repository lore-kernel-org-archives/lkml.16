Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B9D191F66;
	Wed, 18 Jun 2025 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235836; cv=none; b=LU/9g6F56rarkjdXhe0ppGtwGBOtqEKbwjuJKqmUJJtFRXOjvalQP9WT7X7PK6s49fVCQ8QkzXEsmJg989av6lXZmULgH7eHYwjCQ60oqjSgJRddnRHls8JyV9UAcCczqlrJuQCT4XzPYPr8PDo3Z/W+7VNxBlokd7lAp5CQtzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235836; c=relaxed/simple;
	bh=/8BEmg97Zy4Wt/2DfeBqRy6k3PmRgxtoVX2GcbOXTXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwCbajAZZ8R2ApAYolb4dzy1pTzghUSzCA+K2391YsnYXS6WgDRTLqv98V5C0VEM3UHiBXQIhIABuHLKrIHIZPprU7Le3PxadYHjg9jXLQidKdJlWKuorRSXeWa+jSU2i/scOoh870W+WvTCIDeF2zqgX6EjuMblA7ROL2yedF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E2B14BF;
	Wed, 18 Jun 2025 01:36:52 -0700 (PDT)
Received: from [10.163.35.185] (unknown [10.163.35.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D31E3F66E;
	Wed, 18 Jun 2025 01:37:09 -0700 (PDT)
Message-ID: <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
Date: Wed, 18 Jun 2025 14:07:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/06/25 1:48 PM, David Hildenbrand wrote:
> On 18.06.25 06:12, Anshuman Khandual wrote:
>> Add a new format for printing page table entries.
>>
>> Cc: Petr Mladek <pmladek@suse.com>
>> Cc: Steven Rostedt <rostedt@goodmis.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>>   lib/vsprintf.c                            | 20 ++++++++++++++++++++
>>   mm/memory.c                               |  5 ++---
>>   scripts/checkpatch.pl                     |  2 +-
>>   4 files changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>> index 4b7f3646ec6ce..75a110b059ee1 100644
>> --- a/Documentation/core-api/printk-formats.rst
>> +++ b/Documentation/core-api/printk-formats.rst
>> @@ -689,6 +689,20 @@ Rust
>>   Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>>   Do *not* use it from C.
>>   +Page Table Entry
>> +----------------
>> +
>> +::
>> +        %ppte
>> +
>> +Print standard page table entry pte_t.
>> +
>> +Passed by reference.
> 
> Curious, why the decision to pass by reference?

Just to make this via %p<> based address mechanism. But wondering
will it be better for the pte to be represented via value instead
of reference ?
