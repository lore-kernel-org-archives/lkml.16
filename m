Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EAB208CA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427589; cv=none; b=oQX64un3ZWrCshmVMMuk4X8Hc3wNBC56AM1jt9VDbICD9ApoNDaATdPIih4K03U0ZSYmMKoDz6dtyCHvYhs9XyWf79iIsrkPVyx07g5FM5JyQ5a7YHePjitQMaOXEnKjLL3Eb3xDstVMolIw96xHNA/eEUuwsWY3v1P1LAeLavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427589; c=relaxed/simple;
	bh=1OuwfN7ccRF30E/+SBVUMx7F9WfrPXskf8z9CcCuT3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVlpmzRk96kW3GKsWvUcw2S+CugSzDThJrAeo1pARZEYNdNCcvRSBO6fbyHOJ6CmuxZd1gwlejMk/uPMlf/Ds6k3HWpYrWM4b3GH4b3uLVcbPglG7Fk5WYIGz6r6h9ucH8PT/jPN9WixmKwu65PbmvcW6eMBLRiweQWw0TbEF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLG7GLLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLG7GLLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090D6C4CEE2;
	Wed, 23 Apr 2025 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745427589;
	bh=1OuwfN7ccRF30E/+SBVUMx7F9WfrPXskf8z9CcCuT3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLG7GLLKII0UU4MclbTY7fR8BrQkyokLMUiEwZjRHVQm7EDG21rxryy9U4RcwKT10
	 zjXCiFugvNtlPH93x1mP7yJIEGyJ+nXGqxAOKOESzjpRjDHRzuR5omi1d0aUD2u5Xm
	 d7TqLwNh/qNKFclkk7Vl4RdsbYrlXzI7LcYpwgUpCGG3r1rQsNWu02UFZk6YGPdtk+
	 ien7YhO+zlndkShgX+LjRFoXelKVMVk028CDA9p+JtzrXbdQ85PMtBW4sc12AihJ23
	 dB1bk9Oi7LHjg1RaPObS9De1qWWLnwYMBiH+oSRl+avp8z7jSNded+NtmMo7suJyte
	 cButmNDDyjVjQ==
Date: Wed, 23 Apr 2025 06:59:47 -1000
From: Tejun Heo <tj@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
	syzbot+01affb1491750534256d@syzkaller.appspotmail.com,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v2] workqueue: Fix race condition in wq->stats
 incrementation
Message-ID: <aAkcgwmNBtetyS3_@slm.duckdns.org>
References: <20250423161742.14429-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423161742.14429-1-jiayuan.chen@linux.dev>

On Thu, Apr 24, 2025 at 12:17:42AM +0800, Jiayuan Chen wrote:
> Fixed a race condition in incrementing wq->stats[PWQ_STAT_COMPLETED] by
> moving the operation under pool->lock.
> 
> Reported-by: syzbot+01affb1491750534256d@syzkaller.appspotmail.com
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Applied to wq/for-6.16.

Thanks.

-- 
tejun
