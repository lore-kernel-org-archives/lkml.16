Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39B22F392
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134932; cv=none; b=jznqLZkbcgl+GLvoZwUnuQoxxf0dkhsdWPjy56DrWc1/sOggqMJVKiUR/W4Ormnixev9gXBWEdFVBXOvU8vpesoJCkadbziL2SWS5vwMV+4/KRobyAN7zi2loBBkyJhFzqlDHRXrcrZQE+OypHKlLYj04kHfMUY+T3dWjwKSgOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134932; c=relaxed/simple;
	bh=yRmas3K2xieaNhlmr4YhUVvJP1wdvguN8jnJktPsuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ95sVHziusFL5Hj7M3pgmEieluRJCx2n1xRjc04iiRxLy/1F9qnVaeBlDADsKQ/o2/+Q2AWq+f35HKw6xDyrnITSd9OSNS0N1WubtszGLNRHP+50wHFLVaTpHLgL0PfBCA2r1bD95TAETjUfd+mg2951zpNfSvv+CcAg9q9jec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0XE6s/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0XE6s/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31262C4CEE5;
	Tue,  8 Apr 2025 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134932;
	bh=yRmas3K2xieaNhlmr4YhUVvJP1wdvguN8jnJktPsuaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0XE6s/EoS129ZTPP03lyNLBNr89ml4RGg/zzFnUTW9DKHiN/H54bAzo4GSoEE6x5
	 gd7S5RJiCYot2SnEr4iQJufcFBYuQCtdHICy/60HOnlK35L2oB91L7pTpQ+bE1J0e9
	 +/WvkTYSAXxSi82uHhhmIOKmC6ug254jDQAJKkGAiakhwzDfQotJJcVz5Jrv1aGMHn
	 2ogNSf8XGixUqMR/Ey99e9r6j/UvC4q9yd9EqVLK3a3YNhVA/v5+EH3Mg4tniOyZ+2
	 yvQMn2yUVRqEPHLwXBXyr7eGYwjYEg1YWnPaPPbXHR/WaEd4i1vETcO4JSsshNc1mM
	 QY6Jt/7TGVPQQ==
Date: Tue, 8 Apr 2025 07:55:31 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Remove cpu.weight /
 cpu.idle unimplemented warnings
Message-ID: <Z_VjE_d9A6wRfZlx@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_RdpDkLCXm140RT@slm.duckdns.org>

On Mon, Apr 07, 2025 at 01:20:04PM -1000, Tejun Heo wrote:
> sched_ext generates warnings when cpu.weight / cpu.idle are set to
> non-default values if the BPF scheduler doesn't implement weight support.
> These warnings don't provide much value while adding constant annoyance. A
> BPF scheduler may not implement any particular behavior and there's nothing
> particularly special about missing cgroup weight support. Drop the warnings.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
