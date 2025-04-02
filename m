Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D9288DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609742; cv=none; b=ciwIJVEBcsYNlY8ipnKT21hlXpLw7mb54tykr4CivupLOOU0S8G6ILQDlASJumjXY1VvXAB434J/SuW01XBou2IxLoJkjKNRMHT+jITvPA9G1FRXTishk9iqTyett/cpdsOi7QWvBRKr6DD3hSrabujgZrQCjgRaq4Tv5+BBaxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609742; c=relaxed/simple;
	bh=g+ItB0TOGMldp9DtR2kf9cNdmDO55ZBo5GikKFTiLGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAnPk95HCuaIMIn5r4laNZSF9O3AcKggEb2I+CbnbDn9iANwvsja792bhJ6XjpnXjv5l2YtBFmeQUR2KetC5l2gBN2nGgffpK72q/5aHr9++WWuA4zMfNqRTwIURBbaCCkC1cLmh22PV9oJoTc+w0FUiiRt2g9xxQEcRw7Zs8GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SnUqiwNG; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SnUqiwNG"
Date: Wed, 2 Apr 2025 09:01:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743609728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JiTnDWrOw4/ephyEm9Qze5QTOtw1WA47YfgoERGCeA=;
	b=SnUqiwNGh8mEp8ceCSuVJqNu6sO0Sw4G9JaSpakl7cQAZJM3BZMT6mRqHG3ILl3ZKWK2kO
	cHA9LGYybdOoavHgbF4TcT/2xVIblc9mhuPlxfYJrqTe+715TeVlzDjMMqepR/rs+Ji5W5
	sKgfwIvF8stwhl2Ji7JItS0mRw3utdU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Rik van Riel <riel@surriel.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	cgroups mailinglist <cgroups@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] memcg, oom: do not bypass oom killer for dying tasks
Message-ID: <q6ianzrub4plkvyhxqxy5zoqdweamccvvndnnsbfz3qho3ti2b@gmqmnuq2g6wh>
References: <20250402090117.130245-1-mhocko@kernel.org>
 <20250402152715.GA198651@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402152715.GA198651@cmpxchg.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 11:27:15AM -0400, Johannes Weiner wrote:
> On Wed, Apr 02, 2025 at 11:01:17AM +0200, Michal Hocko wrote:
> > From: Michal Hocko <mhocko@suse.com>
> > 
> > 7775face2079 ("memcg: killed threads should not invoke memcg OOM killer") has added
> > a bypass of the oom killer path for dying threads because a very
> > specific workload (described in the changelog) could hit "no killable
> > tasks" path. This itself is not fatal condition but it could be annoying
> > if this was a common case.
> > 
> > On the other hand the bypass has some issues on its own. Without
> > triggering oom killer we won't be able to trigger async oom reclaim
> > (oom_reaper) which can operate on killed tasks as well as long as they
> > still have their mm available. This could be the case during futex
> > cleanup when the memory as pointed out by Johannes in [1]. The said case
> > is still not fully understood but let's drop this bypass that was mostly
> > driven by an artificial workload and allow dying tasks to go into oom
> > path. This will make the code easier to reason about and also help
> > corner cases where oom_reaper could help to release memory.
> > 
> > [1] https://lore.kernel.org/all/20241212183012.GB1026@cmpxchg.org/T/#u
> > 
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Michal Hocko <mhocko@suse.com>
> 
> Thanks, yeah, the investigation stalled out over the new years break
> and then... distractions.
> 
> I think we'll eventually still need the second part of [2], to force
> charge from dying OOM victims, but let's go with this for now.

Agreed.

> 
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> [2] https://lore.kernel.org/all/20241212183012.GB1026@cmpxchg.org/
> 

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
