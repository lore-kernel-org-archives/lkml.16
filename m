Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FD2EF9D4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186491; cv=none; b=jYnIhpn04sKWA64UNkN4iNg2QyX3X6T0D8FPIcsrH75n4z3YfffHtylesHWx53pmh88pnUQQO+iTaIJlHePhcYITFl622Up0gUSniRiQmGIQ/NJJYnMAbf2bs1G650DjfNSheC9wSbGha0aM9vI5pXzspK70meAwq345fHk3GD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186491; c=relaxed/simple;
	bh=x8EkyP9u3v0sxdM1NDxgfOD+IGC7zHSYk6f4CTLUU9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVlUUjTWrlnTnrC2899WTR9OLjPIQ4yYJLcNlOnGns9a78zjDVKozMDJKg0PxK3jfnPvL3EUsssx8mxvyzdZ+GKuvU8uaNsYw3BpRwaxY6DxDyCD/K+D2K+k/HiLYTOlHdZqX0I3E9y8orJA6ZHPjeWmKiMkXofP5RFBdgUUneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJ6EfoEe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJ6EfoEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F71C4CEE3;
	Tue, 17 Jun 2025 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186491;
	bh=x8EkyP9u3v0sxdM1NDxgfOD+IGC7zHSYk6f4CTLUU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJ6EfoEejv8KsEfAcXdAnE6A2tDH25l2Otb4MqsRITkHoh1gOnnKEtoF530llJsuV
	 VDPm9+rAK002i1weBNnevsW5c3ISC0ga2QFyjaRKerH5YEjQ1WBrEudN753RSQ5zEb
	 aKJx01ZXMEthk9hqINSorskwRURl6NvBuNtvgVTevD4N9br09eQZRHUpACyak81888
	 /hO1AsURmUO0dfp3lWOzOIPbr4QWob4ohqXkp+aaXGwXZhr3hGnSOB1QbhQ9lq1031
	 G9EGvyewiyhoZdDeIAEbcMu/Dj8BTBDYStZvlN8xpB2+048NlDDqp/bplQiJlWP6ss
	 h+AeLT5vqIdnw==
Date: Tue, 17 Jun 2025 08:54:50 -1000
From: Tejun Heo <tj@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and
 system_percpu_wq
Message-ID: <aFG5-qBWHy-LeLGS@slm.duckdns.org>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
 <aFBj9PXQiw-7O6yQ@slm.duckdns.org>
 <aFFozq_dzk8Qn7XN@localhost.localdomain>
 <aFGwmO3cNdR38lo8@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFGwmO3cNdR38lo8@slm.duckdns.org>

On Tue, Jun 17, 2025 at 08:14:48AM -1000, Tejun Heo wrote:
> On Tue, Jun 17, 2025 at 03:08:30PM +0200, Frederic Weisbecker wrote:
> > Le Mon, Jun 16, 2025 at 08:35:32AM -1000, Tejun Heo a écrit :
> > > On Sat, Jun 14, 2025 at 03:35:28PM +0200, Marco Crivellari wrote:
> > > > Marco Crivellari (3):
> > > >   Workqueue: add system_percpu_wq and system_dfl_wq
> > > >   Workqueue: add new WQ_PERCPU flag
> > > >   [Doc] Workqueue: add WQ_PERCPU
> > > 
> > > Applied 1-3 to wq/for-6.17. I applied as-is but the third patch didn't need
> > > to be separate. Maybe something to consider for future.
> > 
> > If this is for the next merge window, I guess the easiest is to wait for it
> > before sending patches to other subsystems to convert them?
> > 
> > I guess we could shortcut that with providing a branch that other subsystems
> > could pull from but that doesn't look convenient...
> 
> Oh yeah, I said I was gonna do that and promptly forgot. I'll set up a
> separate branch based on v6.15.

Okay, I folded the doc patch into the second one and applied them to the
following branch.

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git WQ_PERCPU

This is v6.15 + only the two patches and should be easy to pull into any
devel branch.

Thanks.

-- 
tejun
