Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F82FEE03
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267305; cv=none; b=SMWZFfOmg0m5f4kbZWST5ZV6gDmUG6/MEckjh6hs6MrYtDcyxNVnzi4zBPodXiy/3HEKj8E4Mh2i/lca3dxdOjqaTo0uH/Zb2CeArNUphgGlIQ9pCQIZziVBqttzPPoEPPKMWqTjlltcELHpD+Ad7aH8AoQOSjGulH61YgFcULA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267305; c=relaxed/simple;
	bh=Ig42YHRYmrVBbfi+OjXog9hjn68e04E/1MFqgrmGhRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRilujXowGLSEzbqnKDSPUDyOU/yitwoZJTP5KCSSzh4G3JilGUHbcQ3fkgw8PKH5H9ge5rlswjpjGTZUtTg2P1KLKvyiq8J5+jYX2qDeDWQ7ijjycm80n11mhXttyjZ6jbRF3NMm7HA/QBc9bhce8rZEWKaYrII1q8weQO+FYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IMjcnwy7; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IMjcnwy7"
Date: Wed, 18 Jun 2025 10:21:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750267290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3NpJ38lWR4z6hqaBFLevEDpaHIfTo7YXuZVNKBzsa8=;
	b=IMjcnwy7QV5re4ok3GMG3nK6OJGJLk0CMZXqK4kGOCF51d6Vyxgv5wX6mawvSWkMJej1yZ
	xcbNOKct1Zihy2R9FrF3njNWIK4R8yLSP3PR+XNLsEC36AG/al+a66mGXOcujTJlskDf2r
	z7rOfOMjh7+FqGnEXREqqni1Jijqh0c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cgroup/rstat: change cgroup_base_stat to atomic
Message-ID: <4rj2fju2cerlxarbqjmd4222jqeoqtltz57uo3ztw6nhirbotk@66brhfp3t5dc>
References: <20250617102644.752201-2-bertrand.wlodarczyk@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617102644.752201-2-bertrand.wlodarczyk@intel.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 17, 2025 at 12:26:45PM +0200, Bertrand Wlodarczyk wrote:
> The kernel currently faces scalability issues when multiple userspace
> programs attempt to read cgroup statistics concurrently.
> 
> The primary bottleneck is the css_cgroup_lock in cgroup_rstat_flush,
> which prevents access and updates to the statistics
> of the css from multiple CPUs in parallel.
> 
> Given that rstat operates on a per-CPU basis and only aggregates
> statistics in the parent cgroup, there is no compelling reason
> why these statistics cannot be atomic.
> By eliminating the lock, each CPU can traverse its rstat hierarchy
> independently, without blocking. Synchronization is achieved during
> parent propagation through atomic operations.
> 
> This change significantly enhances performance in scenarios
> where multiple CPUs access CPU rstat within a single cgroup hierarchy,
> yielding a performance improvement of around 50 times compared
> to the mainline version.
> Notably, performance for memory and I/O rstats remains unchanged,
> as these are managed in separate submodules.
> 
> Additionally, this patch addresses a race condition detectable
> in the current mainline by KCSAN in __cgroup_account_cputime,
> which occurs when attempting to read a single hierarchy
> from multiple CPUs.
> 
> Signed-off-by: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>

Can you please rebase your change over for-6.17 branch of the cgroup
tree and resend?
