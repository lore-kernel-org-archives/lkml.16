Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1938F30E824;
	Fri, 20 Jun 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406561; cv=none; b=S6YABDI16DdAI6KD/5YdXErmO+0OZKXt333TLN8cZNioUvb7R/MX3uFZdN+XgVPGpUf2iZNkYcU0u/PsbbezaEGuKXmLl2scLpEqJHpoeABw75nvywPP+93GNv6PjE47FsJqWSmK3yNbSVEzq6smPAigR6V6PKreARYr6USeA8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406561; c=relaxed/simple;
	bh=zR9P41fSivBylvTIgh8isbmn30vkfpgRB7a+NPqHr1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OE3JJf+67AEjrzJgm8ke4dc3k1FlAXIlXmy5M3MjRVQFxgmjlV2mWzn5wvqdxXuBPfo9z1GI4YpgzAYM1cmBhnydjydgWGnswR5g1aFq3SN8bZ/eD62CcqiR5JG9v2vg/3mGWYSyAtAuryQyD2uVSJR86ZI6XqJ3lEHhh0SBtJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37CE5176A;
	Fri, 20 Jun 2025 01:02:18 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713BE3F66E;
	Fri, 20 Jun 2025 01:02:34 -0700 (PDT)
Message-ID: <68cdf649-a273-4d83-b862-6b675a793f18@arm.com>
Date: Fri, 20 Jun 2025 13:32:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Petr Mladek <pmladek@suse.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFQYVPmStsIIFcMW@pathway.suse.cz>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aFQYVPmStsIIFcMW@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/25 7:31 PM, Petr Mladek wrote:
> On Wed 2025-06-18 09:42:34, Anshuman Khandual wrote:
>> Add a new format for printing page table entries.
> 
> How many users do you explect, please?
> 
> This patch adds only one caller. It does not justify the added complexity.

Understood.

The idea is to convert all page table entry prints through out the tree
both in generic and platform code. Added just a single generic example
here for this being a RFC proposal. Will go through similar instances
and be back with more comprehensive change set.

> 
>> @@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>>  		default:
>>  			return error_string(buf, end, "(einval)", spec);
>>  		}
>> +	case 'p':
> 
> Please, do not opencode this in the already very long switch().
> Move it to a helper function.
Sure, will do.

> 
> 
>> +		if (fmt[1] == 't' && fmt[2] == 'e') {
>> +			pte_t *pte = (pte_t *)ptr;
> 
> If the value (pointer) gets dereferenced then please add a basic
> check:

Sure, will do.

> 
> 	if (check_pointer(&buf, end, ptr, spec))
> 		return buf;
> 
>> +			spec.field_width = 10;
>> +			spec.precision = 8;
> 
> Is she precision = 8 really needed?
> I guess that .field_width + ZEROPAD would do the trick.
> 
> And them maybe special_hex_number() might be used instead of number()
> and safe a lot of code.

Agreed. Andy also might have suggested about special_hex_number() helper
on the other thread. Will try and use the helper instead.

> 
>> +			spec.base = 16;
>> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
>> +			if (sizeof(pte_t) == sizeof(u64)) {
>> +				u64 val = pte_val(*pte);
>> +
>> +				return number(buf, end, val, spec);
>> +			}
>> +			WARN_ONCE(1, "Non standard pte_t\n");
> 
> This is nasty. It should be a compile-time check. And the code should

Something like BUILD_BUG_ON() against pte_t as either u64 or u32 aka all
the sizes the print format is going to support and it should pass on all
platforms ?

> get fixed on all architectures. If it is not easy then> it might be a signal that the generic %ppte flag is not a good idea.

Understood.

> 
>> +			return error_string(buf, end, "(einval)", spec);
>> +		}
>> +		fallthrough;
>>  	default:
>>  		return default_pointer(buf, end, ptr, spec);
>>  	}
> 
> Best Regards,
> Petr

Thanks for your review.
