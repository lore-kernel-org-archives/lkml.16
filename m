Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5B10E0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517690; cv=none; b=Wx7IQRqLOZL8DhvSB0SoiTZzmSveqvu6FxFAjBApWdqrqImYPB9Oy5DBW0OGbpjmktXH9GenGBM13ptS8ML3iQ2q2xa3YPSGGdTylXhmETNyrg4LSb877rpRTnyLSXaWX9JBNasUeLWdREkYp6PhcINXhiM0sbkTqXVVZpkncIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517690; c=relaxed/simple;
	bh=gF7+zNsql05kE74EZKi8zK1kYBtci6KMkh6j3d9Apzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl4EMPGAOaglfZcnCIewSVbTyTe98kchB7caIDjYr9zdk+oUSLMnID2dsU/TIXV50brKMTX+e7U5Ar8yjyeVcxLJ10zjIyK1i6jO9H8Sn517ghG++YKZ4QB5Gyp97MEA9k4iJYiAqrHay5nTH79BtJhABQJdaJYKU943nMeF/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B89nlZTg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B89nlZTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD3CC4CED1;
	Sun,  2 Feb 2025 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738517690;
	bh=gF7+zNsql05kE74EZKi8zK1kYBtci6KMkh6j3d9Apzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B89nlZTgA6Qp+xxhRxTwXThliIRLp3kQAMLAj4OXiQotuYBIWzuKRC4N2WdRTjHxr
	 Z2TTzFPFXzOBq12iX6zTEYcGE0AV/kIz47axXA9vq8qbDhcQWi/tpzPjvvrHDn7Yb/
	 vgwurOVtJGW/5ReDjkjEyDd6kOSSzPvL8mpjoapgLP4hoZWOvnvs0xfDbdVToH16ae
	 lKZz5o+VEf7+xDRmWVVdAS7nG8hpnVnxW0evqrM58XRckwGcjA11D3CHgG+droNa8Z
	 dmXs3Y7rIc5/IGzW2GAL8eD5BTjtugQ92BTnKd1N6BDiKC+e2RNimBuhxs/dWkoHVj
	 cyd/A7fN6H9Yg==
Date: Sun, 2 Feb 2025 07:34:49 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/11] sched_ext: Add an event,
 SCX_EV_SELECT_CPU_FALLBACK
Message-ID: <Z5-suR7WL9Y9jsOv@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-3-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-3-changwoo@igalia.com>

On Fri, Jan 31, 2025 at 04:09:29PM +0900, Changwoo Min wrote:
...
> @@ -2170,6 +2175,11 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
>  	do_enqueue_task(rq, p, enq_flags, sticky_cpu);
>  out:
>  	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
> +
> +	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
> +	    (cpu_of(rq) != p->scx.selected_cpu)) {
> +		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
> +	}
>  }

I made minor edits to the above block while applying:

	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);

Thanks.

-- 
tejun
