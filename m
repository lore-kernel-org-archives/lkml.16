Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808A137E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454683; cv=none; b=gBvax095zXaZLRJKKCHePnlVTw58DgCJyNd2cdxBTlisd+IRAjeSeA/Tw+eWlLFXskNZwRiCbf1dX6OJBAfNRGXe0hXU6lwmwuCBvK7qnDu6VmnAKjHO3CiqRCE9xKy+vc6dQjBpYcd070xvEKHsrIHYWBZeVOxHOXwW+QGDrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454683; c=relaxed/simple;
	bh=aBSvV4uVpj3rZ+OHvr47kU75iXhkywW48nUQy5VL4xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeYwqXl+7+c9r0x6wd1MkVbA/dYq1mquIARKHDRUAlwBwlIuTZzIODnfq7cr97cpj15lrZ3K4SjSPP8Nd97pvsbUq7M3xD2McfhO40U8TOdNmq0rm21b8pJ3NiIiJKgxxX1HQ7yHZUrYtOvOfoVQ7zaq8Z3cXib/tMKLya8HC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKrEg5GS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKrEg5GS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45348bff79fso25597305e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750454680; x=1751059480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hYnhtoZwkuwrvB+wwlp0QSio2QYiDoPuXaarA1EFM3s=;
        b=WKrEg5GSnSmIGzcqyoCZUIMeZAIwqSNf0dAF6ryNCy/Fwna/jPT1AqUOI4OayPW+1d
         Y0W26k5yF0Kz4cimev09vYUPfma+X49Jfk8vh03CeHRZAWH9JQ1tC21u+0xaHdZv7j7Z
         ZWNFhkJCdshdyshXin1cbAFcRqNw/DkNvv07BU4RH4EQfqhxkJD31qeo0cO+OGQ/gT+O
         OxIRHjquCrD/NYowNrnirpX2bzZJmw6L+2mJT6NVHYkPJ2jC+BxzFh3/vQ5cyZ8rFcXc
         yox+lrJdcJxwDP7EhpSCmW3VDnWKGmXgHJWs56iE8Wb329tMb6mPzx4KD87PVNTSlCbW
         5NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454680; x=1751059480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYnhtoZwkuwrvB+wwlp0QSio2QYiDoPuXaarA1EFM3s=;
        b=LlYB3SZcC1TbtHvQM+CLqC2Ff3yJwEfbW16gJgiTRsm/NMxS4a0xKXzNYx3yeQw86X
         5e9YK7bM6I4Hc2EIcrFiuSZHRGxeWRk2kYpEGjMMWvN+4QkSZihm9wUfqFY+jS9c+Yaj
         hfCqdZ6cyjWNFgDdTB9/3UUdbkfjexim34WKc9sON4mMb7oMexmyX22q4RjcFIkohon2
         3IiOMJtChcdOEtOfY5h7oRay9yW8mW/PsHSj8nX3x74M3IxVbyuiKcLUOivxwZl/d92/
         RtCviHURH82px2HJPPLHBEZ2jJ3+7A+5rFifMIPhx8tc/cxipQkLjiRwsMKH/rtc6ROl
         COPg==
X-Forwarded-Encrypted: i=1; AJvYcCVL8C/EIZi9+3ToIOwI1Z2c/BA6pYMLVFWzzu8PuJazuTJ/SC1FSI/tsv4W8tJ2cWMNFkBn4O+70UXRfPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyLGcjXHLd5ZQTFarCBI5q8mL40nCLAoXDC3bX6joaT+M+yBN0
	W9WXLF8O2Jxfpp1bOMDolTJCBDgQZARuXGVnLeJWC0CVAadg2nLHjWcw
X-Gm-Gg: ASbGncu+EC/F0WQW68OHiDrLC7olnubNBSOrhvsCJmRWw+EUZavTRTiPzXnwbJQBWB5
	TMBok0TT3xfWazPf75kR0BD9D6VpI6w7Mokd8F9GXG6N4DeMXV760UHoy/s3LLvIGtLDeaoBr17
	mx3K5f/nqoGhe/rTq6K5raxxmuw/L4CmkedQIT9Sc5BGG/mkWwlBGBKbuRF41m0RmOdATF1TJRp
	ACa/PzquUWR9oUBQj+4VECVHe36T07HlfRYjn8j5U4v0VMFuR09D9ey9kvJB1fnoluyzcwXZ2rb
	T3F+p+2ZizQR6AZmrJhWWO1deH0QQOnomKdOdtBHixXuDNEMJWwLYqqJV3enlet1RxXx97F1E6Q
	jcQ==
X-Google-Smtp-Source: AGHT+IHg66BfpksH7Z+l45xm9wgQ15fWq+qXGEskV3DYoxb2fboh+LpeAPVq/Tm4xUWCs+ctV8SemA==
X-Received: by 2002:a05:600c:37c5:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-453659dcd62mr38100545e9.21.1750454679885;
        Fri, 20 Jun 2025 14:24:39 -0700 (PDT)
Received: from [192.168.1.8] ([5.29.20.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470903asm36272215e9.40.2025.06.20.14.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 14:24:39 -0700 (PDT)
Message-ID: <f230df34-2959-47f9-9131-ac233d85027e@gmail.com>
Date: Sat, 21 Jun 2025 00:24:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, bp@alien8.de, x86@kernel.org, seanjc@google.com,
 tglx@linutronix.de, mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-6-riel@surriel.com>
 <6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com>
 <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
From: Nadav Amit <nadav.amit@gmail.com>
Content-Language: en-US
Autocrypt: addr=nadav.amit@gmail.com; keydata=
 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
In-Reply-To: <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2025 4:10, Rik van Riel wrote:
> On Fri, 2025-06-20 at 02:01 +0300, Nadav Amit wrote:
>>> +
>>> +static void set_payload(struct rar_payload *p, u16 pcid, unsigned
>>> long start,
>>> +			long pages)
>>> +{
>>> +	p->must_be_zero_1	= 0;
>>> +	p->must_be_zero_2	= 0;
>>> +	p->must_be_zero_3	= 0;
>>> +	p->page_size		= RAR_INVLPG_PAGE_SIZE_4K;
>>
>> I think you can propagate the stride to this point instead of using
>> fixed 4KB stride.
> 
> Agreed. That's another future optimization, for
> once this code all works right. 

It might not be an optimization if it leads to performance regression 
relatively to the current software-based flush that does take the stride 
into account. IOW: flushing 2MB huge-page would end up doing a full TLB 
flush with RAR in contrast to selectively flushing the specific entry 
with the software-based shootdown. Correct me if I'm wrong.

> 
> Currently I am in a situation where the receiving
> CPU clears the action vector from RAR_PENDING to
> RAR_SUCCESS, but the TLB does not appear to always
> be correctly flushed.

Interesting. I really do not know anything about it, but you may want to 
look on performance counters to see whether the flush is at least 
reported to take place.

> 
>>
>>> +	p->type			= RAR_TYPE_INVPCID;
>>> +	p->pcid			= pcid;
>>> +	p->linear_address	= start;
>>> +
>>> +	if (pcid) {
>>> +		/* RAR invalidation of the mapping of a specific
>>> process. */
>>> +		if (pages < RAR_INVLPG_MAX_PAGES) {
>>> +			p->num_pages = pages;
>>> +			p->subtype = RAR_INVPCID_ADDR;
>>> +		} else {
>>> +			p->subtype = RAR_INVPCID_PCID;
>>
>> I wonder whether it would be safer to set something to p->num_pages.
>> (then we can do it unconditionally)
> 
> We have a limited number of bits available for
> p->num_pages. I'm not sure we want to try
> writing a larger number than what fits in those
> bits.

I was just looking for a way to simplify the code and at the same time 
avoid "undefined" state. History proved the all kind of unintended 
consequences happen when some state is uninitialized (even if the spec 
does not require it).

> 
>>
>>> +		}
>>> +	} else {
>>> +		/*
>>> +		 * Unfortunately RAR_INVPCID_ADDR excludes global
>>> translations.
>>> +		 * Always do a full flush for kernel
>>> invalidations.
>>> +		 */
>>> +		p->subtype = RAR_INVPCID_ALL;
>>> +	}
>>> +
>>> +	/* Ensure all writes are visible before the action entry
>>> is set. */
>>> +	smp_wmb();
>>
>> Maybe you can drop the smp_wmb() here and instead change the
>> WRITE_ONCE() in set_action_entry() to smp_store_release() ? It should
>> have the same effect and I think would be cleaner and convey your
>> intent
>> better.
>>
> We need protection against two different things here.
> 
> 1) Receiving CPUs must see all the writes done by
>     the originating CPU before we send the RAR IPI.
> 
> 2) Receiving CPUs must see all the writes done by
>     set_payload() before the write done by
>     set_action_entry(), in case another CPU sends
>     the RAR IPI before we do.
> 
>     That other RAR IPI could even be sent between
>     when we write the payload, and when we write
>     the action entry. The receiving CPU could take
>     long enough processing other RAR payloads that
>     it can see our action entry after we write it.
> 
> Does removing the smp_wmb() still leave everything
> safe in that scenario?

Admittedly, I do not understand your concern. IIUC until 
set_action_entry() is called, and until RAR_PENDING is set, IPIs are 
irrelevant and the RAR entry would not be processed. Once it is set, you 
want all the prior writes to be visible. Semantically, that's exactly 
what smp_store_release() means.

Technically, smp_wmb() + WRITE_ONCE() are equivalent to 
smp_store_release() on x86. smp_wmb() is actually a compiler barrier as 
x86 follows the TSO memory model, and smp_store_release() is actually a 
compiler-barrier + WRITE_ONCE(). So I think it's all safe and at the 
same time clearer.


