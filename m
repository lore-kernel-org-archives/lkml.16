Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEB7299AA3;
	Mon, 23 Jun 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696068; cv=none; b=rFgHcm7/TgVmiyc/dPO7nOE8x5d+XX67nwHLTGiUra6HJWRShWSfXkdeTJmB/1U01ewnaEdrZD9wpwoDueOEtGdAsh2mAQcRT103xLqx07i6EueJKc4+QnnLhTnuTnlvUPOpHXB8Mpk134bCBj4tVZurCpJrRbVH/SNDz7zuHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696068; c=relaxed/simple;
	bh=e7AG1sO9g6P8AweAZMbNsLUjluCD0jinneNYAB/ud4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJQaLlawW3FBGKIn5v00JooRFqVW5BQVrNXOxXffvvzyK9YrR9Ji2UoeJsnAKg4Lx/ez+JMWxDNPnSyRsmdXXZDHShHap0Wn47oeVG0WLVjZhfWH+opojr7vXDOnZHoDdeVJhGytc9p/CKLZitdAbOGPtOpkeyNg+k0eGaD3UbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BAA6113E;
	Mon, 23 Jun 2025 09:27:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C2E3F66E;
	Mon, 23 Jun 2025 09:27:39 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:27:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
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
> 
> One more example is
> Linux suspended, other agent send reboot linux message, Linux should
> wakeup and reboot itself.
> 
> Same to suspend
> Linux suspended, other agent send suspend Linux message, Linux wakeup
> and suspend again.
> 

These are very valid requirements and if this is not supported or not
working as expected, it is a BUG in the current implementation.

As lots of details were discussed in private unfortunately, I suggest you
to repost the patch with all the additional information discussed there
for the benefits of all the people following this list or this thread in
particular. It is unfair to not provide full context on the list.

Just to summarise my understanding here at very high level, the issue
exists as the second notification by an agent to the Linux to suspend
the system wakes up the system from suspend state. Since the interrupts
are enabled before the thaw_processes() (which eventually continues the
execution of scmi_suspend_work_func() to set the state to SCMI_SYSPOWER_IDLE,
the scmi_userspace_notifier() is executed much before and ends up ignoring
the request as the state is still not set to SCMI_SYSPOWER_IDLE. There is
a race which your patch is addressing.

-- 
Regards,
Sudeep
