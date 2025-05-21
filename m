Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5178E4A3C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835974; cv=none; b=lIu9LYVdRRIDxdNoiIYvMzUlfDhSEuBVdBmT8k92AnNTc7DhzdmMCKCqfIwt8RlauGQAh/2CBMZMQdIgQ/PdhvmAHGzeRVf2+owgay7gIyclueTN/G2/VfJWj3JuAIEGx6JzKPj/GdACDu4e39/FJFUJLLyl/jRKXwdL1XZrA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835974; c=relaxed/simple;
	bh=te5jLmEzSC9SZtYaAF1oudZg4TTUhQShPQuQBVCLtdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsUNh5F+PTd8BwjrljaZtN8dCLbSs5jaJQVKXvxRngiR4Zuot2zKGY2koiQA8NnED7GYtGe8UNalQkoyxaM7jhLxGpjrbnWUZvKbApu28khrKkPcgdyBDjerRgwjrlfpX/Hz56zlYHTj2mRiv+Ni11QOeIqw4FoTN4S9JzhTW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB4011515;
	Wed, 21 May 2025 06:59:17 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6581F3F5A1;
	Wed, 21 May 2025 06:59:30 -0700 (PDT)
Message-ID: <d1002060-a1e4-4c47-aeb4-d8af0744267a@arm.com>
Date: Wed, 21 May 2025 15:59:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Chris Mason <clm@meta.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <23576497-af63-4074-8724-d75d0dca1817@meta.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <23576497-af63-4074-8724-d75d0dca1817@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 16:53, Chris Mason wrote:
> On 5/20/25 10:38 AM, Dietmar Eggemann wrote:
>> On 16/05/2025 12:18, Peter Zijlstra wrote:
>>> On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:

[...]

>> I can't spot any v6.11 related changes (dl_server or TTWU_QUEUE) but a
>> PSI related one for v6.12 results in a ~8% schbench regression.
>>
>> VM (m7gd.16xlarge, 16 logical CPUs) on Graviton3:
>>
>> schbench -L -m 4 -M auto -t 128 -n 0 -r 60
>>
>> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> 
> I also saw a regression on this one, but it wasn't stable enough for me
> to be sure.  I'll retest, but I'm guessing this is made worse by the VM
> / graviton setup?

For me the 8% regression here is pretty stable. I have to add that I ran
schbench in:

  /sys/fs/cgroup/user.slice/user-1000.slice/session-33.scope

So that explains IMHO the 4 calls to psi_group_change() from
psi_task_switch() now doing all their own 'now = cpu_clock(cpu)' call.

schbench-6509    [004] d....   689.050466: psi_task_switch: CPU4 [schbench 6509] -> [schbench 6514] ->
schbench-6509    [004] d....   689.050466: psi_group_change: CPU4 now=689050466118
schbench-6509    [004] d....   689.050467: psi_group_change: CPU4 now=689050466537
schbench-6509    [004] d....   689.050467: psi_group_change: CPU4 now=689050466950
schbench-6509    [004] d....   689.050468: psi_group_change: CPU4 now=689050467838
schbench-6509    [004] d....   689.050468: psi_task_switch: CPU4 [schbench 6509] -> [schbench 6514] <-
 
> I've been testing Peter's changes, and they do help on my skylake box
> but not as much on the big turin machines.  I'm trying to sort that out,

Turin vs. SKL,SPR ?

> but we have some other variables wrt PGO/LTO that I need to rule out.

OK, thanks! We also started testing this on Arm64 server with +20 cores ...

[...]
