Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02555C2FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984046; cv=none; b=rxC9DCgWQ5PI3I10sPTVPpWF7DRAzrzgNkASc74oEW7lKAxGlSXeUKeMobbkPN2INQEnbZcr8i1FfIvT0wC75vEWOL/1wX4wHtv1CduKrYvrQNHAgUFFhJsCBDvc4LIlRLCu03mg/A0p54NUaQrFbh3mnxLa2k1pfBcVr9XwcDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984046; c=relaxed/simple;
	bh=lb/r+tSHRlvc3LCBgtEyhMXAD0xeZec+acCZr6fYzp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJaMpwQfG426FEv0xKZZGHcZbbmW2PtM3eQ47t1vsAC8vqOcOqFTN38TLoR2qH3t9lcZzR0wcA+cvBTz7J22peZBFC9n8XeB49I8uDlH30jQfVhvXlvPkqe04EQ8JeXijQTCohB7LZgJYoOKTM9IM8bVQf+4i3dIMlLz/GwKmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685DE55F00007B68; Fri, 27 Jun 2025 08:27:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6481486685182
X-SMAIL-UIID: CE6BBDA348B44F55AF616AB41B4BDDAE-20250627-082713-1
From: Hillf Danton <hdanton@sina.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: peterz@infradead.org,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 1/9] sched/docs: Document avoid_cpu_mask and avoid CPU concept
Date: Fri, 27 Jun 2025 08:27:01 +0800
Message-ID: <20250627002702.1942-1-hdanton@sina.com>
In-Reply-To: <15328540-0c0a-4076-8ec8-77661b984fba@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com> <20250626062749.1854-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Jun 2025 20:16:36 +0530 Shrikanth Hegde wrote
> > On Thu, 26 Jun 2025 00:41:00 +0530 Shrikanth Hegde wrote
> >> This describes what avoid CPU means and what scheduler aims to do
> >> when a CPU is marked as avoid.
> >>
> >> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> >> ---
> >>   Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
> >>   1 file changed, 25 insertions(+)
> >>
> >> diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
> >> index ed07efea7d02..d32755298fca 100644
> >> --- a/Documentation/scheduler/sched-arch.rst
> >> +++ b/Documentation/scheduler/sched-arch.rst
> >> @@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
> >>   arch/x86/kernel/process.c has examples of both polling and
> >>   sleeping idle functions.
> >>   
> >> +CPU Avoid
> >> +=========
> >> +
> >> +Under paravirt conditions it is possible to overcommit CPU resources.
> >> +i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
> >> +CPUs(pCPU). Under such conditions when all or many VM have high utilization,
> >> +hypervisor won't be able to satisfy the requirement and has to context switch
> >> +within or across VM. VM level context switch is more expensive compared to
> >> +task context switch within the VM.
> >> +
> > Sounds like VMs not well configured (or pCPUs not well partationed).
> 
> No. That's how VMs under paravirtulized case configured as i understand.
> Correct me if i am wrong.
> 
> On powerpc, we have Shared Processor Logical partitions (SPLPAR) which allows overcommit.
> When other LPAR(VM) are idle, by having overcommit one could get more work done. This allows one
> to configure more VMs too. The said issue happens only when every/most VMs ask for
> CPU at the same time.
> 
After putting virtualization aside, lets see a simpler case where more
than 1024 apps are bound to a single (ppc having 4 CPUs for instance) CPU,
what can we do wrt app responsibility in kernel? Nothing because
resource/budget is never enough without sane config.
