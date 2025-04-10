Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910371581E0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297155; cv=none; b=V71ML2u1IsEfoe5F94PNuNrF0qw0Ek1XQqHCOBhMJH6zK6JC56pLzTlrQDGDAxLYL9o34HM/LjJ/cuG1MCSb4uPxwsiiCfLrNfjwGObkwd+CuCpNRXcNa1kCkQ0Z/Wti4TXt/ZDUJs7D9ApGYKiQCBNzYaCwSzkLIRtvuexMAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297155; c=relaxed/simple;
	bh=HRf0Pc1Z3xBthCPSZUcjN1HfvQ/bbryl1Drb/lcqk0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwKlNuoshDkbDXKusv632YHPlV6epy2+LHN2K4kvQrr8OyHB5VCHKpCfoXi9EDX6VHAJZY1U1aT6VPX5wvhrhHkd/IjRE+JY8JE1w/QvGKaxy55aTEBWm4bJBr/tv8XUckKyxKtxiUQkMj/fbdEq4NDL3DodHew9nQ2wONTymL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9v855hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9v855hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E61C4CEE9;
	Thu, 10 Apr 2025 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744297154;
	bh=HRf0Pc1Z3xBthCPSZUcjN1HfvQ/bbryl1Drb/lcqk0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9v855hfQdr5H36V36cGa9PxRPrNOq9QpfEbUs2Zh9ox+VB54zWTGzFybYPmWNTmX
	 SoWcuNQUh5/5RPbg5jF+LfyX+zflJOkokESvzl3QB7CKyEuiro6ju8jKaZjpfHQy96
	 dKdJ94AIECsm/oN3LgRXUQzgmYC0VMEb9RN+lYcfg187U2GnoQ42eLLct/7AOb6SQV
	 Q1xmPhmzF7Hh0k7jdTRtKJRRaDV4pAri4exIXpWRkVMmpPVh8/sKGKPt5Pnvdznjxz
	 5kv7OhD2Dcz35V5acU85BkY3RtlvED/u26zyZdVvtovEEXUMZN6jkxVpTQgWbXfT+p
	 Z35johRp7pyvQ==
Date: Thu, 10 Apr 2025 16:59:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain>
 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>

Le Thu, Apr 10, 2025 at 04:46:10PM +0200, Gabriele Monaco a écrit :
> 
> 
> On Thu, 2025-04-10 at 16:20 +0200, Frederic Weisbecker wrote:
> > Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a écrit :
> > > On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> > > > But how do we handle global timers that have been initialized and
> > > > queued from
> > > > isolated CPUs?
> > > 
> > > I need to sketch a bit more the solution but the rough idea is:
> > > 1. isolated CPUs don't pull remote timers
> > 
> > That's the "easy" part.
> > 
> > > 2. isolated CPUs ignore their global timers and let others pull
> > > them
> > >   perhaps with some more logic to avoid it expiring
> > 
> > This will always involve added overhead because you may need to wake
> > up
> > a CPU upon enqueueing a global timer to make sure it will be handled.
> > At least when all other CPUs are idle.
> > 
> > > Wouldn't that be sufficient?
> > > 
> > > Also, I would definitely do 1. for any kind of isolation, but I'm
> > > not
> > > sure about 2.
> > > Strictly speaking domain isolated cores don't claim to be free of
> > > kernel noise, even if they initiate it (but nohz_full ones do).
> > > What would be the expectation there?
> > 
> > I don't know, I haven't heard complains about isolcpus handling
> > global
> > timers so far...
> > 
> > I wouldn't pay much attention to 2) until anybody complains. Does 1)
> > even
> > matter to anybody outside nohz_full ?
> > 
> 
> Makes sense..
> In our case, 2. is not a big issue because it can usually be solved by
> other configurations, but 1. is an issue.
> Most people indeed use nohz_full in that scenario, but some users may
> not want its overhead.
> 
> I find it misleading at best for global timers to migrate from
> housekeeping to isolcpus cores and since it's "easy", I'd definitely
> change that.

Easy but still a bit invasive so:

> Does it make sense?

It makes sense but is there a real need for that? Have people
complained about that?

Thanks.

> 
> Thanks,
> Gabriele
> 

-- 
Frederic Weisbecker
SUSE Labs
