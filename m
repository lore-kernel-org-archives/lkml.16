Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BD481C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324428; cv=none; b=cAm74scaiJrJvnpJBhdnh+hYkEPK84vwnUJDmwzobuPnGzYjkxu80wwoJb5JOqm3aMtkh+CALCO0qNSQIYE3w6hRZcYo0Mnpn+/4jPpgjj4TcsbkBgqboLc9JAQO3xXxjJVoT1lNPabBqrtP4i+vn9P60A0zw3l4W2aF5J7lbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324428; c=relaxed/simple;
	bh=bus/gjtJ6jnDZJAvN6OTrLA9OvRDzX/sPYLlfJQuzV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0FRuJ+IF9VIeVHZlMuR7ZKHLeucU6ZtnH55oTPUXDnS8vTSONIMHr3q03qXa3JSUGrqkGdLBKwZylpKiY0bnMDruEf1w1+NKev0kP4TbMFnAAxmaqokJRAltKqKDVCXa34ivZceiv/1PJm3EK8UHu3uSZRB/XfYdPJwPptdmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvNW0okx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvNW0okx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B10C4CEE7;
	Thu, 15 May 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324426;
	bh=bus/gjtJ6jnDZJAvN6OTrLA9OvRDzX/sPYLlfJQuzV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvNW0okxmz6bciskk0TiNGZLdEV/Idfy6+7CzsDNuv6DjMvtv1J7/tyJAydxUyTmK
	 eGZ7BkcHq7GSgD115GwMxFfMumtDSNWXBpQC4+fS7ZdN4yxBExG9oOBqPCCnByHh6o
	 mZIrm+BdE2ZMsSRek9GiHHSVknow4RLoP/7zl/ozs4dK0iE0bujJY2ja7KXp9u98dB
	 Seqpk+gbILwZdxScBAw+kxjP3fo7cG5cu4W38rAvHMUC/VC2TUirCnmdNNze9hXfH9
	 Sqa+wjyOabXfrM1gsyfvUN8A8ff6j5LyCj4TXzhMLNaZOk1+N4d1G+IZ3bk6WoYKaE
	 VwjqUuqzFim9g==
Date: Thu, 15 May 2025 11:53:45 -0400
From: Tejun Heo <tj@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH] workqueue: show the latest function name in
 /proc/PID/{comm,stat,status}
Message-ID: <aCYOCYsXisQH6mi_@mtj.duckdns.org>
References: <20250515040523.430181-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515040523.430181-1-songmuchun@bytedance.com>

Hello, Muchun.

On Thu, May 15, 2025 at 12:05:23PM +0800, Muchun Song wrote:
> Workqueues, such as system_unbound_wq, are shared across the system,
> making it difficult to determine which tasks are being executed by
> each worker. This patch improves clarity by displaying the latest
> function name associated with each workqueue worker in the
> /proc/PID/{comm,stat,status}. For example:
> 
> Before:
>   # ps 64 67 68
>   PID TTY STAT TIME COMMAND
>   64  ?   I    0:00 [kworker/u34:0-events_unbound]
>   67  ?   I    0:00 [kworker/u33:1-events_unbound]
>   68  ?   I    0:00 [kworker/u33:2-events_unbound]
> 
> After:
>   # ps 64 67 68
>   PID TTY STAT TIME COMMAND
>   64  ?   I    0:00 [kworker/u34:0-events_unbound:flush_memcg_stats_dwork]
>   67  ?   I    0:00 [kworker/u33:1-events_unbound:flush_to_ldisc]
>   68  ?   I    0:00 [kworker/u33:2-events_unbound:idle_cull_fn]
> 
> This change provides a clearer view of the tasks being performed by
> each worker, enhancing system monitoring and debugging.

One worry I have about this is that these will likely be stale most of the
time as kworkers are just sitting and waiting, and there's no connection
between what a kworker ran before and what it's going to run next, so I'm
unsure how useful the extra information is.

Thanks.

-- 
tejun
