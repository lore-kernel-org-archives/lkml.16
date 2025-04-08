Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6221C22B8CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109208; cv=none; b=r7ZrvB0QuHpW/lD2PzDdIEMZ80+q2hwt0lkzzsM/VejTFD+uqUy6NuJ03dWNTROEGg1HMrjymZHX/aErt4G0jom6APXWrdPkciaVWrfAcyyRkV9UJfNHh4IIrFcqIt4zPH98TkMClKxCfqZT5XFiA5wQLU3c2kLO3I/3MhQneSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109208; c=relaxed/simple;
	bh=xJ2o+XwqJeqtT38jisDrj6CN90JkDEBQlYCW6UfI7So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9gcJNbsJxa+ZFfI9uhqh925HEkRgwGPbMjFuNkRqMkY7URnhcmsqRyektGYmITX1FZBDFl6EHjR1CVHEl/p+7qGwyFJMW6S3uskHPxjHTxi5oIbExbnLRQacODPu9BVnSwyJ1yNoBwYdl2X6uJ+ipEFvtLh7Vrsf9e5RVUN4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923A61688;
	Tue,  8 Apr 2025 03:46:46 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A43C3F6A8;
	Tue,  8 Apr 2025 03:46:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:46:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Donghyeok Choe <d7271.choe@samsung.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250408-transparent-daft-dog-ec2a74@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
 <20250403-rare-wasp-of-management-9bce59@sudeepholla>
 <20250404041323.GA685160@tiffany>
 <20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
 <20250407225146.GA2858456@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407225146.GA2858456@tiffany>

On Tue, Apr 08, 2025 at 07:51:46AM +0900, Donghyeok Choe wrote:
> On Mon, Apr 07, 2025 at 10:17:43AM +0100, Sudeep Holla wrote:
> > On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> > > On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > > > /me more confused.
> > > > 
> > > > Are you saying you have some cpuidle platform specific logic inside
> > > > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > > > trace the entry into the state and nothing more.
> > > 
> > > If you have any further questions, feel free to reach out.
> > > 
> > 
> > I was trying to understand the difference in behaviour between normal
> > cpuidle entering the same deepest state that is entered in s2idle state.
> > I assume GIC doesn't loose power and no need for GIC ITS save/restore
> > in normal cpuidle path ?
> >
> > If so, what triggers the GIC suspend in s2idle path if syscore_ops is
> > not getting called ?
> >
> > Why would the firmware pull the plug on GIC ?
> 
> The GIC loses power. It is powered down to the same level as during suspend.
> Therefore, it became necessary to perform GIC ITS save/restore through
> a method other than the GIC ITS syscore path.
> To help with better understanding, I will write a pseudo code.
> 
> void mimic_syscore_suspend()
> {
> 	/* Perform the actions required to power off all cores. */
> 	...
> 	its_save_disable();
> }
> 
> void android_vh_cpuidle_psci_enter_handler(... bool s2idle)
> {
> 
> 	if (!s2idle)
> 		return;
> 
> 	set_cpu_powerdown_mark();
> 
> 	if (cpu != booting core)
> 		return;
> 
> 	/* only booting core here */
> 	mimic_syscore_suspend()
> }
> 
> void mimic_syscore_resume()
> {
> 	...
> 	its_restore_enable();
> }
> 
> void android_vh_cpuidle_psci_exit_handler(... bool s2idle)
> {
> 	if (!s2idle)
> 		return;
> 
> 	if (cpu == booting core)
> 		mimic_syscore_resume();
> 
> 	set_cpu_poweron_mark();
> }
> 
> All cores will be marked as powered down when the HVC/SMC call for
> CPU suspend is invoked. When all cores call the suspend function,
> the firmware will recognize the powerdown mark and transition
> the system into suspend. At this point, the entire GIC will also
> be powered off.
> In a cpuidle situation that is not s2idle, the cores do not mark
> CPU powerdown, so the GIC ITS save/restore operation is neither
> performed nor necessary.
> 

OK, I understood. In short, you create problems by hacking up or misusing
your trace handlers in ways it shouldn't be, and now you are t/crying to
solve those problems.

> > Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
> No, there are parts of the GIC that require secure access, so the
> GIC save/restore is performed by the firmware.
> Since the GIC-ITS is entirely controlled as a non-secure IP,
> I think it is more efficient to perform save/restore in the kernel.
> 

I can understand that part, but my hacking up things the way you have
shown above, though you may think you have achieved some feature very
smartly, you have just dug up the hole with issues you are facing now.

The only reason IIUC s2idle info is used is to identify when the RPM
is disabled. You are using that info to manage GIC power state.

The CPU deepest idle states entered in the normal and s2idle must be
same. If you want to still achieve extra power save with GIC powerdown
make it completely transparent to the OS.

-- 
Regards,
Sudeep
