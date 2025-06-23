Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC819049B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709855; cv=none; b=Qx8V4McH6WOjjoOxl64AbQcrEEXhM+DFZKUc0VsURngPyW5p8YfBbY6JmRss/bqUINK69nCQ890/jS9Q/nyekA2/W1ClJElGy0AEVwwVCN2GGc0bYRfsL4YHmKZQN9Xt7zZ3LeNrdUEWmUp69rjHaWda8L+azObnFp25eSbOBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709855; c=relaxed/simple;
	bh=S3mCB0xVZb/vXWoFlWi/0lOsSNVNPOPbtuCqr58c+kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1kdWTHUOXbXJYtJOsCY06WCB63q5HFz3bx18BDeu/lGYUb/RD1l51r+twfD4k2H2p+G4xlAvX0zsAOjYUyik8w7m4XuW8wZdpiw7il57gzTezkAJWobs5H70zFZ8Ivdq3oiPfNWOKu041J1cHX7crrobyim+XdwVPDxU+yiCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mu1cCDHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mu1cCDHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7AAC4CEEA;
	Mon, 23 Jun 2025 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750709854;
	bh=S3mCB0xVZb/vXWoFlWi/0lOsSNVNPOPbtuCqr58c+kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mu1cCDHAbRCCbXYAK1kx09K+UvrzNBJHOYq2doZFvKQtkv0H0OgU/I4H9OYgmKWLY
	 acvfDDFuRArOrS0Rpesnme4qngxDirQSUS926NhgRvHO/CugIOt+9wW5riHx0PaYm2
	 /t9mZmyL6lTCNeNBooQ/0zitY1wM41VOZ4Kv/4xK+2g6IUwFQwVnFRRBXoeqxaOojJ
	 K1Io3+ZLtmzI6DpxkM7KE9mEpgnUMt11DzEmgK511ugEG6ech4BRh9agA3bJSu4ZqH
	 f3uMDXEKzU+2Ai8c1Rnjosl6R2mK/9uF0eaVAHqhEeUYzKA9sm2k4xzIYdRIMU+ssI
	 WXAzzdGPOhjuA==
Date: Mon, 23 Jun 2025 10:17:33 -1000
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
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 03/14] sched/deadline: Clear the defer params
Message-ID: <aFm2XaQurEXOGfCp@slm.duckdns.org>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-4-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-4-joelagnelf@nvidia.com>

On Fri, Jun 20, 2025 at 04:32:18PM -0400, Joel Fernandes wrote:
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..ae15ec6294cf 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3431,6 +3431,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
>  	dl_se->dl_non_contending	= 0;
>  	dl_se->dl_overrun		= 0;
>  	dl_se->dl_server		= 0;
> +	dl_se->dl_defer			= 0;
> +	dl_se->dl_defer_running	= 0;
> +	dl_se->dl_defer_armed	= 0;

Match indentations?

-- 
tejun
