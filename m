Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0F33F6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744329538; cv=none; b=aRCB1d4g1J2TNHskjIU805Ga0RSRj7bOvLoXr5/54q6v6btj+nD9krInRGz7kIXknMECrOwaeus7QR+jdfrLGD5aSn/BFfWIcyrNIxwSfo42+Tvrs8G2li++KXGH+01t6eDKd8ByBQLIeV/kjCFdrRq9tKUgezZpBIgQfBeAOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744329538; c=relaxed/simple;
	bh=zS1yfxeRokA8cnGRHyUwOOHvMnk8CAc9VfSUbBB1V4A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gyGLxHFfnxLbOKT5aTuR8V0Y6Z/bNH1j1DKl7MJn821SWAyaWlYY+J3vYUi1W/TmzJOGui84NT8kwQzKH7+4kAFNwR5CiCYrBvIAsFwvIqLiRPVJMTCTdP4soO1y8WM9fCTvSlYkAdDZl8pSMFZRSJ68D9OnhErD/5W3j0auYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p0BYxoby; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p0BYxoby"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744329523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zS1yfxeRokA8cnGRHyUwOOHvMnk8CAc9VfSUbBB1V4A=;
	b=p0BYxobykot/O1wR2GbeCtnrfajU9GwzxJ8f8GwbgEBhEu2j91HvknQrz3WTAEJGWGQY6g
	zi3s3n8fF5qVBdC3Rpfl5HWOFP1d7OnKNrksEfFWnqgk0uXCEgxnOQ92nThJjdQaotRnKG
	8ECyojXys5nIuJMOyEDyZaOu/QdiDEA=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Muchun Song <songmuchun@bytedance.com>
Cc: hannes@cmpxchg.org,  mhocko@kernel.org,  shakeel.butt@linux.dev,
  muchun.song@linux.dev,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  cgroups@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH] mm: memcontrol: fix swap counter leak from offline cgroup
In-Reply-To: <20250410081812.10073-1-songmuchun@bytedance.com> (Muchun Song's
	message of "Thu, 10 Apr 2025 16:18:12 +0800")
References: <20250410081812.10073-1-songmuchun@bytedance.com>
Date: Thu, 10 Apr 2025 23:58:38 +0000
Message-ID: <7ia4cydj1scx.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Muchun Song <songmuchun@bytedance.com> writes:

> The commit 73f839b6d2ed addressed an issue regarding the swap
> counter leak that occurred from an offline cgroup. However, the
> commit 89ce924f0bd4 modified the parameter from @swap_memcg to
> @memcg (presumably this alteration was introduced while resolving
> conflicts). Fix this problem by reverting this minor change.
>
> Fixes: 89ce924f0bd4 ("mm: memcontrol: move memsw charge callbacks to v1")
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!
