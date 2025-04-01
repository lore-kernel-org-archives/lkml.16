Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9A7B673
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496316; cv=none; b=bCOaBfw4QRYHet9om2xtO86hGuPzwGmE33HraJxbrpQFKQJorE5fYg22IqAo7l9CM0Uf8se+1ig8VNKgUPhEAddh1vDGNkRT0ml1olo6rmIwsl1NZAz/vojhR8PV923FTQYrRE8AmT9UffZh5MGI/5Rqtj+t0Qf9qbPsJnYB7ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496316; c=relaxed/simple;
	bh=seoJoeV4q+JPfatAYXDnQ97BmCiWFxxNWHxaEGXiEBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8pnGSGgoOxOo96et0q59nuJSZ36qGwmfSgL2bgsHA70m/Dna8LyN4B/U3k94Y9nQHfq5/EKrmwcQ4hDkbkzpfhzTnzMOYXu0narUgWUUQ4GlH429Vmx07q9edaP0sgXtGR3vFEOn+R5D3mMHBCg3oN9vasC6OOZ9uSRVBi2NHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD7214BF;
	Tue,  1 Apr 2025 01:31:57 -0700 (PDT)
Received: from [10.17.201.184] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E50183F63F;
	Tue,  1 Apr 2025 01:31:48 -0700 (PDT)
Message-ID: <8cbfd385-a950-4399-9241-bad84d357084@arm.com>
Date: Tue, 1 Apr 2025 10:31:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan94@gmail.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, qyousef@layalina.io,
 ke.wang@unisoc.com, di.shen@unisoc.com, linux-kernel@vger.kernel.org
References: <20250325014733.18405-1-xuewen.yan@unisoc.com>
 <03344e80-4ed2-41f1-9d2b-f7ed2e201eba@amd.com>
 <CAB8ipk_1=U_HgVQrfQ4VRUDrcHJBQd2LJ9aXh8PG6E-Z4_xS+g@mail.gmail.com>
 <d19cc24f-32a4-4d10-a51c-466476616e7d@amd.com>
 <CAB8ipk8WGLqbBfamqLcXtaHO-CEbZTXt51nCwHixOn6JVaRnyw@mail.gmail.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <CAB8ipk8WGLqbBfamqLcXtaHO-CEbZTXt51nCwHixOn6JVaRnyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 12:46, Xuewen Yan wrote:
> Hi Prateek,
> 
> On Wed, Mar 26, 2025 at 12:37 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> Hello Xuewen,
>>
>> On 3/26/2025 8:27 AM, Xuewen Yan wrote:
>>> Hi Prateek,
>>>
>>> On Wed, Mar 26, 2025 at 12:54 AM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>>>
>>>> Hello Xuewen,
>>>>
>>>> On 3/25/2025 7:17 AM, Xuewen Yan wrote:

[...]

>>>> If think cfs_rq_util_change() should be called for the root cfs_rq
>>>> when a task is delayed or when it is re-enqueued to re-evaluate
>>>> the uclamp constraints.
>>>
>>> I think you're referring to a different issue with the delayed-task's
>>> util_ets/uclamp.
>>> This issue is unrelated to util-est and uclamp, because even without
>>> these two features, the problem you're mentioning still exists.
>>> Specifically, if the delayed-task is not the root CFS task, the CPU
>>> frequency might not be updated in time when the delayed-task is
>>> enqueued.
>>> Maybe we could add the update_load_avg() in clear_delayed to solve the issue?
>>
>> I thought something like:
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index a0c4cd26ee07..007b0bb91529 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -5473,6 +5473,9 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>>                 if (sched_feat(DELAY_DEQUEUE) && delay &&
>>                     !entity_eligible(cfs_rq, se)) {
>>                         update_load_avg(cfs_rq, se, 0);
>> +                       /* Reevaluate frequency since uclamp may have changed */
>> +                       if (cfs_rq != rq->cfs)
>> +                               cfs_rq_util_change(rq->cfs, 0);
>>                         set_delayed(se);
>>                         return false;
>>                 }
>> @@ -6916,6 +6919,9 @@ requeue_delayed_entity(struct sched_entity *se)
>>         }
>>
>>         update_load_avg(cfs_rq, se, 0);
>> +       /* Reevaluate frequency since uclamp may have changed */
>> +       if (cfs_rq != rq->cfs)
>> +               cfs_rq_util_change(rq->cfs, 0);
>>         clear_delayed(se);
>>   }
>>
>> ---
>>
>> to ensure that schedutil knows about any changes in the uclamp
>> constraints at the first dequeue, at reenqueue.
> 
> Because of the decay of update_load_avg(), for a normal task with
> uclamp, it doesn't necessarily trigger frequency update when enqueued.
> If we want to enforce frequency scaling for requeued delayed-tasks,
> would it be possible to extend this change to trigger frequency update
> for all enqueued tasks?

But IMHO this is not what we want to achieve here? Instead, we want that
the uclamp values of a just enqueued p_1 with:

'p_1->se.sched_delayed && !(flags & ENQUEUE_DELAYED)'

possibly count in CPU frequency settings of p_2 via:

enqueue_entity(..., &p_2->se, ...) -> update_load_avg() ->
if(decayed)cfs_rq_util_change()

e.g. for shared frequency domain:

-> sugov_update_shared() -> sugov_next_freq_shared() -> sugov_get_util()
-> effective_cpu_util(...,  &min, &max)

uclamp is about applying the max value of all enqueued tasks.

[...]
