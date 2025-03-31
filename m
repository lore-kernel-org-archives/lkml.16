Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8C0524B0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417982; cv=none; b=IWtxGc574DwYSQWWEphjdeeyNPZnVG2tIzpzr+ajt6OqkSKNxBfFnAGVc3EZcGkXOoPAHcSOix0A/+7E9KJ6ulktJfGK/GgVMLX+AB7rtUptGKUmquEdbQjDlQmHEWaFrQcoh/vcRhnS8S2uXujJsR89K6Zq0eEdHd/aN5cF+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417982; c=relaxed/simple;
	bh=M556UEmzfL5UmqqucIfqwbUIS+OZWZu7lx22pUnBB04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfg695odrs4cVM0Ti4yZZ0ZWm4ZidMRpaUFoTGSSvcL0Y14mnALcChqr1JWgYk87MqpQKY2dDA01fKTN+LFm6TYQ88l1MX2otQdHewTR5dZnoXL87R4+Xu6ytEL/5AQ1NI8iZgmAk3+0XDlKvKOKsTzBXQRiU4dllatG85pxr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27FEA1F02;
	Mon, 31 Mar 2025 03:46:23 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2FC93F63F;
	Mon, 31 Mar 2025 03:46:17 -0700 (PDT)
Message-ID: <83876902-d53f-48b2-95d3-79add3373452@arm.com>
Date: Mon, 31 Mar 2025 12:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: Allow decaying util_est when util_avg > CPU
 capa
To: Pierre Gondois <pierre.gondois@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-kernel@vger.kernel.org, Chritian Loehle <christian.loehle@arm.com>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250325150542.1077344-1-pierre.gondois@arm.com>
 <CAKfTPtCfaH6SvBesbKBHRNfjZHJXXC1h4NF8GoFUczE5NiRunQ@mail.gmail.com>
 <3c21871b-4936-4143-bc78-38495a7995a6@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <3c21871b-4936-4143-bc78-38495a7995a6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 10:35, Pierre Gondois wrote:
>  
> 
> On 3/26/25 18:25, Vincent Guittot wrote:
>> On Tue, 25 Mar 2025 at 16:06, Pierre Gondois <pierre.gondois@arm.com>
>> wrote:
>>>
>>> commit 10a35e6812aa ("sched/pelt: Skip updating util_est when
>>> utilization is higher than CPU's capacity")
>>> prevents util_est from being updated if util_avg is higher than the
>>> underlying CPU capacity to avoid overestimating the task when the CPU
>>> is capped (due to thermal issue for instance). In this scenario, the
>>> task will miss its deadlines and start overlapping its wake-up events
>>> for instance. The task will appear as always running when the CPU is
>>> just not powerful enough to allow having a good estimation of the
>>> task.

This one will be removed by your patch, right?

>>>
>>> commit b8c96361402a ("sched/fair/util_est: Implement faster ramp-up
>>> EWMA on utilization increases")
>>> sets ewma to util_avg when ewma > util_avg, allowing ewma to quickly
>>> grow instead of slowly converge to the new util_avg value when a task
>>> profile changes from small to big.
>>>
>>> However, the 2 conditions:
>>> - Check util_avg against max CPU capacity

I assume this is the condition you remove and

>>> - Check whether util_est > util_avg

this is:

 4918 /*
 4919  * Reset EWMA on utilization increases, the moving average is used
 4920  * to smooth utilization decreases.
 4921  */
 4922  if (ewma <= dequeued) {
 4923      ewma = dequeued;
 4924      goto done;
 4925  }

which is before the condition you remove?

So maybe explain those conditions and their order more carefully? So
it's easier to grasp.

>>> are placed in an order such as it is possible to set util_est to a
>>> value higher than the CPU capacity if util_est > util_avg, but
>>> util_est is prevented to decay as long as:
>>> CPU capacity < util_avg < util_est.

Maybe mentioning 'util_avg eq. dequeued' and 'util_est eq. ewma' would
help here for easier understanding.

>>> Just remove the check as either:
>>> 1.
>>> There is idle time on the CPU. In that case the util_avg value of the
>>> task is actually correct. It is possible that the task missed a
>>> deadline and appears bigger, but this is also the case when the
>>> util_avg of the task is lower than the maximum CPU capacity.
>>> 2.
>>> There is no idle time. In that case, the util_avg value might aswell
>>> be an under estimation of the size of the task.
>>> It is possible that undesired frequency spikes will appear when the
>>> task is later enqueued with an inflated util_est value, but the
>>> frequency spike might aswell be deserved. The absence of idle time
>>> prevents from drawing any conclusion.
>>>
>>> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>>
>> This change looks reasonable to me. Did you face problems related to
>> this in a particular use case ?
> 
> I think it was more related to the fact util_est is not decayed when:
> (runnable - util_avg) > margin
> 
> This patch slightly helps to decay, but not that much.

Some of the 'stress-ng --class scheduler' seem to be be sensitive in
this regard. Haven't looked deeper into this.

[...]

