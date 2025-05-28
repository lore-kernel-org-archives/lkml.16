Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DEC210F49
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462402; cv=none; b=uh+oThfp3fiUJJmZyC2a0FwRHge7Ke6SP5u+8DmzBLY2U8tpf4mUB4eqZAGQq9bU0fDUMsPM7WJ9lfkmWj6ZCslaQSArABzSdEFVREBHo47YD8Sd4ctxYHTNMb7LlaakO4e73ldeyrSUgoS2uB/0J0lcbHrPp//tKZZPj4TyupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462402; c=relaxed/simple;
	bh=OuJOAvFQupul4YcfYOseZWQ8vjgASYgtDsDA5+R6lqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTC1bcFPqfnJQUjpiEXZcZlnMLK8FosBZUDVvelD426jwpjxwHlY/IEu7L9SZ9XSXksWXlO/Lublhlaav6HwZCoe3QtPbKGjNorck0hNok+n0WiDS5hlbXd5nKqlP0GaAv0h0MtlL9M8pupjDLT2P8lb+a/0GqgYrMl4K1Nnz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EthvdDZq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EthvdDZq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dib/g1JwNqkWRLTQOlbSV1lIMGkGPIUG7yhuAuQPWf8=; b=EthvdDZqa6PJODBgSHr81ZQgSt
	e08MSO8jutXZ6M7CXDTUH7eHRQhfNUKOi44gAlzNkH/Sc43m527TXY2q2O1do//b+jHbO4BmlsKiN
	36x2DMHlJtjTUid1RubtfT/eT6vvTjjHLRlJQA3l6xGKhzlogWx4pG6W04vC1lEXSe2Ll9C2p+u0h
	kJTOzcrqFH8XRDMMwENGnIfAoryAoWcTnq+tcbT26bm005oSqq896ha0sG6+RwJZFG9xE8Gx9CUEu
	f1wSbSp6eXrC81rsPsMQILU5UQ7Rxfwg0UFHltsquaZ2aQo878LfKjoMox6QhAGJmKKUpSlNJZyYc
	u1LD/kvA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMwD-0000000E1Wg-2lju;
	Wed, 28 May 2025 19:59:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1011F3005AF; Wed, 28 May 2025 21:59:45 +0200 (CEST)
Date: Wed, 28 May 2025 21:59:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com
Cc: linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
Message-ID: <20250528195944.GB19261@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520094538.086709102@infradead.org>

On Tue, May 20, 2025 at 11:45:38AM +0200, Peter Zijlstra wrote:

> Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
> somewhat rough state. At the very least the last patch is missing ttwu_stat(),
> still need to figure out how to account it ;-)
> 
> Chris, I'm hoping your machine will agree with these numbers; it hasn't been
> straight sailing in that regard.

Anybody? -- If no comments I'll just stick them in sched/core or so.
