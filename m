Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EF227EFF9;
	Wed, 18 Jun 2025 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235641; cv=none; b=mx1vWUQvlvOa5kwNEVkra//ArUDUSJ2vlRq8PuTIHNvgk4I2dKtPwUCfLf3Q9xN+GKOLYN2p0b/JSryEPXEn/Ig1zLr9exPBKLduC7/P3XpNrWR6qGmmar6JMawlJvQvdZqDE92mZN5Lp7VGp7H2UY3LQvD18oOSeUgqMkkRh8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235641; c=relaxed/simple;
	bh=NkVP0Pe6MixI98Ik2kCoYR/GZdPxxXULj0SRX8tgsbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIOwHmy/go2qYVO3eHKKdsSIw+1UeAnPyzOJzy/Xb70brImo9W5Z0pAmZrtfI1/7uWmZ8RvUWZz4RAHeK3BjXTZRBF4maN1a5OfkDAf+NbLmOejri0nrXK8cMdiT4IC3uXR6rTqIquFbmPV+21e8c8EXbCxdFmurjqW367HKMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE97114BF;
	Wed, 18 Jun 2025 01:33:31 -0700 (PDT)
Received: from [10.163.35.185] (unknown [10.163.35.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4B853F66E;
	Wed, 18 Jun 2025 01:33:48 -0700 (PDT)
Message-ID: <ba8ec54d-586e-4bde-95c6-1dc2a9a937fb@arm.com>
Date: Wed, 18 Jun 2025 14:03:45 +0530
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1eceff0f-4df8-4716-8e3c-e2cb9e142511@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/06/25 1:49 PM, David Hildenbrand wrote:
>> +    case 'p':
>> +        if (fmt[1] == 't' && fmt[2] == 'e') {
>> +            pte_t *pte = (pte_t *)ptr;
>> +
>> +            spec.field_width = 10;
>> +            spec.precision = 8;
>> +            spec.base = 16;
>> +            spec.flags = SPECIAL | SMALL | ZEROPAD;
>> +            if (sizeof(pte_t) == sizeof(u64)) {
>> +                u64 val = pte_val(*pte);
>> +
>> +                return number(buf, end, val, spec);
>> +            }
>> +            WARN_ONCE(1, "Non standard pte_t\n");
> 
> What about 32bit with 32bit pte_t?

Ahh, missed that. Just wondering which all platforms might
care about the 32 bit pte representation.

