Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A774298CDC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073334; cv=none; b=qZE97ToDXusLDctaEmodB6nMNMuolEuxzRgrWzdbWTWQaZhkylNyiNxLzhbBdc34i8arrjAUfmGKTFTkEJgAuSn3cdswujGWn3+DizpepRHRlcX+dbcUmLlmi1pkrxAYS+FNbqCoNFXNI5ds4T7tr+eVR0NTfBPfxpvCd5V8oiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073334; c=relaxed/simple;
	bh=9sFKIGpTQIObW8ewu+pjp7fzCsKkwOvlWvfG5bMYO1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwKxZomkB6f4yKtU42n3BBuecaFFKYj9QFy/UxhB74EIixhTeFjBmZN7NIvCHzycj0hl3c2f8iP2WRalY97AprFjtCi+qMPCXxloPKXAVN05tywUaP+V8mD7iLOrHlXXPjyNLa3PmHx6FqScjswxct/auazNQPDBMzwFYbvdDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=u3oqGM40; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u3oqGM40"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Oa6A8+qzaBX/k47EFQIvxMkVXbsVVrzU2Y5F8y4wCQA=; b=u3oqGM40AizaOr3hdwKtFZd5GG
	/OGqjof9LhElxsWh3Fd2irIdGtFQgMy+4tFy6oID+//3u0WjiCduTQv5da/mGwVdyu/p/9ufGqdg6
	9GhDwo08oUwvYrTwDSU7+qV6ekzd1G04yKUHjpQmQyYOrncCRQKRtel49SJmtg5ZMtEKRS1RgEGiV
	XT4nIwc7dJiTQM64MhRo3MJgkfAMk6dG89TXCOt0pom/dnz09aDPcQZaGnMtbsyNPHN1TowyGRzUl
	fLip6p1IJEHa5619lljS5ZJh8jBMIsG3EiEjGtru972OJb3TWOz573ZP/Jjoxx3CUPULblatUI+9c
	okSXxZRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXa3-0000000A7JJ-1KR9;
	Mon, 12 May 2025 18:08:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AD911300717; Mon, 12 May 2025 20:08:46 +0200 (CEST)
Date: Mon, 12 May 2025 20:08:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	dietmar.eggemann@arm.com, vschneid@redhat.com
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250512180846.GA25891@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509194955.GA25798@noisy.programming.kicks-ass.net>

On Fri, May 09, 2025 at 09:49:55PM +0200, Peter Zijlstra wrote:
> 152 729288bc6856 kernel/sched: Fix util_est accounting for DELAY_DEQUEUE
> 	average rps: 1936829.47
> 	average rps: 1950715.10
> 
> 153 84d265281d6c sched/pelt: Use rq_clock_task() for hw_pressure
> 	average rps: 2176857.32
> 	average rps: 2223004.23

So, a little more data on this.

The result appears stable, but reverting 729288bc6856 on master does not
seem to cure things.

OTOH, switching to performance governor completely cures things here.

My machine defaults to schedutil governor.

Chris, can you confirm -- or did we manage to find different issues?
