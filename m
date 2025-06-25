Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57498262FDB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856197; cv=none; b=HtufNprjiJBajb75IP4DTNJ5tmdrlHADQ3uVqJlZCHW6XGLtTR5SfRo/9rvQ8/FvZl0GgH4lncaz7jeIMSgp9CXQhBov76Dyy0sJJmxFxUmK8UoHm0tOEtqLL21hvqYT0Tlp6tpjY7c6xBGDeeuwUixvVh4DKJ0ufEI/K2y4VUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856197; c=relaxed/simple;
	bh=kiJkhbD887D7E5HxOxF/kiBhYYzNxATNFuZWHOcOG8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWYEr3kP2doKGrJYFNla7EoXK+SHKw4E0iFCJbZsXhw18Bhiju9GM+SNTBJ5TmkId+RwYQOjj1VJQ6Y+NB0/VbTHBIeq7wpsStOCrpuuUGm5Q/j+vMX6h008FOxNUi1ipOeUlIRb1ml+iDCz4xBuSv0yOK+ZSggpYQxJYWFEWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPMJ2x0S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPMJ2x0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750856194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yUkvyC2Z5d27PXdLFK+gO49jin43XWbaxtmm6zdhbUA=;
	b=XPMJ2x0S8P5DYQCKFDru13uNfnQu3TUxvNnq/GO1ed1s5LKYWUPPTjdvHHxLxV22kB7Ip/
	J9HsF1jhwx3xdMRauOBunHvwc48HxYmnjlj3gBkEkoTq8HSK4uzrMhsicZ5/U2tglU9w/G
	eT670EmHxJRqVpQ5Yes0bwCQTxGyEkU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-pRoR9FiSM22PKQWs8yqh5g-1; Wed, 25 Jun 2025 08:56:32 -0400
X-MC-Unique: pRoR9FiSM22PKQWs8yqh5g-1
X-Mimecast-MFC-AGG-ID: pRoR9FiSM22PKQWs8yqh5g_1750856191
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so884903f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856191; x=1751460991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUkvyC2Z5d27PXdLFK+gO49jin43XWbaxtmm6zdhbUA=;
        b=EsQkIaVWL0PW29eMdJVuNNWJrOqzHbEQEkDQ7jb38Jz/IcAcxfkZrM5QjVScW+GkPC
         igvQQR43Tz30fulTNQr3O/xfvzj/ec5eC0RwVy46VkLdamT2YMWAfcG8W2c4WOPB6lRQ
         T2oOOkLgKweeUdsFpdDAwzE9BoTn7Z3JQPE68LKwLSMJ0bcqhMWFxYp3LoGdTjZ4vSkR
         jO+DTXSHuVbwcrruSYJ59ZNJEcGN1BXv8xxhgRI9+RD1HMDDEIYLs7Esdgd9/2H3GVxb
         HLf5fnI7EEdo4EYoDEUwgXPIEq2z8XHyE3xiJKqA6YNBFzGGl1s8FzlnwMHAMV3XKmQs
         3AoA==
X-Gm-Message-State: AOJu0Ywf+YW2jt/qk7fzpZ7RfK4sPD8mbiRT46nn1YADcaW9HPgx1LXq
	a03aUB2hGp+4t4ZLFXwAefN766B4fsyafa2DgPC1n6zc/+o6/DxopDrtuHzUdA0tlwyJyYpEzIL
	Kx7QC3r+bFc9jqKahwn1IgknGggOkwKjj4ewz12NYDhHf5hspTeZoknfz6K+aCtHBwQ==
X-Gm-Gg: ASbGncuFViRAuqTJKgKTyRlNvY+kjVelr73ne9UIz7a9nW5bQEYo+radqsBsUzDc07Q
	F0/f8tW/j/5giXjmREH4VonhKdmtmANilBGVZpygpgUEPxSiWJA38fUKxsLQbFWjK4w/2yIlwkP
	GjxuRH5qyIBmIRGzGltc7QbmzBOgzgFWUsyjKUH8Px+LGFkflzD5Ta8HlNM56oh5RollTzdVeUu
	N7i0QWpOHGOSbTFUd8XjfzL1K2ffDUvfhbTZxLy7pDFSo8PFUR4uTBWtqeZWecUHCX64+Ymda1g
	TWp1o09bj3FDbQg74dIYQDhprnKKr6gYElEht3okx6fpNPWFUzlH
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr2384430f8f.21.1750856191418;
        Wed, 25 Jun 2025 05:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtKoxtt02GMNCN32sG8EO2q8gJ0Qg3a2QadOwIyW/8s+055cKB+IjLXH3hR/alWyyYb8NDsw==
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr2384399f8f.21.1750856190875;
        Wed, 25 Jun 2025 05:56:30 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.11.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d5f4sm4429336f8f.27.2025.06.25.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:56:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:56:27 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 04/14] sched/deadline: Prevent setting server as
 started if params couldn't be applied
Message-ID: <aFvx-z7Dd_0mYMeg@jlelli-thinkpadt14gen4.remote.csb>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-5-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-5-joelagnelf@nvidia.com>

Hi Joel,

On 20/06/25 16:32, Joel Fernandes wrote:
> The following call trace fails to set dl_server_apply_params() as
> dl_bw_cpus() is 0 during CPU onlining.
> 
> [   11.878356] ------------[ cut here ]------------
> [   11.882592]  <TASK>
> [   11.882685]  enqueue_task_scx+0x190/0x280
> [   11.882802]  ttwu_do_activate+0xaa/0x2a0
> [   11.882925]  try_to_wake_up+0x371/0x600
> [   11.883047]  cpuhp_bringup_ap+0xd6/0x170
> [   11.883172]  cpuhp_invoke_callback+0x142/0x540
> [   11.883327]  _cpu_up+0x15b/0x270
> [   11.883450]  cpu_up+0x52/0xb0
> [   11.883576]  cpu_subsys_online+0x32/0x120
> [   11.883704]  online_store+0x98/0x130
> [   11.883824]  kernfs_fop_write_iter+0xeb/0x170
> [   11.883972]  vfs_write+0x2c7/0x430
> [   11.884091]  ksys_write+0x70/0xe0
> [   11.884209]  do_syscall_64+0xd6/0x250
> [   11.884327]  ? clear_bhb_loop+0x40/0x90
> [   11.884443]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> It is too early to start the server. Simply defer the starting of the
> server to the next enqueue if dl_server_apply_params() returns an error.
> In any case, we should not pretend like the server started and it does
> seem to mess up with the sched_ext CPU hotplug test.
> 
> With this, the sched_ext hotplug test reliably passes.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  kernel/sched/deadline.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ae15ec6294cf..d2eb31b45ba9 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1656,8 +1656,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
>  		u64 runtime =  50 * NSEC_PER_MSEC;
>  		u64 period = 1000 * NSEC_PER_MSEC;
>  
> -		dl_server_apply_params(dl_se, runtime, period, 1);
> -
> +		if (dl_server_apply_params(dl_se, runtime, period, 1))
> +			return;
>  		dl_se->dl_server = 1;
>  		dl_se->dl_defer = 1;
>  		setup_new_dl_entity(dl_se);
> @@ -1674,7 +1674,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)

I wonder if the above will still be needed if we move dl-servers init
further down (later) the boot process as I am trying to do to fix issues
reported at [1]. Also, failing to apply parameters at boot is not very
nice I am thinking. Wondering if we should WARN or do something about
it.

>  void dl_server_stop(struct sched_dl_entity *dl_se)
>  {
> -	if (!dl_se->dl_runtime)
> +	if (!dl_se->dl_runtime || !dl_se->dl_server_active)
>  		return;
>  
>  	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);

Yeah, I ended up adding the same check as a fixup in my WIP fix series.
:-)

https://github.com/jlelli/linux/commits/upstream/fix-grub/

1 - https://lore.kernel.org/lkml/aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb/

