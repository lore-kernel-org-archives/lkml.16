Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565F263F2D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422255; cv=none; b=FGyJ7twqkChnCW+0+d/3bLwqq3J7N62i6lXwnY5CKlProwAC0/VYrBS7lVDFBPhwyVd2RyB4AamfGlZ+ETgJmY1/FsY0UM5qS3347waQlzLJMg1Eqi74CehdEi2nj9WXAZl/hQ2cLGZumo0vZCZWFTHrX0l2N1QIJj2kiYc1DAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422255; c=relaxed/simple;
	bh=pRGZRE/J9Ym4C0y5/OE2t+BlXhI2eeAOLYTZFR8RKgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+CUAIEDa9RdLb7cZomssCY1fMubb6CcymMDTX2RcqMriJb6sYbf22phR2Z7KNV8ggR/gbgpj3vIhLh0kXswf2V5nK6Q9q72tcUblJokiBqP7AEwOqkssmmBs850g6evjq+tUKo1dWQC4v9azcCqLUkDUyUYgyzTfg3V3bSE8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btPf0GO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btPf0GO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07301C4CEE2;
	Wed, 23 Apr 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422255;
	bh=pRGZRE/J9Ym4C0y5/OE2t+BlXhI2eeAOLYTZFR8RKgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btPf0GO1KzfSYvGrT7KbaTDblenmKQzpMynLCtktPltTlhX/JkwZpmiVjWFIh2AHB
	 RFWScL64AndoRPXbx8TOZkLG74fBVZ7uVxNv/F39xl5hAzT31dN1ZUctej7u9qmHne
	 Ja+Rgue+06K82g02kuIisSdiYNdtccy7XMUCDqEN2+CqMXfZtRlJXzTa2LUSDRJaWR
	 pgzza336Ppz8juASOrZrR191zQySkWT2KP+UtGrShx3ijDkWUFZn6owyDXwoNZHNc6
	 9GOO/lFL55MCgK//hGvGSH2v4WQs55Hf6qYQB47Ap5jW082mRgiBWS/+QQO6cmfwi9
	 TwJr3NT0c7qag==
Date: Wed, 23 Apr 2025 05:30:54 -1000
From: Tejun Heo <tj@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
	syzbot+01affb1491750534256d@syzkaller.appspotmail.com,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v1] workqueue: annotate data-races around pwq->stats
Message-ID: <aAkHrjU22pCSkWif@slm.duckdns.org>
References: <20250423125341.503659-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423125341.503659-1-jiayuan.chen@linux.dev>

On Wed, Apr 23, 2025 at 08:53:41PM +0800, Jiayuan Chen wrote:
> Suppress warning by annotating these accesses using
> READ_ONCE() / WRITE_ONCE().
> 
> Reported-by: syzbot+01affb1491750534256d@syzkaller.appspotmail.com
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  kernel/workqueue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index cf6203282737..d78640b5d188 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -3241,7 +3241,7 @@ __acquires(&pool->lock)
>  	 * point will only record its address.
>  	 */
>  	trace_workqueue_execute_end(work, worker->current_func);
> -	pwq->stats[PWQ_STAT_COMPLETED]++;
> +	WRITE_ONCE(pwq->stats[PWQ_STAT_COMPLETED], READ_ONCE(pwq->stats[PWQ_STAT_COMPLETED]) + 1);

The function acquires pool->lock down below. Can you move it down inside the
locked region instead of adding READ/WRITE_ONCE()?

Thanks.

-- 
tejun
