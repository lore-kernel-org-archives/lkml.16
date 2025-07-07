Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184F1F4623
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879508; cv=none; b=S0J6X3XCae7ThikceUQj/3+0SX2YKSWS7eiRQplI56VZBTXkW6Rc+cztjeWZkIvu2ZfjHRQwNR0n61K+CqPrwfU90llBgImUwP6maMvw06SBrbeHqSRg2OCnfCN4S/jcN9WMBm7RLy69hMR9cW9hteYJ62QeV3pxaM3Pbtapds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879508; c=relaxed/simple;
	bh=0Tp61NqyWF5FGzGHVemsbFz0P+yecNYQl97zCv81nJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bStNDsNUgvNt5c52jInhkRpRY1RZFZQvED4b92VtxRBC26wnUEeUh2xrL6wfiK7pTmHLnlyKS4t83NhqD+rUz+v30xaHGEIpcOUZECXqEeP/ghQQWIY7yLPMYdp/2i4l+Y+8g+KybkHMSeWWjqNUwnLjPyL9lL3xOUj+VuBIexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eIkuQjMN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eIkuQjMN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0df8zUp/oxZ4dFX7V7uLHpMSKuBUZPFHzv7dbyVP5co=; b=eIkuQjMNdbfFWr7hlEKgZaw45O
	aAWSlBPTF/xWfIIhp9hyyKTaX5gLx31lwYSOa4u/8hqmY/ZOvRO7ptBbiz3rmlmVMvGh67a+0mrq2
	gVmYHww74r++zd7IHZ5189xMpS8n8zmBDhqOFvxPEY7Wt8OoYwjB9c2guQY/WzPQSLlD8iYmC3T7y
	wrJH4dO10zFOGIhQ+utcUYz1WWCWTfxElTrr586rpGPrz24BP36iRHqB3XLafSuOUXa6RfNFYT6I3
	00jGyC+AZjvqjO91DcrqZo/Gm27B49cu4N0QS+qouzPuJQYOW4IGwGy9EhQyDcvIb9mRlMFUQkr2i
	udOzyW7g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhsv-00000008RV3-13iX;
	Mon, 07 Jul 2025 09:11:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5EB22300212; Mon, 07 Jul 2025 11:11:36 +0200 (CEST)
Date: Mon, 7 Jul 2025 11:11:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com
Subject: Re: [PATCH v2 00/12] sched: Address schbench regression
Message-ID: <20250707091136.GB1099709@noisy.programming.kicks-ass.net>
References: <20250702114924.091581796@infradead.org>
 <132949bc-f901-40e6-a34c-d1d67d03d8b6@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132949bc-f901-40e6-a34c-d1d67d03d8b6@linux.ibm.com>

On Mon, Jul 07, 2025 at 02:35:38PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 7/2/25 17:19, Peter Zijlstra wrote:
> > Hi!
> > 
> > Previous version:
> > 
> >    https://lkml.kernel.org/r/20250520094538.086709102@infradead.org
> > 
> > 
> > Changes:
> >   - keep dl_server_stop(), just remove the 'normal' usage of it (juril)
> >   - have the sched_delayed wake list IPIs do select_task_rq() (vingu)
> >   - fixed lockdep splat (dietmar)
> >   - added a few preperatory patches
> > 
> > 
> > Patches apply on top of tip/master (which includes the disabling of private futex)
> > and clm's newidle balance patch (which I'm awaiting vingu's ack on).
> > 
> > Performance is similar to the last version; as tested on my SPR on v6.15 base:
> > 
> 
> 
> Hi Peter,
> Gave this a spin on a machine with 5 cores (SMT8) PowerPC system.
> 
> I see significant regression in schbench. let me know if i have to test different
> number of threads based on the system size.
> Will go through the series and will try a bisect meanwhile.

Urgh, those are terrible numbers :/

What do the caches look like on that setup? Obviously all the 8 SMT
(is this the supercore that glues two SMT4 things together for backwards
compat?) share some cache, but is there some shared cache between the
cores?
