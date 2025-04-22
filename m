Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F114C5B0;
	Tue, 22 Apr 2025 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344452; cv=none; b=q2+v/nC98dEA36JoIaVwMhcFnPemfGhruA0N/22laVEjXaAopHIQwHUnyzS/6HuntUS4UPdSjU5Cm2UYu/pi+SuHW1UlEXGt7achIQ257FEYzNbrPLdgorELa1sMx34g2/L9RWqNDTC8s445957LLr4edokHITRr48T+1JsKwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344452; c=relaxed/simple;
	bh=0FQTPJHIz29z5oWjlh7KgjgaRuKuppH5aeGSXUNH8+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaPRdDE8advwjaVwAY3awbFjoVHv5xa0fldYNapX4aiaWpo8y9QeZyxwcqLOLZXQKD38LHlvqiTd7VyF1r720DyvK/wbamycUqoDdvMyQ3GWdTqDcPI/S5xdldcRGgyAXf36GfqDuy0Vg5ON4uQq+OWKFKjp2VTRvl9tn0UpyM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5sJjYiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5sJjYiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C1C4CEE9;
	Tue, 22 Apr 2025 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745344450;
	bh=0FQTPJHIz29z5oWjlh7KgjgaRuKuppH5aeGSXUNH8+s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=U5sJjYiXXnIh8A9LZGtiU+hUF2GOaGPXMnGLHln7vgPA+UHSKX8BUAQLKhcKPqPcw
	 4xW3iuXWFQrXRITzuOfmTGrLLyucuO++rWgcGbBmz0WMS+a4ibdNbiEWdzpPo9YZk2
	 8Y7eyzAGKJku5B3Pb1w4avowPj0f/fwLHViM23+5taujBy6u/UxV1if4OeTPqn8pFr
	 S2Q8f379+7BbcK8eKGa9u+ZB9FwD+rmCaqk4RHSESJC5Oiq6wvMxYJdkCmDA054kLW
	 BzjHKAD9/htiyW/n+pl/tFwj76fxcidaunSktc+FCGqBWYGH+usUlzhZNYx53ZrWdc
	 8NWRZ6Wn5HkXQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4750ECE0875; Tue, 22 Apr 2025 10:54:10 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:54:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
 <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>

On Tue, Apr 22, 2025 at 01:01:58PM +0800, Oliver Sang wrote:
> hi, Paul,
> 
> On Mon, Apr 21, 2025 at 09:34:34AM -0700, Paul E. McKenney wrote:
> > On Mon, Apr 21, 2025 at 03:39:41PM +0800, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]" on:
> > > 
> > > commit: ddd062f7536cc09fe7ff1a66816601984bc68af8 ("rcutorture: Complain if an ->up_read() is delayed more than 10 seconds")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > > 
> > > [test failed on linux-next/master f660850bc246fef15ba78c81f686860324396628]
> > > 
> > > in testcase: rcutorture
> > > version: 
> > > with following parameters:
> > > 
> > > 	runtime: 300s
> > > 	test: cpuhotplug
> > > 	torture_type: srcud
> > > 
> > > 
> > > 
> > > config: x86_64-randconfig-123-20250415
> > > compiler: clang-20
> > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > > 
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > 
> > > 
> > > +-------------------------------------------------------------------------+------------+------------+
> > > |                                                                         | 1b983c34d5 | ddd062f753 |
> > > +-------------------------------------------------------------------------+------------+------------+
> > > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]      | 0          | 24         |
> > > | RIP:rcu_torture_updown[rcutorture]                                      | 0          | 24         |
> > > +-------------------------------------------------------------------------+------------+------------+
> > > 
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > > 
> > > 
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> > 
> > Good catch, and thank you for your testing efforts!
> > 
> > Does the patch at the end of this email help?
> 
> sorry but the patch does not help. one dmesg is attached.

And idiot here failed to check for the exact same problem at the point
where the timer is queued, so thank you for bearing with me.

Does the patch at the end of this email (in addition to the previous
patch) get the job done?

							Thanx, Paul

[ . . . ]

> > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > index 3dd213bfc6662..53f0860b3748d 100644
> > --- a/kernel/rcu/rcutorture.c
> > +++ b/kernel/rcu/rcutorture.c
> > @@ -2557,6 +2557,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> >  static int
> >  rcu_torture_updown(void *arg)
> >  {
> > +	unsigned long j;
> >  	struct rcu_torture_one_read_state_updown *rtorsup;
> >  
> >  	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
> > @@ -2564,8 +2565,9 @@ rcu_torture_updown(void *arg)
> >  		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
> >  			if (torture_must_stop())
> >  				break;
> > +			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
> >  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> > -				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
> > +				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> >  				continue;
> >  			}
> >  			rcu_torture_updown_one(rtorsup);


diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index abe48ff48f54c..7268e33086eb4 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2449,6 +2449,7 @@ struct rcu_torture_one_read_state_updown {
 	struct hrtimer rtorsu_hrt;
 	bool rtorsu_inuse;
 	int rtorsu_cpu;
+	ktime_t rtorsu_kt;
 	unsigned long rtorsu_j;
 	unsigned long rtorsu_ndowns;
 	unsigned long rtorsu_nups;
@@ -2548,12 +2549,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
 		schedule_timeout_idle(HZ);
 		return;
 	}
-	rtorsup->rtorsu_j = jiffies;
 	smp_store_release(&rtorsup->rtorsu_inuse, true);
 	t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
 	if (t < 10 * 1000)
 		t = 200 * 1000 * 1000;
 	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
+	smp_mb(); // Sample jiffies after posting hrtimer.
+	rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
+	rtorsup->rtorsu_kt = t;
 }
 
 /*
@@ -2574,7 +2577,8 @@ rcu_torture_updown(void *arg)
 				break;
 			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
 			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
-				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
+				WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
+					  "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
 				continue;
 			}
 			rcu_torture_updown_one(rtorsup);
