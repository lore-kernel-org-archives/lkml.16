Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57CF5FDA7;
	Mon, 23 Jun 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690096; cv=none; b=H9pxveUT41H2bIPlUmpTX6EU78tazyKuDjqKCvb8lYCnft7smoHNVsl4ZYjRnz1FR9m1IOyVps8HB5ZB94z5UDbbfkSRB5ard8lF6t17LemQ14tonGQ4PUgtPZLWp0umpXqixjp3KoMhCxAXvxvfn/wd3/oauY5sUuOInEuWLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690096; c=relaxed/simple;
	bh=xaZzalJK5pmWGPsdmSTg02HC9jaZJeoUXO/Gj+ovFwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppMdszWaGK05scIaZa8FFXJLQVtKHrVjtE+0a5/XpC2xY2mFQ5MSUi2bOt2+2UyHfZyPpMFq26wBHb4/+A11/wDfjzBsWFwzS1p2WGRZpfbDC2cmIvp8EGAK5M6ZQbRwwrA0skD92+R4ELmTxc0KhydoAT1Rd26od+/CJ4r1nTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E37113E;
	Mon, 23 Jun 2025 07:47:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 946B93F66E;
	Mon, 23 Jun 2025 07:48:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:48:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/2] firmware: arm_scmi: add pm ops for scmi_power_control
Message-ID: <aFlpJV_hXvX_nGqV@pluto>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>

On Fri, Jun 20, 2025 at 11:37:12AM +0800, Peng Fan (OSS) wrote:
> When testing on i.MX95, two consecutive suspend message send to the Linux
> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> 2nd suspend message).
> 

Hi,

> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).
> 
> This patchset is to make the 2nd suspend message could suspend linux
> again.
> 
> So why SCMI fireware couldn't block the 2nd suspend message from being
> sent to Linux agent? Per checking with our SCMI firmware owner:
> The SM(System Manager) does not know exactly when Linux is in suspend.
> There are no handshakes that clearly tell the SM this. The flow should
> be, if in suspend and you send a suspend (or graceful reset/power off)
> it will wake and then do the request action

Shouldn't the suspended-state of the agent be known to the SCNI server
since:

  A. the SCMI/server has somehow requested a suspend itself sending
     previously a SUSPEND SysPower notification (maybe to fulfill a
     Mnagement entity request)

OR

  B. Linux suspended itself by issuing a PSCI_SUSPEND call to EL3 which
     in turn should have notified the SCMI server os such request by
     issuing a SYSTEM_POWER_STATE_SET to the SCMI server

As in 3.4.1

"On application processors, a PSCI implementation. The PSCI implementation
fulfills OSPM calls to SYSTEM_OFF, SYSTEM_SUSPEND, SYSTEM_RESET and
SYSTEM_RESET2 functions. To do so, the PSCI implementation uses the SCMI
protocol to request system power down or reset transitions."


So how can the SCMI server be NOT aware of the current state of the OSPM
and send a second unneeded message ?

Also addressing Chuck reply later in this thread...

...why if the system is suspended, for whatever reason, and receives a
graceful shutdown notification it does NOT wakeup (due to the
notification received) and then shuwdown to fulfill the request just
received ? Is this the bug ? The wakeup-nortificatin is NOT processed
properly by the driver after it has been woke up ? 

Thanks,
Cristian
