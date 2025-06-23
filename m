Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65323C4F2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709815; cv=none; b=MJeoldjJVgzq8RM9uqv5UGmfrcMVEOERbdBAiqT4inhFLyvv4F1uWK+jArifrgXaUSJKUsJKEyjZVbqDKMGJatTAVam8SN/7EL4up3VEWOIjUDRL3AfJPdDaLMzWWOo+UpjeVVgtzyK9Uq3M3gTsh4atZysrfC1Vdviikx46XRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709815; c=relaxed/simple;
	bh=h02DPzfNm7HGO9Zd58f+8iys5DgBStt20/b3S7ApPNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6dMSlLZw4wazFitEJSCuiGTq5oJ+oYJ0ZE43OzSq7EMrUrIz5R/bu5fKvNvXwjg5VdXY6ZFZWMvuIfVoHN5dW298IbWUOKsP+TAMdTmv0BnZbAB8vsRMdTGSl+LArS15/wVm4aRddDqyRrfJBTStNUnebeTS1DJSnQW3+NA4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYJusWiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYJusWiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEABC4CEEA;
	Mon, 23 Jun 2025 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750709814;
	bh=h02DPzfNm7HGO9Zd58f+8iys5DgBStt20/b3S7ApPNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYJusWiXGwMil1AbgD5HPAiQ0BYxSzFtIrQkZ7zyxfI42b1/rMuoGk4i1b1KGPADM
	 VlG7qHCClQgohQzjc1PGjviK4EqyTkUI6JK315yiYiX30KUTTYxPUKm0qf94LWv+gH
	 joKGLAHu2IJLKt3sVIjvHk7F9qkmFImNhOs39TxZSdK/LqLqRoWWaEUysCaePUzUhU
	 hi9Y/o1WTRje95JMRqbEcMiy30URV/vvERuM2AqG3wcdZsEa7LS8/5b4td8lV6CyzR
	 6/1JNhit3bwsR1GtFwYEp/cA7blqdJ213gNyyJvvaRAj0N07IvlNBYOSIjM1ozFjHZ
	 h38x19bzje8yw==
Date: Mon, 23 Jun 2025 10:16:53 -1000
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
Subject: Re: [PATCH v5 02/14] sched/debug: Stop and start server based on if
 it was active
Message-ID: <aFm2NSeFE9LJS_BU@slm.duckdns.org>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-3-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-3-joelagnelf@nvidia.com>

On Fri, Jun 20, 2025 at 04:32:17PM -0400, Joel Fernandes wrote:
> @@ -381,7 +382,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
>  			return  -EINVAL;
>  		}
>  
> -		if (rq->cfs.h_nr_queued) {
> +		if (dl_server_active(&rq->fair_server)) {
> +			was_active = true;
>  			update_rq_clock(rq);
>  			dl_server_stop(&rq->fair_server);
>  		}
> @@ -392,7 +394,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
>  			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
>  					cpu_of(rq));
>  
> -		if (rq->cfs.h_nr_queued)
> +		if (was_active)

This is minor but the style looks a bit odd to me. Would it make more sense
to put was_active in the scoped_guard block and do something like:

        is_active = dl_server_active(&rq->fair_server);
        if (is_active) {
                ...
        }
        ...
        if (is_active)
                dl_server_start(&rq->fair_server);

Other than that,

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
