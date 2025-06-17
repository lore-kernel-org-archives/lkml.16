Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666942EBB82
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184090; cv=none; b=sFHwEY7x7jnjGpWwcK0oeXFqmllDKbDVYw6U1K/cJC1mHYsquVOST5zkL10sLGSwi70VSgEIPoPd0deMRspypJyHErsY1+kp/Xgn4l6pyO72HWdvkRmX6SqjvBGg2guMCm0MFiytonhYe31X3/8DeYdsI2+MRkVc1Ck56zXzpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184090; c=relaxed/simple;
	bh=trQDe7A1agpj9FMI+2Gw942P4/ry+AksCOZVrjHrMgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8pi0kJsrC3dFiQTIBgVJdXehIXGwY2eTy/TbJOVNBr5hwelQBl0E7CFvKuWWUOop6j3AsrODJTMAT7iMvGXtzVG4JjjRgX8wGygxnfkzfDcd0dcPmbqK15HO3AcpOG4oKLPY8s0vdV6S8IE/NpO4Kv5hmGtAvbyMCfmqNHpkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccL/a3HI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccL/a3HI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90B2C4CEE3;
	Tue, 17 Jun 2025 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750184090;
	bh=trQDe7A1agpj9FMI+2Gw942P4/ry+AksCOZVrjHrMgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccL/a3HI0mKAlCc/xb8/HzgyqlbBdhwqK16VnT+eB6FN//7aXU0W5xxHQMwXpKABa
	 d6+z1+mFy9VrMuVp6K+91weRCj7pbtY/x7YhqC/t0p9fHYeaT2fn395YMI+LP7ogZ6
	 8aAc07koT97ihzFHdwAwEvlN2EBFECmWX14RogFnELwaGdRzQAsTwP1KZkd/ebiM7N
	 anANx7AiIjtVTgKFlPDAOSTzwjoMKKAhlYphBSIA71/9qWTxXNVFCMnfEMFO23+FYr
	 7F4SD1Z9ztODw2bEtr+fgSDRDTHJc4scyDmxYbRHSFl2UygSFqyEmJ9FKqyTecbuAw
	 9KFfCJ4P8ktVg==
Date: Tue, 17 Jun 2025 08:14:48 -1000
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
Message-ID: <aFGwmO3cNdR38lo8@slm.duckdns.org>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
 <aFBj9PXQiw-7O6yQ@slm.duckdns.org>
 <aFFozq_dzk8Qn7XN@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFFozq_dzk8Qn7XN@localhost.localdomain>

On Tue, Jun 17, 2025 at 03:08:30PM +0200, Frederic Weisbecker wrote:
> Le Mon, Jun 16, 2025 at 08:35:32AM -1000, Tejun Heo a écrit :
> > On Sat, Jun 14, 2025 at 03:35:28PM +0200, Marco Crivellari wrote:
> > > Marco Crivellari (3):
> > >   Workqueue: add system_percpu_wq and system_dfl_wq
> > >   Workqueue: add new WQ_PERCPU flag
> > >   [Doc] Workqueue: add WQ_PERCPU
> > 
> > Applied 1-3 to wq/for-6.17. I applied as-is but the third patch didn't need
> > to be separate. Maybe something to consider for future.
> 
> If this is for the next merge window, I guess the easiest is to wait for it
> before sending patches to other subsystems to convert them?
> 
> I guess we could shortcut that with providing a branch that other subsystems
> could pull from but that doesn't look convenient...

Oh yeah, I said I was gonna do that and promptly forgot. I'll set up a
separate branch based on v6.15.

Thanks.

-- 
tejun
