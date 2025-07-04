Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747628750C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618769; cv=none; b=d5Ys0FuNa9ka7yDdKhWUVXsjSQqRrfkUsa7MOfgY7vzIAcNdyhGsSefm0zwewPsBF/ieTv93uzwFa+D2PVL5/bAeJpAnudn3Pi3oTFKlRb/qbUrtrCW37srWqXslqVO/2q7+DdmQlzldWumSEE0B+VT3AQVSTEei3QrVJYZRIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618769; c=relaxed/simple;
	bh=HU0oCF3SsO6xY8EQnlB2lkoCeGaZMBu9JmdYXoSnmms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMMNIlecfXhXcApSUcIKWyacQSv6nZVZJTwb9J59UrE5r1cn6aO7PBLL9I+zZoc/XJgBnPUFPFAAcTg/n5HguLviQxw7egs4+KFu10WJYmt15tKiOGHtwmdp3iBKHcZtN3cowXF1Qn9E3N6LvM7pf2ej5/EL/RZSLxHKACZW1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oSCZKgVv; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oSCZKgVv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BiiPFvk8pVVBJSxL7L3t13j61DBtLfP08JMvkqNoRsw=; b=oSCZKgVvDMkuC841Is/QwZap2m
	VDvyrkacWFey7YEIFLQ2AJKNjdwlGKCYlgcCiWZQTzJdY1E4M47UL/r+1VKktDy042QTiHRz5Dven
	NdVZUUujpVJdD/cPH574LTNCpimDerJPIaWdiqhpd5vnckr6/OLt3YXf3btNsXjAXtYjFa37XH+Ay
	+FKX6uJtMclo/uq4GaDoIrDWQRrxsrUiaZ3eA+yswpGHpwxDU+7c158dAkjabe3BUYlTRf/73Ed0i
	HBtMIneeGzjpEsidmBO5yTpQ+Puk6qtRl3PAo7mQv6UdPd+XJhmsNvS6TSifcA63aKe6+7dN1z3gX
	i8eXjroQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc3I-00000007s3T-3ouw;
	Fri, 04 Jul 2025 08:45:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0CCB8300212; Fri, 04 Jul 2025 10:45:48 +0200 (CEST)
Date: Fri, 4 Jul 2025 10:45:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
Message-ID: <20250704084547.GF2001818@noisy.programming.kicks-ass.net>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
 <b4cce11c-5ed6-4366-92c6-9a6b34998295@linux.ibm.com>
 <ba7f6c16-919a-4261-8677-056072572fc9@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba7f6c16-919a-4261-8677-056072572fc9@intel.com>

On Fri, Jul 04, 2025 at 04:40:39PM +0800, Chen, Yu C wrote:

> > > @@ -953,6 +953,10 @@ config NUMA_BALANCING
> > > ?????????????? This system will be inactive on UMA systems.
> > > +config SCHED_CACHE
> > > +?????? bool "Cache aware scheduler"
> > > +?????? default y
> > > +
> > 
> > Should it depend on EXPERT?
> > IMO this could add quite a bit of overhead and maybe n by default?
> > 
> 
> I would leave this to Peter and Tim to decide.

Runtime controls are always better than compile time. Distros will have
no choice but to enable the config option.

But that is not the kind of thing you start a series with. First
versions didn't even have the config option. First you make it work,
then later you worry about silly detail.

