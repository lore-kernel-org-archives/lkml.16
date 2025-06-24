Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3723741
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729518; cv=none; b=ZkwKY7+GJmcf5hNxuDi/cUkmETHjIGIu/Mhf+2bWLc2ycYDdDGSWdtVRI6zDavDA9JgfsCsIgpsDB0DAh9hhQJgrTVExYgpICci0wL5GOoAM+Atk43EZEtZndZNa8zM4AXh5at18/IJ2GiihLspt2NSbW+xdj1w6WBY/uH8FfQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729518; c=relaxed/simple;
	bh=qptuB39aITaXbyUpwcx40C6fX9AbMYH1LXUzHZFpnS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRlDo4w7g9myw4p/U6/rw8AVcAMxVMtCGeRT1n6QGeEpwJg6IcUmwfG3NHx3Bw7VX/yvNtNVUJ8FRyvQW7K8n+a7vE4iAHJ7LDQYcHI5es2w4k/VMLbeawFO2BmwzO4ay/BXM8lIVvRLePUE4EpZvGj9VhyLOyun3vo5hKI8Ctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X1vckY1o; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X1vckY1o"
Message-ID: <21ef5892-afdf-491e-937f-7821cac63d16@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750729512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2CJ+wfy+ADMRsXsRkLArunoDUBo8vuqozYwhppCtkg=;
	b=X1vckY1ognrcET8EIXRDVMQt/IGOaH6G9TqeDMBd/lkvOhc6r9Kq1/BaTBYh36SrJG/qHE
	eA0Ls4HKpIlFWDzwIEQNH5ovgVQQ1LFvb7M1rVt9GsSSfZN7F6WVnYXqIuIaSWEjuo87p+
	GwnKzMaO5NVI4fBp7gyXxdn+YXx5joI=
Date: Tue, 24 Jun 2025 09:44:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 2/3] locking/rwsem: clear reader-owner on unlock to
 reduce false positives
Content-Language: en-US
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com,
 kent.overstreet@linux.dev, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, longman@redhat.com, mingo@redhat.com,
 mingzhe.yang@ly.com, peterz@infradead.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, will@kernel.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250612042005.99602-1-lance.yang@linux.dev>
 <20250612042005.99602-3-lance.yang@linux.dev>
 <20250624092620.3346ac39e882434aafb0b93d@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250624092620.3346ac39e882434aafb0b93d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/24 08:26, Masami Hiramatsu (Google) wrote:
> On Thu, 12 Jun 2025 12:19:25 +0800
> Lance Yang <ioworker0@gmail.com> wrote:
> 
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
>> reader-owned rwsem can lead to false positives in blocker tracking.
>>
>> To mitigate this, let’s try to clear the owner field on unlock, as a NULL
>> owner is better than a stale one for diagnostics.
> 
> Can we merge this to [PATCH 1/3]? It seems that you removed #ifdef and
> remove it. This means in anyway we need the feature enabled by DEBUG_RWSEMS.

Thanks for the feedback! I see your point about the dependency ;)

Personlly, I'd perfer to keep them separate. The reasoning is that
they addreess two distinct things, and I think splitting them makes
this series clearer and easier to review ;)

Patch #1 focuses on "ownership tracking": Its only job is to make
the existing owner-related helpers (rwsem_owner(), is_rwsem_reader_owned())
globally available when blocker tracking is enabled.

Patch #2, on the other hand, is about "reader-owner cleanup": It
introduces a functional change to the unlock path, trying to clear
the owner field for reader-owned rwsems.

Does this reasoning make sense to you?

Thanks,
Lance

> 
> Thanks,
> 
>>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>>   kernel/locking/rwsem.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
>> index 6cb29442d4fc..a310eb9896de 100644
>> --- a/kernel/locking/rwsem.c
>> +++ b/kernel/locking/rwsem.c
>> @@ -205,14 +205,12 @@ bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>>   		return false;
>>   	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
>>   }
>> -#endif
>>   
>> -#ifdef CONFIG_DEBUG_RWSEMS
>>   /*
>> - * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
>> - * is a task pointer in owner of a reader-owned rwsem, it will be the
>> - * real owner or one of the real owners. The only exception is when the
>> - * unlock is done by up_read_non_owner().
>> + * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
>> + * it will make sure that the owner field of a reader-owned rwsem either
>> + * points to a real reader-owner(s) or gets cleared. The only exception is
>> + * when the unlock is done by up_read_non_owner().
>>    */
>>   static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
>>   {
>> -- 
>> 2.49.0
>>
> 
> 

