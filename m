Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF062AE68
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747080021; cv=none; b=dd4XDE4x20drIJYlMNHjlHKumdViYDCGB4mWiLCZyO00ofQN/VD9Rt1N9n+jvZhLqF+3jMcTum+uZ4Vr0vfWVijPnB/E/EuppRrcaVD/i+wEQx6r07/Uiyurj1uYmECBeee041JntCQpqd4tqfSBEgUSYdEXcUSaOAcvY7hFyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747080021; c=relaxed/simple;
	bh=UXZyJgWX13mTDmjicZ9UQF94TEsRpcLNsaoh7lz0ct4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNY1pXB23o0iqJVkQXOgIa8QmwD6+h+kTvcchrniRWPZvq4HOY+m2kijgPewOFFSziwKsPDOhGN7ivUdDbM77TvrXVktnGFNqFWeqLTg/WrabQgYFJRvQU+1a/52voFMTJCQ+SGkpDDkUK9TyYf8KB6+mTyImiLcM/CiWebIw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJsjm74d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJsjm74d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D515C4CEE7;
	Mon, 12 May 2025 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747080020;
	bh=UXZyJgWX13mTDmjicZ9UQF94TEsRpcLNsaoh7lz0ct4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJsjm74d8pAiBW6U4M8V01hzjkAySFFug2jZgRfeVzPBuHNJTeKEMcYcAblUw42Hw
	 3rDUl15Raq0f9xI68E/xuMiUVxsUUjxPZd74Xs+VM0HECrMKzOeqAO8y5Vz7q7eBJt
	 R8xP/cL505CJphIQARAfrPpCbanHQ+EslcOB6uBjWzAhy73gi6dpg1ThpJrdiqKlyG
	 rfpP+B5XdR+ClFawMIqglXXVGFVKZQDjhAjinSQpCinV2jzDlBr4GOgXv27L1fMtEf
	 vbcoOAGFwmQNNMQaHjTv92SLHt0HDXM3Ry3aHlAhzMkQyjeMTgkLF0Nf3tE8a3Pub9
	 L3WQRCBoEAolA==
Date: Mon, 12 May 2025 10:00:19 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCJTU1yuc61zdxVA@slm.duckdns.org>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
 <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
 <aCI9_GBpky0cowH9@gpd3>
 <aCJHBSmb0mjCbiQ4@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCJHBSmb0mjCbiQ4@gpd3>

Hello,

On Mon, May 12, 2025 at 09:07:49PM +0200, Andrea Righi wrote:
...
> 	if (scx_kf_allowed_if_unlocked())
> 		rq = task_rq_lock(p, &rf);
> 	...
> 	if (scx_kf_allowed_if_unlocked())
> 		task_rq_unlock(rq, p, &rf);
> 
> Or at least it should cover all current use cases. The tricky one is
> scx_bpf_select_cpu_and() being called via BPF test_run from a user-space
> task (scx_rustland_core).
> 
> If we had a way to clearly identify a test_run context, we could restrict
> this to BPF_PROG_TYPE_STRUCT_OPS and BPF_PROG_TYPE_TEST_RUN (but as far as
> I can tell, the latter doesn't exist).

Shouldn't that work as-is? TEST_RUN isn't gonna set any kf_mask, so the same
condition would work?

Thanks.

-- 
tejun
