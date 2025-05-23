Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86273C8CE
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003730; cv=none; b=QnNn9zKlnkaN1+SiaT71HyLO3D317KCySE46PWcwbofnp1OY9BulfmaqprLUpKKZdIbYKYhwog8JpqulWUw+3ylMDVsw+uNdMYqTu8XPG0zlEkuzjyVV+4umdS6DzHA03F7nk27Czma+T0hASFt4H68v401o1UeshQXqn3Sdq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003730; c=relaxed/simple;
	bh=XkIvQT+/yWhVwpes43vYQ0OrO3E8O5aoaWzFfhJST6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f23yo488Ti+YdvYajmNkoNz2IK1734uFWmLs8k0oRlAH+d80oXS2kVkV/mms/ncn2qOggvbGyYmlYkaBENKaDAhsBrJo7iMVvq8tewxQekpltrVnOoXjd3NXXGLWpH7tGbn4+ohXuN4qm9hYVQS+SQCTXqRmSEwQVHQ1HWEK+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nrac3uS1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nrac3uS1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=joYyarh9uwtRJl475buma+o5HMm3sVPLQkQWh3pNq3c=; b=nrac3uS1AdK7R0d+xBmKCcbBAW
	NplkfWtQvoDkM13QRtqCaamPmJXCQng82whBE2NtJG+IZlxaheYySZdFcfgWEBfTs84ffoqplCTWP
	3SJLx6adbh7U1h3mEJhMVVGBYQYuDpPotwPFXb6HXReoryo4qgo6vI6CUzms4s2AYusdrPMHAlnp1
	pFo6Rv7oDTa8leT07FyllpFSrd8viuptGXB/LNe1gRH6rG9VVLP2zOvW7VCcYGifynqMBZZV90GtJ
	/ZfqURkiVw6TH31ZayJMTpdDP8Ca8w785jWQ0cA0/h1ICmrfEt+s22ozGK7WgsjXQEuWUkk31cg6D
	Uj/+c+2A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRcL-00000007a1L-37DM;
	Fri, 23 May 2025 12:35:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2EEB83003B0; Fri, 23 May 2025 14:35:17 +0200 (CEST)
Date: Fri, 23 May 2025 14:35:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250523123516.GK39944@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104110.3673059-3-ziqianlu@bytedance.com>

On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
>  static int tg_throttle_down(struct task_group *tg, void *data)
>  {
>  	struct rq *rq = data;
>  	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
>  
> +	cfs_rq->throttle_count++;
> +	if (cfs_rq->throttle_count > 1)
> +		return 0;

	if (cfs_rq->throttle_count++)
		return 0;

vs
	
	if (--cfs_rq->throttle_count)
		return;

