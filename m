Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D925DB19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626940; cv=none; b=upbsgSN7gRnluSehFJkD/aRrZDShxQZbL4LwgUEIv+iuBxNeYudRquMga2UFfU79jzn8XF0FYt7EWA+ct+crQVdh5Kd1IPN0XlpDvkhX0YHeEP8baFTPqsAM8nyY3U7KOoSyGqZhNuvf+tVyKSln+2Rg/RYgUGdW/nrpyeLIpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626940; c=relaxed/simple;
	bh=E6pmIAB0uVViWc5fN91Dbx2SXqix9ruV4iDCW5UYYHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKHq0JPmNjDJwQE4WLjarj0ptmEH5GimmEKwovwQuqzvxFcyYhMjbvhS0iiQyihbdbjM6Sh14cOYeqsKstwbiy6r4ihJvHdBvbCbMpyT1/lh7HnBTnNjcOt7UxVCD7f2IaY+DP9lpj0eKTWkoaRHYZqNV2agupbpQEKR0Y0oiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8oeXLGV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8oeXLGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E57C4CEE2;
	Mon, 14 Apr 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626939;
	bh=E6pmIAB0uVViWc5fN91Dbx2SXqix9ruV4iDCW5UYYHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8oeXLGVw+tZ9ctzyHG6X1OwJC+6GSYFDzt8QpEzqOSBQ5T7UTDc9tCPJ946zH1eG
	 g8QTEF6ldOMcC4ln3N3zsI5C5yv4oUox6BGZk9zKr/3LNA3N4YMjevaTn6PhOo/kd9
	 W9HBLi2SXvMSR0sDUDKhwkN3z+Y+B3QKltv8IY+WdApUsrnSrugxRDxyDFmbhtBUfO
	 oTuDSsmAY6ah9ORoYmKmbwbgl+04bJl/RU0cuRaorgqXHcyaBmN4nshOEzaps3fEN/
	 giAso8+Qdl+GqxyItpKXrmswDyQrve2FNDbuUqatXVr4rH8lO7kggalL9W5pI09GVY
	 uRY0glmbqbw9g==
Date: Mon, 14 Apr 2025 12:35:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/17] timers: Complete the timer_*() API renames
Message-ID: <Z_zk94RFo2bK85iJ@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>


* Ingo Molnar <mingo@kernel.org> wrote:

> Complete the timer API namespace cleanup that begun with:
> 
>   8fa7292fee5c treewide: Switch/rename to timer_delete[_sync]()
> 
> The best way to view this series is to look at the right side
> column of this table of renames, in order of API appearance
> in <linux/timer.h>:
> 
>        add_timer_global()                  =>          timer_add_global()
>        add_timer_local()                   =>          timer_add_local()
>        from_timer()                        =>          timer_container_of()
>        mod_timer_pending()                 =>          timer_mod_pending()
>        timer_delete()              ... [unchanged] ... timer_delete()
>        timer_reduce()              ... [unchanged] ... timer_reduce()
>        timer_shutdown()            ... [unchanged] ... timer_shutdown()
>        timer_shutdown_sync()       ... [unchanged] ... timer_shutdown_sync()
>        try_to_del_timer_sync()             =>          timer_delete_sync_try()
>        add_timer()                         =>          timer_add()
>        add_timer_on()                      =>          timer_add_on()
>        mod_timer()                         =>          timer_mod()

BTW., my suggestion would be to maybe change this to timer_modify(), 
because timer_mod() reads a bit weirdly.

This would be similar to how del_timer() was changed to timer_delete().

I didn't want to make bigger, discretionary changes in the first 
iteration, but I can easily propagate any such suggestions into future 
versions of this series.

If we do that, we'd also do timer_modify_pending().

>        timer_delete_sync()         ... [unchanged] ... timer_delete_sync()
>        timer_setup_on_stack()      ... [unchanged] ... timer_setup_on_stack()
>        destroy_timer_on_stack()            =>          timer_destroy_on_stack()
>        timer_pending()             ... [unchanged] ... timer_pending()
>        timer_setup()               ... [unchanged] ... timer_setup()
>        init_timer_key()                    =>          timer_init_key()
>        init_timer_on_stack_key()           =>          timer_init_on_stack_key()

Maybe timer_init_key_on_stack()? Because the base name should be 'timer_init_key'.

That would similar to how we have:

		__timer_init()
		__timer_init_on_stack()

where _on_stack is a suffix.

> 
>        __init_timer()                      =>          __timer_init()
>        __init_timer_on_stack()             =>          __timer_init_on_stack()
> 
>        NEXT_TIMER_MAX_DELTA                =>          TIMER_NEXT_MAX_DELTA
> 
>        init_timers()                       =>          timers_init()
>        timers_dead_cpu()           ... [unchanged] ... timers_dead_cpu()
>        timers_prepare_cpu()        ... [unchanged] ... timers_prepare_cpu()

Note that with this rename there's now a unified timers_*() namespace 
for subsystem-wide functionality, such as boot-time setup or hotplug 
callbacks.

Thanks,

	Ingo
