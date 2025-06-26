Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07722F74A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750919301; cv=none; b=o+5zKtlGJfUIogIuxzEqsW62bmaEhVP4SoNS94H0Q8DYyYeSPGv7TWdoa5jPFg87YM92OZFBUYigl3hkE25bdikEj4RNAC9IrnohO+Q8MGkTVZEDYMuXKL6vZ6KyRxqBjkiEtoUwQMOAW2DZi87MQTp7QIWICg2bCeoxC5E7wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750919301; c=relaxed/simple;
	bh=2Z/Em1Y4whxorjWO+GN30U2VbwgQirIi+tFcGvqGmKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIF9UApCFLyV/FyUCsfK+HIKLemZSN/Z9bFBNJ1kMrsxSELfugSBV3heaW26XF8/94fo4bNHr1/255OOpjozDAmyamDWTfhY0R6iDNdxXg51iH+yhBCbjBU7lhhfBWbBtC4Y//YTFOXKF+Hm+LlRwBgVwLFat2jrQWXWGRxi2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685CE8700000199A; Thu, 26 Jun 2025 14:28:01 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9124786685332
X-SMAIL-UIID: 13828CA596954EBC9EC5EAEA50D56982-20250626-142801-1
From: Hillf Danton <hdanton@sina.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: peterz@infradead.org,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 1/9] sched/docs: Document avoid_cpu_mask and avoid CPU concept
Date: Thu, 26 Jun 2025 14:27:40 +0800
Message-ID: <20250626062749.1854-1-hdanton@sina.com>
In-Reply-To: <20250625191108.1646208-2-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Jun 2025 00:41:00 +0530 Shrikanth Hegde wrote
> This describes what avoid CPU means and what scheduler aims to do 
> when a CPU is marked as avoid. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
> index ed07efea7d02..d32755298fca 100644
> --- a/Documentation/scheduler/sched-arch.rst
> +++ b/Documentation/scheduler/sched-arch.rst
> @@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
>  arch/x86/kernel/process.c has examples of both polling and
>  sleeping idle functions.
>  
> +CPU Avoid
> +=========
> +
> +Under paravirt conditions it is possible to overcommit CPU resources.
> +i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
> +CPUs(pCPU). Under such conditions when all or many VM have high utilization,
> +hypervisor won't be able to satisfy the requirement and has to context switch
> +within or across VM. VM level context switch is more expensive compared to
> +task context switch within the VM.
> +
Sounds like VMs not well configured (or pCPUs not well partationed).

> +In such cases it is better that VM's co-ordinate among themselves and ask for
> +less CPU request by not using some of the vCPUs. Such vCPUs where workload
> +can be avoided at the moment are called as "Avoid CPUs". Note that when the
> +pCPU contention goes away, these vCPUs can be used again by the workload.
> +
In the car cockpit scenario for example with type1 hypervisor, there is app
kicking watchdog bound to every vCPU, so no vCPU should be avoided.

> +Arch need to set/unset the vCPU as avoid in cpu_avoid_mask. When set, avoid
> +the CPU and when unset, use it as usual.
> +
> +Scheduler will try to avoid those CPUs as much as it can.
> +This is achived by
> +1. Not selecting those CPU at wakeup.
> +2. Push the task away from avoid CPU at tick.
> +3. Not selecting avoid CPU at load balance.
> +
> +This works only for SCHED_RT and SCHED_NORMAL.
>  
Sounds like forcing a pill down through Peter's throat because Steve's headache.
