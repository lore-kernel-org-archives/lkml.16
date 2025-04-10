Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD9284B56
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290223; cv=none; b=V6joWDuvui+5CTbks/E0TGCtSqD9baF5sv7rrZevhLY4Qf4Y3ESphChK++GAlZB/g/HmIVN7Q/HDiXYuAoozJDZ8QYHgDJ1U/PV8y+X4xfcECxht7Wr6NmNopec7ePgSDiXButf+ou2Sv4msFa8xEjOX2ibVn0usdDeLz/cy7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290223; c=relaxed/simple;
	bh=vA/gCsoIgkSva5mOicjAd1iIvdctkBeNksiFHCeSE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYMb1dTp560/rZNJ5zy2nHZHF547tMfbFIOE0CCAD4Cy5tyqMSp6u7+PZzE3eIVvYGK/p9Hcw5CFpjzzr6W3tiO5+ocRFydimvuJVgs+XqQDnFYfGhqJYZVrXDXRzIv9TLtmL/iC97QWqDlv6b0zzOCq9E0TPO3YuUhFj9s/aBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laNUUSMN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laNUUSMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89609C4CEE8;
	Thu, 10 Apr 2025 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744290222;
	bh=vA/gCsoIgkSva5mOicjAd1iIvdctkBeNksiFHCeSE2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laNUUSMNLuJNWpwGE3BYsaFGLV/9l4foz2/xgT9DIrX2JphBCx/7lOveWH3yV4tQh
	 OR80bApUZZCw4VENloI+LzskAFluBEtbIOTJ0FXv24GhwhzOrS9int3x1IMJZ//DUZ
	 aXkhs4oe8oobTBeXZQWU7Lq+rlgvFI2MyFJEMfc1EUqtXrt2KZqoPV9DjZ6F7sphxt
	 Ul25AetPcKsWfp9L8InJIt3NcKg4VZD4M788u5jObpfRkYkJqXXS1Co71E26IQdhyT
	 UQcbPvDCidzGL8yMfSXCZDf+2bUWQUrBWWG26wZlhzwH4YFSLmTA2KF2csujuV/Avl
	 hFRTV8QY0ce0Q==
Date: Thu, 10 Apr 2025 15:03:39 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fBq2AQjzyg8m5w@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>

Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
> On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
> > How can that happen? There is always at least _ONE_ housekeeping,
> > non-isolated, CPU online, no?
> > 
> 
> In my understanding it shouldn't, but I'm not sure there's anything
> preventing the user from isolating everything via cpuset.
> Anyway that's something no one in their mind should do, so I guess I'd
> just opt for the cpumask_first (or actually cpumask_any, like before
> the change).

With "nohz_full=..." or "isolcpus=nohz,..." there is always at least one
housekeeping CPU. But with isolcpus=[domain] or cpusets equivalents
(v1 cpuset.sched_load_balance, v2 isolated partion) there is nothing that
prevents all CPUs from being isolated.

Speaking of, those are two different issues here:

* nohz_full CPUs are handled just like idle CPUs. Once the tick is stopped,
  the global timers are handled by other CPUs (housekeeping). There is always
  one housekeeping CPU that never goes idle.
  One subtle thing though: if the nohz_full CPU fires a tick, because there
  is a local timer to be handled for example, it will also possibly handle
  some global timers along the way. If it happens to be a problem, it should
  be easy to resolve.

* Domain isolated CPUs are treated just like other CPUs. But there is not
  always a housekeeping CPU around. And no guarantee that there is always
  a non-idle CPU to take care of global timers.

> > That brings me to the general design decision here. Your changelog
> > explains at great length WHAT the change is doing, but completely
> > fails
> > to explain the consequences and the rationale why this is the right
> > thing to do.
> > 
> > By excluding the isolated CPUs from migration completely, any
> > 'global'
> > timer, which is armed on such a CPU, has to be expired on that
> > isolated
> > CPU. That's fundamentaly different from e.g. RCU isolation.
> > 
> > It might be the right thing to do and harmless, but without a proper
> > explanation it's a silent side effect of your changes, which leaves
> > people scratching their heads.
> 
> Mmh, essentially the idea is that global timer should not migrate from
> housekeeping to isolated cores. I assumed the opposite never occurs (as
> global timers /should/ not even start on isolated cores on a properly
> isolated system), but you're right, that's not quite true.

Indeed, they can definetly start there.
I'm tempted to propose to offline/reonline isolated CPUs in order to migrate
away those timers. But that only works for timers that are currently queued.

> 
> Thinking about it now, since global timers /can/ start on isolated
> cores, that makes them quite different from offline ones and probably
> considering them the same is just not the right thing to do..
> 
> I'm going to have a deeper thought about this whole approach, perhaps
> something simpler just preventing migration in that one direction would
> suffice.

I think we can use your solution, which involves isolating the CPU from tmigr
hierarchy. And also always queue global timers to non-isolated targets.

-- 
Frederic Weisbecker
SUSE Labs
