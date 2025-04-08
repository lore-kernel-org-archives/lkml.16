Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4649D14B092
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135291; cv=none; b=BvOdkwS3nBOmsYhy7cXpvj1ELXaUwzJs2dkWYAvLuxWq27KXsFhLdotHVJe0f5163lDTMbc7rAiZFehKggdKROaXVpBaZCUHMbXHNzleF3ITmKHlsf/gueIYxyex4gO8CHGS8ypeZDmKGRxkI2XMXRzIiMu6vkgrecRbakQzWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135291; c=relaxed/simple;
	bh=lMscrNdBK9IGzo5eTM22brzWOrDsP1vhnJnb/3p3cPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QebZfVkIU0Mut1tpdxdJ6o3zgISYC4K3eX9+gUcHmHLXvFZzRIAHAi7J+OdsTSujEkEFeguOgIl33CC8T6pjKoTrDsTVbg96/5Bg87zhNjN2ey6hPff3XpFlhDo/z2/jKeLAnW5C2piVuxrPMSRNxocOECLuwCFelhtAqpHCegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGHhXKqN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGHhXKqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D6C4CEE5;
	Tue,  8 Apr 2025 18:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744135290;
	bh=lMscrNdBK9IGzo5eTM22brzWOrDsP1vhnJnb/3p3cPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGHhXKqNc7RyG4uHOJ3j6oyHqQG3mzeWQoVCt1Yntrxps/2axtpdHHXmVbfRXQjf6
	 eov6lRNyxvqAaz7LbQZqmM+HpDDBjmiX8Lbx9JqiOqBjeWaEMJaoQ7N6K0tSlf7i8J
	 SpUah57HJYvhMOHFqMch5a9s/JmjQwViQhZW6aA3eh/60Mmf9myfedJiqJfkKc1Ufu
	 ecjRV3gMIHsdgAu8KzSkcKV0uTr9BJf62iKNCBiiOUif4wSbu644ZoRgI88A6m0rQ4
	 3XEGSOb2tbGyeE5RtBj/VwMQ+5o9XVaYgXgThwol1h6yxPxpXifccUwdi8J2s1I6yP
	 2WtWBszWtXJJg==
Date: Tue, 8 Apr 2025 08:01:29 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Remove cpu.weight /
 cpu.idle unimplemented warnings
Message-ID: <Z_Vkede_M_VxPl08@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_VjE_d9A6wRfZlx@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VjE_d9A6wRfZlx@slm.duckdns.org>

On Tue, Apr 08, 2025 at 07:55:31AM -1000, Tejun Heo wrote:
> On Mon, Apr 07, 2025 at 01:20:04PM -1000, Tejun Heo wrote:
> > sched_ext generates warnings when cpu.weight / cpu.idle are set to
> > non-default values if the BPF scheduler doesn't implement weight support.
> > These warnings don't provide much value while adding constant annoyance. A
> > BPF scheduler may not implement any particular behavior and there's nothing
> > particularly special about missing cgroup weight support. Drop the warnings.
> > 
> > Signed-off-by: Tejun Heo <tj@kernel.org>
> 
> Applied to sched_ext/for-6.16.

Strike that. Applied to for-6.15-fixes instead. Better to get rid of it
sooner than later.

Thanks.

-- 
tejun
