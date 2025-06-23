Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D04267729;
	Mon, 23 Jun 2025 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691101; cv=none; b=iNjl7cngb7/vd7VbHHDCAuoEiq4nfaDFsvlq3wJVyEJsWOhSRsnf80foSs3eij+XOSppRFKo/xWZJLKL4PK0iytr6HTeI4abwIojc/RcGcIVZ5PG3Vo4Nl4VYZasn+0V4oyyUkwwnVzyUuZ/xVYUXyM3EUVbJV8Ygb3FU2nOlTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691101; c=relaxed/simple;
	bh=ELdPHZlUVrZOe8aVsLYXCzrpwY4IxMXCXJiok5DsVeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6qaFqFTBMLQGK9hisjMuztrP0qmEjJ2xvsYr0Ro+9Q3H/LQiqCXaujSyk9tEZU8g5P5/t5sXrKrNWRsR5oG4I5NQzugNMxO5XKSMyrVCdWg+oNNBFfqZKIYTeiTNd4SOFzvGAiTOYP+hI+TKFPc+PkE8d/JJn1A1URxLNMRXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ACC0113E;
	Mon, 23 Jun 2025 08:04:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C39EF3F58B;
	Mon, 23 Jun 2025 08:04:57 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:04:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dhruva Gole <d-gole@ti.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <aFltF1xqRDnyyngE@pluto>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623142957.GA10415@nxa18884-linux>

On Mon, Jun 23, 2025 at 10:29:57PM +0800, Peng Fan wrote:
> On Mon, Jun 23, 2025 at 06:27:50PM +0530, Dhruva Gole wrote:
> >On Jun 20, 2025 at 11:37:14 +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> When two consecutive suspend message send to the Linux agent, Linux will
> >> suspend and wake up. The exepcted behaviour should be suspend, wake up
> >
> >I am first trying to gather more context of the issue at hand here,
> >Why and who is sending 2 consecutive suspend messages to Linux?
> 
> Currently in my test, it is SCMI platform send two suspend messages.
> But in real cases, other high priviledge agents could send suspend messages
> to linux agent.

Dont really understand this...a high-privileged supervisor agent would
anyway send a suspend/shutdown request to the SCMI server which in turn
should be able to filter out such spurious requests...or such suspend
request from the supervisor to the agent comes through other non-SCMI
means ?

> 
> One agent may wrongly send two suspend messages by user or the agent is hacked.
>

An agent is NOT capable to send direct notification to another agent...
....notifcation are sent via the P2A channels which means that the server is
in charge to send notifs...other agents can cause notifs to be sent NOT
send them directly...so that the server can filter-out any hacked
request... 

> >
> >Just quoting the cover letter:
> >
> >> When testing on i.MX95, two consecutive suspend message send to the Linux
> >> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> >> 2nd suspend message).
> >> 
> >> The ARM SCMI spec does not allow for filtering of which messages an agent
> >> wants to get on the system power protocol. To i.MX95, as we use mailbox
> >> to receive message, and the mailbox supports wake up, so linux will also
> >> get a repeated suspend message. This will cause Linux to wake (and should
> >> then go back into suspend).
> >
> >When you say mailbox supports wake up you mean the mailbox IP in your
> >SoC actually gets some sort of wake interrupt that triggers a wakeup?
> 
> There is no dedicated wake interrupt  for mailbox.
> 
> The interrupt is the doorbell for processing notification, and this
> interrupt could also wakeup Linux.
> 
> >Is this wakeup sent to the SM then to be processed further and trigger a
> >linux wakeup?
> 
> No. As above, the mailbox received a doorbell notification interrupt.
> 
> >
> ><or> the mailbox directly wakes up linux, ie. triggers a resume flow but
> >then you are saying it was an unintentional wakeup so you want to
> >suspend linux again?
> 
> Right.
> 
> This just seems like the wakeup routing is
> >incorrect and the system is going through a who resume and then suspend
> >cycle without a good reason?
> >
> >Why and when in this flow is linux ending up with a duplicate suspend message is
> >something I still don't follow.
> 
> Other agents could send duplicated suspend messages, right?
> We could not expect other agents always behave correctly.
> 

Absolutely, BUT SCMI is a client/server system and the server is in
charge to filter-out such requests, since each agent has its own dedicated
channel and it is identified by the server as agent_X with capabilities_X
from the channel it speaks from (i.e. an agent cannot spoof its identify)

...and the server is the ultimate judge/aribter of any request so that
it can drop any unreasonable request...we should NOT delegate such
self-protection mechanisms to the agents...

> >
> >Could you point us to any flow diagrams or software sequences that we
> >could review?
> 
> Not sure what kind diagram or sequences you wanna. It is just one agent
> wrongly send duplicate suspend message to Linux agent. And Linux agent
> should suspend again.
> 
> One more example is
> Linux suspended, other agent send reboot linux message, Linux should
> wakeup and reboot itself.

Yes...another privileged agent request a Reboot for agent_X (SYSPOWER_STATE+_SET)
to the server and the server in turn sends a Reboot notification to the
suspended agent_X , which is woken up by the notification and proceeds
with a graceful shutdown/reboot...if this does NOT happen it is
definitely a bug..

> 
> Same to suspend
> Linux suspended, other agent send suspend Linux message, Linux wakeup
> and suspend again.

In theory yes, it should work like this, BUT better if the 2nd message
never come (as explained above)...if this happens, I would say log this
as a warning too because it is not a normal scenario...i.e. if you
receive multuple suspend to the same agent from the same server...
...something is wrong...I agree Linux should survive (and suspend back)
BUT should not be allowed at first (filtered-out) 

Thanks,
Cristian
