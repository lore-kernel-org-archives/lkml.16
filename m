Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8E221F37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528278; cv=none; b=AFIp0qr37ueSUs3eW6B22oRSWukXXzN25mHXVs+H27SHqvgkzr5sz48rAeZMRBDGJb635X1UbPbeAXNnag5jMuzjoCqNJXvevitrgYJ6iH65iu2/CfeO+83c+5CZyZny5f+vFxMfFMhemIJWPgBgoyS4A6BX9Q72qa7hR0/kV5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528278; c=relaxed/simple;
	bh=6+Nmgrpjrk/W8tzwN3Mj9jg3OA9NorNAknPaeBNC1es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF/la3NRoeBE6G9CT67LR0lb/SNAk7B+leI6RjJ3sQdxckguQJZ/WRE+9wMpfsr3qvwbwZIfmlsgFX78M3tBQAeV0pDPMMP+gd1Tq7f5PqCBAjPByAcnSfxalLNPTMUjDZRq8hn2cgh1QfwGG0spYTYXrQRVKA7M0WVzCtQQm7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eiu7Jusp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eiu7Jusp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6+Nmgrpjrk/W8tzwN3Mj9jg3OA9NorNAknPaeBNC1es=; b=eiu7JuspPSM3lnhzfouk6r0P64
	zJ3Hd5gLjhdC7JRLw7UJ+wd++ezp4USACcfb74UKVvucLiJbSul1UHD3WPjW8AWy0+o9VVSfeZsSj
	pIHey+xn8qsoi+d1UyH5aCe2+6VWpCPGQDsCtAjFLXlSqc1zzw4WAaeNt3a+l0LaMrkC0EDz90/11
	TKRXU+HiV160vj7XHVate/Yexgpp9v0hYxeDdyIZQ5AjdR4ZzQJ7jpD704om3tUDTUBB7nzQcsSIK
	WPiVyvcRFFwlTTFwTY3ih3/JsOLW5AEC006nky5zaLtX2/ald9Y+vqJCDAR0i5cAbPA6e7IZAsD6r
	ppIwo1uA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEVp-00000007dff-1p5b;
	Thu, 03 Jul 2025 07:37:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EBE7E30017D; Thu, 03 Jul 2025 09:37:40 +0200 (CEST)
Date: Thu, 3 Jul 2025 09:37:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250703073740.GU1613376@noisy.programming.kicks-ass.net>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <20250701083123.GA2784928@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701083123.GA2784928@bytedance>

On Tue, Jul 01, 2025 at 04:31:23PM +0800, Aaron Lu wrote:

> I wonder is there any more comments about this series?
> Is it going in the right direction?

I had a quick look yesterday, and things seem more or less agreeable.
I see there has been some feedback from Ben that warrants a new version,
so I'll try and keep an eye out for that one.

Thanks!
