Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3194210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687677; cv=none; b=LLA3dzoal3jYN90X61xBZs9ELWSQEDrb9olUnoCzRCbxfCKrRT558p+7HngfSkiZpIgWd4P7XaniERTqB67/IOmPecGs/lQB8a8E49cSFSImPRmvmceIkUZXp1inex18f3P0h3/ozyQN+UhegABOpGRMe+GwPrmyxA6tzjZeseM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687677; c=relaxed/simple;
	bh=iS6mOEeajkZYtTYluSq6j68MuQ5x8jxFGkN2FSIISnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L76e8fUW2VCVpn5VTSEdU4aocTg82TjYS69WLww6D4dCnKz3gehu3umFTwArWDj7JIvGqrpO0gt+iQSipPpjIoiSRFQo1qE6pSSbm/HYqbDHytMlsvYuiFWA93CUqDm7RREnFllrR2qgtJyombe1xx96p9yrxoWjcy09pD+j4qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zg3xXINc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zg3xXINc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5967095e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743687673; x=1744292473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRjH9LUbXGXt0wyOzN5egHLn7xabuue3cHwKXGB5l2A=;
        b=Zg3xXINcldjctgX0ke9kVA7H06BUKmhOwJ0TKJWZmwSOCV8i3CpTK4IvEESSKRJtpX
         zFcTPqNv7KJJlTR0QjvgF8+Z1gFDYFMcqiTtSPn6w2nmAS7j4WekCYkaHtXrZh+epuSZ
         6/aPTpEvxuj126Zpd+NoVrvUQJoyXHooHotRxkXTCnBmQsIvwTTKgMnwBthKpVw+62gv
         LdeQemuu3t9F1n7gQckiPxkK5GRWfsdTCo4qLGSiAqbPd9vlxH4Axc1UAEWPLSqUisi8
         M1A/i1LLY7Lqmwnpxld/QsXcfh4mZaN89+q3oCDRiKaey3i96m/WuD0dp5n6oD1Euz05
         9JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687673; x=1744292473;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRjH9LUbXGXt0wyOzN5egHLn7xabuue3cHwKXGB5l2A=;
        b=XCWi+tYflTowWD6rVIFcstyIuvUrWwjdH1plOkJwW0Qy83H1KkLc5xPYDmtqbMfY3/
         pBBhN7RLCpgedQpPYsiH98lByVChB/1yZfrd0h5bOu99ty/ZP4iykIjaH23eK6r+l11V
         jjsh8ox03Y2256jfL4KnfSVNnzHU5jILr4Hzsumeyi5HuZKHlaJLMwRcMOXIb4ogx3v7
         MWmTyUzZBYNQL3qiEnkuWXbjoRs+umpx+jRfbT0O0ydWtfBh/IATJu6wiLqQfdkZY5Sz
         8RKv32JnODyWbit4DkWce3hwix7eRRKWiLQJvMM0qMWEmEaTi09CFPgM8tsHDmiRAAvU
         vNuA==
X-Gm-Message-State: AOJu0YzaxF6f/a6E3GUQnUbkfBNynjofGxsGqzFvGf8b+WZhEPdB1W2R
	Z6qM2g5YjGPZHxkOoKAhus3EotNQ6x1T5qA6XjScYN4+FUziBzUHAal6m2OnmT4=
X-Gm-Gg: ASbGncs6Iu7bfsHO1MNg7EJHgm4zu73C+tO7SJtJTVlkBJab+X4kWoqhkxkeLh3qEN3
	SN39qNpAdI1iNJDZVKNgUbeHWJFKsBRWAe0IkU4QRa6yqA73bqWF8BWYquzN+w3XNq3djNUdTAH
	BvTnsWadHIbbbFNHIFGVDRB+UyKX9n/ZaDuMU0/ygaT4oOjbWgbRvK8YzB2s/KyE6Z4rVZogbrz
	xKkhqRxdyDIWxq51HAUH6Fd3zW+KbJqMuoBCpfKuM/R1LubMtkArBhT3SZCnoq31h0Igqn4V7bg
	7v0yh9AflDSd9LNBV4A/xJzBpD+/DzS2PNXFjUwWacQicjbP1A==
X-Google-Smtp-Source: AGHT+IHtqmU85YUlm2aOX0BmfwMP9zVTg8UHep9vwFipsdX9bXNUCWRLGqY05jbqNPlIufvsn3Uxug==
X-Received: by 2002:a05:600c:21d4:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43ec9a8e72dmr9440735e9.4.1743687673199;
        Thu, 03 Apr 2025 06:41:13 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b23sm1793017f8f.86.2025.04.03.06.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:41:12 -0700 (PDT)
Message-ID: <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com>
Date: Thu, 3 Apr 2025 16:41:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com> <Z-6PWWyopb86UC6y@gmail.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <Z-6PWWyopb86UC6y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.04.25 г. 16:38 ч., Ingo Molnar wrote:
> 
> * Nikolay Borisov <nik.borisov@suse.com> wrote:
> 
>>
>>
>> On 28.03.25 г. 15:26 ч., Ingo Molnar wrote:
>>> Simplifies the code and improves code generation a bit:
>>>
>>>      text	   data	    bss	    dec	    hex	filename
>>>     14769	   1017	   4112	  19898	   4dba	alternative.o.before
>>>     14742	   1017	   4112	  19871	   4d9f	alternative.o.after
>>>
>>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>> ---
>>>    arch/x86/kernel/alternative.c | 11 +++++------
>>>    1 file changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
>>> index 1df8fac6740d..5293929488f0 100644
>>> --- a/arch/x86/kernel/alternative.c
>>> +++ b/arch/x86/kernel/alternative.c
>>> @@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
>>>    		if (unlikely(!atomic_dec_and_test(refs)))
>>>    			atomic_cond_read_acquire(refs, !VAL);
>>>    	}
>>> +
>>> +	/* They are all completed: */
>>> +	text_poke_array.nr_entries = 0;
>>>    }
>>>    static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
>>> @@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
>>>    void smp_text_poke_batch_finish(void)
>>>    {
>>> -	if (text_poke_array.nr_entries) {
>>> +	if (text_poke_array.nr_entries)
>>>    		smp_text_poke_batch_process();
>>> -		text_poke_array.nr_entries = 0;
>>> -	}
>>>    }
>>
>> This function becomes trivial, why not simply move the check into
>> smp_text_poke_batch_process and rename it to smp_text_poke_batch_finish ?
> 
> Yeah, that's pretty much what happens in patch #47:
> 
>    x86/alternatives: Remove 'smp_text_poke_batch_flush()'

Well, that patch removes poke_batch_flush but still retains 
poke_batch_finish + poke_batch_process. My suggestion is to eliminate 
poke_batch_process name and turn it into poke_batch_finish by moving the 
check from poke_batch_finish into poke_batch_process.

> 
> Thanks,
> 
> 	Ingo

