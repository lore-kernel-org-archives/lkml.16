Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6280478F4B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120558; cv=none; b=UX2LSJhlG3mAjyNGt6tRrDyATFvsjl0UNbgqZrn+oBr4W3iI7RjEnV2s4fff64qzaCYrSUYQerW5L3Q6XMAT9oKrZvGIZuLTc9DwBmgM8BOfL1CsVQsmm9ITNrvOpmZKUv+mosAio+C4cfEfOv2gZm63chF0wIqZce7XGTxtpss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120558; c=relaxed/simple;
	bh=fjGXXGGuEma/ZGhpVxZmIeD6jIHIL9M9K4UGUKVsIok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pop34l1YlfaTt7sBjWkAHozTtpNHywUJWICjdKhtH8+tghZKQF6h3XYW5L6uGGHoPBbgNOP2B1VldGNLPokZCF8SPlvpUkTjOssT9glc1K+M1v6Ei+A5+uITY4r5cz75zcC2tX0KNB13hb4jkZwyZ0mBveM0SeHnbj+VBOpie6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RXvIym7g; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RXvIym7g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zhhBJaYhS+oJo+YRj//JVfYPNY9cmf/8jlPwUvwAIas=; b=RXvIym7g+9JSoga+LHyyZclqEE
	eBh8odVqFnpEJ8LKenBMUDx1OtwyN7Wx0p8KGZ2RPRrs/2n6FeAjPbQPZfzSX3BOQPL8K/NQctpWW
	6HWfoU5IyPNdK15j0ER+L+IDN4jdYhcTUqqwYU7Bt+jUfhEiFxvBWdb83Ib6grIC3WG6XuZSFsGxv
	FDp8f3j1UxCFTGspS85E9QKc0J8ztqpewV5/BCsW2YZO/LLfXgQoekC94FP95Iwtq/1wE6inbQYsc
	/BG1BKt9c1IOjDdsdvRUzGNxnYjujYEAYBc2ugZPjuJ6MOYxWe27SyrHAaBxM9X7fi5rfs1e/746c
	VRCU1tCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjrk-0000000AdwX-1JaL;
	Tue, 13 May 2025 07:15:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CFBD730050D; Tue, 13 May 2025 09:15:51 +0200 (CEST)
Date: Tue, 13 May 2025 09:15:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	dietmar.eggemann@arm.com, vschneid@redhat.com
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250513071551.GC25763@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>

On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:

> If I take 54a58a787791 or 54a58a787791 and turn off the
> DELAY_DEQUEUE/ZERO features at run time, I don't get the performance
> back.  But, if I patch them such that DELAY_DEQUEUE/ZERO default off
> 
> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> index 7fdeb5576188c..94409e9831e97 100644
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -37,8 +37,8 @@ SCHED_FEAT(CACHE_HOT_BUDDY, true)
>   *
>   * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
>   */
> -SCHED_FEAT(DELAY_DEQUEUE, true)
> -SCHED_FEAT(DELAY_ZERO, true)
> +SCHED_FEAT(DELAY_DEQUEUE, false)
> +SCHED_FEAT(DELAY_ZERO, false)
> 
> It runs at 2M QPS again.  If I enable DELAY_QUEUE/ZERO, I go back to 1.95M

Well, that's odd... there should not be residual effects like that. I'll
see if I can spot anything.
