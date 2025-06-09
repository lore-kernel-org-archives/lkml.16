Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29334881E;
	Mon,  9 Jun 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506962; cv=none; b=ZThLKI4/lQUA2Bl3pPSfhnNDy5IKm3dW4OACUjGa1rB5QVpLDzWW+3Gw2ChJcbwbR4GQbkirlz/8knonz1SZ6zJKZSjLmrCqFhYhfdP3Laa63WRnMw/r1I6Hgqu1BcOmmX7X2olGfCMcM5f6lvGYWXcl5DGHZpjj+6JVuviqDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506962; c=relaxed/simple;
	bh=8ltAwYFv2cksOlBrVdvRI5IV+hW9IlGKWfgQeMZpWd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bY0BAOhoyvJhuYB5wqklk3kiUkJVjRG7iXGKw3yWoY9Te2+pY3Lo1+oUQgFoiYGx44aZ0khqevYUTpj8xNwuFJlKTZQcSSpqJTh2XLmmHQsGCeoAxgjFBV2TMp5C6eeV4BiaA6DK9I4KWBpJp1i1rcqZLORgW1iy0wrTCUX3b+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TdnPezWJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TdnPezWJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4700041AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749506960; bh=YD2PzxwZONyeRBUM9EwLiCsPafBrl11N8Bu2mIZK0ZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TdnPezWJflyz+yXoHSYVsJD/fzIf9wORfxGQRWrLtEi3e430gpYtPHV3t61+kTr0K
	 1Kyx5ECeUfFNqpNOvJl+uw+UE0LVU73kF8I2S1Ti/cNrbP28eQsOWLgCbdH3h/nBXa
	 IoydCnzY+Ir+7JVbXDN5m9SxaACRDOE6yjt03Mi2mXNDfOfa8HV3cJj3cbklVunNje
	 yU5/vOsS+8QNUDRDIbL41sIRcXtqy4AOwDGAC/f0hHa8P/3tEqVF//RVs3g/MNZxkq
	 Di9Rr2j7a6HH1EA60AGpO5uodufMvnyR9Q/zmF6c41YKZIwH6PmRRLZGrnC0HrXXN6
	 PqY3Yr0xYA5jA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4700041AA1;
	Mon,  9 Jun 2025 22:09:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, peterz@infradead.org
Cc: kprateek.nayak@amd.com, gautham.shenoy@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 swapnil.sapkal@amd.com, Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH] docs/sched: Make the sched-stats documentation consistent
In-Reply-To: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
References: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
Date: Mon, 09 Jun 2025 16:09:19 -0600
Message-ID: <87ecvs8t4g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Swapnil Sapkal <swapnil.sapkal@amd.com> writes:

> pull_task(), the original function to move the task from src_rq to the
> dst_rq during load balancing was renamed to move_tasks() in commit
> ddcdf6e7d991 ("sched: Rename load-balancing fields")
>
> As a part of commit 163122b7fcfa ("sched/fair: Remove
> double_lock_balance() from load_balance()"), move_task() was broken down
> into detach_tasks() and attach_tasks() pair to avoid holding locks of
> both src_rq and dst_rq at the same time during load balancing.
>
> Despite the evolution of pull_task() over the years, the sched-stats
> documentation remained unchanged. Update the documentation to refer to
> detach_task() instead of pull_task() which is responsible for removing
> the task from the src_rq during load balancing.
>
> commit 1c055a0f5d3b ("sched: Move sched domain name out of
> CONFIG_SCHED_DEBUG") moves sched domain name out of CONFIG_SCHED_DEBUG.
> Update the documentation related to that.
>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> ---
>  Documentation/scheduler/sched-stats.rst | 53 +++++++++++++++----------
>  1 file changed, 31 insertions(+), 22 deletions(-)

It looks like this never got picked up; I've applied it now.

Thanks,

jon
