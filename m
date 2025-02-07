Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75D154C05
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926481; cv=none; b=K+FQNRIfa8yyMZxkUpRRSq44aOKTKvrcCJR2730XtvJigzrnd3V6pMZkMntowk0eEZXtxG6/v/Ju/eZkcYXojRY+Otj/SziicoGHvE+gUiUYKEVspFCz+zno1lo94Oynspm90lvVbsBmZ/g7YOQxRkvPa6UkqVgDVEmcfAVLzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926481; c=relaxed/simple;
	bh=em5mp7iyPLUIHDvYOriyT+XJN+lR6gsNheRrOLO0lJ8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwQ5h6G/bS6wR78JtxHO2JGaHGk6p5XSXYgImxPxq6IV7ORRdbd6rN6gDAGsX5xPzVLEaGllC+D/5t5P+AYpx0CrvM+uO20XyT3kbp/0fCdPJjUBhrl6BVgmLI1MzV9194WlNisYeqM6uK24/2iHhhYZUt+dcC9WTpmyyetGxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=YJFrON5r; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="YJFrON5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738926480; x=1770462480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDrX47E7AMkaBaTAt1fatsRSKDGJpLJ0U230EiOyUUM=;
  b=YJFrON5rS7K4WpHbcjYmVpgj3wcTXyiMZevnLXAmJrngT4+ouJjWkV8K
   Shafv8vUyMYsHQmTRbuaUDGzVra0ZoDnSHPUI8ofz38yWJyHJT+YE7W/r
   FdjwxLLNK/mK2SnXGEwQyqW2KeFEIF/kDfx6gxHGz6gdPCD3txEI5oAPH
   Y=;
X-IronPort-AV: E=Sophos;i="6.13,266,1732579200"; 
   d="scan'208";a="375317767"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 11:07:58 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:6083]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.35.94:2525] with esmtp (Farcaster)
 id 88b37125-b983-4a49-973a-a4edda4b7003; Fri, 7 Feb 2025 11:07:56 +0000 (UTC)
X-Farcaster-Flow-ID: 88b37125-b983-4a49-973a-a4edda4b7003
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 7 Feb 2025 11:07:56 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 7 Feb 2025 11:07:56 +0000
Received: from email-imr-corp-prod-pdx-1box-2b-ecca39fb.us-west-2.amazon.com
 (10.43.8.6) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Fri, 7 Feb 2025 11:07:56 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com [10.253.65.58])
	by email-imr-corp-prod-pdx-1box-2b-ecca39fb.us-west-2.amazon.com (Postfix) with ESMTP id 48FEE8014E;
	Fri,  7 Feb 2025 11:07:55 +0000 (UTC)
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id D1F7E20DAA; Fri,  7 Feb 2025 11:07:54 +0000 (UTC)
Date: Fri, 7 Feb 2025 11:07:54 +0000
From: Hagar Hemdan <hagarhem@amazon.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, wuchi <wuchi.zero@gmail.com>,
	<linux-kernel@vger.kernel.org>, <Mohamed@amazon.com>,
	<Abuelfotoh@amazon.com>, Hazem <abuehaze@amazon.com>
Subject: Re: BUG Report: Fork benchmark drop by 30% on aarch64
Message-ID: <20250207110754.GA10452@amazon.com>
References: <20250205151026.13061-1-hagarhem@amazon.com>
 <4a9cc5ab-c538-4427-8a7c-99cb317a283f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4a9cc5ab-c538-4427-8a7c-99cb317a283f@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, Feb 07, 2025 at 10:14:54AM +0100, Dietmar Eggemann wrote:
> Hi Hagar,
> 
> On 05/02/2025 16:10, Hagar Hemdan wrote:
> > Hi,
> > 
> > There is about a 30% drop in fork benchmark [1] on aarch64 and a 10%
> > drop on x86_64 using kernel v6.13.1.
> > 
> > Git bisect pointed to commit eff6c8ce8d4d ("sched/core: Reduce cost
> > of sched_move_task when config autogroup") which merged starting
> > v6.4-rc1.
> > 
> > The regression only happens when number of CPUs is equal to number
> > of threads [2] that fork test is creating which means it's only visible
> > under CPU contention.
> > 
> > I used m6g.xlarge AWS EC2 Instance with 4 vCPUs and 16 GiB RAM for ARM64
> > and m6a.xlarge with also 4 vCPUs and 16 GiB RAM for x86_64.
> > 
> > I noticed this regression exists only when autogroup config is enabled.
> 
> So '# CONFIG_SCHED_AUTOGROUP is not set' in .config so we have: 
> 
> static inline void sched_autogroup_exit_task(struct task_struct *p) { }
> 
> I.e. doing a 'echo 0 > /proc/sys/kernel/sched_autogroup_enabled' still
> shows this issue?
yes, when I do 'echo 0 | sudo tee /proc/sys/kernel/sched_autogroup_enabled',
It behaves like the disable 'CONFIG_SCHED_AUTOGROUP'.
> 
> > 
> > Run the fork test with these combinations and autogroup is enabled:
> > 
> > Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
> > ----------+---------------------+--------------------+------------------
> > aarch64   | without             | 28677.0            |  3.2 us, 96.7 sy
> > aarch64   | with                | 19860.7 (30% drop) |  2.7 us, 79.4 sy
> > x86_64    | without             | 27776.2            |  3.1 us, 96.9 sy
> > x86_64    | with                | 25020.6 (10% drop) |  4.1 us, 93.2 sy
> > ----------+---------------------+--------------------+------------------
> 
> Can you rerun with:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 3e5a6bf587f9..62cc50c79a78 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -9057,7 +9057,7 @@ void sched_move_task(struct task_struct *tsk)
>          * group changes.
>          */
>         group = sched_get_task_group(tsk);
> -       if (group == tsk->sched_task_group)
> +       if ((group == tsk->sched_task_group) && !(tsk->flags & PF_EXITING))
>                 return;
I tried that and I see it fixed the regression and the cpu utilization
is 100% with it.

I'd like to ask if this like reverting the patch in case of exit path
and also means the enqueue/dequeue are needed in case of task exiting,
right?

Thanks for replying :)
> 
> > 
> > It seems that the commit is capping the amount of CPU resources that can
> > be utilized leaving around 18% idle in case of aarch64 and 3% idle in
> > x86_64 case which is likely the main reason behind the reported fork
> > regression.
> > 
> > When autogroup is disabled:
> > 
> > Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
> > ----------+---------------------+--------------------+------------------
> > aarch64   | without             | 19877.8            |  2.2 us, 80.1 sy  
> > aarch64   | with                | 20086.3 (~same)    |  1.9 us, 80.2 sy
> > x86_64    | without             | 24974.2            |  4.9 us, 92.5 sy 
> > x86_64    | with                | 24921.5 (~same)    |  4.9 us, 92.4 sy
> > ----------+---------------------+--------------------+------------------
> > 
> > So when autogroup disabled, I still see the amount of idle CPU resources 
> > 18%, 3% on aarch64 and x86_64 regardless of commit.
> > 
> > Is this performance drop an expected of this commit when autogroup is
> > enabled?
> > 
> > Thanks,
> > Hagar
> > 
> > [1] https://github.com/kdlucas/byte-unixbench/blob/master/UnixBench
> > [2] Used command: ./Run -c 4 spawn
> > 
> 
