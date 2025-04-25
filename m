Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6141E32D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606475; cv=none; b=kCBxZZM6C9O+QmeEYOfpQ7W37Xp/a1OGnXnZjOqip3zbMTKSPw0ywL+AkEpcvgdd0i0fMwNUi/DHNCcZnw5Yhyv5Iq0xDSnuSo+igMJ5WgENA3rBe+zS04Nq2533KtGX7mMkCvB/B5S/gkVRwAHn0xWWDDN8QvwPEUVszElWztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606475; c=relaxed/simple;
	bh=TLf5B1P7UXr6nnbB/ZbY+aAybWFlJvEAU0QJN6UMijU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVD9ll1vsgk9dGTpr8w6BZMotyuxZhw9S6JiXsps62tRK2YtA3jpMdu612eE6fgkj+Glc8Aohx6Kp5GSrXi5jLah5I/XUdYGmS26untlTHVLq58gsZzU4GiAoD55BLbmCEC7SQTQgKAiAkF5VSXogC4yzDUYgbhGn+oE5CKJzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX+uqhjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX+uqhjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A3DC4CEE4;
	Fri, 25 Apr 2025 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745606474;
	bh=TLf5B1P7UXr6nnbB/ZbY+aAybWFlJvEAU0QJN6UMijU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aX+uqhjOmQ7xUXbS28rdBw9Q3O7W5nZoEGP3TqjmQ1DrPxdHBmUEEzatX3G8v+2TJ
	 hCjLG+xROV/6HNBG2EDSujOi+hQ3bk6CI0gQPciTKU9rcuuxu4gkM90klqwdDvTHjx
	 EFm2f92JbphjcNklhxhAhHyF1flBKR1zE/82UumAuIPpceXN3S2WEb8qzjTOgh/rsa
	 L/hEpsnRIX+FoFcy/oq5/Ogf+t7zoDHswjNUv0ckPcuBP4ooSdSkcoa7ghQl1xKRLO
	 7qAmfn1MXb94nzon0ir8hasQ3I/NHWWy94yjQdlE+Vn0+b8wvmXWq4oIR1IZE2ICXs
	 D446ytuzEGcUg==
Date: Fri, 25 Apr 2025 08:41:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Remove duplicate BTF_ID_FLAGS definitions
Message-ID: <aAvXSQaJZN058qh4@slm.duckdns.org>
References: <20250425175702.1127590-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425175702.1127590-1-arighi@nvidia.com>

On Fri, Apr 25, 2025 at 07:57:02PM +0200, Andrea Righi wrote:
> Some kfuncs specific to the idle CPU selection policy are registered in
> both the scx_kfunc_ids_any and scx_kfunc_ids_idle blocks, even though
> they should only be defined in the latter.
> 
> Remove the duplicates from scx_kfunc_ids_any.
> 
> Fixes: 337d1b354a297 ("sched_ext: Move built-in idle CPU selection policy to a separate file")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.15-fixes.

Thanks.

-- 
tejun
