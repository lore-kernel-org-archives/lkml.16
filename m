Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8128B4E0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656308; cv=none; b=uGjRo3CZ0v6z9evEtS4r+JbCy7gObQcFJLhC28R6it0B1MtGnKiUMnJa4zrg+sTycXxJ1o/jj3C4+OMKvF6ZmHo1iIAZqbvZXYrDerROvy3Dzw6fwwHlWiTPVj/67IczOKLvnqIdi2tDGf4/+8sb2SJe9/M9BMefkjv2GXA6mEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656308; c=relaxed/simple;
	bh=GKbEjGwaeeuz4P18SdEWi3KA3yTaFC89U8NRwU2OdHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUwMf9l0wwW0GeQPxYBRpAAnQT3AwSoRRS9lB3wtr57XWye8VLy/e1V3ka+ORwwklahwaoNWPDJ4umym8PQVJUaMjGm51+jaRGRsgHWwSGFxeZ4nVBc0C4jYviLh0VJgQqRVvVwpb6qiur4EYWsTcJhgePBv+Th8QvDgKp6uy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u7sxAJ6N; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u7sxAJ6N"
Date: Mon, 14 Apr 2025 11:44:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744656294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IE34eKIrzni8w8jruJy7hhdwzJ4NPk/TJmLf6LYd+yw=;
	b=u7sxAJ6N5cToxpICD1gtAyZcq08ZDvYeAGIZpo3/nHwIhpy8rlLz3hdJLyZqnxdCLX2A7G
	JmQ41r6Mev5SvHL07Qm7zRLRPiHKd7/cTWExXmXkLPrnQ41EwTci0zDL7sklWDoGV0DTVC
	3aVYjUvii+KT1jrtQTJOYGv53IhcZlo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Waiman Long <llong@redhat.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: no refill for offlined objcg
Message-ID: <ttlcvw2jiwloctvqblvoo4mdn7cg7av6uzauzjlwnpyevghnpt@jthjpbztrvii>
References: <20250410210535.1005312-1-shakeel.butt@linux.dev>
 <7ia47c3r1sb0.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia47c3r1sb0.fsf@castle.c.googlers.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 10, 2025 at 11:59:47PM +0000, Roman Gushchin wrote:
> Shakeel Butt <shakeel.butt@linux.dev> writes:
> 
> > In our fleet, we are observing refill_obj_stock() spending a lot of cpu
> > in obj_cgroup_get() and on further inspection it seems like the given
> > objcg is offlined and the kernel has to take the slow path i.e. atomic
> > operations for objcg reference counting.
> >
> > Other than expensive atomic operations, refilling stock of an offlined
> > objcg is a waster as there will not be new allocations for the offlined
> > objcg. In addition, refilling triggers flush of the previous objcg which
> > might be used in future. So, let's just avoid refilling the stock with
> > the offlined objcg.
> 
> Hm, but on the other side if there are multiple uncharges in a row,
> refilling obj stocks might be still cheaper?
> 

Thanks for the review. I looked at the fleet data again and what you are
suspecting i.e. multiple objects of same objcg getting freed closeby is
possible. I think I should be optimizing/batching at the upper layer. I
will be looking at rcu freeing side which is the most obvious batching
opportunity.

> In general I think that switching to atomic css refcnt on memcg
> offlining is a mistake - it makes memory reclaim generally more
> expensive. We can simple delay it until the approximate refcnt
> number reaches some low value, e.g. 100 objects.

This is a good idea. For the memcg, I think after Muchun's LRU
reparenting, we should not have zombie refcnt slowdown but for objcg
this idea might help. Anyways this is for later.
