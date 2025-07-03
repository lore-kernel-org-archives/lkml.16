Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5CB292B25
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543714; cv=none; b=hO23D/jURxLDcuZxpLfDYjXJi2t5kqEvs+MG5o4ZtDKPPly7eYOSMDFnKHBKM2+Z8hKSpO7cD+qy205Qse2mlCfTkEyzhjWlvltJyR3L/7BVqXU3Ge2RAHGNYUTpR2BsAanpCZL+uxji2G+lYQY/iKNIS8k6qAf34CkQBZwMaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543714; c=relaxed/simple;
	bh=oIewnEJSo1vCoaaQoHG+O2LBIjZiQKqGJ+vTiG7rlpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVOXQid0AQ1H5fd0USyCr/z2PHWrkY2QYsjjpYz6dy3e0Bom9pWrevr0ypAzeVTBCornhGv4Ni3kzcNjGsAYwJf9Y/Pkxf5B8n2I6epEzqt7/3TyLEzx3HbCG37qattuHbOr+3lciV4a/lrfFTC/foIkA1ejEKfGpcuS2l0W9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UWNNhSoE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UWNNhSoE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oIewnEJSo1vCoaaQoHG+O2LBIjZiQKqGJ+vTiG7rlpI=; b=UWNNhSoEgbFNRw5T7NwVz5QlVC
	Iv4hWPdhQr5ziGs8oIXs+OP4C8bL0aIpFRN0uYK066Na8MbvDIVelMa41svySlRRt5DD3PdB8K8P9
	VFzVaex+MtD1Ezdv6WFPzbyiSbYSLYCe3rnThUpEN9jlu/rPuz+YGm2n9bva/7GQ8L9bUNCgPXSKS
	WOpzbqht/DJgAsRRRi2fTkvcoOasdezzZZ7yp8vpkf0n7ax7N+QocemSJ3oWkeB3I5Pcw6jbsCg9p
	AR9qiWVUGBD8wjzzdDdaIgTLlXQnWg0BaN4i7JEM0bRw8spz1TXxlF+bgSK3NICETLRrWkMF8zIX4
	D0pwmaJQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIWu-0000000CxwH-3nCh;
	Thu, 03 Jul 2025 11:55:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7290C30017D; Thu, 03 Jul 2025 13:55:04 +0200 (CEST)
Date: Thu, 3 Jul 2025 13:55:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@suse.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <20250703115504.GU1613200@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <aGYutwftSAPgPzf-@tiehlicka>
 <b6b9e035-5227-4aab-a0cb-0ab6e4d57f9a@intel.com>
 <aGZuuxxTI6tFOTWK@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGZuuxxTI6tFOTWK@tiehlicka>

On Thu, Jul 03, 2025 at 01:51:23PM +0200, Michal Hocko wrote:
> Why not use find_lock_task_mm if task_lock is acceptable for this code
> path?

Having to take locks just to count a number nobody is ever going to look
at is silly. Iterating the whole thread group (might be hundreds or
thousands of tasks) just to maybe find one when racing with a fatal
signal is even more silly.


