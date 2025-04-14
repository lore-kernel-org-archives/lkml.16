Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5428BAB9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655685; cv=none; b=InQjWVGrQLQS9P9muKV3/NDb3WVWSaWPaJHFebwj93d8lKvCV8o/l2h6Kt7PVijGZ0rpXWKaeI1GHhX3MoNHaYpWvnD7pGVca5ZdD/6Cb8bJG6b9K6TtWtrDAXm8eSTe4TruIP9i2IN6C8BIaCD14qf8iOByL80+8HeMWoEGjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655685; c=relaxed/simple;
	bh=inFuZXDNWZB9IrQxuopCU5+gEIrcyOMeM9cQlAdeA9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ueXLe/T2+7zIxzfgAkVBF6PkmeFp2s5J/7Z9O4L8+ITYy2wj+sfHWXr2JZyAuiFyMuKSiKkOGpc8k3xXOhrAD+Jo4sEcGJPIPfOAiFvAZubSp+1N8nEQDosOqS4WT8sace++o8PfelPqDxXws9vOrQZdDX+PXXGWXfz6ooGpVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0EYWuhPv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=02UtCtK7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0EYWuhPv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="02UtCtK7"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744655681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D6tEG05LV9BTff7SDBxQ+0/mXImprZ89pSTAdngVfLg=;
	b=0EYWuhPvQr+eMLSV+ybzPiRbBdCKpRXXMNhn5tX1Xq1veUgrsHQcyHOPv38sBk53+vjHJA
	naP+l89fUdvq+Of9xVSb8dZJAxIwgYq3GPvN0meoFQRvkARCB6NidoYi4U3Tz3ZVA2zWgD
	NdXw/1tSpPycNEvPytrDkOOF+Gg3LKBe6I6dD52KLSSpVHT/F0SJSsTLoFf7vIoU5aah84
	zfzxAoUnhHErZAe2SyPhrKfrIeRyN8zkx6ljiPi7sttMbISYUvdA7I9gLALYwsbTzX8iB/
	Mi5m/sDUe6FiJ8/WCbA7CFxVroVYov3UWQQ52UhI8BvpBQ5wvT8lxMJQsPol0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744655681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D6tEG05LV9BTff7SDBxQ+0/mXImprZ89pSTAdngVfLg=;
	b=02UtCtK7Rkfzf2UohhvSJiB2QtqXRIZQBIod7UjonzaUF8JRWUNJSQhydFgdtI7YyGuQPE
	V+qyCnJJc/ehG1Bg==
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin"
 <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter
 Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/17] timers: Complete the timer_*() API renames
In-Reply-To: <Z_zk94RFo2bK85iJ@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
 <Z_zk94RFo2bK85iJ@gmail.com>
Date: Mon, 14 Apr 2025 20:34:41 +0200
Message-ID: <87ikn6sibi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 14 2025 at 12:35, Ingo Molnar wrote:
> * Ingo Molnar <mingo@kernel.org> wrote:
>>        add_timer_global()                  =>          timer_add_global()
>>        add_timer_local()                   =>          timer_add_local()
>>        from_timer()                        =>          timer_container_of()
>>        mod_timer_pending()                 =>          timer_mod_pending()
>>        timer_delete()              ... [unchanged] ... timer_delete()
>>        timer_reduce()              ... [unchanged] ... timer_reduce()
>>        timer_shutdown()            ... [unchanged] ... timer_shutdown()
>>        timer_shutdown_sync()       ... [unchanged] ... timer_shutdown_sync()
>>        try_to_del_timer_sync()             =>          timer_delete_sync_try()
>>        add_timer()                         =>          timer_add()
>>        add_timer_on()                      =>          timer_add_on()
>>        mod_timer()                         =>          timer_mod()
>
> BTW., my suggestion would be to maybe change this to timer_modify(), 
> because timer_mod() reads a bit weirdly.

Can you make your mind up _before_ spamming people with half baked
changes done in a hurry? :)

While I appreciate proper namespace prefixes, this series is just a
mechanical conversion without any additional value. Some of the
conversions like try_to_del_timer_sync() are obviously fine and can't
provide moar than a namespace consolidation.

But if you look at the actual functions and their usage all over the
place then you can see that there is way more cleanup and consolidation
potential especially for those functions which add or modify timers.

First of all the question is whether add() and mod() are really valuable
distinctions. I'm not convinced at all. Back then, when we introduced
hrtimers, we came to the conclusion that hrtimer_start() is sufficient.

But that aside there is a major cleanup potential for this stuff. The
vast majority of add/mod_timer() sites uses:

    - Precomputed timeout values derived from a timeout provided in SE
      units

    - Instant conversions of SE unit based timeouts to jiffies

          msec/usec/sec_to_jiffies()

    - All variants of HZ, HZ * N, HZ / N ....

This is lots of duplicated and copy and pasted code. So instead of
blindly renaming things, we can be smarter and provide sensible
functions:

mod_timer() takes an absolute expiry value, but most places use

    mod_timer(t, jiffies + $timeout);

So the obvious first step is to provide:

    timer_start_rel(t, $timeout);

which does the addition of jiffies under the hood.

And because $timeout is some of the above calculations, we can be
smart and provide:

   timer_start_rel_secs(t, timeout_in_seconds);
   timer_start_rel_msecs(t, timeout_in_milliseconds);
   timer_start_rel_usecs(t, timeout_in_microseconds);

This all can be sensibly converted with coccinelle, which even can
handle the cases where $timeout is calculated from HZ / N.

I have a pile of half finished coccinelle scripts somewhere, which do
exactly such a conversion. I just ran out of time to play with that, as
I ran into a few things which need more thoughts about proper
interfaces. I'm happy to share them.

Converting the whole timer arming to use SE unit based timeouts makes a
lot of sense in general and also paves the way to boot-time controlled
HZ, which is something distros and others are asking for since years (of
course nobody wants to sit down and do the actual work as usual...)

That said, I'm fine to convert the obvious things, like
try_timer_del*(), where there is no other consolidation value, but for
everything else we better sit down and think about proper interfaces and
large scale consolidation.

Thanks,

        tglx


