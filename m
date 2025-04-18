Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894A26A0B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744961482; cv=none; b=gO8RpvrMi6U35bVxcrfgYfWCo7YqcvZEMhOdPeVQgnArLcfEHVAnFkec1TDqr1JUajzKnXXm2/unqyeHDS8akCWDwjfdr6PRN2BxSMFGYpPm0pY1pcjZgK3snUqsZv0UTo0hs8wdjD5ifOiLHqBg0f3eNx/tMd+BCXZAV0+s6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744961482; c=relaxed/simple;
	bh=d4UBkY2la6/3RAILDwAbbTryW5C4vVzM3FviVjTGwqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHhRY3xeHsd+tFH1Nw6Dygi2pjwSwEb9MQj/gBpEk0GCzipnOKUZzxXqynoAGt6Nv4E1IBBo+cSMc5Fbl6s6SPakpW8I2z8323/xzP6EatcdXaP39ZH/Tx9L9B4UDYB5ppIGWxEYesQL8yip0ZdTWQQF6qsDlomiP6hDWivN2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSTvotwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSTvotwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6018C4CEE7;
	Fri, 18 Apr 2025 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744961480;
	bh=d4UBkY2la6/3RAILDwAbbTryW5C4vVzM3FviVjTGwqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSTvotwP+bQHy6Aiy0jIkKgw976YfNL9JnYtYAkp1LSZVZ+0O0UUCii9BmBW0Tc6C
	 bIw0ouQXC1yvWcKjcWBaKm3gsp3nnt5P4DnY0kVHkOjt9J2E6QbMErlveCojPExySL
	 3KV4wqqodwo+T5qDYSDPKEs8zcOK9JVLon+c6giIEm7I4q8EDywBx2OEoDYRWEAf0V
	 80HgjZkY9qICV+MuCn2sWcx0vaGBDpmfJlVEDgxLaqRhCU8wEoyMEgXaayMY6Woz1g
	 Ksy3tjlOoPmMUgvgyUW+tN3ehALF5LA/LEc1C2eEWWfJ9RAar8wqh5IkWa1+2c9hbX
	 jkJBUK605j5Mg==
Date: Fri, 18 Apr 2025 09:31:16 +0200
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH -v2 00/10] timers: Simple cleanup of the timer API
 namespace
Message-ID: <aAH_xCECRV75M6ON@gmail.com>
References: <20250416090544.3311613-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>


* Ingo Molnar <mingo@kernel.org> wrote:

> [ Changes since -v1:
>    - Exclude the 6 APIs that need further work, keep 9 APIs/symbols
>    - timer_init_on_stack_key() -> timer_init_key_on_stack()
>    - Fixes
>    - Rebase to -rc2
> ]

> Ingo Molnar (10):
>   rust: Rename timer_container_of() to hrtimer_container_of()
>   treewide, timers: Rename from_timer() => timer_container_of()
>   treewide, timers: Rename try_to_del_timer_sync() => timer_delete_sync_try()
>   treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
>   treewide, timers: Rename init_timer_key() => timer_init_key()
>   treewide, timers: Rename init_timer_on_stack_key() => timer_init_key_on_stack()
>   treewide, timers: Rename __init_timer() => __timer_init()
>   treewide, timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
>   treewide, timers: Rename NEXT_TIMER_MAX_DELTA => TIMER_NEXT_MAX_DELTA
>   treewide, timers: Rename init_timers() => timers_init()

>  708 files changed, 997 insertions(+), 997 deletions(-)

Thomas, if these changes are broadly acceptable to you as a first step, 
I'd like to propose the following merge order:

These 7 patches with a low -next cross section could go into 
tip:timer/core the regular way, if they pass review & testing:

  rust: Rename timer_container_of() to hrtimer_container_of()
     5 files changed, 6 insertions(+), 6 deletions(-)

  timers: Rename init_timer_key() => timer_init_key()
     2 files changed, 8 insertions(+), 8 deletions(-)

  timers: Rename init_timer_on_stack_key() => timer_init_key_on_stack()
     2 files changed, 6 insertions(+), 6 deletions(-)

  timers: Rename __init_timer() => __timer_init()
     2 files changed, 4 insertions(+), 4 deletions(-)

  timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
     2 files changed, 4 insertions(+), 4 deletions(-)

  timers: Rename NEXT_TIMER_MAX_DELTA => TIMER_NEXT_MAX_DELTA
     3 files changed, 11 insertions(+), 11 deletions(-)

  timers: Rename init_timers() => timers_init()
     3 files changed, 3 insertions(+), 3 deletions(-)

( Note that I've removed the 'treewide' prefix for these patches, as 
  these really are mostly timer subsystem internal changes. )

The three largest changes, which patches I've already ordered to be at 
the tail of the series in the latest mingo/tip.git/WIP.timers/core 
tree, would go to Linus separately, two days before -rc1 or so, 
assuming everything passes review & testing:

  treewide, timers: Rename try_to_del_timer_sync() => timer_delete_sync_try()
     7 files changed, 17 insertions(+), 17 deletions(-)

  treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
     26 files changed, 35 insertions(+), 35 deletions(-)

  treewide, timers: Rename from_timer() => timer_container_of()
     697 files changed, 923 insertions(+), 923 deletions(-)

In addition to this I'll also work on the timer_start_*() API cleanup & 
restructuring you suggested. Please send me the prelimary cocci script 
you had for this that you mentioned in the previous mail and I'll try 
dusting it all off. (Or I'll write new scripts if you cannot find 
them.)

Thanks,

	Ingo
