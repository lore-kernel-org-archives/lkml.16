Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6E1FFC5D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002941; cv=none; b=mVBBkw6NcuWpj+T0uHEcwo2JLtU+BNyaQ/1i+qbTuh0987DekaEuyS6LrL4YeADWInaq/b/HJdnLGypo511fbY0NnehR5lKyCc9RuC2riYQLYWRHDSTbYDebKCdJHOQtKNieEZKnrgJKJpOVTARV4hLTpOFU5J3Q8JidKbghw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002941; c=relaxed/simple;
	bh=p/IhXOhhDMb95O+uqUnq73objn2vlJ1KbJjC1++3NFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwrdgmRahlMP37ueKqinwUg6moxtBdjL2riiUok7lsEss72iNNgorzp8+J4gSfISzMMmRQk4SwSjsr3XrbBNuxtbKQv4tMu+2eDjFpUeJb+rxd7AGiaeU3HjfnCqHuerRcqGC3puenmcWG6RwISNK3SjL51Ty0IKuNvAVWg4dGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FXwLu9cQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FXwLu9cQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PMw2d61umer74GrzwIdwRMRlRYI7XRFijQdJ+/QCMVM=; b=FXwLu9cQqKQbn1q/60z1s0AP/K
	wd4x4zEW8DBqIzScuYrbeg1Wry9v1ZrHVVXt+htRNIejHIjBPM5F0WaJzxu8/NffdZgx+hWSnqUfN
	o/mDdYRnXiGsVTH8YFZYuajobGTwQZ61Yxl5h8M4R6WzbNz2f2LF8nDKxg+PGLeDSmmUHKo/uOD/V
	rBKy6rP2IgXQK0n24uAoYDd67ePEiG2xkSJTkfFaZ5g+KuczO4ETfLr52zPXVfRtPhfRMqw+Bcxnd
	Q2ZQKEHMP1AO+f7m++GVWCUT/lDANBxGCr7FA5c5YRdQ2/OOd9ShzgwJiL7dq7vM+jNDbWV369ljR
	2W1W+7VA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA37c-0000000DkGp-3zQK;
	Wed, 30 Apr 2025 08:48:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C9DA300642; Wed, 30 Apr 2025 10:48:52 +0200 (CEST)
Date: Wed, 30 Apr 2025 10:48:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Carlos Bilbao <bilbao@vt.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, carlos.bilbao@kernel.org,
	tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com,
	pmladek@suse.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-ID: <20250430084852.GN4198@noisy.programming.kicks-ass.net>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
 <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
 <20250429221049.GG4439@noisy.programming.kicks-ass.net>
 <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>

On Tue, Apr 29, 2025 at 03:52:05PM -0500, Carlos Bilbao wrote:
> Hello,
> 
> On 4/29/25 17:10, Peter Zijlstra wrote:
> > On Tue, Apr 29, 2025 at 03:32:56PM -0500, Carlos Bilbao wrote:
> > 
> >> Yes, the machine is effectively dead, but as things stand today,
> >> it's still drawing resources unnecessarily.
> >>
> >> Who cares? An example, as mentioned in the cover letter, is Linux running
> > 
> > Ah, see, I didn't have no cover letter, only akpm's reply.
> > 
> >> in VMs. Imagine a scenario where customers are billed based on CPU usage --
> >> having panicked VMs spinning in useless loops wastes their money. In shared
> >> envs, those wasted cycles could be used by other processes/VMs. But this
> >> is as much about the cloud as it is for laptops/embedded/anywhere -- Linux
> >> should avoid wasting resources wherever possible.
> > 
> > So I don't really buy the laptop and embedded case, people tend to look
> > at laptops when open, and get very impatient when they don't respond.
> > Embedded things really should have a watchdog.
> > 
> > Also, should you not be using panic_timeout to auto reboot your machine
> > in all these cases?
> > 
> > In any case, the VM nonsense, do they not have a virtual watchdog to
> > 'reap' crashed VMs or something?
> 
> The key word here is "should." Should embedded systems have a watchdog?
> Maybe. Should I've auto reboot set? Maybe. Perhaps I don’t want to reboot
> until I’ve root-caused the crash.

Install a kdump kernel, or log your serial line :-)

> But my patch set isn’t about “shoulds.”
> What I’m discussing here is (1) the default Linux behavior, 

Well, the default behaviour works for the 'your own physical machine'
thing just fine -- and that has always been the default use-case.

Nobody is going to be sitting there staring at a panic screen for ages.

All the other weirdo cases like embedded and VMs, they're just that,
weirdos and they can keep their pieces :-)

> and (2)
> providing people with the flexibility to do what THEY think they should do,
> not what you think they should do.

Well, there are a ton of options already. Like said, we have watchdogs,
reboots, crash kernels and all sorts. Why do we need more?

All that said... the default more or less does for(;;) { mdelay(100) },
if you have a modern chip that should not end up using much power at
all. That should end up in delay_halt_tpause() or delay_halt_mwaitx()
(depending on you being on Intel or AMD). And spend most its time in
deep idle states.

Is something not working?
