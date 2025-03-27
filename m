Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAF1A28D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095945; cv=none; b=sHpYLD7AQF/OJYTY5VKnjrt5uZSDDRiBIPyjGgxW+tdtuDiFvmn0pluGsMtzLoK8OebKwWsB3HWLebrA7yE95c30c0PHBcmscURj/whKHJ3OpshrbJQpesjcPU47vi21UhGK/leZhYRaxQ7pEcGj+o8Dcwyl7EaeUL8IOMY7kfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095945; c=relaxed/simple;
	bh=obhnZ94S9tmTE49IzNlDGIP5YjR1w9PDoJHTDx1VrWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6rJEGQHIPsNuYwCkNw4GUd8WRvDSULX5VY81rDr7jWSB7G9x2+0f0lmAq1UXkgJVRXEE30oNShHJrpYKK9PjaxbnJ/OSuPwN6Ftj7ZjIeG/wukire1OicfS9HtG84gGFdRWwzIm7KNPr8jLtw1MBAElu6/nclDQxgpBUNJT7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLYgfl2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLYgfl2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00FBC4CEDD;
	Thu, 27 Mar 2025 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743095945;
	bh=obhnZ94S9tmTE49IzNlDGIP5YjR1w9PDoJHTDx1VrWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLYgfl2VHleXyg0r3nySfB4zyxiAXgX85cfy1bi/FAAIfMqA7gGNhtQ5Rrz8ZdmQz
	 /jyqKWZyTm+gwnVwJBKxAaw6J7wPeKJrFTcrhtQV/MhIH31/xcrZuHvoPbA1fJPqpV
	 HflKOVP0Q5kpDNLN4FTkHjGB4ky95c1VxJkbtC6RswiAAuOsVSLU5nzMRKpmpGuCUv
	 3zz9vtjOtf/T0/3eXtCTnRFr+dDe8xM4DJ45ainh2GLXI/xQZt07isJpuO8gqZcvUS
	 QDz57jiMkabDdgvTQyGi2TtoDYYA2VJF7toa3kah5zDerll9u4u/57kyJPlLRDtiAY
	 FqzOwcsKtrg2g==
Date: Thu, 27 Mar 2025 07:19:03 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-WIh6obKP-ygcsP@slm.duckdns.org>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
 <Z-UEkJfkkBBKqCyU@gpd3>
 <Z-UgI3dSwcLa-CRC@gpd3>
 <Z-WGRetAL9tSPEkv@slm.duckdns.org>
 <Z-WHnYrNHHYx3lpa@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-WHnYrNHHYx3lpa@gpd3>

Hello,

On Thu, Mar 27, 2025 at 06:15:09PM +0100, Andrea Righi wrote:
> > If we don't want to do locked rq tracking, we can always use
> > schedule_deferred() when any rq is locked too. That's a bit more expensive
> > tho.
> 
> Yeah, I'm a bit worried that locked rq tracking might introduce overhead to
> all the scx callbacks, just to address this issue.

All operaitons are already wrapped with SCX_CALL_OP() and updating per-cpu
state (kf flags). It's unlikely that another percpu variable update is going
to be noticeable.

Thanks.

-- 
tejun
