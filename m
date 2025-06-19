Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064B0220F5C;
	Thu, 19 Jun 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326826; cv=none; b=IK612xu1YLsiMKoSLkdhdpjkrbybs/m452LP3RTPka6wkcCYBE6BQ/HW2HLIbaBGNKsXa61O0lXGDYHxHpLoCE0VCRKO64YehuD1zjfm9QnYuFInYGLOmL7N9NCFa24SIm7KOx8Ywut/BrPpDsHeeoURyNJRhsRhP0zMuVzxH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326826; c=relaxed/simple;
	bh=cXoInAMla698Hrg8juo+W+JZpAaCpFOq+g+d1caEEko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfxpZpTdAIuh6EOlVRCAxHcHhs0quKyCustaTiMI4CrCIoOPtSUg9mSck9njiwTiLH0wmuglxqkA42GqceY+Rgof/BSJObOgvie+8Zaw6ElcXHLvTijAjZoCsxkQiula3sC9+rVUi4yKhAvy1jywKCDNV1pEbllfpy9dGj9m93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26899113E;
	Thu, 19 Jun 2025 02:53:24 -0700 (PDT)
Received: from [10.163.35.214] (unknown [10.163.35.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26673F66E;
	Thu, 19 Jun 2025 02:53:40 -0700 (PDT)
Message-ID: <ca4d1ac9-725c-491f-b1ff-26661952557e@arm.com>
Date: Thu, 19 Jun 2025 15:23:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <zsfblk4nfi6nigfnv7umruhewmg7fqhhtz6fiigezzk2wtn2n7@agpzorfpaywq>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <zsfblk4nfi6nigfnv7umruhewmg7fqhhtz6fiigezzk2wtn2n7@agpzorfpaywq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/06/25 11:49 PM, Pedro Falcato wrote:
> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
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
>>  Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>>  lib/vsprintf.c                            | 20 ++++++++++++++++++++
>>  mm/memory.c                               |  5 ++---
>>  scripts/checkpatch.pl                     |  2 +-
>>  4 files changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>> index 4b7f3646ec6ce..75a110b059ee1 100644
>> --- a/Documentation/core-api/printk-formats.rst
>> +++ b/Documentation/core-api/printk-formats.rst
>> @@ -689,6 +689,20 @@ Rust
>>  Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>>  Do *not* use it from C.
>>  
>> +Page Table Entry
>> +----------------
>> +
>> +::
>> +        %ppte
>> +
>> +Print standard page table entry pte_t.
>> +
>> +Passed by reference.
>> +
>> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
>> +
>> +        %ppte   0x00c0ffee
> 
> Ok, so what's the point of this if you're just printing the number?

I might have got this wrong probably. The ideas is to represent
a 64 bit address containing a 64 bit value i.e 0xc0ffee - which
needs to be printed via the new print format.

> 
> Could at least do something like:
> 
> %ppte 0xc0ff000|WRITE|DIRTY|PRESENT
> 
> no? Otherwise it's a not super useful wrapper around printing pte_val(*pte).

Although it would be great to have PTE flags called out as well,
the proposed patch here just wanted to transparently extract 64
bit printable value from pte_t represented page table entries.

But coming back to your suggestion above.

%ppte 0xc0ff000|WRITE|DIRTY|PRESENT

Should all the generic page table entry flags and contained pfn
be extracted from the pte_t and printed via new format %ppte ?

> 
>> +
>>  Thanks
>>  ======
>>  
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> index 3d85800757aa5..005490202ffb5 100644
>> --- a/lib/vsprintf.c
>> +++ b/lib/vsprintf.c
>> @@ -2433,6 +2433,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>>   *		Without an option prints the full name of the node
>>   *		f full name
>>   *		P node name, including a possible unit address
>> + * - 'pte'	For a 64 bit page table entry, this prints its contents in
>> + *              a hexa decimal format
>> + *
>>   * - 'x' For printing the address unmodified. Equivalent to "%lx".
>>   *       Please read the documentation (path below) before using!
>>   * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
>> @@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>>  		default:
>>  			return error_string(buf, end, "(einval)", spec);
>>  		}
>> +	case 'p':
>> +		if (fmt[1] == 't' && fmt[2] == 'e') {
>> +			pte_t *pte = (pte_t *)ptr;
>> +
>> +			spec.field_width = 10;
>> +			spec.precision = 8;
>> +			spec.base = 16;
>> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
>> +			if (sizeof(pte_t) == sizeof(u64)) {
>> +				u64 val = pte_val(*pte);
>> +
>> +				return number(buf, end, val, spec);
>> +			}
> 
> As mentioned elsewhere in the thread, this obviously doesn't work for everything
> 32-bit, and 64-bit PAE, and all of the weird page table formats we have around.
I will accommodate 32 bit formats.

But what about 64-bit PAE ? Would not pte_val() also return a printable
64 bit number for such cases. Could you please elaborate on the weird
page table formats you mentioned and why would not pte_val() work for
those as well.

