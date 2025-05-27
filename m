Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8A2F29
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324052; cv=none; b=AOv9LBgXwbToI5srT7WasmfEj10zkI44Yyw0PRucZTCb69kPnfVS97/1P6FKeNIVw0kl3bVlV38wLVCxb8L4vQtlMlPJZ6vSBAwBC3O+/7ZEAC2n6MRTnntH0qNPWEV9ztQpAX1rkDY8aEAHFXZ+dOh+S2R9e+cJfwtHFKkH7oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324052; c=relaxed/simple;
	bh=owmKOZ+LjHRRvTCtjxaqB/61XgX+EQg7MnF9vxRS2Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAWIF1CX9zE6PFGHl7mcwSHjc6B2JaTy5mpbKqShcLzpWnkG6fy+5Ou0BjFY4bNMwN9a9gMXLFC9QmlkRAieRccq1B25s85EnI7U4Onbv+EM387N/qzZO16drmgMVHQCTB2Pc6GQZPvJeqo+BGmONMe3h66RepbfNPSdSrePX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BPqGm6F3; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BPqGm6F3"
Message-ID: <055a9abd-8137-4382-9830-551961cbcda2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748324048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtFxO4qrn8tZ4jKlC35uOPsc9iqCtcevGZOVYHd+UXs=;
	b=BPqGm6F3HWGvopIsRZJQ63ZQGlgUsEpMAm2AESEw7i90Q/7LnY2582ypHN8adZrQCmPfP2
	9RU4HifVnQeGBb7d2YFtdXkZ/J03MWqoJSNklgycuazlNZ/295KpXuInPMs0Iv6YAmjUHp
	RRai0XHueLj1nmVKj5uVQx48zAlfT4k=
Date: Tue, 27 May 2025 13:33:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [WARN] LOCKDEP: MAX_LOCKDEP_CHAIN_HLOCKS too low
To: Waiman Long <llong@redhat.com>, peterz@infradead.org
Cc: mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 Zi Li <zi.li@linux.dev>
References: <20250527020252.43684-1-lance.yang@linux.dev>
 <c0fb67e3-ebe0-45ec-9f61-a8cd5949cc42@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <c0fb67e3-ebe0-45ec-9f61-a8cd5949cc42@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Longman,

Thanks for looking into this!

On 2025/5/27 12:48, Waiman Long wrote:
> On 5/26/25 10:02 PM, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> Hi all,
>>
>> With CONFIG_LOCKDEP on, I got this warning during kernel builds:
>>
>> [Tue May 27 00:22:59 2025] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!

[...]

>>
>> $ cat .config|grep CONFIG_LOCKDEP
>> CONFIG_LOCKDEP_SUPPORT=y
>> CONFIG_LOCKDEP=y
>> CONFIG_LOCKDEP_BITS=15
>> CONFIG_LOCKDEP_CHAINS_BITS=16
>> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
>> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
>> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
>>
>> Is it safe? Or could this be a real locking issue?
> 
> The lock chains store the locking order of nested locks. The default 
> value of 16 may be too low now as the kernel is becoming more complex in 
> term of possible nested locking orders. Anyway, I would suggest upping 
> the CONFIG_LOCKDEP_CHAIN_BITS to 17 or even 18 to prevent this kind of 
> problem. In fact, the latest RHEL debug kernel sets 
> CONFIG_LOCKDEP_CHAINS_BITS to 18.

Yes, makes sense to me. Bumping it to 18 sounds reasonable as the kernel
is getting more complex in terms of possible nested locking orders. It
uses a bit more memory, but keeping LOCKDEP working is worth it ;)

And if there are no objections, I’d be happy to send a patch making the
change.

Thanks,
Lance

> 
> Cheers,
> Longman
> 

