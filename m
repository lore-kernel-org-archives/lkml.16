Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0811474DA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820394; cv=none; b=rDzspF8pFeF3DkSoo3pvk6gQacnJCZwUE1Q3yuM1bH1ktnavh5J6RRh3fyyUlzhgfuJnMeyTpIupe6SwnVpmVYxL/nVFK06y+2Bgd/iF73HnO8hmwhLFjCOKGf0qWs0Y0LWeJvBAYtTsBe+U/EDq3fHbI+hlCU0I2M4XQTtAChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820394; c=relaxed/simple;
	bh=oXq+DBXT/QirbJWU/Y1NLC4CUmBuRpPwAmO1rKv54/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbjWi0CYyJs3m88a/AmGa07wOtefbZ8O3mFARSrQgIacQLLuBYg8oUScgFHzF8gUEl9hKkTzGYNzalkGE7yNdUDWgZLZwVEYbw4t2gs3sQ967OyTfWnbadScHGbSfqF1Xi2m4E1HLzfV5kUYyPd4caG0ajbF8qKU1C6cS6Of1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNgfw5/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNgfw5/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EDDC4CEE3;
	Fri, 13 Jun 2025 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820394;
	bh=oXq+DBXT/QirbJWU/Y1NLC4CUmBuRpPwAmO1rKv54/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNgfw5/AxsRv7gSN0LDFIfzVG9wA4f2QYa+BWJw12qE2+o6S9gu7b4PRVINxiSoHn
	 ZT//5e9Spa5WGKlyjcLSNhXEfqjJzyNweFkMQ+XMqjvbUpZ14+EOVUQ/PJHGQGyDDN
	 +5Gj61PtaudZarsraP2tuyatwRwwbIKOjp/XwMoucTgTQ0bUvgL1hvw+FFsZr+mN3c
	 poBNUcInzFIf759mEqcNiAIfnuJ30SFi72Ed1IuwXDa5SXHGaXpPn56ck4/nG+qw7c
	 Sux6KDVQzWzgexOqd3U/o7XiIuc86d4SwAF9/lP6pz3q5+nTWDOsDAgIOeu2PlIbdO
	 BrBv5Kw15IcdA==
Date: Fri, 13 Jun 2025 15:13:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 3/3] [Doc] Workqueue: add WQ_PERCPU
Message-ID: <aEwj52Fia2Q6-O2Z@localhost.localdomain>
References: <20250612133335.788593-1-marco.crivellari@suse.com>
 <20250612133335.788593-4-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612133335.788593-4-marco.crivellari@suse.com>

Le Thu, Jun 12, 2025 at 03:33:35PM +0200, Marco Crivellari a écrit :
> Workqueue documentation upgraded with the description
> of the new added flag, WQ_PERCPU.
> 
> Also the WQ_UNBOUND flag documentation has been integrated
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Thanks, a few spelling nits below:

> ---
>  Documentation/core-api/workqueue.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
> index e295835fc116..ae63a648a51b 100644
> --- a/Documentation/core-api/workqueue.rst
> +++ b/Documentation/core-api/workqueue.rst
> @@ -183,6 +183,12 @@ resources, scheduled and executed.
>    BH work items cannot sleep. All other features such as delayed queueing,
>    flushing and canceling are supported.
>  
> +``WQ_PERCPU``
> +  Work items queued to a per-cpu wq are bound to that specific CPU.

s/that/a

> +  This flag it's the right choice when cpu locality is important.

s/it's/is

> +
> +  This flag is the complement of ``WQ_UNBOUND``.
> +
>  ``WQ_UNBOUND``
>    Work items queued to an unbound wq are served by the special
>    worker-pools which host workers which are not bound to any
> @@ -200,6 +206,10 @@ resources, scheduled and executed.
>    * Long running CPU intensive workloads which can be better
>      managed by the system scheduler.
>  
> +  **Note:** This flag will be removed in future and all the work

in the future

> +  items that dosen't need to be bound to a specific CPU, should not

s/dosen't/don't

> +  use this flags.

flag.

But since the support for this is not there yet, perhaps this note
should be added later? Ie: if someone omits the WQ_UNBOUND flag currently,
the workqueue will be percpu.

Thanks.

> +
>  ``WQ_FREEZABLE``
>    A freezable wq participates in the freeze phase of the system
>    suspend operations.  Work items on the wq are drained and no
> -- 
> 2.49.0
> 

-- 
Frederic Weisbecker
SUSE Labs
