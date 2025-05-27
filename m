Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9F827A92A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358637; cv=none; b=U/WdsbccWHBPizdLYKHYRKcDjrLc3s4doAby0n2IEa2UeDaFO8HGCekYNxf9x5S8mdwZWH17O8jiFzU3fyequH5azb7QSFiszz+vEcQDLtku349rLJTQ34/KfpZo/ZxC367P2Eq0S983K82gnI3v6uU1oy/nfmRTILnQfKpsv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358637; c=relaxed/simple;
	bh=4gs1b/ko3CxGx4GmgUqTqHIRpGpYAs8W47atNLtnLIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thWEyDiF4B2m+umVgBlc2cONn73p3ooibMZUnSTe4fLU1aBtQFBfBLunQnPTqyVGfkXyIpPE28tPUO5jJn4eZZ7CCacTc04yZK+lEiU2/zvQdO+Xx1FZf/HSCkYLQCV7v7+NALR1tqguTy4BDDWRR503ZQIzdv05cZgrL2mq4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lsqfW4ky; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lsqfW4ky"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V/O5fYihAfRjgvt9RMTFWFmKIRdznyV/sr6+ZSsUtVY=; b=lsqfW4kyxUe4CCuWXDu0vPgCIh
	YvVa84VIwPjnLiM0o4icjrE+9z2sEojuww5BZN0P2c3Ghmlg1Lj6lKPi4cSMjjdAbTMp955HiIXP2
	nDsKAWgSZPB66rJTjHMv4Ooh/UMTRQzrSSRO0bgmP4Zod8RXcptQpaaJGdm4DX3BZgCqmlDbHtaeX
	sPgC1feqFoUaTYxrlqPy/f/ChzwXTa9ZRIVS1V7h7tn3FYK1o2DB8bRG6KpvS2vy9UL9MujsfTF/p
	nLotZ2oQ+UnTdXBbkkY9ntA5i14yoeEl34HUn331190D6embKBGlMwZY7PRmHnu2SXskS6n4Kh457
	Z67PZkMQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvwb-000000024QN-1vbF;
	Tue, 27 May 2025 15:10:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C93C53002CE; Tue, 27 May 2025 17:10:20 +0200 (CEST)
Date: Tue, 27 May 2025 17:10:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	tglx@linutronix.de, yury.norov@gmail.com, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	jstultz@google.com, kprateek.nayak@amd.com, huschle@linux.ibm.com,
	srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk
Subject: Re: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
Message-ID: <20250527151020.GV24938@noisy.programming.kicks-ass.net>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523181448.3777233-1-sshegde@linux.ibm.com>

On Fri, May 23, 2025 at 11:44:43PM +0530, Shrikanth Hegde wrote:
> In a para-virtualised environment, there could be multiple
> overcommitted VMs. i.e sum of virtual CPUs(vCPU) > physical CPU(pCPU). 
> When all such VMs request for cpu cycles at the same, it is not possible
> to serve all of them. This leads to VM level preemptions and hence the
> steal time. 
> 
> Bring the notion of CPU parked state which implies underlying pCPU may
> not be available for use at this time. This means it is better to avoid
> this vCPU. So when a CPU is marked as parked, one should vacate it as
> soon as it can. So it is going to dynamic at runtime and can change
> often.

You've lost me here already. Why would pCPU not be available? Simply
because it is running another vCPU? I would say this means the pCPU is
available, its just doing something else.

Not available to me means it is going offline or something like that.

> In general, task level preemption(driven by VM) is less expensive than VM
> level preemption(driven by hypervisor). So pack to less CPUs helps to
> improve the overall workload throughput/latency. 

This seems to suggest you're 'parking' vCPUs, while above you seemed to
suggest pCPU. More confusion.

> cpu parking and need for cpu parking has been explained here as well [1]. Much
> of the context explained in the cover letter there applies to this
> problem context as well. 
> [1]: https://lore.kernel.org/all/20250512115325.30022-1-huschle@linux.ibm.com/

Yeah, totally not following any of that either :/


Mostly I have only confusion and no idea what you're actually wanting to
do.
