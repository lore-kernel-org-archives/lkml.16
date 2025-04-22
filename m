Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE1D1F5437
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745350437; cv=none; b=Ljkg2vtt5lAMHz3MhoTRDa3Lzzv1+wxMmwp9zAkXkWoJnMNyab0Ve2vBJZzplDenYLJTuhSyqa2YHjpvKWmTVik+c0mC1bQoJ53UEqe533rKFultHFcSOEH0wwBR3tyQV8aBlfZLxDkBO6Z87ssXteFvuAkkoVXdXHETGOy3NLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745350437; c=relaxed/simple;
	bh=reqaiu5VT9JP9DV2RrFxaIIun39isr1WpyjP9HdCZE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi5OjjQ/ieqBfxASSTLp8+Dc+q5sVxYBK90mnrjNXSV7r7L8QUOHW6gkIp6zEV11Z8s9Z+ORtVh/M8o08pg4TQBugvlooVVo1ZbYcvQp2h2wwj0uFl0E5qZW/Rpdtyp+kJ0J21zOLvfji+a/RZioqdupwOdHIe7i8laYmxwr22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcH4ItAP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcH4ItAP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C5CC4CEE9;
	Tue, 22 Apr 2025 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745350437;
	bh=reqaiu5VT9JP9DV2RrFxaIIun39isr1WpyjP9HdCZE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcH4ItAP3mVweRtR+Agiap85wkVvUfBEU+XH82mCOUvBRMS8pR1jb3Q3Y2hJSuvi8
	 /ly1gAB2ALCCqVe9VMnQxPt3NmjMAKQ1DnADR9ySQxOhcTfJXSCKov/ZpBOS7HQkZu
	 zEtpk0xDYabP/ep8gWdcDVLQF3pDPmhqCUSqrJgudG3h5f+/ZrhtW8WDbDzQsErIz7
	 VzAbY0lKmfUJgAD9H6IiXmMtSlwNqJGzYJA+TB/993bCuIrPzGrtxkBzSHe2rwAISM
	 8KaNaZmbzxdv4iu19UM1IP6zBAl5zzHi1GtWncRrMbugvMt8Fvew7VmExSsyv6K5gC
	 fesTghJKcz74w==
Date: Tue, 22 Apr 2025 09:33:55 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] sched_ext: Introduce rq lock tracking
Message-ID: <aAfvIx1l95o-2FlB@slm.duckdns.org>
References: <20250422082907.110167-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082907.110167-1-arighi@nvidia.com>

On Tue, Apr 22, 2025 at 10:26:31AM +0200, Andrea Righi wrote:
> Add rq lock tracking to sched_ext ops callbacks to enable scx_bpf_*()
> kfuncs to detect whether a specific rq is currently locked and safely
> operate with it.
> 
> If no rq is locked, the target rq lock can be acquired. If a different rq
> is already locked, the operation can either fail (triggering an ops error),
> deferred using IRQ work, or managed accordingly to avoid deadlocks.
> 
> This patchset is also available in the following git branch:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-rq-lock-tracking

Applied to sched_ext/for-6.15-fixes and merged into for-6.16. It had a
couple minor conflictsapplying to for-6.15-fixes but the merged result on
for-6.16 is identical to applying directly to for-6.16, so it should be
okay.

Thanks.

-- 
tejun
