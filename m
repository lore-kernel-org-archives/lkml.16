Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E169259C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412523; cv=none; b=A/iWVF7WscDExtt35tjZJAW929jPjSyeDMcbJtVQ7EqEjV6JpcZEHkjcAVexjewTizT+JSNJP106doeDoHheRqrOuK621vcmrbzHLV0dK06V9WXznqHigjgzOVZ3BmBCieVuk1sBAuU2vWh9eYbZA/njJ4g0LULYbLBeSOGtkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412523; c=relaxed/simple;
	bh=kuXGuwZLBAEvO3zrtZrXIH3dXjoHkCX2f+iTyQUest8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Csa0hEwd+9F83IODupYkEiEX/oCEWfAiDJa4nhmXTsnSC9RHcccZwTNn5oOTMCG5r0W/8WfV4uNK+UeegHCTPvqIhBgwO+q7ps9cgTuWSzrv0/uUGrXcahxWFFHi89V3V4P5d+3fCBVsn0owcD2LZp2DPeXI3Lvfx6yddH+p6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z1if2ENR; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z1if2ENR"
Message-ID: <08d75be1-e8e4-434e-a9d8-6a4503043872@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743412516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVIGD1+F33cfMPqMr31omIeVJR7X9HmYfzJAZ5aAg/k=;
	b=Z1if2ENRa8PC80bOfXWcpZ6ad4MbltSZUDFoV/8WQ1v1YScZF4Us1xdBchsWIm4K3siICm
	BBYx07NCY06Fv7htimQQHkKQ4Tp2Dv85gbXibNJ0hsm2ke4nJvYSJR/tXCTYtnutTTZ9up
	DlYMwgIFF594nTCYdScBddm7GeIEmqE=
Date: Mon, 31 Mar 2025 17:14:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 2/7] sched/fair: Handle throttle path for task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcFF7cnR4rCbU5MmY1Gq3M+r4gPXv39QPXXC=Cdr6sRww@mail.gmail.com>
 <58e0515a-ed67-4d1a-825f-bfc2b31d1d18@linux.dev>
 <20250314094249.GC1633113@bytedance>
 <a257205f-525f-48cf-b8d9-101ad8a95081@linux.dev>
 <20250331064204.GB1571554@bytedance>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250331064204.GB1571554@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/3/31 14:42, Aaron Lu wrote:
> Hi Chengming,
> 
> On Fri, Mar 14, 2025 at 07:07:10PM +0800, Chengming Zhou wrote:
>> On 2025/3/14 17:42, Aaron Lu wrote:
>>> On Fri, Mar 14, 2025 at 04:39:41PM +0800, Chengming Zhou wrote:
>>>> On 2025/3/13 15:21, Aaron Lu wrote:
>>>>> From: Valentin Schneider <vschneid@redhat.com>
>>>>>
>>>>> Once a cfs_rq gets throttled, for all tasks belonging to this cfs_rq,
>>>>> add a task work to them so that when those tasks return to user, the
>>>>> actual throttle/dequeue can happen.
>>>>>
>>>>> Note that since the throttle/dequeue always happens on a task basis when
>>>>> it returns to user, it's no longer necessary for check_cfs_rq_runtime()
>>>>> to return a value and pick_task_fair() acts differently according to that
>>>>> return value, so check_cfs_rq_runtime() is changed to not return a
>>>>> value.
>>>>
>>>> Previously with the per-cfs_rq throttling, we use update_curr() -> put() path
>>>> to throttle the cfs_rq and dequeue it from the cfs_rq tree.
>>>>
>>>> Now with your per-task throttling, maybe things can become simpler. That we
>>>> can just throttle_cfs_rq() (cfs_rq subtree) when curr accouting to mark these
>>>> throttled.
>>>
>>> Do I understand correctly that now in throttle_cfs_rq(), we just mark
>>> this hierarchy as throttled, but do not add any throttle work to these
>>> tasks in this hierarchy and leave the throttle work add job to pick
>>> time?
>>
>> Right, we can move throttle_cfs_rq() forward to the curr accouting time, which
>> just mark these throttled.
> 
> While preparing the next version, I found that if I move
> throttle_cfs_rq() to accounting time, like in __account_cfs_rq_runtime(),
> then it is possible on unthrottle path, the following can happen:
> unthrottle_cfs_rq() -> enqueue_task_fair() -> update_curr() ->
> account_cfs_rq_runtime() -> throttle_cfs_rq()...

Ah, right, then it's best to leave throttle_cfs_rq() where it is.

> 
> Initially I was confused why update_curr() can notice a non-null curr
> when this cfs_rq is being unthrottled but then I realized in this task
> based throttling model, it is possible some task woke up in that
> throttled cfs_rq and have cfs_rq->curr set and then cfs_rq gets
> unthrottled.
> 
> So I suppose I'll keep the existing way of marking a cfs_rq as
> throttled by calling check_cfs_rq_runtime() in the following two places:
> - in pick_task_fair(), so that the to-be-picked cfs_rq can be marked for
>    throttle;
> - in put_prev_entity() for prev runnable task's cfs_rq.
> 
>> And move setup_task_work() afterward to the pick task time, which make that task
>> dequeue when ret2user.
> 
> No problem for this part as far as my test goes :-)

Good to hear.

Thanks!

> 
> Thanks,
> Aaron
> 
>>>
>>>> Then then if we pick a task from a throttled cfs_rq subtree, we can setup task work
>>>> for it, so we don't botter with the delayed_dequeue task case that Prateek mentioned.
>>>
>>> If we add a check point in pick time, maybe we can also avoid the check
>>> in enqueue time. One thing I'm thinking is, for a task, it may be picked
>>> multiple times with only a single enqueue so if we do the check in pick,
>>> the overhead can be larger?
>>
>> As Prateek already mentioned, this check cost is negligeable.
>>
>>>
>>>> WDYT?
>>>
>>> Thanks for your suggestion. I'll try this approach and see how it turned
>>> out.
