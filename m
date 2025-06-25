Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8501C861D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888557; cv=none; b=MnllwbEpKTYrSCllCdfUy6n4bdtntmhwOLz7ACjhP/BwmFmpbSyBlSisakBw33ZAPkiPhCixjCD1MinmGADNOPlXKhYTrwDXxQB8bCu1sLDe311gtnV6oKOblMtCGu0381z27kLd+6UaB58BAqL1IFyh6Bq0R2j30shW/Fa7tOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888557; c=relaxed/simple;
	bh=XzFUm4OhHzIgy3m0acdzwHSWcL93eh9YFKlH107yo40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvUJmcza7LhCknXWezH71xQIfu4MVzU5oMJ9BFVhOFugmEF1iudIuKaOrJ9W0+poH1pfyQByQTxAEAhZYEgQgzjtR+3ar1W9SLRa5cIS11pOXrfm/5x6R3R0buOkai2aYABy6Kxeba7klwQb5EbPdGRixmryAy7R5NJnkNq0H+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxxI1u+4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxxI1u+4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-237311f5a54so4248035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750888556; x=1751493356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LGxtwTUiUZfmjCFavT0wpko1sgth32s7AXdMmiF+7c=;
        b=HxxI1u+4cvZXHCkjqYCVXcSMgvqF9WqB9dCEmKHNTtb3HoQQu4Tj/B+a6F24Zxo7yM
         0ItPNDqSkA5gMr/8zv+q/6em8tOBH13ARr6VZOkZx2N1kZFX5J8KxzKTIMOuV20t4duW
         jSp002aQuuErbL0C/PcYoSHSquZp4tyoLezFvFfTPAZqIYE+qmUlH4zm5Pg1SBVrbqkR
         Vdn7MfHocpJ72EjPqp8yIFtlRxf9F+OX62XkwPVAnoxwIAcx9Bj1OLk6vVVFgRFOBBAZ
         MrwiOPzjGr1d/8iWdHYHDm2RQiz9W01jOaRLQ98zSmhII5kF0bVvHbtWTpZ8sHEJQCTo
         T+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750888556; x=1751493356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LGxtwTUiUZfmjCFavT0wpko1sgth32s7AXdMmiF+7c=;
        b=tr8p+6iGpqpNfUcLDi7IzpNSsAZgO2MLbkbzeuw/V5VqHAyyaGjvikIwL7jAfmfM/j
         7m5j/c3146PzrjdexLP9m58bCl9/6XkWs+o3xjaj78/cj95+ML+XJWoEyHb6nhh6V9ol
         VQj2ndA3GIo1xrHj1XGVi+V3OKtefYivu+LCwz8cgE5g9lkE/TEb39P7XPo739ph0b6V
         2IfS1LQpiGWFYaOhVK07O3boo1BO5Qji42CO3er7t5vv0JDNz2YUVg4+VJxwON597zW6
         sqvWN5gMOyDbhNX+Aj8GAHibDvn2KspXoadcpBXcUxHqM8FFqUj7IVC14SKAh2p9tycX
         1RjA==
X-Forwarded-Encrypted: i=1; AJvYcCWTCxLhcc2FvuzAcy+vJJEMtB49CebCs7D2mQO0BY0ItdHatfl1VQqZFsV8ZJYaWQZ6s7tpTlVxYtH7MXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXO7Y1O9hAi6GKenvblsixY4EaKS7Rp75X09gZsIuf5Z8/4SHV
	eULu3PWgbCZUqTreDtKSCZfST82xzkaTrjiOKHO48FQQu+kRU53xxWi3
X-Gm-Gg: ASbGncsFqIeRldcQqJfx/6oRmbIS44xqoaZMho9diPwRS/Pw66BX2cusx6F7501Nhp+
	Zh9YvcX/KYM79DpXlpfLr9Uu3I31ZjRJdslTx+CbwzCWlmpNN81xRIq0cIZvtzBT9U4JTaiEwTo
	bs3Hc67TApd7/p/aXzSnufWGAyGWyaQuhv+2SDaMgAYMMe8HD+AFiGnTMj+3hSjU5GvKsC3EGLP
	3LeqHRdsC69werdN4RsHIAAXW6A/DB5jhF5XxRf6RUTaA3xbSy8WbRQIC1D73AiMS8nvTZEdxrz
	uOxO2rEVasumptZvygyyX/9I0xf5P/t1uZhMV7eEGwF4G92o+3wKS07gSQfQkQ==
X-Google-Smtp-Source: AGHT+IEDI1YLUnjAmW35bzf+fq8eaKiorLa2kacWkfWatUza7rGvC8Y97Bnyyayyvde212EU8qgskw==
X-Received: by 2002:a17:902:d58c:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23824086a0emr85784225ad.49.1750888555480;
        Wed, 25 Jun 2025 14:55:55 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866488csm140884085ad.158.2025.06.25.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:55:54 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:55:52 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 0/9] cpu avoid state and push task mechanism
Message-ID: <aFxwaKwBykv5shN4@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>

On Thu, Jun 26, 2025 at 12:40:59AM +0530, Shrikanth Hegde wrote:
> This is a followup version if [1] with few additions. This is still an RFC 
> and would like get feedback on the idea and suggestions on improvement. 
> 
> v1->v2:
> - Renamed to cpu_avoid_mask in place of cpu_parked_mask.

This one is not any better to the previous. Why avoid? When avoid?
I already said that: for objects, having positive self-explaining
noun names is much better than negative and/or function-style verb
names. I suggested cpu_paravirt_mask, and I still believe it's a much
better option.

> - Used a static key such that no impact to regular case. 

Static keys are not free and designed for different purpose. You have
CONFIG_PARAVIRT, and I don't understand why you're trying to avoid
using it.

I don't mind about static keys, if you prefer them, I just want to
have feature-specific code under corresponding config.

Can you please print bloat-o-meter report for CONFIG_PARAVIRT=n?
Have you any perf numbers to advocate static keys here? 

> - add sysfs file to show avoid CPUs.
> - Make RT understand avoid CPUs. 
> - Add documentation patch 
> - Took care of reported compile error in [1] when NR_CPUS=1
> 
> -----------------
> Problem statement
> -----------------
> vCPU - Virtual CPUs - CPU in VM world.
> pCPU - Physical CPUs - CPU in baremetal world.
> 
> A hypervisor is managing these vCPUs from different VMs. When a vCPU 
> requests for CPU, hypervisor does the job of scheduling them on a pCPU.
> 
> So this issue occurs when there are more vCPUs(combined across all VMs) 
> than the pCPU. So when *all* vCPUs are requesting for CPUs, hypervisor 
> can only run a few of them and remaining will be preempted(waiting for pCPU).
> 
> If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from 
> VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
> each other and request for *limited*  vCPUs, it avoids the above overhead and 
                                       ^
Did this extra whitespace escaped from the previous line, or the following?
                                        v
> there is context switching within vCPU(less expensive). Even if hypervisor
> is preempting one vCPU to run another within the same VM, it is still more 
> expensive than the task preemption within the vCPU. So *basic* aim to avoid 
> vCPU preemption.
> 
> So to achieve this, use "CPU Avoid" concept, where it is better
> if workload avoids these vCPUs at this moment.
> (vCPUs stays online, we don't want the overhead of sched domain rebuild).
> 
> Contention is dynamic in nature. When there is contention for pCPU is to be 
> detected and determined by architecture. Archs needs to update the mask 
> accordingly.
> 
> When there is contention, use limited vCPUs as indicated by arch.
> When there is no contention, use all vCPUs.
> 
> -------------------------
> To be done and Questions: 
> -------------------------
> 1. IRQ - still don't understand this cpu_avoid_mask. Maybe irqbalance
> code could be modified to do the same. Ran stress-ng --hrtimers, irq
> moved out of avoid cpu though. So need to see if changes to irqbalance is
> required or not.
> 
> 2. If a task is spawned by affining to only avoid CPUs. Should that fail
> or throw a warning to user. 

I think it's possible that existing codebase will do that. And because
you don't want to break userspace, you should not restrict.

> 3. Other classes such as SCHED_EXT, SCHED_DL won't understand this infra
> yet.
> 
> 4. Performance testing yet to be done. RFC only verified the functional
> aspects of whether task move out of avoid CPUs or not. Move happens quite
> fast (around 1-2 seconds even on large systems with very high utilization) 
> 
> 5. Haven't come up an infra which could combine all push task related
> changes. It is currently spread across rt, dl, fair. Maybe some
> consolidation can be done. but which tasks to push/pull still remains in
> the class. 
> 
> 6. cpu_avoid_mask may need some sort of locking to ensure read/write is
> correct. 
> 
> [1]: https://lore.kernel.org/all/20250523181448.3777233-1-sshegde@linux.ibm.com/
> 
> Shrikanth Hegde (9):
>   sched/docs: Document avoid_cpu_mask and avoid CPU concept
>   cpumask: Introduce cpu_avoid_mask
>   sched/core: Don't allow to use CPU marked as avoid
>   sched/fair: Don't use CPU marked as avoid for wakeup and load balance
>   sched/rt: Don't select CPU marked as avoid for wakeup and push/pull rt task
>   sched/core: Push current task out if CPU is marked as avoid
>   sched: Add static key check for cpu_avoid
>   sysfs: Add cpu_avoid file
>   powerpc: add debug file for set/unset cpu avoid
> 
>  Documentation/scheduler/sched-arch.rst | 25 +++++++++++++
>  arch/powerpc/include/asm/paravirt.h    |  2 ++
>  arch/powerpc/kernel/smp.c              | 50 ++++++++++++++++++++++++++
>  drivers/base/cpu.c                     |  8 +++++
>  include/linux/cpumask.h                | 17 +++++++++
>  kernel/cpu.c                           |  3 ++
>  kernel/sched/core.c                    | 50 +++++++++++++++++++++++++-
>  kernel/sched/fair.c                    | 11 +++++-
>  kernel/sched/rt.c                      |  9 +++--
>  kernel/sched/sched.h                   | 10 ++++++
>  10 files changed, 181 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0
