Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D92D46BE;
	Wed,  2 Jul 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469984; cv=none; b=pmaBlOi2B3dGEqrtuMnWRZ8IZEoFiftrkBwewngfKulxkAvk83zdOTGe1NSnDpOyDQnyy46ZwIhDvGE+4XBPKhU1HUR+nSfBDL9hwkBq/ogG1Ea25D1C2t9ukCxMH9SkLj2/oj7qYZEdEbGNkJz3OhwWWm+8V2c7Q3bHXovMowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469984; c=relaxed/simple;
	bh=6YuNdY3/SCUsFVGNpash/jquxmzlvddlqK/RpCd8Kfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Huw/RdhM47CHC4k66Xrdugjgm3pKg1UpYSMaOiGeHwdQ7AfGJDeYWV/CYQc/6A/Msvt+WUuHc1nUxqtpKFK6BJSXO4sCMc6ia+pG0w+KvO5jvwNB3tpEkxJvxksJeS4MrSb6kelOTyuix3SuK44A6D76gyMo2CUSXJV0FdQ85HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9BDB2F9D;
	Wed,  2 Jul 2025 08:26:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1BDC3F6A8;
	Wed,  2 Jul 2025 08:26:20 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:26:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250702-apricot-anteater-of-fertility-92ebc2@sudeepholla>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
 <20250624145807.GA14878@nxa18884-linux>
 <20250701150735.GD20538@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701150735.GD20538@nxa18884-linux>

On Tue, Jul 01, 2025 at 11:07:35PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Tue, Jun 24, 2025 at 10:58:07PM +0800, Peng Fan wrote:
> >On Tue, Jun 24, 2025 at 11:21:52AM +0100, Sudeep Holla wrote:
> >>On Tue, Jun 24, 2025 at 01:23:10AM +0000, Peng Fan wrote:
> >>> > 
> >>> > Just to summarise my understanding here at very high level, the issue
> >>> > exists as the second notification by an agent to the Linux to suspend
> >>> > the system wakes up the system from suspend state. Since the
> >>> > interrupts are enabled before the thaw_processes() (which eventually
> >>> > continues the execution of scmi_suspend_work_func() to set the state
> >>> > to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
> >>> > much before and ends up ignoring the request as the state is still not
> >>> > set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
> >>> > addressing.
> >>> 
> >>> Thanks for writing this down, It is very correct and clear.
> >>> 
> >>
> >>While I am not against adding bus PM ops as it can be useful elsewhere,
> >>just wonder if this usecase is a good use of it. Does setting the state
> >>before the pm_suspend() call suffice. I still need to think through the
> >>possible race with that solution, but just asking you to check if that
> >
> >There is race condition if setting the state to SCMI_SYSPOWER_IDLE before
> >pm_suspend.
> >
> >The 2nd suspend notification could runs into pm_suspend again
> >before pm_suspend update system_state to SYSTEM_SUSPEND, if my understanding
> >is correct.
> >
> >Per pm_suspend->enter_state,
> >"Make sure that no one else is trying to put the system into a sleep state",
> >not sure, but I think better not let pm_suspend to handle the race condition.
> >
> >Since syspower only has one per system(linux), the other approach is to
> >use syscore, but need a global variable for state in scmi_power_control.c,
> >because syscore_suspend/resume does not have parameter.
> >
> >we need to set state back to IDLE after linux wakeup and before kernel
> >thread scheduling. I only see two interfaces to achieve:
> >PM ops or syscore ops.
> 
> Not sure you have time to give a look. I plan to post V2 later this
> week. In V2, I would still use pm ops.
> 

Sure, please go ahead and post. I didn't get time to look at it in depth.
I agree with your comment for now, will take a look at it again with your v2.

-- 
Regards,
Sudeep
