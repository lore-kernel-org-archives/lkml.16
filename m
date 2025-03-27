Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B38EEA9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095367; cv=none; b=q2Z9zSVcXiOftNhyMi3NjjUPvOfH0Y/03+BD1nS4MWPfglkFTCuO/R0aGKxmlcrbzqbmsHpUwXj0kM5bmVzEwk3X0yCoXG/S90Z/Pzio1tqx+YR0sM3sA9zdzSuudYx+n1AOIPUdrj4fQe7MUPOWsEsDiLdMFK2FUvrAq0M2U0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095367; c=relaxed/simple;
	bh=swxS27j2Fa45SOvPHd+RoddyF7ldkMEgTwYmbkFWlwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQl7Xaspb0r6CVETJbDAcsKjLSOfv8FaDtKmAwgPg2Z3trQUrZveRA1bHDDglLwe+XMeDjEygi0/j/V8Rzi+ndme+eEN/7AXK+QZ2CBo/wEmDvVmPDeGM1EMhFdPb0YbI9pHOL3cMhNFlDPWsisDYfTmj+EAxwBCpLRWPgJa2lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKfcIwuY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKfcIwuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5127CC4CEE8;
	Thu, 27 Mar 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743095366;
	bh=swxS27j2Fa45SOvPHd+RoddyF7ldkMEgTwYmbkFWlwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKfcIwuYLSWu6SIS+zAgq+j7q4AmeDas+TDkYLuddr/scs1SGy9m3fPrISmVYsI4Z
	 +dXikxyLeAiuSZ0Gb0Vjdeb/KyU3Uatb3ahhMEG3cQjltcbWBKrjojSFglTF+ix5pt
	 6Jg3UcF8Te9P1YcqaiUYtuAs8fmZkhNF0cimG6/CAzLhg0GERAhps8RwM3lYpvErJy
	 78YPpWlQrqv4FM/I2gi9r3HXfMnV/50q8I+CUpWogZ0BlKFpVdFjopC1O2sLOw3n8B
	 DOs6cjbs7ZanvyxkaNE9TibB9v+3h83hjzX48rVgx1wgx4pT9skTdbdOGNdP+H+13s
	 ZyJV/Hyquy7fg==
Date: Thu, 27 Mar 2025 07:09:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-WGRetAL9tSPEkv@slm.duckdns.org>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
 <Z-UEkJfkkBBKqCyU@gpd3>
 <Z-UgI3dSwcLa-CRC@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-UgI3dSwcLa-CRC@gpd3>

Hello,

On Thu, Mar 27, 2025 at 10:53:39AM +0100, Andrea Righi wrote:
...
> > Hm... that's right, it looks like this requires a bit more work than
> > expected, but saving the currently locked rq might be helpful also for
> > other kfuncs, I'll take a look at this.
> 
> What if we lock the rq in the scx_kf_allowed_if_unlocked() case, and for
> all the other cases we ignore locking if rq == this_rq(). If we need to
> operate on a different rq than the current one we could either defer the
> work or just trigger an ops error. Something like:
> 
> 	if (scx_kf_allowed_if_unlocked()) {
> 		rq_lock_irqsave(rq, &rf);
> 		update_rq_clock(rq);
> 	} else if (rq != this_rq()) {
> 		// defer work or ops error
> 		return;
> 	}
> 
> 	lockdep_assert_rq_held(rq);
> 	rq->scx.cpuperf_target = perf;
> 	cpufreq_update_util(rq, 0);
> 
> 	if (scx_kf_allowed_if_unlocked())
> 		rq_unlock_irqrestore(rq, &rf);
> 
> AFAICS all the current scx schedulers call scx_bpf_cpuperf_set() from
> ops.running(), ops.tick() or ops.init(), so even with the ops error we
> should cover all the existent cases.
> 
> The only unsupported scenario is calling scx_bpf_cpuperf_set() from
> ops.enqueue() / ops.select_cpu(), but maybe we could add the deferred work
> later to handle that if needed.

balance_one() can be called from a sibling CPU when core sched is enabled,
so ttwu isn't the only path where this_rq() test wouldn't work. Even if we
plug all the existing holes and make it work, it feels a bit too fragile to
me. It's something which can easily break inadvertently and cause subtle
failures.

If we don't want to do locked rq tracking, we can always use
schedule_deferred() when any rq is locked too. That's a bit more expensive
tho.

Thanks.

-- 
tejun
