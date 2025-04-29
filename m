Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3948269806
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960821; cv=none; b=fi9zka5L0ryw4eW+RgICnXEeaLQZzrz2FdR6XKJuPn6A6D3J7Qy9kDvuszRUU1J4m1scGsZMmtYBhVSH1joa6ovrx3k1xH3WU/n9anihV8APgRbvoxjuslxpl1wUbReqcwLIUJcSxD7LSM/CSzUxotie5t3tFOcVEniwWrBzOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960821; c=relaxed/simple;
	bh=OdPx+9rE/+SGwziMXpppjMh/K44iE529FLcpRp3+x34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnZcUMV1TayDtTZEf1y0K9+kErpExgXUG4BMIFwAUxZmv8P29+lo/CH2vEjJAZFzE8jC1Y7jD7fP6WSmuQEup2Gb4IlLRdbHfJ57XtzTpR2l5pVQBSxMPDv5tan94ub399yFHV54O9cXiY/tPJVxNVJBMJ1wMdJemVxBFDoN4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Zk4lHq3h; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zk4lHq3h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pbASHdPEQN2aUBUOT3uJTu0pEAfLEl1MEPamgqhd9s0=; b=Zk4lHq3hKPod8ZAhaG4kvtT83d
	jmHSRCGbzhsJQCuDJbgIWiQPGxaqFv85ictTSX4UAMnkJWo5hny8LuzNnTw3UXBlZ9s0SM5yFUQQT
	iIfx/tq9SCyTSftLAeK0CYYOrJliqlWiIm2uZP+3EGA0yn8cIOi4vEa2lhqZ//ur6I7cM3YG9DuCt
	cQfQb0yQ9lncqMAYHDdlGDOmUGIjDy5cmLMa1npbtOGuCVyiTS5s+Wh1t0HHVpbkM9PxYIg4ieTPA
	4LEK4pXNBMqMbqYEMGyOqvhnOCKLJOrGAmogRNOjCJxVhYxhEmF6WZpJU0HmNvJISWHcCZlcQ8C2T
	No3BFZuw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9sAF-0000000DWvK-2ECq;
	Tue, 29 Apr 2025 21:06:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0006D30035E; Tue, 29 Apr 2025 23:06:50 +0200 (CEST)
Date: Tue, 29 Apr 2025 23:06:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, seanjc@google.com,
	jan.glauber@gmail.com, bilbao@vt.edu, pmladek@suse.com,
	jani.nikula@intel.com, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, takakura@valinux.co.jp,
	john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-ID: <20250429210650.GD4439@noisy.programming.kicks-ass.net>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>

On Tue, Apr 29, 2025 at 01:39:41PM -0700, Andrew Morton wrote:
> (cc more x86 people)
> 
> On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:
> 
> > From: Carlos Bilbao <carlos.bilbao@kernel.org>
> > 
> > Provide a priority-based mechanism to set the behavior of the kernel at
> > the post-panic stage -- the current default is a waste of CPU except for
> > cases with console that generate insightful output.
> > 
> > In v1 cover letter [1], I illustrated the potential to reduce unnecessary
> > CPU resources with an experiment with VMs, reducing more than 70% of CPU
> > usage. The main delta of v2 [2] was that, instead of a weak function that
> > archs can overwrite, we provided a flexible priority-based mechanism
> > (following suggestions by Sean Christopherson), panic_set_handling().
> > 
> 
> An effect of this is that the blinky light will never again occur on
> any x86, I think?  I don't know what might the effects of changing such
> longstanding behavior.
> 
> Also, why was the `priority' feature added?  It has no effect in this
> patchset.

It does what now, and why?

Not being copied on anything, the first reaction is, its panic, your
machine is dead, who cares about power etc..
