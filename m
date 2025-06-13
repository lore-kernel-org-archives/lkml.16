Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9B917A2FA;
	Fri, 13 Jun 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822222; cv=none; b=aKfeO+263TtBwaQ+OYqcCATjf8UbF0ma2wbz3SAkdYHRwUfYHsHUoQFSYCI5E9JtEcm2ruJ5uXdBQQ37Bn/w8uxXul/AC3I5SCQVkjzDym8y3QC0VJnQiXDM48r2/7Fv8Zm5rEa/WiMn61xK+mMGHwz/7hP3NxUJerOYFkyDD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822222; c=relaxed/simple;
	bh=t2t/Dydkc0Q4SJApf90p0e3QNDSx3/98b+FbhGdPnFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljrtMgYcOedcjjInVLnP8fKp5bL9diUklLp+S41ddDwTPGJuH2Tvib4vPCZLxmrmYc4K0piyWpeqw7YhaHKtof5bGGBG8CJ76kr6bsvW6xPKFogOzPJKGop/vr3oK+2pfUAM0jNgsoHSG/YOGCVb7BU6s+v3cjE35C4rRkkNDYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8F62B;
	Fri, 13 Jun 2025 06:43:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722613F59E;
	Fri, 13 Jun 2025 06:43:38 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:43:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] clk: scmi: Handle case where child clocks are
 initialized before their parents
Message-ID: <20250613-congenial-tamarin-of-experience-cb2598@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>

On Thu, Jun 12, 2025 at 02:56:57PM +0200, Sascha Hauer wrote:
> The SCMI clock driver currently assumes that parent clocks are always
> initialized before their children. However, this assumption can fail if
> a child clock is encountered before its parent during probe.
> 
> This leads to an issue during initialization of the parent_data array:
> 
>     sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> If the parent clock's hardware structure has not been initialized yet,
> this assignment results in invalid data.
> 
> To resolve this, allocate all struct scmi_clk instances as a contiguous
> array at the beginning of the probe and populate the hws[] array
> upfront. This ensures that any parent referenced later is already
> initialized, regardless of the order in which clocks are processed.
> 
> Note that we can no longer free individual scmi_clk instances if
> scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
> platform has proper per-agent clock discovery.
> 
> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Reviewed-by: peng.fan@nxp.com
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Mike/Stephen,

Please pick this up in your next round of fixes.

-- 
Regards,
Sudeep
