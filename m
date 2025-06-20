Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1930E844;
	Fri, 20 Jun 2025 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401065; cv=none; b=tYlV636hG9lm4uGHzLWCCSPJalq5inazqbFoEvxnB7b6h5Ap8ZZeLbhCR3T59tkt+R7mZQbfLhS3800zTeJJcI9lWp2kixxXg7d12DwYfdiiUUpfDwgZ+HA/x3EXZnd0Y0fmM24L09tjvdRgsavvVmoPB94fnxXHlXHbIE//A6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401065; c=relaxed/simple;
	bh=FfQO/3Gko0umHfvQNq8LkRrn8BCHd44Qw+u8nsZ5xdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIpl9j9zW7etLE1fs3j5dEdvq90+WzTKhMKj6dyIiBaPuy/LFBZ2NGaFdV9xf5wpdmsjQBtlKpK9U0UrMoTllpq0nrCEreDdqEmucuNtCccy0p4BOxyYT4N5aSUvGagefqB88hTR2eF+3voqY5ZujNseLqECiDKq7B6oLIrVV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4397B176A;
	Thu, 19 Jun 2025 23:30:42 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8773F66E;
	Thu, 19 Jun 2025 23:30:58 -0700 (PDT)
Message-ID: <670878b5-23fc-4b11-b585-9ddd43576963@arm.com>
Date: Fri, 20 Jun 2025 12:00:55 +0530
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
 <1eceff0f-4df8-4716-8e3c-e2cb9e142511@redhat.com>
 <ba8ec54d-586e-4bde-95c6-1dc2a9a937fb@arm.com>
 <8f41d3ed-d490-4207-a907-75090c81bfc9@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <8f41d3ed-d490-4207-a907-75090c81bfc9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/06/25 2:13 PM, David Hildenbrand wrote:
> On 18.06.25 10:33, Anshuman Khandual wrote:
>>
>>
>> On 18/06/25 1:49 PM, David Hildenbrand wrote:
>>>> +    case 'p':
>>>> +        if (fmt[1] == 't' && fmt[2] == 'e') {
>>>> +            pte_t *pte = (pte_t *)ptr;
>>>> +
>>>> +            spec.field_width = 10;
>>>> +            spec.precision = 8;
>>>> +            spec.base = 16;
>>>> +            spec.flags = SPECIAL | SMALL | ZEROPAD;
>>>> +            if (sizeof(pte_t) == sizeof(u64)) {
>>>> +                u64 val = pte_val(*pte);
>>>> +
>>>> +                return number(buf, end, val, spec);
>>>> +            }
>>>> +            WARN_ONCE(1, "Non standard pte_t\n");
>>>
>>> What about 32bit with 32bit pte_t?
>>
>> Ahh, missed that. Just wondering which all platforms might
>> care about the 32 bit pte representation.
> 
> I think e.g., 32bit arm has 32bit ptes?
> 
> arch/arm/include/asm/pgtable-2level-types.h
> 
> typedef u32 pteval_t;
> ...
> typedef struct { pteval_t pte; } pte_t;

Right, missed that. I will accommodate 32 bit representations.

