Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E75291880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150572; cv=none; b=cawn88PfpkM7GPuC4quLlwSP4JvccPFUeRQvfscGuxLYmqz6a6u8o3r4o9gQporD4Kxxpc2+vpCGHDAJkExSYrqk81nG7XNfx1OCyab2QPObVRhpt2OGos0GKQp7d2TyOI6U+xK3mjD/4CcSnWZsAgBuUjG/g68p9cR2VFwwUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150572; c=relaxed/simple;
	bh=ammezWLERgGv5CCJCoHGzZvxacEr3SB2rHBRGFbdTh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9otgQ3llGTe7+KPiRKuwu9vQ/XwPPE/00wd4VQc0nOyx5Pg7JTfqPu/YjFQG0pcPkoC8/GekPvj6dIbfljuOr9sM+Q9w1bDvb7kOAY34M8+jKiCQPwgCL834hQYmrVPttuyTGHBloAfN9pbIGwNHaotHsTLnZu0EiddObbhHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eNZLq3iK; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eNZLq3iK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zrZPx0STfRRus6zvHgDdFyqAJdk67cYWcmtLJpHw4IU=; b=eNZLq3iK9iEUMstyXFzvy5k331
	OHkm3FQ2xTdgVZLc8VHxtufFGI874492yiXGzSeaZSAJBxpVxWdRA5f9tw+MItWmlaEEuBTV6p20V
	vQSNE9FczSKiR6my/nr5qm88gpbGw/tW+t+Y9GtSSjncJVVVB2pG5uh6NdpvGGx29JkCDZI/fz/IG
	5MvW6xm9MjfkaajvADUpp0h2AC+IRtSCM/Y8Fky660xzw6h/ToTrjZOA+7GQ88uoUeSRivc+ErY4Q
	gc4NNyAd8m0iEbd1dl+JJCZbu6uOgxjjjHEDqxXdU2staLV6I7XP9/ObeD3d56fDIJq7miHaNCXCX
	/NbJAFPA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRS6q-00000003kd2-0y9V;
	Tue, 17 Jun 2025 08:56:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EA703308523; Tue, 17 Jun 2025 10:55:58 +0200 (CEST)
Date: Tue, 17 Jun 2025 10:55:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>

On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
> 
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
> 
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.

What's this FIE/CIE stuff? Is that some ARM lingo?


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..8bfa846cf0dc 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
>  	if (dl_entity_is_special(dl_se))
>  		return;
>  
> -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> +	if (dl_se == &rq->fair_server)
> +		scaled_delta_exec = delta_exec;
> +	else
> +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);

Juri, the point it a bit moot atm, but is this something specific to the
fair_server in particular, or all servers?

Because if this is something all servers require then the above is
ofcourse wrong.
