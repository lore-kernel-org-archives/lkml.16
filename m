Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E950E26BD8E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291271; cv=none; b=aZO7bhgMQlYAYlR63iepJ022x4Y4idyC04tS66D4oNWRPPi0r7sjzIyzU47LRFqhIZkzYj0V4mlPXb5QLvsjGgeFfE4JPfWXdoUU0pfAaW6vMDN9S/rN0qnAnzZ+cjb5Dvbf/Zc8pd2ZQtoDKQjTB+nOfPsad4S50BIZSWR9NFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291271; c=relaxed/simple;
	bh=m2vUGcn+byOSrLz9jG+8j49FJIZgquXxhQbsO1uzmWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oviURZ/ObezNZim+E7pjVErobxu1hNU18iE/D1e1YKpTSfCG186daKTGjgc1Og0eUAz0fiCUWuyUiMZDPOocYjma7Wciq9oS2XieHNdGofkBgKFehIQSX2gGTlqWhHJKrcu7qvitXNbuinfGKQZL9soQHnq8vysS2VggCaQJ730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F40813D5;
	Tue, 11 Feb 2025 08:28:10 -0800 (PST)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4D423F6A8;
	Tue, 11 Feb 2025 08:27:48 -0800 (PST)
Message-ID: <4b48fd24-6cd5-474c-bed8-3faac096fd58@arm.com>
Date: Tue, 11 Feb 2025 17:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG Report: Fork benchmark drop by 30% on aarch64
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: abuehaze@amazon.com, linux-kernel@vger.kernel.org
References: <20250205151026.13061-1-hagarhem@amazon.com>
 <4a9cc5ab-c538-4427-8a7c-99cb317a283f@arm.com>
 <20250207110754.GA10452@amazon.com>
 <1ca758c7-b6ab-4880-9cc7-217093a30bbb@arm.com>
 <20250210213155.GA649@amazon.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250210213155.GA649@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 22:31, Hagar Hemdan wrote:
> On Mon, Feb 10, 2025 at 11:38:51AM +0100, Dietmar Eggemann wrote:
>> On 07/02/2025 12:07, Hagar Hemdan wrote:
>>> On Fri, Feb 07, 2025 at 10:14:54AM +0100, Dietmar Eggemann wrote:
>>>> Hi Hagar,
>>>>
>>>> On 05/02/2025 16:10, Hagar Hemdan wrote:

[...]

>> The 'spawn' tasks in sched_move_task() are 'running' and 'queued' so we
>> call dequeue_task(), put_prev_task(), enqueue_task() and
>> set_next_task().
>>
>> I guess what we need here is the cfs_rq->avg.load_avg (cpu_load() in
>> case of root tg) update in:
>>
>>   task_change_group_fair() -> detach_task_cfs_rq() -> ...,
>>   attach_task_cfs_rq() -> ...
>>
>> since this is used for WF_FORK, WF_EXEC handling in wakeup:
>>
>>   select_task_rq_fair() -> sched_balance_find_dst_cpu() ->
>>   sched_balance_find_dst_group_cpu()
>>
>> in form of 'least_loaded_cpu' and 'load = cpu_load(cpu_rq(i)'.
>>
>> You mentioned AutoGroups (AG). I don't see this issue on my Debian 12
>> Juno-r0 Arm64 board. When I run w/ AG, 'group' is '/' and
>> 'tsk->sched_task_group' is '/autogroup-x' so the condition 'if (group ==
>> tsk->sched_task_group)' isn't true in sched_move_task(). If I disable AG
>> then they match "/" == "/".
>>
>> I assume you run Ubuntu on your AWS instances? What kind of
>> 'cgroup/taskgroup' related setup are you using?
> 
> I'm running AL2023 and use Vanilla kernel 6.13.1 on m6g.xlarge AWS instance.
> AL2023 uses cgroupv2 by default.
>>
>> Can you run w/ this debug snippet w/ and w/o AG enabled?
> 
> I have run that and have attached the trace files to this email.

Thanks!

So w/ AG you see that 'group' and 'tsk->sched_task_group' are both
'/user.slice/user-1000.slice/session-1.scope' so we bail for those tasks
w/o doing the 'cfs_rq->avg.load_avg' update I described above.

You said that there is no issue w/o AG. Unfortunately your 'w/o AG'
trace does not contain any evidence that you ran UnixBench's './Run -c 4
spawn' since there are no lines for tasks with p->comm='spawn'. Could
you rerun this please. My hunch is that 'group' and
'tsk->sched_task_group' differ w/o AG?

[...]
