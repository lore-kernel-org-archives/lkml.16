Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208D1C2309
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178841; cv=none; b=E4BW4M2pHzprnks9mmkNWkihjcjTxDHBDnZ9NUc5G0k2JRxGUaB4HdzVgVQO8vN5gYcTJ1uLZyZyKq+rKrldu0SflcHK36fgoE8hp+1dSj1m34Y2cRzcCM2+meTcWirG4zZXG4eG/H66mumK8gVAxr4UzsAmJpXM8/ygJe2N5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178841; c=relaxed/simple;
	bh=f5TcJdDvVwoPEQhhI1ZcqCEzcqtcVObDhftAdZwAdC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAC+w0VTHqC269hQF93/Sx/L3vGEbQxB+A4F89UGpxL7r/zI240Na6fyQzNs7Ix6hCzx4jk9WqxUz3jc8v31B+QHLOj1N9z5VzQIZ525jWJS6Qt8nUt2V7aVhAWWHyPau+E52zmKtwTGLJUc0ieZr3mwxny3lg79pGsHX5G2eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S6b5XF+m; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S6b5XF+m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f5TcJdDvVwoPEQhhI1ZcqCEzcqtcVObDhftAdZwAdC8=; b=S6b5XF+maT2oJdS3g5eW6GTLZE
	T9HkiuyZ6PDZoWdsOodLIFebv7J+9/8B4Lcy2F47GM6vObhRBdFwc0vMQ81ZqozD4ZM8XYpV8IFiq
	rtxP1YYf/8miK0cz8LCf7qU/CA22yUfUzd05hRkeSBHcnUJbUKQyr3jJDjIDWxcmX9PbbrM0gV+Ze
	TrROF/5U8eEE98qK5V0tWZBQnWW9eUBm80cJiNVy9kFrKhXXzVD0K0di38+rdk+O8Yr1YdCedzvB0
	+fwe5sIITqH+M+Ba9WI4ccTJxhPsWR9VEB0lz4J5rN2WKCUoHob5k7lA6Hj92pC9/ewJgxKqh1UQ7
	GFrD8rxw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thPrV-000000006ex-0t2U;
	Mon, 10 Feb 2025 09:13:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5A4203003E1; Mon, 10 Feb 2025 10:13:52 +0100 (CET)
Date: Mon, 10 Feb 2025 10:13:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: zihan zhou <15645113830zzh@gmail.com>, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <20250210091352.GC10324@noisy.programming.kicks-ass.net>
References: <20250208074821.11832-1-15645113830zzh@gmail.com>
 <20250208075322.13139-1-15645113830zzh@gmail.com>
 <20250210012931.ym337oexdcjmwwzv@airbuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210012931.ym337oexdcjmwwzv@airbuntu>

On Mon, Feb 10, 2025 at 01:29:31AM +0000, Qais Yousef wrote:

> I brought the topic up of these magic values with Peter and Vincent in LPC as
> I think this logic is confusing. I have nothing against your patch, but if the
> maintainers agree I am in favour of removing it completely in favour of setting
> it to a single value that is the same across all systems.

You're talking about the scaling, right?

Yeah, it is of limited use. The cap at 8, combined with the fact that
its really hard to find a machine with less than 8 CPUs on, makes the
whole thing mostly useless.

Back when we did this, we still had dual-core laptops. Now phones have
8 or more CPUs on.

So I don't think I mind ripping it out.
