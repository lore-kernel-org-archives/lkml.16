Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D0C1F12F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671941; cv=none; b=FB1yRZM+3bZDZppmjoUkjGw369Xy2ts7ehcJQqwLDGhj/R+hCTb+s37HZ3iuRif3ZUxpmIEyyGg9hx2jgZNnFNaui8SFbfUwPRewsFzhI5d2Um4lXXajRjqGIy+iexcJGR7yp3JXY5LPVS1NYTQBBEPXMBBkpgiM3jmNLUhR2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671941; c=relaxed/simple;
	bh=HjXwZjrWSWpTGn0Xh3Tw/Q7l0FTJDuJ3AB9KN8lNfyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9FKap5h7tnUWTz13qcxLxpAb5aZ0tiL3HbnZ2W6Z8l0syKO8EIZRp9y8UsABdMmRUeEQwVNzqB4ZOkq24r+Eza4n7S/XKk5B3n3cr6ZvOBhqurBLjEIfsxgpO2hs2agz/iesnidyzr13QR93GP0lhgAw8hJbZqR78Jrskq9a8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C6D106F;
	Thu,  3 Apr 2025 02:19:01 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C813F63F;
	Thu,  3 Apr 2025 02:18:56 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:18:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	d7271.choe@samsung.com, joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250403-rare-wasp-of-management-9bce59@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+3kwsesiXyC0hbO@perf>

On Thu, Apr 03, 2025 at 10:30:42AM +0900, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 12:56:53PM +0100, Sudeep Holla wrote:
> > (Failed to find the original email, so reply on this instead)
> > 
> > On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> > > 
> > > The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> > > so we cannot rely on it in that context.
> > > We would like to use these suspend/resume functions during S2IDLE as well.
> > 
> > I have one orthogonal question. The s2idle will just use the deepest
> > cpuidle state registered. So if s2idle needs this save/restore of GICv3
> > ITS, how does that work when all the CPUs enter that idle state.
> > 
> > With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
> > bit confused as how it can work fine in normal cpuidle paths but no in
> > s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
> > s2idle little different but nothing to change this GICv3 ITS save/restore
> > requirement between cpuidle and s2idle.
> > 
> Hi Sudeep,
> 
> Thanks for asking.
> As a SoC vendor, we are using the Android kernel, which includes a vendor
> hook like the one below.
> 
> In this function, a vendor-specific handler attached to
> trace_android_vh_cpuidle_psci_enter is called.
> 
> 54 static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
> 55                                                     struct cpuidle_driver *drv, int idx,
> 56                                                     bool s2idle)
> 57 {
> 58         struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
> 59         u32 *states = data->psci_states;
> 60         struct device *pd_dev = data->dev;
> 61         u32 state;
> 62         int ret;
> 63
> 64         ret = cpu_pm_enter();
> 65         if (ret)
> 66                 return -1;
> 67
> 68         /* Do runtime PM to manage a hierarchical CPU toplogy. */
> 69         trace_android_vh_cpuidle_psci_enter(dev, s2idle);
> 
> Within the vendor-specific handler, if the current mode is S2IDLE and the
> CPU logical number is 0, the GIC ITS suspend function is executed.
> 

/me more confused.

Are you saying you have some cpuidle platform specific logic inside
trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
trace the entry into the state and nothing more.

In fact, it was recently added upstream as well.
Commit 7b7644831e72 ("cpuidle: psci: Add trace for PSCI domain idle")

Further you didn't explicitly answer my question. IIUC are you calling
GIC ITS suspend function unconditionally if its boot cpu ? Or is it
done only for s2idle ? If done only for s2idle, how does it work for
normal cpuidle entry to deepest idle state that matches the one entered
during s2idle.

-- 
Regards,
Sudeep
