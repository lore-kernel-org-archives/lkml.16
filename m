Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA219DF4A;
	Thu, 24 Apr 2025 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745535370; cv=none; b=Sa/eo32bB+PEeqo64RWAyBcfA13TD4JfEqrI5xv7JeoJvVMWIBFl89vXwr/7AtS1dJ9Zr++WCleLsT5N2RVNx0U9zhRY6ikIXZwEBhRlNvJow42z/EDbruuZ0kzYsZUWAyMqWPQZJhW7SKQdOTGpryEtx8WOhjhXMdAmvAbX6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745535370; c=relaxed/simple;
	bh=rONlSTV9KsUzMXsWImgBgWL3p1SN2kaztMqBtsBDXbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqWaY7sHX/rMGHjlv91RNSL1PHOHpYbqRkOJN1JbtL8xNTNR4RzNi50+ZGS/fPo5eUr7+8gGdB1BHfuA6tcf7t955KYqbXbERW57Fm4Eeii91S7SgF034m5vgnkwzwvPYmwdSU76hMXPSWmYdJstc0o8kIai8qF2iPXmth7pH3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g12+dwYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g12+dwYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE87C4CEE3;
	Thu, 24 Apr 2025 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745535370;
	bh=rONlSTV9KsUzMXsWImgBgWL3p1SN2kaztMqBtsBDXbQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=g12+dwYsHbx2EXPghRdnJGqXrtjQJJ45JP81rkiNmfmCy6l3wzihx0uHZqbEGYBIp
	 Km0d06Vx+zRg4a18en4g9J6vYjmkfcWiZnGZ9RxhpgJACh9FTd2Jxgs19BuA+ytriL
	 ji/upc0HaRlMScQYr5CSh3Q4KAxqbsGV2iEysciyVfqRb/tD31Z4SpET5/rt/eBdQr
	 vzuY1iuClmMjE1WqYIIQNlIQdlNQQwhqco1HhgX2yOP6Tmvbj7IcObBq3Q+PyUcE2V
	 LBDr0lqzHqw9Z6QwC5jKQpdoWttSJ5iNjwa45qWZE4cDDEe072HUqoy8docruDomv6
	 qF9HSI37AkQVA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D2821CE191C; Thu, 24 Apr 2025 15:56:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:56:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <7f32b085-c9e9-4686-9a93-539080cee9ab@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
 <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
 <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
 <aAmYzAsE6fPz5uaB@xsang-OptiPlex-9020>
 <5863ed5d-81b4-452a-a929-d68c26d6d028@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5863ed5d-81b4-452a-a929-d68c26d6d028@paulmck-laptop>

On Wed, Apr 23, 2025 at 08:05:53PM -0700, Paul E. McKenney wrote:
> On Thu, Apr 24, 2025 at 09:50:04AM +0800, Oliver Sang wrote:
> > hi, Paul,
> > 
> > On Tue, Apr 22, 2025 at 10:54:10AM -0700, Paul E. McKenney wrote:
> > 
> > [...]
> > 
> > > > > > 
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > > > > > 
> > > > > > 
> > > > > > The kernel config and materials to reproduce are available at:
> > > > > > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> > > > > 
> > > > > Good catch, and thank you for your testing efforts!
> > > > > 
> > > > > Does the patch at the end of this email help?
> > > > 
> > > > sorry but the patch does not help. one dmesg is attached.
> > > 
> > > And idiot here failed to check for the exact same problem at the point
> > > where the timer is queued, so thank you for bearing with me.
> > > 
> > > Does the patch at the end of this email (in addition to the previous
> > > patch) get the job done?
> > 
> > unfortunately, it still doesn't fix, one dmesg is attached. part of is as [2]
> > 
> > but I applied your two patches directly upon ddd062f753, like below:
> > 
> > * 1c91d0bd4809f (linux-devel/fixup-1539a7e7b61a9) further patch for ddd062f753 from Paul
> > * 1539a7e7b61a9 (linux-devel/fixup-ddd062f753) fix for ddd062f753 from Paul E. McKenney
> > * ddd062f7536cc rcutorture: Complain if an ->up_read() is delayed more than 10 seconds
> > * 1b983c34d5695 rcutorture: Comment invocations of tick_dep_set_task()
> > 
> > 
> > I noticed there are some conflicts while applying your second patch, the
> > 1c91d0bd4809f looks like [1]. there is no "int rtorsu_cpu;" before line:
> > +	ktime_t rtorsu_kt;
> > 
> > seems your patch has a different base? I worried if my applyment has
> > problems. if so, could you tell me the correct base? thanks!
> 
> It looks correct to me.  I will rebase at my end to make it apply cleanly
> by the end of my tomorrow at the latest.  Attempting it now would likely
> just make a mess.  :-/
> 
> And thank you very much for your help with this because...
> 
> > [1]
> > commit 1c91d0bd4809f9f12e61f25d881a02f25c473702 (linux-devel/fixup-1539a7e7b61a9)
> > Author: 0day robot <lkp@intel.com>
> > Date:   Wed Apr 23 10:27:51 2025 +0800
> > 
> >     further patch for ddd062f753 from Paul
> > 
> >     Signed-off-by: 0day robot <lkp@intel.com>
> > 
> > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > index e7b5811e0e456..14cc67d436c97 100644
> > --- a/kernel/rcu/rcutorture.c
> > +++ b/kernel/rcu/rcutorture.c
> > @@ -2438,6 +2438,7 @@ rcu_torture_reader(void *arg)
> >  struct rcu_torture_one_read_state_updown {
> >         struct hrtimer rtorsu_hrt;
> >         bool rtorsu_inuse;
> > +       ktime_t rtorsu_kt;
> >         unsigned long rtorsu_j;
> >         struct torture_random_state rtorsu_trs;
> >         struct rcu_torture_one_read_state rtorsu_rtors;
> > @@ -2522,12 +2523,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> >                 schedule_timeout_idle(HZ);
> >                 return;
> >         }
> > -       rtorsup->rtorsu_j = jiffies;
> >         smp_store_release(&rtorsup->rtorsu_inuse, true);
> >         t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
> >         if (t < 10 * 1000)
> >                 t = 200 * 1000 * 1000;
> >         hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> > +       smp_mb(); // Sample jiffies after posting hrtimer.
> > +       rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
> > +       rtorsup->rtorsu_kt = t;
> >  }
> > 
> >  /*
> > @@ -2548,7 +2551,9 @@ rcu_torture_updown(void *arg)
> >                                 break;
> >                         j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
> >                         if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> > -                               WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> > +                               WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
> > +                                         "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
> >                                 continue;
> >                         }
> >                         rcu_torture_updown_one(rtorsup);
> > 
> > 
> > 
> > [2]
> > 
> > [  168.048387][  T796] ------------[ cut here ]------------
> > [  168.049342][  T796] hrtimer queued at jiffies 4294952214 for 200000000 ns took 1502 jiffies
> 
> ... I am quite surprised by the 1502 jiffies.  On a HZ=1000 system,
> I would have expected this value to be at least 10,000.  I clearly need
> to dig into this code much more carefully.

And upon looking at the dmesg.xz that you attached, I see that HZ=100.
So there really is a 15-second delay, which is intended to trip this
10-second timeout.

So I guess is it no more Mr. Nice Guy for hrtimers, and therefore
HRTIMER_MODE_HARD it is!  ;-)

Once again, thank you for your testing efforts!

I also rebased my fixup patches to the bottom of my development stack,
so the combined patch shown below should apply cleanly.  Here is hoping
that the third time is a charm.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 88d9f5298c3d8..1ebeef8019b86 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2445,6 +2445,7 @@ rcu_torture_reader(void *arg)
 struct rcu_torture_one_read_state_updown {
 	struct hrtimer rtorsu_hrt;
 	bool rtorsu_inuse;
+	ktime_t rtorsu_kt;
 	unsigned long rtorsu_j;
 	unsigned long rtorsu_ndowns;
 	unsigned long rtorsu_nups;
@@ -2488,7 +2489,7 @@ static int rcu_torture_updown_init(void)
 	for (i = 0; i < n_up_down; i++) {
 		init_rcu_torture_one_read_state(&updownreaders[i].rtorsu_rtors, rand);
 		hrtimer_setup(&updownreaders[i].rtorsu_hrt, rcu_torture_updown_hrt, CLOCK_MONOTONIC,
-			      HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
+			      HRTIMER_MODE_REL | HRTIMER_MODE_HARD);
 		torture_random_init(&updownreaders[i].rtorsu_trs);
 		init_rcu_torture_one_read_state(&updownreaders[i].rtorsu_rtors,
 						&updownreaders[i].rtorsu_trs);
@@ -2539,12 +2540,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
 		schedule_timeout_idle(HZ);
 		return;
 	}
-	rtorsup->rtorsu_j = jiffies;
 	smp_store_release(&rtorsup->rtorsu_inuse, true);
 	t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
 	if (t < 10 * 1000)
 		t = 200 * 1000 * 1000;
-	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
+	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_HARD);
+	smp_mb(); // Sample jiffies after posting hrtimer.
+	rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
+	rtorsup->rtorsu_kt = t;
 }
 
 /*
@@ -2555,6 +2558,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
 static int
 rcu_torture_updown(void *arg)
 {
+	unsigned long j;
 	struct rcu_torture_one_read_state_updown *rtorsup;
 
 	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
@@ -2562,8 +2566,10 @@ rcu_torture_updown(void *arg)
 		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
 			if (torture_must_stop())
 				break;
+			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
 			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
-				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
+				WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
+					  "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
 				continue;
 			}
 			rcu_torture_updown_one(rtorsup);
