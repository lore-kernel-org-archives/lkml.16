Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4879D0;
	Thu, 24 Apr 2025 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463955; cv=none; b=P557qgTtdtlZNdK2vmQzvblGsWfRyHvMZS1T+/DEq4b40TAaOtsLW4EcDbU1yFD2XJz4+1gkfF/15hGyySMthqqvZOoflvYnqi5ZScXMKHfvFI04Jcw5rjRSiMq5AJFPiIoZdmTojDWMAc0JT+MsXWO+/b+R5DwQTg6Gb88Y/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463955; c=relaxed/simple;
	bh=YCeXBVahkx2lcAmBCFU2fMvSEWQMKKrdLCdBEJCcrZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBJTeN8xW7NE9Sm3nSCKMqO5yzfSjkakTMHmHvWlL9N6qbHFbEW/Ux9Zqkr8xkpRnX7f9QinpOeCVrmw2ZYnT4pVE9wv1Icdl6RgqE5SH7N1Ewgm3V0j0C1lIKPEQlVYeutioLKAkjjvIFtV5GU6xsoURwTdnnqUT9yDrF81UU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXBASjbY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXBASjbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690F2C4CEE2;
	Thu, 24 Apr 2025 03:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745463953;
	bh=YCeXBVahkx2lcAmBCFU2fMvSEWQMKKrdLCdBEJCcrZA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XXBASjbYNT13ZJM3R41fuvS7vjhrEZ43YinGaXBjG2q4+Z+MThA51i8IdrZXjJt+b
	 qblwAFmEDkpqbUzQppCPevBILppBfrQuEEmoL//0DPTQHg0JwVSDv0NgvezQdyBWpO
	 RpMub1NNuHgX9Ac0AZ1uCZE/gDwEVTKOOfv3e+38R2AvAZFu52DZrnnAHdDR/KYFma
	 oBeRZhhek3epUMrkmo3Ly9OSneBihJHZYaK95rV0H8e00oj10oWTMm897wvqauUbBS
	 JOT53seG7MjQX1kE6QcZ/5GznaVKw1K6hfX1/poR0/BLj3pgbvJY2WZAekCy4a1c2q
	 MdYT8qhZMuo8g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0D9F3CE0B75; Wed, 23 Apr 2025 20:05:53 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:05:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <5863ed5d-81b4-452a-a929-d68c26d6d028@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
 <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
 <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
 <aAmYzAsE6fPz5uaB@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAmYzAsE6fPz5uaB@xsang-OptiPlex-9020>

On Thu, Apr 24, 2025 at 09:50:04AM +0800, Oliver Sang wrote:
> hi, Paul,
> 
> On Tue, Apr 22, 2025 at 10:54:10AM -0700, Paul E. McKenney wrote:
> 
> [...]
> 
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > > > > 
> > > > > 
> > > > > The kernel config and materials to reproduce are available at:
> > > > > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> > > > 
> > > > Good catch, and thank you for your testing efforts!
> > > > 
> > > > Does the patch at the end of this email help?
> > > 
> > > sorry but the patch does not help. one dmesg is attached.
> > 
> > And idiot here failed to check for the exact same problem at the point
> > where the timer is queued, so thank you for bearing with me.
> > 
> > Does the patch at the end of this email (in addition to the previous
> > patch) get the job done?
> 
> unfortunately, it still doesn't fix, one dmesg is attached. part of is as [2]
> 
> but I applied your two patches directly upon ddd062f753, like below:
> 
> * 1c91d0bd4809f (linux-devel/fixup-1539a7e7b61a9) further patch for ddd062f753 from Paul
> * 1539a7e7b61a9 (linux-devel/fixup-ddd062f753) fix for ddd062f753 from Paul E. McKenney
> * ddd062f7536cc rcutorture: Complain if an ->up_read() is delayed more than 10 seconds
> * 1b983c34d5695 rcutorture: Comment invocations of tick_dep_set_task()
> 
> 
> I noticed there are some conflicts while applying your second patch, the
> 1c91d0bd4809f looks like [1]. there is no "int rtorsu_cpu;" before line:
> +	ktime_t rtorsu_kt;
> 
> seems your patch has a different base? I worried if my applyment has
> problems. if so, could you tell me the correct base? thanks!

It looks correct to me.  I will rebase at my end to make it apply cleanly
by the end of my tomorrow at the latest.  Attempting it now would likely
just make a mess.  :-/

And thank you very much for your help with this because...

> [1]
> commit 1c91d0bd4809f9f12e61f25d881a02f25c473702 (linux-devel/fixup-1539a7e7b61a9)
> Author: 0day robot <lkp@intel.com>
> Date:   Wed Apr 23 10:27:51 2025 +0800
> 
>     further patch for ddd062f753 from Paul
> 
>     Signed-off-by: 0day robot <lkp@intel.com>
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index e7b5811e0e456..14cc67d436c97 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2438,6 +2438,7 @@ rcu_torture_reader(void *arg)
>  struct rcu_torture_one_read_state_updown {
>         struct hrtimer rtorsu_hrt;
>         bool rtorsu_inuse;
> +       ktime_t rtorsu_kt;
>         unsigned long rtorsu_j;
>         struct torture_random_state rtorsu_trs;
>         struct rcu_torture_one_read_state rtorsu_rtors;
> @@ -2522,12 +2523,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>                 schedule_timeout_idle(HZ);
>                 return;
>         }
> -       rtorsup->rtorsu_j = jiffies;
>         smp_store_release(&rtorsup->rtorsu_inuse, true);
>         t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
>         if (t < 10 * 1000)
>                 t = 200 * 1000 * 1000;
>         hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> +       smp_mb(); // Sample jiffies after posting hrtimer.
> +       rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
> +       rtorsup->rtorsu_kt = t;
>  }
> 
>  /*
> @@ -2548,7 +2551,9 @@ rcu_torture_updown(void *arg)
>                                 break;
>                         j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
>                         if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> -                               WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> +                               WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
> +                                         "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
>                                 continue;
>                         }
>                         rcu_torture_updown_one(rtorsup);
> 
> 
> 
> [2]
> 
> [  168.048387][  T796] ------------[ cut here ]------------
> [  168.049342][  T796] hrtimer queued at jiffies 4294952214 for 200000000 ns took 1502 jiffies

... I am quite surprised by the 1502 jiffies.  On a HZ=1000 system,
I would have expected this value to be at least 10,000.  I clearly need
to dig into this code much more carefully.

So thank you again for your testing efforts!

							Thanx, Paul

> [  168.050699][  T796] WARNING: CPU: 0 PID: 796 at kernel/rcu/rcutorture.c:2555 rcu_torture_updown+0x143/0x4f0 [rcutorture]
> [  168.052702][  T796] Modules linked in: rcutorture torture
> [  168.054084][  T796] CPU: 0 UID: 0 PID: 796 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00010-g1c91d0bd4809 #1 NONE  e0cf54ed16af150d49bfa95e1fe661f9e9161d42
> [  168.056119][  T796] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  168.058045][  T796] RIP: 0010:rcu_torture_updown+0x143/0x4f0 [rcutorture]
> [  168.059229][  T796] Code: 48 c1 e8 03 42 80 3c 38 00 74 05 e8 a7 1b 49 e1 49 8b 54 2d 48 49 29 de 48 c7 c7 c0 9e 5e a0 48 89 de 4c 89 f1 e8 dd 6a c4 e0 <0f> 0b e9 d2 01 00 00 4c 89 24 24 4c 8d 34 2d 68 00 00 00 4d 01 ee
> [  168.061887][  T796] RSP: 0000:ffff888152bf7e60 EFLAGS: 00210246
> [  168.062804][  T796] RAX: 0000000000000000 RBX: 00000000ffffc516 RCX: 0000000000000000
> [  168.064097][  T796] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  168.065436][  T796] RBP: 0000000000002a00 R08: 0000000000000000 R09: 0000000000000000
> [  168.066674][  T796] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888150812a40
> [  168.067932][  T796] R13: ffff888150810000 R14: 00000000000005de R15: dffffc0000000000
> [  168.069302][  T796] FS:  0000000000000000(0000) GS:ffff888424c90000(0000) knlGS:0000000000000000
> [  168.070729][  T796] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  168.071772][  T796] CR2: 000000000805b740 CR3: 000000014b9ef000 CR4: 00000000000406f0
> [  168.073736][  T796] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  168.075050][  T796] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  168.076319][  T796] Call Trace:
> [  168.076954][  T796]  <TASK>
> [  168.077552][  T796]  kthread+0x4b7/0x5e0
> [  168.079269][  T796]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture e5c5209c38907516252542c1d07dd3e619a57f4e]
> [  168.080832][  T796]  ? kthread_unuse_mm+0x150/0x150
> [  168.081731][  T796]  ret_from_fork+0x3c/0x70
> [  168.082491][  T796]  ? kthread_unuse_mm+0x150/0x150
> [  168.083328][  T796]  ret_from_fork_asm+0x11/0x20
> [  168.084182][  T796]  </TASK>
> [  168.084826][  T796] irq event stamp: 90885
> [  168.085562][  T796] hardirqs last  enabled at (90895): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
> [  168.086968][  T796] hardirqs last disabled at (90904): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
> [  168.088472][  T796] softirqs last  enabled at (90738): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
> [  168.089989][  T796] softirqs last disabled at (90729): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
> [  168.091310][  T796] ---[ end trace 0000000000000000 ]---
> 
> > 
> > 							Thanx, Paul
> > 
> > [ . . . ]
> > 
> > > > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > > > index 3dd213bfc6662..53f0860b3748d 100644
> > > > --- a/kernel/rcu/rcutorture.c
> > > > +++ b/kernel/rcu/rcutorture.c
> > > > @@ -2557,6 +2557,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> > > >  static int
> > > >  rcu_torture_updown(void *arg)
> > > >  {
> > > > +	unsigned long j;
> > > >  	struct rcu_torture_one_read_state_updown *rtorsup;
> > > >  
> > > >  	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
> > > > @@ -2564,8 +2565,9 @@ rcu_torture_updown(void *arg)
> > > >  		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
> > > >  			if (torture_must_stop())
> > > >  				break;
> > > > +			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
> > > >  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> > > > -				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
> > > > +				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> > > >  				continue;
> > > >  			}
> > > >  			rcu_torture_updown_one(rtorsup);
> > 
> > 
> > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > index abe48ff48f54c..7268e33086eb4 100644
> > --- a/kernel/rcu/rcutorture.c
> > +++ b/kernel/rcu/rcutorture.c
> > @@ -2449,6 +2449,7 @@ struct rcu_torture_one_read_state_updown {
> >  	struct hrtimer rtorsu_hrt;
> >  	bool rtorsu_inuse;
> >  	int rtorsu_cpu;
> > +	ktime_t rtorsu_kt;
> >  	unsigned long rtorsu_j;
> >  	unsigned long rtorsu_ndowns;
> >  	unsigned long rtorsu_nups;
> > @@ -2548,12 +2549,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> >  		schedule_timeout_idle(HZ);
> >  		return;
> >  	}
> > -	rtorsup->rtorsu_j = jiffies;
> >  	smp_store_release(&rtorsup->rtorsu_inuse, true);
> >  	t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
> >  	if (t < 10 * 1000)
> >  		t = 200 * 1000 * 1000;
> >  	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> > +	smp_mb(); // Sample jiffies after posting hrtimer.
> > +	rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
> > +	rtorsup->rtorsu_kt = t;
> >  }
> >  
> >  /*
> > @@ -2574,7 +2577,8 @@ rcu_torture_updown(void *arg)
> >  				break;
> >  			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
> >  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> > -				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> > +				WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
> > +					  "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
> >  				continue;
> >  			}
> >  			rcu_torture_updown_one(rtorsup);


