Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889822A4DA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716754; cv=none; b=RehI5Ufp2KIufD30JTsNShvNX9HHuWhEBpCeQ8kOK2ZZ2yimbQwmJqNIehX+KHqfBPawhWyyXq8St/XhhZ3scquKv9KiTp4K44Cpon1XZh0G4l+PmPQHCyCM5EUELwmiD9soNkISVLkzdkTGeIV8YFH5ba+21euQLxv0WIQfcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716754; c=relaxed/simple;
	bh=ho3zcw4A1svqP7KSnr5Y5m7So26IZm+NmIbonnKDlBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teyNB3ZIKPYDRt7KOxSQhsAIuM+clVtXdC8TUQ7nxVjLIYRfB+P9rzNhiLZpi1IYSKa2uELt7uCebwvWwqJ3qMe3adpuxSaee9J1kaOOr/HOXVedUlQ7u20EAW8hRtM5wfORiw1vH8F0O/YWEFgqFPHbgF55kqd4EXDTg3OINTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTLMvkmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTLMvkmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B538EC4CEED;
	Mon, 23 Jun 2025 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750716753;
	bh=ho3zcw4A1svqP7KSnr5Y5m7So26IZm+NmIbonnKDlBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTLMvkmhN5gFS0/PPqc+HAEQUetO/oK6xoc5+yI4wCDsSg+/lwHkTkqf9uf/JrcF/
	 uoO3q/q0PdTF2G5ExodnuFzG59zBaZ7r4rK7fZF3DgGX4ujGswC6AnJ+cU0bdIJ+YT
	 R28gQgHGXyh9eKSUWLzPwGLFRmfT6AY4gDGn2ApuBE1JOzVILj9lBs8Uiw22WnQLOW
	 54TLwFvYfAfbvJu1sQM78TM58oxg5Y6U/z5rcxpLe58dBRe8EGtpFSh+D5zwLGm8RB
	 KNwWuPWDzWKBl7RM0aEymMAUjx/FLvHYekqp1+BLDzfbirQdhBK3Xh1E8ar4/U54No
	 rSfo0xaQ1P22Q==
Date: Mon, 23 Jun 2025 12:12:32 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 09/14] sched/debug: Add support to change sched_ext
 server params
Message-ID: <aFnRUA1oY7BsBncv@slm.duckdns.org>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-10-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-10-joelagnelf@nvidia.com>

On Fri, Jun 20, 2025 at 04:32:24PM -0400, Joel Fernandes wrote:
...
> -		if (!runtime)
> -			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
> -					cpu_of(rq));
> +		if (!runtime) {
> +			if (server == &rq->fair_server)
> +				printk_deferred("Fair server disabled on CPU %d, system may crash due to starvation.\n",
> +						cpu_of(rq));
> +			else
> +				printk_deferred("Ext server disabled on CPU %d, system may crash due to starvation.\n",
> +						cpu_of(rq));

It's minor but the above is a bit ugly. Maybe pass in the name as an arg or
put it in dl_se?

Thanks.

-- 
tejun
