Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561E427726
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417215; cv=none; b=BvocOproTV0yJ5bPCJBc//pKjpgagHmlPPtodW3//n+DxwZXVvhLm4Twi+SmkDN+IXhCG8WN2iabIow02PaLHMDZGNodCPikgDilLT/1Sz4iU18IHJxbNWJ8y7yiTXtVfyyBF+Sr37C3K5f6Mzro0ziaBSK6nLPwR1ZnTw4ADHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417215; c=relaxed/simple;
	bh=YbneYaTomW9dZSD5vTT9pDDz1x90pUmjETImdeKO5/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlCxUhmU7Mpuz0e4quOJ3ImuTKh/ib5WNE9LRqf/qsX+5uADRvshlyw0dw/wuWiZK1r+D4bAA5NRbVlhm/XYLKpLo1oTA/52QojJMU+rksphgfp72tLg8rOpns5d5QLTxJb2TswNfVw4pMBahJFtv/vKrAUUbcAOgxxos6FnQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CEDF1F02;
	Mon, 31 Mar 2025 03:33:37 -0700 (PDT)
Received: from [10.57.40.234] (unknown [10.57.40.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201F13F63F;
	Mon, 31 Mar 2025 03:33:31 -0700 (PDT)
Message-ID: <48408728-f062-46f8-867f-61c6d91d410d@arm.com>
Date: Mon, 31 Mar 2025 11:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET v6 0/4] Split iowait into two states
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, tglx@linutronix.de,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240819154259.215504-1-axboe@kernel.dk>
 <8380f7f3-fd9f-45a0-b66b-85ec0b5d0144@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <8380f7f3-fd9f-45a0-b66b-85ec0b5d0144@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/31/25 10:02, Pavel Begunkov wrote:
> On 8/19/24 16:39, Jens Axboe wrote:
>> Hi,
>>
>> This is v6 of the patchset where the current in_iowait state is split
>> into two parts:
>>
>> 1) The "task is sleeping waiting on IO", and would like cpufreq goodness
>>     in terms of sleep and wakeup latencies.
>> 2) The above, and also accounted as such in the iowait stats.
>>
>> The current ->in_iowait covers both, this series splits it into two types
>> of state so that each can be controlled seperately.
>>
>> Patches 1..3 are prep patches, changing the type of
>> task_struct->nr_iowait and adding helpers to manipulate the iowait counts.
>>
>> Patch 4 does the actual splitting.
>>
>> This has been sitting for a while, would be nice to get this queued up
>> for 6.12. Comments welcome!
> 
> Good day,
> 
> Did anything good happened with these patches or related work?
> Christian> 

Hi Pavel,
so for cpuidle part we've had commit ("38f83090f515 cpuidle: menu: Remove iowait influence")
for a while now without much complaints, hopefully that means it stays in.
So I'd really like to know how the results still compare for relevant workloads.

cpufreq iowait boosting is still a thing in schedutil and intel_pstate,
and so far I've failed to convince Rafael and Peter to get rid of it.
I still think that is the right thing to do, but it does come with a
regression in most of the simple synthetic fio tests.

> Reminder: the goal is to let io_uring to keep using iowait boosting
> but avoid reporting it in the iowait stats, because the jump in the
> stat spooks users. I know at least several users carrying out of tree
> patches to work it around. And, apparently, disabling the boosting
> causes perf regressions.

Details would be appreciated, I looked the the postgres workload that
justified it initially and that was on cpuidle iowait which is no
longer a thing.

> 
> I'm reading through the thread, but unless I missed something, it looks
> like the patchset is actually aligned with future plans on iowait
> mentioned in the thread, in a sense that it reduces the exposure to
> the user space, and, when it's time, a better approach will be able
> replaces it with no visible effect to the user.

I'm not against $subject necessarily, it's clearly a hack tapering
over this but as I've mentioned I'm fine carrying a revert of $subject
for a future series on iowait boosting.

> 
> On the other hand, there seems to be a work around io_uring patch
> queued for, which I quite dislike from io_uring perspective but also
> because it exposes even more of iowait to the user.
> I can understand why it's there, it has been over a year since v1,
> but maybe we can figure something out before it's released? Would
> it be fine to have something similar to this series? Any other
> ideas?

Ah thank you, I've missed this
https://lore.kernel.org/io-uring/f548f142-d6f3-46d8-9c58-6cf595c968fb@kernel.dk/
Would be nice if this lead to more numbers comparing the two at least.

