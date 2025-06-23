Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7515689A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676263; cv=none; b=mXUxR5zjpjZ/kfeQFlvj1F7zqVcKUSz33pKMlHSqceOYvR3hooQQcG4Wyj7ZVkrSUnFxfEojuA6yatO/wlmA7dQO7anqVe3xfdo9FWEUyzpb012LPslKjJiepclxIs4vJhaBoLhv2b2f9pMS3GLu6iYXklnkulcT7e2y6YjcZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676263; c=relaxed/simple;
	bh=di9FW3fogKW8ME2CExAyyZ/YTmJNCTF6mSxeyZx1+O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA7bFDapnwqJwhhay2BlE6cBshIHtJxbZEyYG4mcFaEG5GAv8ETd48Hvlabu0y3xpHUEOpNP4QHUgzdKI1Z5uYrDrn1IP8WyM637ldrgSlMrNkFNyOV2sWn8a6RLRVweGJTV0fQ8cjZKH/vugwWfDcTcSzN4LNreMlyxevWgvn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c7vgMwpk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c7vgMwpk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n1f3tWRLNJyWqK8KxGyKKzRKbXbWYg7R5Zh9b97gGk8=; b=c7vgMwpkCBJk/WCVXjdaZ4su44
	mlYaxcbwX0D1QNSZRzVitrIMBlr6ZlMVvvtA6vt9GBNBCBaxEJe5+3E31o4JM4UvBUbLIl+/akYZb
	eZnXAwBe2JtzNuCG1k/EHbnx68sq/A9bY9HRMQQTJMNrvOJDnNWQK+zu+FPVzbeKe44Tfp9pQuqwU
	JNytKws3JMNeiop12DCN9lGDFeY/R5IjiVxvwr/78fSuaO+5N5bja85GpOPC/oa5BQsytEUtu/TNl
	zJ67LYcclU6eS4crwD+A8iaJt6Xs8Bz2tV+S4cqQytN0ZT8VmfaeBEMhevZdFBp5MDW+DfDE8YM/9
	KsElDBMw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTerr-00000005BxS-3lMG;
	Mon, 23 Jun 2025 10:57:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 301BB30BAFF; Mon, 23 Jun 2025 12:57:39 +0200 (CEST)
Date: Mon, 23 Jun 2025 12:57:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [sched/eevdf] llama-bench performace drop
Message-ID: <20250623105739.GR1613200@noisy.programming.kicks-ass.net>
References: <20250623102732.3447837-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623102732.3447837-1-gary.yang@cixtech.com>

On Mon, Jun 23, 2025 at 06:27:18PM +0800, Gary Yang wrote:
> Problem: The llama-bench test uses cpu to run AI model. It can create a
> lot of threads, so it belongs to cpu-bounds type process. 

How many threads per CPU? Typically compute workloads stick with 1
thread per CPU.

> It can outputs
> three scores. 1st score is primarily influenced by CPU frequency, 2nd score
> is primarily influenced by memory, or L1/L2 cache, but 3rd score is influenced
> by CPU frequency and memory.
> 
> when run llama-bench test on ARM A720 with kernel6.1, it outputs three scores:
> root# taskset -c 0,5,6,7,8,9,10,11 llama-bench -m DeepSeek-R1-Distill-Qwen-7B-Q4_0.gguf
> -pg 128,128 -t 8
> | model         |     size | params | backend | threads |       test |          t/s |
> | ------------- |--------: |------: | ------- | ------: |------ ---: | -----------: |
> 
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |      pp512 | 58.67 ± 3.08 |
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |      tg128 |  9.32 ± 0.22 |
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |pp128+tg128 | 15.10 ± 1.08 |

Your taskset has 8 CPUs listed, and the threads column has 8. So 1
thread per CPU. This should be a boring workload. Are they sleeping
frequently to sync up or something?

> build: 14d627f4 (5288)
> 
> when run llama-bench test on ARM A720 with kernel6.6.89, it outputs three scores:
> root# taskset -c 0,5,6,7,8,9,10,11 llama-bench -m DeepSeek-R1-Distill-Qwen-7B-Q4_0.gguf
> -pg 128,128 -t 8
> | model         |     size | params | backend | threads |        test |          t/s |
> | --------------|--------: |------: | ------- | ------: | ----------: | -----------: |
> 
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |       pp512 | 49.89 ± 3.83 |
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 |       tg128 |  2.66 ± 1.98 |
> | qwen2 7B Q4_0 | 4.12 GiB | 7.62 B | CPU     |       8 | pp128+tg128 |  1.92 ± 0.45 |
> 
> build: 14d627f4 (5288)
> 
> We find the 2nd and 3rd scores are both lower than kernel6.1. During analyze this issue,
> we note there is a new feature on kernel 6.6. It introduces EEVDF scheduler, instand of
> CFS used in kernel 6.1. After we try to revert some EEVDF patches below, the two scores
> are better, almost near those got from kernel 6.1.
> 
> 9ef5bc6e07a5 Revert "sched/fair: Commit to EEVDF"
> a21eaad7417a Revert "sched/eevdf: Curb wakeup-preemption"
> 2cf7e10af999 Revert "sched/eevdf: Also update slice on placement"
> a19837e0f27b Revert "sched/eevdf: Fix avg_vruntime()"
> eae55a336cf3 Revert "sched/eevdf: Fix min_deadline heap integrity"
> ba3c4b6b5aa9 Revert "sched/eevdf: Fix pick_eevdf()"
> 37561f3cdba5 Revert "sched/eevdf: Fix heap corruption more"
> 9a80e5bf2bb5 Revert "sched/eevdf: Fix vruntime adjustment on reweight"
> df483ee656d5 Revert "sched/eevdf: Always update V if se->on_rq when reweighting"
> 587fe3a23160 Revert "sched/eevdf: Fix miscalculation in reweight_entity() when se is not curr"
> 65f847ba8cc3 Revert "sched/eevdf: Prevent vlag from going out of bounds in reweight_eevdf()"
> 
> Does anyone encounter the similar issue? What suggestions do you have to us?

Try a newer kernel, like 6.15. 6.6 is ancient and I can't remember that
it looked like.

Then try and run your workload using SCHED_BATCH and or increase
/debug/sched/base_slice_ns to 15000000 or so.


