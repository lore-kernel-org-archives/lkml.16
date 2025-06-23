Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5D1519BC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674233; cv=none; b=pj1MGoPIAzvdUAYLpIsy08JKloG6Jg76U4ODRCL4hXyrq1mUnL+EH6MOzVMC3MGFFAhjFX9fech/xUxkj+pbP2F7zq5kWDTwegYwNw4+U75JxoEPu4CH1U5elGsBA2nYJ0n/SqHreTtZDVvbuTe85ih5YO6bT4EsLBXPP5qmFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674233; c=relaxed/simple;
	bh=DGHJ3MpEn4g8BovGBGieKyictPMX/wcXwB8JggXAYrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xit5L51gL/lPmfZEbsZVEUkLlFgI5gs27rB3pzk8VvpbahWKo20JjAZgHMTX1EBMKrA+9I9MEaDBWgZMtTUr8VT1ZF3eNQtFha7vZ5Zu2CLWS0DjlWyvBuGt7CQ3QSP7SbuYQMA2vFO3NSTZB1aFFNo781OWO9SL3v2afisUk8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GSK8HswA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GSK8HswA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DGHJ3MpEn4g8BovGBGieKyictPMX/wcXwB8JggXAYrg=; b=GSK8HswApL3HeeHq5qCIZ0oEg7
	FXGl/wOzYXDYqxWOOix1DFPhtXQGv8v82Yera+5ER4cemEeHi8I6LVEYVVdnimg4z81MDFFsFhHxe
	jW+JwE07ewG3nbjSSzsU2D0clKKJrETHouR35kqo4dNOZ066azAPLLFI2sZOSTrHx4EPfoayuiHBB
	+LMNVKvM4kx1EfBs5RSVDD/QNpOqugGTYzh0PMPmmYuKYtM1YyXXkEFz7mQxSAwKpUT0HAGWGbAuU
	1UevnEWcyv2ahbD0csEdMnVLvRfYMrxhyn3E7TqNFrkkGxuhCXVy46ZkssgA+/3qvvX7ktS2rE2zD
	u/wyINrg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeKt-0000000378P-0OaL;
	Mon, 23 Jun 2025 10:23:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1523C307E51; Mon, 23 Jun 2025 12:23:34 +0200 (CEST)
Date: Mon, 23 Jun 2025 12:23:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, hpa@zytor.com, oleg@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] sched: idle: Introduce CPU-specific idle=poll
Message-ID: <20250623102334.GP1613200@noisy.programming.kicks-ass.net>
References: <20250621235745.3994-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621235745.3994-1-atomlin@atomlin.com>

On Sat, Jun 21, 2025 at 07:57:45PM -0400, Aaron Tomlin wrote:
> Currently, the idle=poll kernel boot parameter applies globally, forcing
> all CPUs into a shallow polling idle state to ensure ultra-low latency
> responsiveness. While this is beneficial for extremely latency-sensitive
> workloads, this global application lacks flexibility and can lead to
> significant power inefficiency. This is particularly evident in systems
> with a high CPU count, such as those utilising the
> Full Dynticks/Adaptive Tick feature (i.e., nohz_full). In such
> environments, only a subset of CPUs might genuinely require
> sub-microsecond responsiveness, while others, though active, could
> benefit from entering deeper idle states to conserve power.

Can't we already do this at runtime with pmqos? If you set your latency
demand very low, it should end up picking the poll state, no? And you
can do this per-cpu.
