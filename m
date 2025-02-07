Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5604E1D6182
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919701; cv=none; b=uaRaor9krrkB7vtf0JP6e/KPkPu2Z4I5gP6Y3RKrbg81ASXKn+1QV2jzGPGq0cPANBXVZCnJDxxnrharY0lOCUPyAKOzXpIqgEaeBbPUu/0vwYmkyKtOGUEbJM+CZ5DFujeFmuRanEpKX6IEQKqo+MyLbrOpXEOedCgRjr+M9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919701; c=relaxed/simple;
	bh=BXKRTbd2uzqXbRAcMyCShqiujkULwYhVPrFqKzf2ceo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMjHjXr2vYNhBo0SRf+GcD+yLczH7GVHwrgCMizkB1RGQnKGds/344U+9xg5biqr1f49WA1y38YKmWzxhB8xTMLL6Fmsy9oqS9HJZWNSzu24dZGhO1lIGe4aHf4PA1bGLZMp2OQJODIOChqyRQEDwo3nxKQsUSMyIrC1rwAlVWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E2DB1063;
	Fri,  7 Feb 2025 01:15:21 -0800 (PST)
Received: from [192.168.178.38] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F094B3F5A1;
	Fri,  7 Feb 2025 01:14:55 -0800 (PST)
Message-ID: <4a9cc5ab-c538-4427-8a7c-99cb317a283f@arm.com>
Date: Fri, 7 Feb 2025 10:14:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG Report: Fork benchmark drop by 30% on aarch64
To: Hagar Hemdan <hagarhem@amazon.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: wuchi <wuchi.zero@gmail.com>, linux-kernel@vger.kernel.org,
 Mohamed@amazon.com, Abuelfotoh@amazon.com, Hazem <abuehaze@amazon.com>
References: <20250205151026.13061-1-hagarhem@amazon.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250205151026.13061-1-hagarhem@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hagar,

On 05/02/2025 16:10, Hagar Hemdan wrote:
> Hi,
> 
> There is about a 30% drop in fork benchmark [1] on aarch64 and a 10%
> drop on x86_64 using kernel v6.13.1.
> 
> Git bisect pointed to commit eff6c8ce8d4d ("sched/core: Reduce cost
> of sched_move_task when config autogroup") which merged starting
> v6.4-rc1.
> 
> The regression only happens when number of CPUs is equal to number
> of threads [2] that fork test is creating which means it's only visible
> under CPU contention.
> 
> I used m6g.xlarge AWS EC2 Instance with 4 vCPUs and 16 GiB RAM for ARM64
> and m6a.xlarge with also 4 vCPUs and 16 GiB RAM for x86_64.
> 
> I noticed this regression exists only when autogroup config is enabled.

So '# CONFIG_SCHED_AUTOGROUP is not set' in .config so we have: 

static inline void sched_autogroup_exit_task(struct task_struct *p) { }

I.e. doing a 'echo 0 > /proc/sys/kernel/sched_autogroup_enabled' still
shows this issue?

> 
> Run the fork test with these combinations and autogroup is enabled:
> 
> Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
> ----------+---------------------+--------------------+------------------
> aarch64   | without             | 28677.0            |  3.2 us, 96.7 sy
> aarch64   | with                | 19860.7 (30% drop) |  2.7 us, 79.4 sy
> x86_64    | without             | 27776.2            |  3.1 us, 96.9 sy
> x86_64    | with                | 25020.6 (10% drop) |  4.1 us, 93.2 sy
> ----------+---------------------+--------------------+------------------

Can you rerun with:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3e5a6bf587f9..62cc50c79a78 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9057,7 +9057,7 @@ void sched_move_task(struct task_struct *tsk)
         * group changes.
         */
        group = sched_get_task_group(tsk);
-       if (group == tsk->sched_task_group)
+       if ((group == tsk->sched_task_group) && !(tsk->flags & PF_EXITING))
                return;

> 
> It seems that the commit is capping the amount of CPU resources that can
> be utilized leaving around 18% idle in case of aarch64 and 3% idle in
> x86_64 case which is likely the main reason behind the reported fork
> regression.
> 
> When autogroup is disabled:
> 
> Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
> ----------+---------------------+--------------------+------------------
> aarch64   | without             | 19877.8            |  2.2 us, 80.1 sy  
> aarch64   | with                | 20086.3 (~same)    |  1.9 us, 80.2 sy
> x86_64    | without             | 24974.2            |  4.9 us, 92.5 sy 
> x86_64    | with                | 24921.5 (~same)    |  4.9 us, 92.4 sy
> ----------+---------------------+--------------------+------------------
> 
> So when autogroup disabled, I still see the amount of idle CPU resources 
> 18%, 3% on aarch64 and x86_64 regardless of commit.
> 
> Is this performance drop an expected of this commit when autogroup is
> enabled?
> 
> Thanks,
> Hagar
> 
> [1] https://github.com/kdlucas/byte-unixbench/blob/master/UnixBench
> [2] Used command: ./Run -c 4 spawn
> 

