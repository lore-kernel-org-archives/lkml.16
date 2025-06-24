Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464933FE7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750728945; cv=none; b=XP6dNl4EIfBpCZOwPPR6+jl8o9m1VJPFVK1S8N0tSlWz6W1ca+M/hvp1uXXWJw8mOqlXg3ihFr2iq2wgUXmrDjgwoQWbiNLKRsqJA1I+pcva8kLVLQfdzAKB4AyghyU0eNItlEUUZpX+4JyhUkUPArlfcgmgE8QUEEbVs+ilS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750728945; c=relaxed/simple;
	bh=0R8kh9vmNHmJxUvVtlnuaKUoGaU/jMFPFGc8nGNfCcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twf5exnwKG0GnX0zC5Ps4coszUa5ikgDFBENP771aESnmJ4w8GOn4SLDY8eTTfycU9Drwq7XNWntd+KL+TIQ1qfG8NpnK5BQSkp+abyDcWpwdviT0U2u4jVf/xMJOuS2ya84lrARQL9472jPR0wIx5miyRSVCKdx+97FMOtD8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ih0WBsa6; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ih0WBsa6"
Message-ID: <6a1d2610-2407-4449-a3ff-2fbfa85f96ae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750728939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKlAz9lF4G5Swjm3N/6rrWAQte/82d71dVG7rJqEujs=;
	b=ih0WBsa65QZfw9GxfDwUtwhUb8YuA+K4PhUXvEGaFDSm/sbjl7NCLJNuH2XJQ2ZojIzqHg
	EyrK/sElvtEKOldXNm7aUe9E0jWoVu2APBDe5gyUHb79lYhr3iq4o6UshNhwlstIJShlOn
	6EY2NOH/+CYkcWnmJaVfiIgS70ap+8w=
Date: Tue, 24 Jun 2025 09:35:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 1/3] locking/rwsem: make owner helpers globally
 available
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mingo@redhat.com,
 mingzhe.yang@ly.com, peterz@infradead.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, will@kernel.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250612042005.99602-1-lance.yang@linux.dev>
 <20250612042005.99602-2-lance.yang@linux.dev>
 <20250624091731.f4d3cf296943ce45e97a631f@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250624091731.f4d3cf296943ce45e97a631f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/24 08:17, Masami Hiramatsu (Google) wrote:
> On Thu, 12 Jun 2025 12:19:24 +0800
> Lance Yang <ioworker0@gmail.com> wrote:
> 
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> In preparation for extending blocker tracking to support rwsems, make the
>> rwsem_owner() and is_rwsem_reader_owned() helpers globally available for
>> determining if the blocker is a writer or one of the readers.
>>
> 
> Looks good to me.
> 
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Thanks!

Thanks for taking the time to review!
Lance

> 
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>>   include/linux/rwsem.h  | 12 ++++++++++++
>>   kernel/locking/rwsem.c |  8 +++++---
>>   2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
>> index c8b543d428b0..544853bed5b9 100644
>> --- a/include/linux/rwsem.h
>> +++ b/include/linux/rwsem.h
>> @@ -132,6 +132,18 @@ static inline int rwsem_is_contended(struct rw_semaphore *sem)
>>   	return !list_empty(&sem->wait_list);
>>   }
>>   
>> +#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
>> +/*
>> + * Return just the real task structure pointer of the owner
>> + */
>> +extern struct task_struct *rwsem_owner(struct rw_semaphore *sem);
>> +
>> +/*
>> + * Return true if the rwsem is owned by a reader.
>> + */
>> +extern bool is_rwsem_reader_owned(struct rw_semaphore *sem);
>> +#endif
>> +
>>   #else /* !CONFIG_PREEMPT_RT */
>>   
>>   #include <linux/rwbase_rt.h>
>> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
>> index 2ddb827e3bea..6cb29442d4fc 100644
>> --- a/kernel/locking/rwsem.c
>> +++ b/kernel/locking/rwsem.c
>> @@ -181,11 +181,11 @@ static inline void rwsem_set_reader_owned(struct rw_semaphore *sem)
>>   	__rwsem_set_reader_owned(sem, current);
>>   }
>>   
>> -#ifdef CONFIG_DEBUG_RWSEMS
>> +#if defined(CONFIG_DEBUG_RWSEMS) || defined(CONFIG_DETECT_HUNG_TASK_BLOCKER)
>>   /*
>>    * Return just the real task structure pointer of the owner
>>    */
>> -static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>> +struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>>   {
>>   	return (struct task_struct *)
>>   		(atomic_long_read(&sem->owner) & ~RWSEM_OWNER_FLAGS_MASK);
>> @@ -194,7 +194,7 @@ static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>>   /*
>>    * Return true if the rwsem is owned by a reader.
>>    */
>> -static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>> +bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>>   {
>>   	/*
>>   	 * Check the count to see if it is write-locked.
>> @@ -205,7 +205,9 @@ static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>>   		return false;
>>   	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
>>   }
>> +#endif
>>   
>> +#ifdef CONFIG_DEBUG_RWSEMS
>>   /*
>>    * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
>>    * is a task pointer in owner of a reader-owned rwsem, it will be the
>> -- 
>> 2.49.0
>>
> 
> 

