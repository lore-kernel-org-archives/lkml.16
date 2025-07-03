Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3250824DD07
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543418; cv=none; b=A6MlZ7q3tkdwyuPCqg2cPjFbGl3w2X/fqNgbtRfxhczD2PfjN8wTzhWWVmpW0ckxpMiIPJj2ro1CQk93vLfk4Enao50e4DdAA76bj6B7ViJ9GiqNojhrlUvhtobogvpS9nWzqCp9+DvJmS1O5C/sNyvOR8vYN08akXdYhTmrI9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543418; c=relaxed/simple;
	bh=x+pVDDFfXHxWSlT0CifMH/fKNmp+E1nKbAMOLGFeqs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OADZutHK0ODcuL0LEYd4Yl/MwnHvul1ldemk5zt/ZkzQ6Ksr3pruDsB7VU13Tma2FahHYPUzyApiqygxzrgEFob4prbgXxNu9xpYLtHve/rsPzoR4oz8ECQdd7UXbN/V/JBgE6WXeaJ9uDRwvJGMyMGOuATcSF9r/bdk+x9EjJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uEMgF25W; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uEMgF25W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x+pVDDFfXHxWSlT0CifMH/fKNmp+E1nKbAMOLGFeqs0=; b=uEMgF25WsPcr1+kqmodoLTJ57e
	oQv6xrjSWQwN6Cq5SFUV7WEVg2ax/M/fc5PelarYUZenEQhSfEtiE5Cy3PKrxacI9DYLrjn20JXjS
	TzCSEsHybwmku12BtJEyU72f07V+XmvkyLNLjhYcdRBnwHbMdRQErGRlhyRuhzMYyf6RJu0nTrJ+G
	Pok+A8JhYoWgOXLn+SZYJEpJ/LvArFUnvfm7O1sNgB7/Vr67QeZF3ZVtG0xSVlg/f5kT3F/btnlAK
	/w+Ct8OID5MyPM98kBGMemptCtJ2hnEopWDwScYxnbeH+fb35IfKTfNi1L0SNG3DI92B2SJBOpNBY
	kNoWco2Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIS7-0000000CxCg-15N8;
	Thu, 03 Jul 2025 11:50:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19A8C30017D; Thu, 03 Jul 2025 13:50:06 +0200 (CEST)
Date: Thu, 3 Jul 2025 13:50:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGZNTtJuCyHJE_25@tiehlicka>

On Thu, Jul 03, 2025 at 11:28:46AM +0200, Michal Hocko wrote:

> But thinking about this some more, this would be racy same as the
> PF_EXITING check. This is not my area but is this performance sensitive
> path that couldn't live with the proper find_lock_task_mm?

find_lock_task_mm() seems eminently unsuitable for accounting --
iterating the task group is insane.

Looking at this, the mm_struct lifetimes suck.. task_struct reference
doesn't help, rcu doesn't help :-(

Also, whatever the solution it needs to be inside this count_memcg_*()
nonsense, because nobody wants this overhead, esp. not for something
daft like accounting.

My primary desire at this point is to just revert the patch that caused
this. Accounting just isn't worth it. Esp. not since there is already a
tracepoint in this path -- people that want to count crap can very well
get their numbers from that.
