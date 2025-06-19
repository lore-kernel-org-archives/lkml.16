Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FC020E33F;
	Thu, 19 Jun 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325722; cv=none; b=kyZBTY7grx/KzOKcKxZpn7KVXt9wynMKQatUEEQ7V+WG1XprP+7j0TePRo8fhB+nqi8mZkebJSHJoLxrij5sa4Ykk+JbnfAi0AUeDQqgiJDQkQN1zB6OtnAMxpyT5YGVrp9K78h4qA7EolpSG6xzWC7kpW/7a6s71icPN4qYK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325722; c=relaxed/simple;
	bh=KJz4wHkbznHGbklhZhBhpri2LOwDB+obREZzjSZkApc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7BGMjMLR2pq2N8mZjBuxfLabOPELJgcqhRRayOKXM96pRAOVMjwcP7JGQkK/7qYZTzE/+lqMxHyZ0Z4KNSo/+YkiSAfAyrmpHHi5jrUf8xICUfVrkcLewYU64AKXBk6F75qSt8izpazWPS8resSxmRzDiRiG5tLb6kBIPQ93Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1725113E;
	Thu, 19 Jun 2025 02:34:56 -0700 (PDT)
Received: from [10.163.35.214] (unknown [10.163.35.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 953A43F58B;
	Thu, 19 Jun 2025 02:35:13 -0700 (PDT)
Message-ID: <0d437b3e-37b5-4e98-90bc-afa6c8150e77@arm.com>
Date: Thu, 19 Jun 2025 15:05:10 +0530
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFL7frrstgpzzgan@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/06/25 11:16 PM, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
>> Add a new format for printing page table entries.
> 
>> Cc: Petr Mladek <pmladek@suse.com>
>> Cc: Steven Rostedt <rostedt@goodmis.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
> 
> Please. move these to be after the '---' cutter line below. Just leave SoB tag
> alone. This will have the same effect w/o polluting commit message.
> 
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> (somewhere here is a good place for all your Cc: tags)

Is not it better to also capture the Cc: list in the commit message.
Seems like such has been the practice for various patches on the MM
list. But not sure if that is an expected standard for all patches.

> 
> ...
> 
>> +        %ppte
> 
> I believe you can take %pte.

Yes - that should be possible.

> 
> ...
> 
>> +Print standard page table entry pte_t.
>> +
>> +Passed by reference.
>> +
>> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
> 
> What does this mean?

64 bit address containing value the 0xc0ffee

> 
>> +        %ppte   0x00c0ffee
> 
> Can it be ever 64-bit?
I am sorry - did not get that. pte_t contained value can be 64
bits if that's what you meant.

> 
> ...
> 
>> +			spec.field_width = 10;
>> +			spec.precision = 8;
>> +			spec.base = 16;
>> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> 
> Do not duplicate code we have already in the file.
I am sorry - did not get that. Is the above flag combination some
how wrong ?

> 
>> +			if (sizeof(pte_t) == sizeof(u64)) {
>> +				u64 val = pte_val(*pte);
>> +
>> +				return number(buf, end, val, spec);
>> +			}
> 
> Ditto.
> 
>> +			WARN_ONCE(1, "Non standard pte_t\n");
> 
> (almost) Ditto,
> 
>> +			return error_string(buf, end, "(einval)", spec);
> 
> Ditto.
> 
>> +		}
>> +		fallthrough;
> 
> Please, avoid this, it makes code much harder to read and maintain.
> See above how.
> 

Could you please kindly elaborate on the code duplication problem
you have mentioned earlier. I might not understand your concern
here correctly.




