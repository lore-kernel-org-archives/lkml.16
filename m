Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2C25B69A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619500; cv=none; b=mmAliIoxi39JTrN+DK87cR7m4yMoR+D3ecIgInY7580eHd/me6z7OC3d0wqXjuNUtTGI3DzceDlhW3e6k6yHYuOWbE9xMRJJw9CR+BQjmQrV+R8EPpXbmBCNNef9UED+tHPBKiCeh/+O75wXgea6om+Z22oCLq0yfeca5T+qMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619500; c=relaxed/simple;
	bh=+PpCMUgk4FbEhoWXHklabVAaqaVKA5WyEg9bsqcLB8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLZhGtl4rwTqJFPze+eCCbuVZRV9vQkQCPgmDJxpqPfxEaLLaC/XhDizYsWW2Gp67tX0xW71Q6lgImg/AhOCfW/7bLUV7ckvGJ1iNkwoGFhwqcD7ruTgX6xUxdqVe6L6066hu9rzJsONXgJr9dESjZyLYbIBN5ks/RxZuOjB29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mef40GdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mef40GdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1332FC4CEF6;
	Wed,  7 May 2025 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746619499;
	bh=+PpCMUgk4FbEhoWXHklabVAaqaVKA5WyEg9bsqcLB8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mef40GdDEMZX/AzH/S0ZuqxQOp6MQRbj9HVTmnVbcmKx2g5vp6Kqy5Ie3994l+Yjl
	 B62JPNIjF3/RnSDCpnoI+lk4zOAp/T1R69RtsR4GYtGtt4dyYJStR0tdQCSbFGzBaR
	 +49vVQqjrJVRV2AGXS5/g5K/ELso8vAUarxlOQEOzP5IZe4PzWdJZqbXZUIBDM/Vzy
	 gN2MK4Ql8K4YxwTQx4Ai8pcDEJghnVABTStsOHMG1Hex4f8G+tYI68MjYWiW0TWoZ3
	 VI2vftbBLwIqm/C5O8hQlxmojDBlNvAeYa0om9TvqP22MEuGUQGDbKTM9z/mN2O6Jq
	 xHUtlhbxVvEDg==
Date: Wed, 7 May 2025 14:04:55 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <aBtMZ4_CR0svusC2@localhost.localdomain>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <aBlMLQl504ThYbnf@slm.duckdns.org>
 <CAAofZF60A82utmB2LiVw910cdFDiHd+fPaozUKpQwfXUqv7R_g@mail.gmail.com>
 <aBoGskbRu0RyRXMF@localhost.localdomain>
 <aBqscir2gawbEdg1@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBqscir2gawbEdg1@slm.duckdns.org>

Le Tue, May 06, 2025 at 02:42:26PM -1000, Tejun Heo a écrit :
> On Tue, May 06, 2025 at 02:55:14PM +0200, Frederic Weisbecker wrote:
> > Le Tue, May 06, 2025 at 12:10:18PM +0200, Marco Crivellari a écrit :
> > > Hi,
> > > 
> > > > Can you please make a summary of the discussion here? Referring to old
> > > > thread is useful but it'd be nice to have the rationales laid out in the
> > > > patchset - why this is desirable, what is the transition plan and what are
> > > > the rationales for it? Also, please include a short summary in the patches.
> > > 
> > > Sure, thanks for the advice.
> > > 
> > > > Let's keep the old names for a release or two and trigger printk_once()
> > > > warnings about the renames. These are pretty widely used, so I think it
> > > > warrants a bit of extra effort.
> > > 
> > > Good, sounds fine.
> > > But I don't understand where printk_once() should be placed.
> > > Can you give me some further guidance?
> > 
> > So one possibility to achieve this is to not do a rename of system_wq
> > to system_percpu_wq but eventually keep system_wq around and create the
> > new system_percpu_wq. Convert all current users of system_wq to system_percpu_wq
> > and warn from queue_work() when system_wq is used.
> > 
> > I would personally prefer that we use WARN_ON_ONCE() so that this really
> > gets noticed. Tejun what do you think?
> 
> I'd stick with printk_once() at least for a while. There are systems set up
> to panic on warnings and there will be a bunch of out-of-tree usages too.
> Let's latch it up over multiple releases.

Fair enough!

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
