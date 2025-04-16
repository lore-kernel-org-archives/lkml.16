Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870DF9DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770662; cv=none; b=mT9NicURC8r3nxpwgsYbDMAX8Mbx0Ye/wlRnoddYPS3+k4JqEyjje8cte1PLXAG1Q6DsBjOuoF+onGacJbFFxkp0JXQo1bJxvMpmmAjiWVtKl+NfE6/HwiPiIUTkOp5gyS6TFWZ5PkOWokCB0B9dVHCsjMks/T+Bo9DIW7LSELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770662; c=relaxed/simple;
	bh=uTCUOMW0q3NjhASYgK3ZnALnwpLe6t3kZ+c9c7jcxxY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pVGpjd+1paiy1+6D4mLn/n7ASJF5GBXq3lFx1F+1+CaTV8eIN8MU2vdYCWvvBv2BHYV6vC5mAOsxYXwvvqnC3oO3VzOmAZnQDfSsNYqsf9JAIuj0kBBJHoG7bsYa7/aN1FavCM0MsAkAf4eLRCFGDM4r+7cVs++vr4EKJqjjL8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HY5hHP0u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HY5hHP0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68598C4CEE7;
	Wed, 16 Apr 2025 02:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744770661;
	bh=uTCUOMW0q3NjhASYgK3ZnALnwpLe6t3kZ+c9c7jcxxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HY5hHP0ug6Dv4X5kcZibf5q+3E6ONzFT0Tsti8EEq9Mq4LViLyTA3L9gCcUyK+hDP
	 2PqAY0VEn0YFHk3Bb51hw4CZiZKmtWFkpZTktWL2LvLTQ/rk4mjRt7gOrPy7pqFAZZ
	 hv2sfwzhAtFqZHq8drRJD1ZM0/UctMYuwcdUxZwA=
Date: Tue, 15 Apr 2025 19:31:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: joel.granados@kernel.org, song@kernel.org, dianders@chromium.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix watchdog may detect false positive of
 softlockup
Message-Id: <20250415193100.562d55b34851e8c9058c5658@linux-foundation.org>
In-Reply-To: <20250416013922.2905051-1-luogengkun@huaweicloud.com>
References: <20250416013922.2905051-1-luogengkun@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 01:39:22 +0000 Luo Gengkun <luogengkun@huaweicloud.com> wrote:

> The watchdog may dectect false positive of softlockup because of stop
> softlockup after update watchdog_thresh. The problem can be described as
> follow:
> 
>  # We asuume previous watchdog_thresh is 60, so the timer is coming every
>  # 24s.
> echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
> |
> +------>+ update watchdog_thresh (We are in kernel now)
> 	|
> 	|
> 	+------>+ watchdog hrtimer (irq context: detect softlockup)
> 		|
> 		|
> 	+-------+
> 	|
> 	|
> 	+ softlockup_stop_all
> 
> As showed above, there is a window between update watchdog_thresh and
> softlockup_stop_all. During this window, if a timer is coming, a false
> positive of softlockup will happen. To fix this problem, use a shadow
> variable to store the new value and write back to watchdog_thresh after
> softlockup_stop_all.
> 

Changelog is a bit hard to follow.  I asked gemini.google.com to clean
it up and it produced this:

: The watchdog may detect a false positive softlockup due to stopping the
: softlockup detection after updating `watchdog_thresh`.  The problem can
: be described as follows:
: 
: ```
: # Assume the previous watchdog_thresh is 60, so the timer triggers every 24 seconds.
: echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
: |
: +------>+ Update watchdog_thresh (Kernel space)
: 	|
: 	|
: 	+------>+ Watchdog hrtimer (irq context: detect softlockup)
: 		|
: 		|
: 	+-------+
: 	|
: 	|
: 	+ softlockup_stop_all
: ```
: 
: As shown above, there is a window between updating `watchdog_thresh`
: and `softlockup_stop_all`.  During this window, if a timer triggers, a
: false positive softlockup can occur.  To fix this problem, a shadow
: variable should be used to store the new value, and this value should
: be written back to `watchdog_thresh` only after `softlockup_stop_all`
: has completed.  

I don't know how accurate this is - please check&fix it and consider
incorporating the result?

> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -47,6 +47,7 @@ int __read_mostly watchdog_user_enabled = 1;
>  static int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
>  static int __read_mostly watchdog_softlockup_user_enabled = 1;
>  int __read_mostly watchdog_thresh = 10;
> +static int __read_mostly watchdog_thresh_shadow;
>  static int __read_mostly watchdog_hardlockup_available;
>  
>  struct cpumask watchdog_cpumask __read_mostly;
> @@ -876,6 +877,7 @@ static void __lockup_detector_reconfigure(void)
>  	watchdog_hardlockup_stop();
>  
>  	softlockup_stop_all();
> +	watchdog_thresh = READ_ONCE(watchdog_thresh_shadow);

I expect a reader of this code will wonder "what's all this
watchdog_thresh_shadow stuff".  Can you please add a few small comments
to explain why we're doing this?


