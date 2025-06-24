Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A382561D4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750728; cv=none; b=Lo7N4bJJTaHMcg09Rp6KJMtU6swQ4Pw8PoMw/X8ry3XXyKVeVeQV7QW1Jaf7mC6vGl3j0CTRTQXfYOGX1EqLWW17pqFHU0dkBt654ZfSgdyt4BvochjmX+vqFN626uY+gPxyt+Fd27KqknonIp6+mwAGJnVldS42ZU7x98nF1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750728; c=relaxed/simple;
	bh=pl9/MhRBFKaI4Lq/rj9m9wr3aN3l+VUytLY9tp89AUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+kP5Cm8n6s5cwMMdpyfYY+Qqt0k6rL7QGz1SKXExXtQVUhNFypDDr3JdGQWN2gWjXH0rjtGKBfjgYRg7JMz6ncYmQMuVhfrFLDS8NonXgHmeMhF0+w69/YAze02/0B8ildUl46qWUaxMp/sS87V7lREquede6qmf8UxNGJjltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w46vippP; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w46vippP"
Message-ID: <8542eb9f-3b9f-4441-9007-eb281fb47c56@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750750723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AageTvrZJxOa6aEU54Hw5wokm0myPC9m7kXfV5GMm84=;
	b=w46vippPbfAHmdVbCrZekcHK4A6LAADE8GSuiVYc4n+WI5zSxAR/PgtTS8xrdA8tMxUnC4
	N5m48JDOMaALFgJCkgrjwvrViqz3l0RHnByutOol5b8sAgiaBLSYyOZj9fXIZQM6ZlvDLQ
	pZA7BiFHv0aHPqiFtYc58FzhFpLLUDA=
Date: Tue, 24 Jun 2025 15:38:33 +0800
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
 <21ef5892-afdf-491e-937f-7821cac63d16@linux.dev>
 <20250624125358.25a7d4cd5ea02ea0bbe373a6@kernel.org>
 <a8e1f5b5-90a2-4738-821b-afce9ca59df8@linux.dev>
 <20250624151346.819475ac122175afa8535aa0@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250624151346.819475ac122175afa8535aa0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/24 14:13, Masami Hiramatsu (Google) wrote:
> On Tue, 24 Jun 2025 13:02:31 +0800
> Lance Yang <lance.yang@linux.dev> wrote:
> 
>>
>>
>> On 2025/6/24 11:53, Masami Hiramatsu (Google) wrote:
>>> On Tue, 24 Jun 2025 09:44:55 +0800
>>> Lance Yang <lance.yang@linux.dev> wrote:
>>>
>>>>
>>>>
>>>> On 2025/6/24 08:26, Masami Hiramatsu (Google) wrote:
>>>>> On Thu, 12 Jun 2025 12:19:25 +0800
>>>>> Lance Yang <ioworker0@gmail.com> wrote:
>>>>>
>>>>>> From: Lance Yang <lance.yang@linux.dev>
>>>>>>
>>>>>> When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
>>>>>> reader-owned rwsem can lead to false positives in blocker tracking.
>>>>>>
>>>>>> To mitigate this, let’s try to clear the owner field on unlock, as a NULL
>>>>>> owner is better than a stale one for diagnostics.
>>>>>
>>>>> Can we merge this to [PATCH 1/3]? It seems that you removed #ifdef and
>>>>> remove it. This means in anyway we need the feature enabled by DEBUG_RWSEMS.
>>>>
>>>> Thanks for the feedback! I see your point about the dependency ;)
>>>>
>>>> Personlly, I'd perfer to keep them separate. The reasoning is that
>>>> they addreess two distinct things, and I think splitting them makes
>>>> this series clearer and easier to review ;)
>>>>
>>>> Patch #1 focuses on "ownership tracking": Its only job is to make
>>>> the existing owner-related helpers (rwsem_owner(), is_rwsem_reader_owned())
>>>> globally available when blocker tracking is enabled.
>>>>
>>>> Patch #2, on the other hand, is about "reader-owner cleanup": It
>>>> introduces a functional change to the unlock path, trying to clear
>>>> the owner field for reader-owned rwsems.
>>>
>>> But without clearing the owner, the owner information can be
>>> broken, right? Since CONFIG_DEBUG_RWSEMS is working as it is,
>>
>> You're right, the owner info would be broken without the cleanup logic
>> in patch #2. But ...
>>
>>> I think those cannot be decoupled. For example, comparing the
>>> result of both DETECT_HUNG_TASK_BLOCKER and DEBUG_RWSEMS are
>>> enabled and only DETECT_HUNG_TASK_BLOCKER is enabled, the
>>> result is different.
>>
>> The actual blocker tracking for rwsems is only turned on in patch #3.
>> So, there's no case where the feature is active without the cleanup
>> logic already being in place.
>>
>>>
>>>>
>>>> Does this reasoning make sense to you?
>>>
>>> Sorry, no. I think "reader-owner cleanup" is a part of "ownership
>>> tracking" as DEBUG_RWSEMS does (and that keeps consistency of
>>> the ownership tracking behavior same as DEBUG_RWSEM).
>>
>> I thought this step-by-step approach was a bit cleaner, since there are
>> currently only two users for these owner helpers (DEBUG_RWSEMS and
>> DETECT_HUNG_TASK_BLOCKER).
> 
> I think the step-by-step approach fits better if the feature is evolving
> (a working feature is already there.) I don't like the intermediate

Agreed.

> state which does not work correctly, because if we have a unit test(
> like kUnit) it should fail. If you can say "this finds the rwsem

Ah, I missed that ...

> owner as same as what the CONFIG_DEBUG_RWSEM is doing", it is simpler
> to explain what you are doing, and easy to understand.

Thanks for the lesson! Will rework the series as you suggested ;)
Lance
