Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55A175A5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861857; cv=none; b=kI5cKdFkNHcjLdw5DqedQ/eIUqwRfTyf0xR38yeRePvMuv/VEFKcadd4xbppw7Y6wff5XdyeTY9Pa/H6BENNMdjX0NCLhHBq7QOFi/UPsMjexRRspG8jaxOd9L4LHNKSxWofPwPaJmBX3MWxu9dZmWid2BRPAJx09k9mpohxynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861857; c=relaxed/simple;
	bh=dAJQaczav+5mwL1Y2Kgggjtw996gUr7V6zTfYs3ao5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikyHvKgx2E7Hvvw8AaCTpC8nX6MHvM5/b3l5PD0edOVLTw24k2Qsj+MFFTPk0tKYOvleVwo2C8raFGqHTvZGF05KAWDwgIQBufW1wRcrJ+Mjw2+cmPTVvlP65FfCs3mVKcMBXgc6XoUNUq+pCyls0Dg/4YNj3tzK/9YTiOSMP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOMukM+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOMukM+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A064EC4CEEA;
	Wed, 25 Jun 2025 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861856;
	bh=dAJQaczav+5mwL1Y2Kgggjtw996gUr7V6zTfYs3ao5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOMukM+IFsxNZ1Y6E2SgIwH8CcINZcQibc1atrgcSDmznieEdaV+KmirgvmNjQj//
	 s6MquvtuzmO5/Ei3GjpG1MReJtpKkiiZqjtoO0Oynau+8owWGyWe4N1AEFpfpZdfKY
	 D/IvUDMsf4sIXbFzQ1gUbZesK76I/buHdYZiKRs7vVdKKnCWP+yAvgTqEoULapG7CW
	 K46YyjJwgktj+nVZPC6ZgoBf+FrhiLLt8kV+NbuH3oTLa3iP+lro6YZ2XOX/7gt7xY
	 +owbLxSeYpgelL/X/P9RWQ6HPMKg04v+N1s1B3VLAQ/DwM+SHXxOGWIOpoyp9R1eYI
	 WeU0/0CH1FKwQ==
Date: Wed, 25 Jun 2025 16:30:54 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <llong@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
Message-ID: <aFwIHnSr8lok7Gks@localhost.localdomain>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <aFmRQLv2RWbqX01b@slm.duckdns.org>
 <509c307c-c72f-423c-b5c4-a1c5fdcac7a1@redhat.com>
 <aFmXAjmtasot2rp6@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFmXAjmtasot2rp6@slm.duckdns.org>

Le Mon, Jun 23, 2025 at 08:03:46AM -1000, Tejun Heo a écrit :
> Hello,
> 
> On Mon, Jun 23, 2025 at 01:57:17PM -0400, Waiman Long wrote:
> > The percpu-rwsem does have a cheaper read side compared with rwsem for
> > typical use case where writer update happens sparingly. However, when the
> > writer has successful acquired the write lock, the readers do have to wait
> > until the writer issues a percpu_up_write() call before they can proceed. It
> > is the delay introduced by this wait that I am worry about. Isolated
> > partitions are typically set up to run RT applications that have a strict
> > latency requirement. So any possible latency spike should be avoided.
> 
> I see. Hmm... this being the mechanism that establishes the isolation, it
> doesn't seem too broken if things stutter a bit when isolation is being
> updated. Let's see what Frederic says why the strong interlocking is needed.

I should be able to work around that.
I think only PCI requires that rwsem because it relies on work_on_cpu().

I can create a dedicated workqueue for it that housekeeping can flush after
the cpumask update.

-- 
Frederic Weisbecker
SUSE Labs
