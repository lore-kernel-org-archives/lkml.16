Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70A2EB5BF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169690; cv=none; b=SL/sa0hGNPP4sUKyPlloi1aAhxzHUOLwaEOUXcvB/QPJcLdgUyxT+JoteOdIvTs/TOjyocKpPemSX/KSGkoJrSMPscZefVAi+XNJ8VRfAx0hDSNo5bvvY9OIUlQwxAKKCU+2P+KjOBnH5gJ17It6+CUr0pE9/ickVFkqECqooEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169690; c=relaxed/simple;
	bh=E34gYDo/+Cv1g8Ji683ccYFpCaR61dzNTOuViZtKEcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5W+KwE/HuVmi1B687EklkEdNw9ZHuHyMHlbLgosxzkuLowaoLT1Bfkpz2RVqgAJZ5I/Xn9a2FaOch30UL5/6NYohb2F36HO/hfuwIKzoPLb+YUZ+QJ63ZtOT+C40nBm7HviCTHchY2Vpaqto3qRFXBsSAS2uLmQWQtrQgm9ePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C9+uYutB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C9+uYutB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yJP0GPyMKswwkaA1sdEsRQYeektr28qBzPz6H5BQJ98=; b=C9+uYutBKalrTGmUZijIbg8NAD
	QRCJan8vuyS1Kc3esAYZg7nZX9wEFsM7QoAZSimDwuR2aX3v5uYMLOSeJUslAXF4I9vSi5nCGThnu
	xGVI4davWmEdbId93nms4ZYLxRBCswq5kOWfJediW7CvBJiIz5kjyWuDbrPPItoVHuVpqz5ei4Ry9
	HSlMYHS5S0x34KLMqbCcwQzaJA2+AGhhdGDjv1X3LZEe969pdkGDDT/wkFeGdULFQnbyM5rWoW6em
	R6mneQPxqV6rEBe53xNfwNI57Jws7ru1dutsziGhwKuMjkmn00l1MWZ4yppIvUXrQOxc80ZlK//wK
	yoFSuUzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX5C-0000000HF1b-2N99;
	Tue, 17 Jun 2025 14:14:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5FA7630BDAD; Tue, 17 Jun 2025 16:14:37 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:14:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>

On Tue, Jun 17, 2025 at 02:33:15PM +0200, Juri Lelli wrote:
> On 17/06/25 10:55, Peter Zijlstra wrote:
> > On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > [Symptom]
> > > The calculation formula for fair_server runtime is based on
> > > Frequency/CPU scale-invariance.
> > > This will cause excessive RT latency (expect absolute time).
> > > 
> > > [Analysis]
> > > Consider the following case under a Big.LITTLE architecture:
> > > 
> > > Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> > > FIE: 100
> > > CIE:50
> > > First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > > Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> > 
> > What's this FIE/CIE stuff? Is that some ARM lingo?
> > 
> > 
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index ad45a8fea245..8bfa846cf0dc 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
> > >  	if (dl_entity_is_special(dl_se))
> > >  		return;
> > >  
> > > -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > > +	if (dl_se == &rq->fair_server)
> > > +		scaled_delta_exec = delta_exec;
> > > +	else
> > > +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > 
> > Juri, the point it a bit moot atm, but is this something specific to the
> > fair_server in particular, or all servers?
> 
> I believe for other servers (i.e., rt-server work from Yuri and Luca) it
> might be useful to have it configurable somehow. I actually had a recent
> discussion about this concerning single task entities (traditional
> deadline servers) for which as well there might be cases where one might
> want not to scale considering frequency and capacity.
> 
> > Because if this is something all servers require then the above is
> > ofcourse wrong.
> 
> To me it looks like we want this (no scaling) for fair_server (and
> possibly scx_server?) as for them we are only looking into a 'fixed
> time' type of isolation. Full fledged servers (hierarchical scheduling)
> maybe have it configurable, or enabled by default as a start (as we have
> it today).

Right. Then we should write the above like:

	scaled_delta_exec = delta_exec;
	if (!dl_se->dl_server)
		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);

and let any later server users add bits on if they want more options.
