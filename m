Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232311494A9
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751148176; cv=none; b=P3VLPNFJfK03da7CL1/CUKXNZ+8wB6VigVR6UJnPpjArbU8DvgTenh9O7LBgi7Yp+ffkxtvntO8pYvB4Ufdvz1yVhPLAIUCg08LEICdzVlNgg1wSyLvyDBVtK+jN1bohGMUjQaHRaptD2ZsX5RtHqPRhe+fNSWEVediE9lR/NFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751148176; c=relaxed/simple;
	bh=mVded2N159xl1DQjHQNT6VFxzEqfJ1FlQJK1SQSAvPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5WJ3h6RMaayrB3T86ooXG83JofAWc2i+0rGbLqHpKNz/HOWVWSDRLnmejjS7ZzNGhzepFIqBjGkLeO8p7oGANLGwYoXxcVpc/bvhPoRRtz+Kj6z5JdPLKL+MaORHxEcOAgg/S02IsIM+sQzoRnB1EJEkDIgwktaCswKqkSES3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 68606681000051AC; Sat, 29 Jun 2025 06:02:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8992666291999
X-SMAIL-UIID: 495D4B6127B248E8A51F867D4E669DDF-20250629-060242-1
From: Hillf Danton <hdanton@sina.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: peterz@infradead.org,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 1/9] sched/docs: Document avoid_cpu_mask and avoid CPU concept
Date: Sun, 29 Jun 2025 06:02:29 +0800
Message-ID: <20250628220230.2052-1-hdanton@sina.com>
In-Reply-To: <90456362-ad16-4fa8-bba5-ec40aba88aa4@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com> <20250626062749.1854-1-hdanton@sina.com> <20250627002702.1942-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Jun 2025 10:07:22 +0530 Shrikanth Hegde wrote
> On 6/27/25 05:57, Hillf Danton wrote:
> > On Thu, 26 Jun 2025 20:16:36 +0530 Shrikanth Hegde wrote
> >>> On Thu, 26 Jun 2025 00:41:00 +0530 Shrikanth Hegde wrote
> >>>> This describes what avoid CPU means and what scheduler aims to do
> >>>> when a CPU is marked as avoid.
> >>>>
> >>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> >>>> ---
> >>>>    Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
> >>>>    1 file changed, 25 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
> >>>> index ed07efea7d02..d32755298fca 100644
> >>>> --- a/Documentation/scheduler/sched-arch.rst
> >>>> +++ b/Documentation/scheduler/sched-arch.rst
> >>>> @@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
> >>>>    arch/x86/kernel/process.c has examples of both polling and
> >>>>    sleeping idle functions.
> >>>>    
> >>>> +CPU Avoid
> >>>> +=========
> >>>> +
> >>>> +Under paravirt conditions it is possible to overcommit CPU resources.
> >>>> +i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
> >>>> +CPUs(pCPU). Under such conditions when all or many VM have high utilization,
> >>>> +hypervisor won't be able to satisfy the requirement and has to context switch
> >>>> +within or across VM. VM level context switch is more expensive compared to
> >>>> +task context switch within the VM.
> >>>> +
> >>> Sounds like VMs not well configured (or pCPUs not well partationed).
> >>
> >> No. That's how VMs under paravirtulized case configured as i understand.
> >> Correct me if i am wrong.
> >>
> >> On powerpc, we have Shared Processor Logical partitions (SPLPAR) which allows overcommit.
> >> When other LPAR(VM) are idle, by having overcommit one could get more work done. This allows one
> >> to configure more VMs too. The said issue happens only when every/most VMs ask for
> >> CPU at the same time.
> >>
> > After putting virtualization aside, lets see a simpler case where more
> > than 1024 apps are bound to a single (ppc having 4 CPUs for instance) CPU,
> > what can we do wrt app responsibility in kernel? 
> 
> In this case you will not likely have vCPU preemption. you will have 
> task preemption. That is ok. Patch doesn't aim to solve the case you 
> have mentioned above.
> 
It is a case of overcommit due to mis-config where scheduler does not
help simply because kernel is not the pill that kills all pains.

> In the generic SPLPAR configuration virtual processor usually have large 
> number of vCPUs and powerpc systems are fairly large in terms of CPU as 
> well.
>
Overcommit is not SPLPAR specific, nor PPC, because it is buggy for scheduler
to create overcommit on either PPC or Arm64.
