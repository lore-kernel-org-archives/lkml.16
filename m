Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E121621CC49
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495559; cv=none; b=H7TtSIt+p/nqeHt8cto7RGNP7XQDToFWj96bngrGaMxTd3xLAwow0aFRry1mJUVm1F8F9FuqMI14qjw+GvA0jKkAzwB9Bg9g0tdVkHgErtRit6ssqrSEvOG4A+lhoH0X71L3KfbEfQxbOpEe3gdMZ6puuNL3+GSkPaew0lnUyEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495559; c=relaxed/simple;
	bh=TPPS1G6clxLaYVI+XLmUhfs6Dnqyo8ZtAR4qA+vEDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGBrhNoxLbfrQXGmRyljWoUTfogn4gA5SrQN9NW2RQT775ejO94rUy8N2OekLb0LFbSqq3W6UhjkbpCFmIavfZK/19tAxZI961y1dtoDuLfiH1bcwSq3CIjNqxka+cgxA0b/J5ah7U2rr/kGbOeMiO/owzLEkLvWKxKmXYJtLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFZSHste; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFZSHste"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B22C4CEEB;
	Mon,  9 Jun 2025 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749495558;
	bh=TPPS1G6clxLaYVI+XLmUhfs6Dnqyo8ZtAR4qA+vEDAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFZSHste9jXUrJg5JqPmtWc1Us0KDhHciB2q1KOFDuiav6GPbytb3nWqyEciO7zyY
	 DFbcDUzn3iVWjKa357VJkIih460/WS/n+VK7f3hICahMRT21awSnt1djiuc425raGb
	 i3Hs3O7PyjlNKYZnOr8u32Cz5jwtX1HRzX0dwa9H78qJI8z8EzmK9wlVhP6GSt6K4w
	 vBhPCwGjE0j4H/gMtiv8iL3OSToYZkqKs71D35mwIi8LYe+FVpZ+1WhxxaZY1/tFhG
	 PiQjFOKLYShhn0kpgigMZr32n6F6dHca02SOxHiIxGGLlEsNAYu5ARqX2dlrglUrXP
	 fywMzaEwud+3g==
Date: Mon, 9 Jun 2025 08:59:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 0/4] Workqueue: rename system workqueue and add
 WQ_PERCPU
Message-ID: <aEcvBadg_rT2_roQ@slm.duckdns.org>
References: <20250609103535.780069-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609103535.780069-1-marco.crivellari@suse.com>

Hello, Marco.

On Mon, Jun 09, 2025 at 12:35:31PM +0200, Marco Crivellari wrote:
> === Introduced Changes by this patchset ===
> 
> 1)  [P 1-2] system workqueue rename:
> 
> 		system_wq is a per-CPU workqueue, but his name is not clear.
> 		system_unbound_wq is to be used when locality is not required.
> 
> 		Because of that, system_wq has been renamed in system_percpu_wq,
> 		while system_unbound_wq is now system_dfl_wq.
> 
> 		The old wq are still around, but if used in queue_work(), a pr_warn_once()
> 		will be printed and the wq used is automatically assigned to the new
> 		default (system_dfl_wq or system_percpu_wq).
> 
> 2)  [P 3] Introduction of WQ_PERCPU.
> 
> 		This patch adds the new WQ_PERCPU flag to explicitly require to be per-cpu.
> 
> 		Every alloc_workqueue() caller should use one among WQ_PERCPU or
> 		WQ_UNBOUND. This is actually enforced warning if both or none of them
> 		are present at the same time.
> 
> 		WQ_UNBOUND will be removed in a next release cycle.
> 
> 		Because of that, this patch also adds to every alloc_workqueue() caller
> 		that require it, the new WQ_PERCPU flag.
> 
> 3)  [P 4] WQ_PERCPU documented in workqueue.rst
> 
> 		Added a short section about WQ_PERCPU and a Note under WQ_UNBOUND
> 		mentioning that it will be removed in the future.

Thanks for working on this and the changes generally make sense to me.
However, I think we should try a bit harder to reduce friction with the
affected subsystems. It's a bit unfortunate that we're already at rc1. It
would have been better if the new flags and wq were introduced before rc1.
Oh well, we can manage. How about something like this?

- Separate out patches to add the new flag and wq. Don't add the warnings
  yet. I'll commit these patches to a separate wq branch.

- Split out patches by subsystems. I know this is tedious but think it'd
  still be worth doing. It doesn't have to be completely granular. e.g. We
  know that network changes go through a single tree, so all network changes
  can be in a single patch. Each patch can explain the workqueue changes and
  that the patch can be either routed through the subysstem which would
  require pulling from the above wq branch, or, as the default option, we'd
  be happy to route the patch through the workqueue tree. I can create a
  separate branch to collect the conversion patches that can go through wq
  tree.

- After the next rc1 drops, I can apply the patches to add warnings to the
  -fixes branch and then send them to Linus.

This is a bit more work but would likely produce less friction without
delaying the timeline significantly.

Thanks.

-- 
tejun
