Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18475502BE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968249; cv=none; b=fzl9FDTB1z8040QuBifkt+9j3L7zuxfA1CY8SVRcpPHEycTX6DoP1dWZQBxQvB19u4VATzx0xa2ur9CnIrsShJR479Gc7lUu6iC2fGXiQk91hPW9M+eb0dIvu4tuxPwDQEaRVEXUSw3J4DeZzFdZ4x399HRenkj/SBLttDfB8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968249; c=relaxed/simple;
	bh=+3cDRPMbgH1ErlQyXc47RVQ/8lKiTSM5Jgvns1McqzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOiQka4+bz4A1DVmZAImtXiSuhQuZPplquFnhsuHhW17L0IYObMF237Gu/F/me7xMmmh8MQ7+5TdSb+uaL9vjSaDXNpA+iSx7AbLZgdgBuP2USZEBpADpir7IkoYRLKdOBScFLUtOqW0GGND+vj8b0FGDmJCgynWKwMsVY8gNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMt4xMcE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMt4xMcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAECC4CED1;
	Fri,  7 Feb 2025 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738968248;
	bh=+3cDRPMbgH1ErlQyXc47RVQ/8lKiTSM5Jgvns1McqzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMt4xMcExWgMsXyAVd7Rx5jiCqHGK/RGYTSRksfyhn+IGXyuB98HNcSb3ym5/o5CS
	 2AUWdPDrqcp4Kvqwf5s65M6/Pjglsxw6E5JOFnBwZuf7KSEM9f2IajOEV63KUvEy5b
	 iNak3B03Xvti2TPJbqEWTaZ+JIJQ+mCbf1DqcjY3wN+i/dOANmMG9AZX5ZyzoehHPA
	 +TFI+9Vj4HPr9w7x7AAN14Uu23HRNCr5EyPjT4S6i1DdeJy36+l77nt+h5yGV2NaI+
	 L4eCvyOsHCE/G08OhV0xgH8KqTfDF16AfulfY28eBSf84eS0C9OFTolMSWi8+36VIf
	 IjiqBF6ozivlQ==
Date: Fri, 7 Feb 2025 12:44:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.14-fixes 1/2] sched_ext: Implement auto
 local dispatching of migration disabled tasks
Message-ID: <Z6aMtxceyZsi5PfC@slm.duckdns.org>
References: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
 <Z6aK2J4F7fnzugxs@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6aK2J4F7fnzugxs@gpd3>

On Fri, Feb 07, 2025 at 11:36:08PM +0100, Andrea Righi wrote:
> > @@ -2014,6 +2029,11 @@ static void do_enqueue_task(struct rq *r
> >  	    unlikely(p->flags & PF_EXITING))
> >  		goto local;
> >  
> > +	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
> > +	if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
> > +	    is_migration_disabled(p))
> > +		goto local;
> 
> Maybe not in this patch set, but it'd be nice to have an event counter for
> this, as skipping ops.enqueue() might introduce latency issues. Having a
> feedback could help to determine if we need to enable
> SCX_OPS_ENQ_MIGRATION_DISABLED in some schedulers.

Yeah, this patch is headed for sched_ext/for-6.14-fixes and the counters are
in for-6.15, so that can come after this lands in for-6.14-fixes and that
gets pulled into for-6.15.

> I'm also a bit conflicted if the default should be on or off, we're
> changing the previous behavior, but OTOH this is going to prevent some
> potential breakage (due to the nr_cpus_allowed mismatch) and server
> workload is going to benefit from this, so it seems that there are more
> pros than cons at dispatching migration_disabled tasks directly by default.

Hmm.. I didn't see a lot of migrate_disable() while testing with stress-ng
and migrate_disable() isn't used that much in the kernel to begin with. Do
you happen to know where migrate_disable() was coming from when you saw them
with bpfland?

Thanks.

-- 
tejun
