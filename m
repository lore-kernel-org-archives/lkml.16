Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A724C06A;
	Mon, 23 Jun 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683486; cv=none; b=YMKE53ftBR++usSimNB8B6ITK3P4DUoTcdi/RuGxG8GZAhJR1W9McDDsFj+66XagO+OdesWQlqt0k51mPq94OqY7ocb3oDjhlCzswgn/ewF+F4rqyP/dtQyiDmwrw4WE2I5prbc6nas9yFMiLLzkHVoIoy4NXtUR+QZ3TvzNkqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683486; c=relaxed/simple;
	bh=2uRzPBv8XmRl6PL+xwcMHqnVmSrlShU09YdB9fiVk9E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RY2xdP0bk0zh5fDkUOEVW0tJ4WvTXnOb0uyAX8yBOe1bNrVFAs+SR35fHSw9PHdjFA3QGrFQ/1KDV8uUNUZFVy4pumBY4+Rjb2TJdPK7u0d25dSJvnov27aZmocxlIbijph/4SskUG2HQrSOlCYuWUTYxCT4om6UN/buVASjPeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZQh8aRsL; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZQh8aRsL"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NCvqqj889428;
	Mon, 23 Jun 2025 07:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750683472;
	bh=31eJ+AWxiGbYg4zWcNeGQWhipTSARDm8us14p739GWk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZQh8aRsLTZ/HYz2VBgn6xeYDbBaWGyxFZ+DW2pnNvEuJU+xN3NQc2XRrk02KGFRJH
	 tfX+was6O/v15f66++Jd9mNJsouyAMIfmP6L7W8qMUS5yw9P/A+XUdTDLtRiH2J3mo
	 R6we3XetfvJ4kAUNJjOc90HYbls0wo8xKgb7ScUc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NCvppg3243449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 07:57:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 07:57:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 07:57:51 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NCvoeg4136274;
	Mon, 23 Jun 2025 07:57:51 -0500
Date: Mon, 23 Jun 2025 18:27:50 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Chuck Cannon
	<chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250623125750.kzwndmcf5yo3siao@lcpd911>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Jun 20, 2025 at 11:37:14 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When two consecutive suspend message send to the Linux agent, Linux will
> suspend and wake up. The exepcted behaviour should be suspend, wake up

I am first trying to gather more context of the issue at hand here,
Why and who is sending 2 consecutive suspend messages to Linux?

Just quoting the cover letter:

> When testing on i.MX95, two consecutive suspend message send to the Linux
> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> 2nd suspend message).
> 
> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).

When you say mailbox supports wake up you mean the mailbox IP in your
SoC actually gets some sort of wake interrupt that triggers a wakeup?
Is this wakeup sent to the SM then to be processed further and trigger a
linux wakeup?

<or> the mailbox directly wakes up linux, ie. triggers a resume flow but
then you are saying it was an unintentional wakeup so you want to
suspend linux again? This just seems like the wakeup routing is
incorrect and the system is going through a who resume and then suspend
cycle without a good reason?

Why and when in this flow is linux ending up with a duplicate suspend message is
something I still don't follow.

Could you point us to any flow diagrams or software sequences that we
could review?

> and suspend again.
> 
> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).
> 
> In current driver, the state is set back to SCMI_SYSPOWER_IDLE after
> pm_suspend finish, however the workqueue could be scheduled after
> thaw_kernel_threads. So the 2nd suspend will return early with
> "Transition already in progress...ignore", and leave Linux in wakeup
> state.
> 
> So set SCMI_SYSPOWER_IDLE in device resume phase before workqueue
> is scheduled to make the 2nd suspend message could suspend Linux again.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
[...]

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
