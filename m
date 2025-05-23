Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBDB224243
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003239; cv=none; b=d5IT8tsf4rc5Hi9sHtdE9HzI44RUuMZkdW9lGbkjCqZHdZTsyMjN0/yrnaPQ0nrwmBa8nkRA0kPhUHukH0Slei/yWkA1zPWo09hcsqF2KIjPapUHUiLqVvosnsspli0EjUU1EUKVDBEjwpA+rBWvZEgC9B/Ys7QhZLX5cpXxchI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003239; c=relaxed/simple;
	bh=UgH+/sT/9jy9eqQZ1vqif/tZKIQiQ2BNNLOPYyd07uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUcWFHhG4DkTJQgnEOhPjHOsZlWMY41gI+XH549v9PwRxpGgPL2M6HH++iPAFPheLSXNtEYnGg8JMmWO3gBJ3t61FFVdefS7OF/2b1vnZjyN4rPWLXsFmGcgNa1KdVmUm7FBOXhBls90571/lNUNZga6/euT8RfLRB5J4wQ/VDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC56B1764;
	Fri, 23 May 2025 05:26:54 -0700 (PDT)
Received: from [192.168.2.98] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E98A3F5A1;
	Fri, 23 May 2025 05:27:07 -0700 (PDT)
Message-ID: <91ff65f4-c31e-4681-95b0-5a9ed81ec656@arm.com>
Date: Fri, 23 May 2025 14:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
 Juri Lelli <juri.lelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 hannes@cmpxchg.org
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <20250521145447.GA31726@noisy.programming.kicks-ass.net>
 <20250522084844.GC31726@noisy.programming.kicks-ass.net>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250522084844.GC31726@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 10:48, Peter Zijlstra wrote:
> On Wed, May 21, 2025 at 04:54:47PM +0200, Peter Zijlstra wrote:
>> On Tue, May 20, 2025 at 09:38:31PM +0200, Peter Zijlstra wrote:
>>> On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
>>>
>>>> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
>>>>
>>>> With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
>>>> 4 times per task switch in my setup) in:
>>>>
>>>> __schedule() -> psi_sched_switch() -> psi_task_switch() ->
>>>> psi_group_change().
>>>>
>>>> There seems to be another/other v6.12 related patch(es) later which
>>>> cause(s) another 4% regression I yet have to discover.
>>>
>>> Urgh, let me add this to the pile to look at. Thanks!
>>
>> Does something like the compile tested only hackery below work?
> 
> possibly better hackery :-)

Ah OK, moving the seqlock protection outside of the single CPU clock read.

schbench number is up again ~9% with 'tip sched/core' on this VM thanks
to this single CPU clock read per task switch.

Doesn't show a big effect on AWS' 'hammerdb-mysqld' repro-collection
test though. (only 0.5% on NOPM (New Operations Per Minue)) even though
mysqld threads are running in '/system.slice/mysql.service'.

schbench is way more aggressive on task switch.

[...]
