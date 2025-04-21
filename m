Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6E1B6CE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221463; cv=none; b=BrcxT0scf+y5u67RschAYcMHaOy+rITHwoy5/iQNHDKCqMKTjVt8VK3XBFdixjAcPogyMGaH/dFOjfawRAmY4qD75zIVD6P1kC0hHZHYAo7MhOBbmIL2CItwlZAiExSceZz53e4Bfm8HMIcZPNWFjhCeh3Ae6afR2MrX2J2yIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221463; c=relaxed/simple;
	bh=eMzaVSCv1S7DGAGOZjBusxjVvrnTWVvabyy0nLdjemk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sooC9isZQkxM4KlENSDXIWqhJw6o+jD/yNLlGVB4StvdybtXn0RN95Dsl68uDnRne33C/gZhA6h/zwWHNo/922o0n41zVuAwcgua9njk9WOfnxB+lEtClbOfnhbxu/YtAyUGBkPzn/Ts3GDq4W5y5qkEEFFWTlQzkrA3rurasaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WEDZddmu; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WEDZddmu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wl4CUQDeaFJLEpVHz3lK13btixVelhRUKal3IH/ZXWY=; b=WEDZddmu10XSRTzPlOj1vUCnCm
	kccLJ/s4uOUc4bWx24qQ01PjGPKhxEmPzYhj2SfL8zwLPimPWv+up864FYmb0HhKbHY+0Is2LfzTi
	mqfi9nOqJgUfM/mcGR+D/K0kFFv0twHBySmR8xzdDinS4SCytrgA0wtOkhw/t48wS4S7g+g8cfnCZ
	wOdBG37fHnIeKT900LpPCgy+/3uVzue7Tnd/Djbks9Ouuj+UIMZtf69B7m36V2e7kwH1Z43OOZ+ff
	t+4Lrxo3Bpq8vwwLiP6aqjF5kM1CAs8q2+JnfOYIuE9jqdw0sizcwEk0EbKCC2UZ0nHRrqgNURPSH
	9CXLWJmQ==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u6lp0-005s1S-1Z; Mon, 21 Apr 2025 09:44:06 +0200
Message-ID: <32e5c7cb-5b41-4e02-81d4-5bbed981ab03@igalia.com>
Date: Mon, 21 Apr 2025 16:44:02 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched_ext: Fix missing rq lock in
 scx_bpf_cpuperf_set()
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>
Cc: linux-kernel@vger.kernel.org
References: <20250420193106.42533-1-arighi@nvidia.com>
 <20250420193106.42533-3-arighi@nvidia.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250420193106.42533-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

The patchset looks good to me. Thanks!
I have one comment, that don't need to be addressed in this patch set,
below:

Acked-by: Changwoo Min <changwoo@igalia.com>

On 4/21/25 04:30, Andrea Righi wrote:
> scx_bpf_cpuperf_set() can be used to set a performance target level on
> any CPU. However, it doesn't correctly acquire the corresponding rq
> lock, which may lead to unsafe behavior and trigger the following
> warning, due to the lockdep_assert_rq_held() check:
> 
> [   51.713737] WARNING: CPU: 3 PID: 3899 at kernel/sched/sched.h:1512 scx_bpf_cpuperf_set+0x1a0/0x1e0
> ...
> [   51.713836] Call trace:
> [   51.713837]  scx_bpf_cpuperf_set+0x1a0/0x1e0 (P)
> [   51.713839]  bpf_prog_62d35beb9301601f_bpfland_init+0x168/0x440
> [   51.713841]  bpf__sched_ext_ops_init+0x54/0x8c
> [   51.713843]  scx_ops_enable.constprop.0+0x2c0/0x10f0
> [   51.713845]  bpf_scx_reg+0x18/0x30
> [   51.713847]  bpf_struct_ops_link_create+0x154/0x1b0
> [   51.713849]  __sys_bpf+0x1934/0x22a0
> 
> Fix by properly acquiring the rq lock when possible or raising an error
> if we try to operate on a CPU that is not the one currently locked.
> 
> Fixes: d86adb4fc0655 ("sched_ext: Add cpuperf support")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>   kernel/sched/ext.c | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 51dad94f1952d..6b6681b14488e 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -7088,13 +7088,32 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
>   	}
>   
>   	if (ops_cpu_valid(cpu, NULL)) {
> -		struct rq *rq = cpu_rq(cpu);
> +		struct rq *rq = cpu_rq(cpu), *locked_rq = scx_locked_rq();
> +		struct rq_flags rf;
> +
> +		/*
> +		 * When called with an rq lock held, restrict the operation
> +		 * to the corresponding CPU to prevent ABBA deadlocks.
> +		 */
> +		if (locked_rq && rq != locked_rq) {
> +			scx_error("Invalid target CPU %d", cpu);
> +			return;
> +		}


Considering almost all chext_ext ops hold an rq lock, the actual ops
where scx_bpf_cpuperf_set() for a remote CPU is possible will be very
limited. When there are more use cases for remote CPU kfuncs calls, I
think we need to come up with some mechanism, for example, extending
schedule_deferred() to cover more actions.

> +
> +		/*
> +		 * If no rq lock is held, allow to operate on any CPU by
> +		 * acquiring the corresponding rq lock.
> +		 */
> +		if (!locked_rq) {
> +			rq_lock_irqsave(rq, &rf);
> +			update_rq_clock(rq);
> +		}
>   
>   		rq->scx.cpuperf_target = perf;
> +		cpufreq_update_util(rq, 0);
>   
> -		rcu_read_lock_sched_notrace();
> -		cpufreq_update_util(cpu_rq(cpu), 0);
> -		rcu_read_unlock_sched_notrace();
> +		if (!locked_rq)
> +			rq_unlock_irqrestore(rq, &rf);
>   	}
>   }
>   

