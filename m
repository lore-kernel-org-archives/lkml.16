Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0C6FC5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745555380; cv=none; b=tG0QXbiIwnF7BAJbEpNMIKYTXC30llTQiY8NgASaj/Da3rcTT3yY3cWNWXjOreLdYNu02QKUadgtuuSn5btZ4hf4UUeA/FcL8YeOU8Fy9nKA7AlVu0+lFqsN3tuimU3tAGanh1iys5halzEWSC0CJMoqbLyTW8OwvwDEjiZkU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745555380; c=relaxed/simple;
	bh=xzHyQMpD9Cbn3KDk1+nVWh1FvG3o4BnPTfv86yXrcv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YO/FxgIGStbqC4USJOhEjIcqeuQsgTYHqBpQalACtyJwuusySSEs5iqr5eZQzsB/+PaSdjNRVgCuH3e88ZrVztsxNFh2IfPJwlCy8zE4wDZdzNxfIkMwSbSiGXZX+y+qNb4wGn02P1/8BqZrtlsTtnVQDRQX/wCJBoLQh6b5slM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZDDzzvP9; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZDDzzvP9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NjMHbgJx3NlwVi0+1Qz0ruUuuWzu7R5cYPb3a+PEb6A=; b=ZDDzzvP9ux0VgLpexgbo4jt1Nk
	eBo4T9agI6YrsXxD+ZnEbOhpL7kWm47cQoNqOA1uI6rVxQ+ZnyvN1gI9MfPYwmA6vbbm+HpS8DbMN
	SZjVptf/TkEq8B40ehfJMVR7ACbT3EqqVTRmgrf5eXeNqEyvR6YOCIzTXbIdq14lQFV4K7ypJn81w
	YW38LP7Cbr4FcSE/s60dFxvTLfc0FL9h9B9FmRDNcdP8ApdYws/TX4rUAX9/5DRVaKu1Xb1SsWMX+
	r/cOOZldwqzClWvRr6p1cw5FkYLE6KjM0b1wMN7H5D8/fPaksx3D4F6sVfVHQiEq6pST2LJR997Mx
	HamYkhtw==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u8Aga-0089Hg-QY; Fri, 25 Apr 2025 06:29:13 +0200
Message-ID: <d8a9cd78-77af-434b-a373-cdcb189302c8@igalia.com>
Date: Fri, 25 Apr 2025 13:29:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched_ext: Clarify CPU context for running/stopping
 callbacks
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Jake Hillion <jake@hillion.co.uk>, linux-kernel@vger.kernel.org
References: <20250423210205.281689-1-arighi@nvidia.com>
 <a7ea9c40-77d8-41dc-aed8-9df66dc8c110@igalia.com> <aAnLiQ-B2-5ufJ-o@gpd3>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <aAnLiQ-B2-5ufJ-o@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 4/24/25 14:26, Andrea Righi wrote:
> Hi Changwoo,
> 
> On Thu, Apr 24, 2025 at 08:06:47AM +0900, Changwoo Min wrote:
>> Hi Andrea,
>>
>> On 4/24/25 06:02, Andrea Righi wrote:
>>> The ops.running() and ops.stopping() callbacks can be invoked from a CPU
>>> other than the one the task is assigned to, particularly when a task
>>> property is changed, as both scx_next_task_scx() and dequeue_task_scx() may
>>> run on CPUs different from the task's target CPU.
>>
>> The same goes to ops.quiescent() too since ops.quiescent() is also
>> called from dequeue_task_scx().
> 
> Yeah, I was a bit conflicted about mentioning this for ops.runnable() and
> ops.quiescent() as well, since it's more obvious in those cases that
> they're executed outside the context of the "current CPU", since the task
> isn't running on any CPU yet, or it's no longer running. In the end, I
> decided to update only ops.running() and ops.stopping(), where it's less
> clear that the task's CPU may not match the current CPU.

That makes sense. Thanks for the clarification!

-- Changwoo

> 
> Thanks for taking a look!
> -Andrea
> 
>>
>> Reviewed-by: Changwoo Min <changwoo@igalia.com>
>>
>> Regards,
>> Changwoo Min
>>
>>>
>>> This behavior can lead to confusion or incorrect assumptions if not
>>> properly clarified, potentially resulting in bugs (see [1]).
>>>
>>> Therefore, update the documentation to clarify this aspect and advise
>>> users to use scx_bpf_task_cpu() to determine the actual CPU the task
>>> will run on or was running on.
>>>
>>> [1] https://github.com/sched-ext/scx/pull/1728
>>>
>>> Cc: Jake Hillion <jake@hillion.co.uk>
>>> Cc: Changwoo Min <changwoo@igalia.com>
>>> Signed-off-by: Andrea Righi <arighi@nvidia.com>
>>> ---
>>>    kernel/sched/ext.c | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> Changes in v2:
>>>    - clarify the scenario a bit more in the code comments
>>>    - link to v1: https://lore.kernel.org/all/20250423190059.270236-1-arighi@nvidia.com/
>>>
>>> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
>>> index ac79067dc87e6..a83232a032aa4 100644
>>> --- a/kernel/sched/ext.c
>>> +++ b/kernel/sched/ext.c
>>> @@ -368,6 +368,15 @@ struct sched_ext_ops {
>>>    	 * @running: A task is starting to run on its associated CPU
>>>    	 * @p: task starting to run
>>>    	 *
>>> +	 * Note that this callback may be called from a CPU other than the
>>> +	 * one the task is going to run on. This can happen when a task
>>> +	 * property is changed (i.e., affinity), since scx_next_task_scx(),
>>> +	 * which triggers this callback, may run on a CPU different from
>>> +	 * the task's assigned CPU.
>>> +	 *
>>> +	 * Therefore, always use scx_bpf_task_cpu(@p) to determine the
>>> +	 * target CPU the task is going to use.
>>> +	 *
>>>    	 * See ->runnable() for explanation on the task state notifiers.
>>>    	 */
>>>    	void (*running)(struct task_struct *p);
>>> @@ -377,6 +386,15 @@ struct sched_ext_ops {
>>>    	 * @p: task stopping to run
>>>    	 * @runnable: is task @p still runnable?
>>>    	 *
>>> +	 * Note that this callback may be called from a CPU other than the
>>> +	 * one the task was running on. This can happen when a task
>>> +	 * property is changed (i.e., affinity), since dequeue_task_scx(),
>>> +	 * which triggers this callback, may run on a CPU different from
>>> +	 * the task's assigned CPU.
>>> +	 *
>>> +	 * Therefore, always use scx_bpf_task_cpu(@p) to retrieve the CPU
>>> +	 * the task was running on.
>>> +	 *
>>>    	 * See ->runnable() for explanation on the task state notifiers. If
>>>    	 * !@runnable, ->quiescent() will be invoked after this operation
>>>    	 * returns.
>>
> 

