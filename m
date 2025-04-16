Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894C22FF2D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794249; cv=none; b=WBmuOrkvNVPOv2ksUUFdBaIFbXHOPjtWORxL3Zu2DzeSAeXU/aKE3VvDCB9qXEiLKGPXL8c04AaWbGm1FuzwsqUZZkxbbIGLEpkzCk05a4QXuK09GggZPJR5gx43Jcp4Dwt9q8n3BFarJUHxF4vmSAuhUbdLbMn1H1L1fjmihrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794249; c=relaxed/simple;
	bh=PSfnDNYEjx66NVJjtF/+2uo/VnfpmqOUhsEwOYjV+kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxjL8oVtzsF7NJ2zKxXXZu4oxkbcndheuXhCdF9cb4qG6eQNIDS+bqO/irAa/E48fCbFrzhuIQkIw3pOhgHVNJRjCdZWO1izF1MYX4yilujD9KD1i3X0SbbRIGli822pU9y9VOB6gsEMNHe68xKceLsGH4hfqtAkmoEJIyKuJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QI33byDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QI33byDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A34CC4CEE2;
	Wed, 16 Apr 2025 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794249;
	bh=PSfnDNYEjx66NVJjtF/+2uo/VnfpmqOUhsEwOYjV+kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QI33byDzwItOGfThyRuUoxFQ471AclScJ0q485jNZGvGvGXTFx9zPAfzRuIZ3FQD1
	 flb2zVCHU/50AIHJauGinYlG0F8DR5BP2gPxFo3Df1HHE6r9cnK6gEai/bh4EUMxsA
	 QA3rSNaT/IQfIIANXvwdiS0XsGyP44j+PpCYy3IijeGCFKBFItTF45H7cwqiW15/5N
	 VqVWNDEju4vKisijbXItxfrRYvUss86gdLm/w0dCoZt+megQF4CGCHPiE2xpylAUq+
	 KKEA2qqyUjlY4cmjjYid8PCd/Zb9XozgHvtiZWFbPISHeVJt03bSu58tJHR/ZRELPg
	 KrpAPw9coiNgw==
Date: Wed, 16 Apr 2025 11:04:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/17] timers: Complete the timer_*() API renames
Message-ID: <Z_9yhQg_jlbIkxHf@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
 <Z_zk94RFo2bK85iJ@gmail.com>
 <87ikn6sibi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikn6sibi.ffs@tglx>


* Thomas Gleixner <tglx@linutronix.de> wrote:

> While I appreciate proper namespace prefixes, this series is just a
> mechanical conversion without any additional value.

Yes, intentionally so, as mentioned I didn't even rename any of the 
APIs beyond the trivial conversion, because I wanted to gather feedback 
first:

> > I didn't want to make bigger, discretionary changes in the first 
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > iteration, but I can easily propagate any such suggestions into 
    ^^^^^^^^^
> > future versions of this series.

    https://lore.kernel.org/all/Z_zk94RFo2bK85iJ@gmail.com/

Can you please acknowledge this clearly declared, intentionally limited 
scope of the -v1 series, instead of deriding it as 'mindless'? :-)

> [...] Some of the conversions like try_to_del_timer_sync() are 
> obviously fine and can't provide moar than a namespace consolidation.
> 
> But if you look at the actual functions and their usage all over the
> place then you can see that there is way more cleanup and consolidation
> potential especially for those functions which add or modify timers.
> 
> First of all the question is whether add() and mod() are really valuable
> distinctions. I'm not convinced at all. Back then, when we introduced
> hrtimers, we came to the conclusion that hrtimer_start() is sufficient.

I didn't want to mix namespace cleanups with functional cleanups, but 
sure, I'd be glad to do that too.

> But that aside there is a major cleanup potential for this stuff. The
> vast majority of add/mod_timer() sites uses:
> 
>     - Precomputed timeout values derived from a timeout provided in SE
>       units
> 
>     - Instant conversions of SE unit based timeouts to jiffies
> 
>           msec/usec/sec_to_jiffies()
> 
>     - All variants of HZ, HZ * N, HZ / N ....
> 
> This is lots of duplicated and copy and pasted code. So instead of
> blindly renaming things, we can be smarter and provide sensible
> functions:
> 
> mod_timer() takes an absolute expiry value, but most places use
> 
>     mod_timer(t, jiffies + $timeout);
> 
> So the obvious first step is to provide:
> 
>     timer_start_rel(t, $timeout);
> 
> which does the addition of jiffies under the hood.
> 
> And because $timeout is some of the above calculations, we can be
> smart and provide:
> 
>    timer_start_rel_secs(t, timeout_in_seconds);
>    timer_start_rel_msecs(t, timeout_in_milliseconds);
>    timer_start_rel_usecs(t, timeout_in_microseconds);
> 
> This all can be sensibly converted with coccinelle, which even can
> handle the cases where $timeout is calculated from HZ / N.
> 
> I have a pile of half finished coccinelle scripts somewhere, which do
> exactly such a conversion. I just ran out of time to play with that, as
> I ran into a few things which need more thoughts about proper
> interfaces. I'm happy to share them.

Please do!

See why I sent the simple approach first? :-)

> Converting the whole timer arming to use SE unit based timeouts makes 
> a lot of sense in general and also paves the way to boot-time 
> controlled HZ, which is something distros and others are asking for 
> since years (of course nobody wants to sit down and do the actual 
> work as usual...)
> 
> That said, I'm fine to convert the obvious things, like 
> try_timer_del*(), where there is no other consolidation value, but 
> for everything else we better sit down and think about proper 
> interfaces and large scale consolidation.

No arguments from me! :-)

Thanks,

	Ingo
