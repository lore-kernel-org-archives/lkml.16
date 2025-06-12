Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FEF1F583D;
	Thu, 12 Jun 2025 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720966; cv=none; b=j/Eqsj4gyTrG0pwLpaciQ2jFmXviboUsY8G1RMAsRgWjcG2HTMgVoSAwmaVFHEN+YBH3n8Ik+QRtJXnOvK9teE5DKkUr+iDKo17Tn3SgLGYJ9gO1dGSiRGJEvtZpAvVFUPjR6M4X7l0aqcwDsow9/0pIQuZOFaDk/2sbE2Ctfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720966; c=relaxed/simple;
	bh=pxEIxUzdt1AT4nWSXvcVmvl8JoaRHII85IQOZaXzROU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlK00411r497TwHba3BGmdFdyyrhoyHNOWeAl6DfnCBCybC2cgHA7NuA7sWOHRMcpOB3lBtaX6jQ7/GjxMGE87I46Ab5EM/jGJGDBhs1N8qwM2mvs2MzHsoX0yPWH4VkqktRHkYnleVN+6/f/RqYORoePMHFNcqWCt+2WejkJTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A4314BF;
	Thu, 12 Jun 2025 02:35:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5133E3F66E;
	Thu, 12 Jun 2025 02:35:56 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:35:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <20250612-vivacious-bipedal-beetle-b04714@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
 <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
 <aEqTNLTp0EzcC2aa@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqTNLTp0EzcC2aa@pengutronix.de>

On Thu, Jun 12, 2025 at 10:43:32AM +0200, Sascha Hauer wrote:
> On Thu, Jun 12, 2025 at 09:29:16AM +0100, Sudeep Holla wrote:
> > On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> > > When it comes to clocks with parents the SCMI clk driver assumes that
> > > parents are always initialized before their children which might not
> > > always be the case.
> > > 
> > > During initialization of the parent_data array we have:
> > > 
> > > 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> > > 
> > > hws[sclk->info->parents[i]] will not yet be initialized when children
> > > are encountered before their possible parents. Solve this by allocating
> > > all struct scmi_clk as an array first and populating all hws[] upfront.
> > > 
> > 
> > LGTM. I would like to add a note that we don't free individual scmi_clk
> > if for some reason it fails to setup. I can do that when I apply, just
> > checking if anyone has any objections. Please shout out if you have.
> 
> Feel free to add that note. I should have added this myself since it's
> not entirely obvious that the devm_kfree() has to be removed with this
> patch.
> 

I did that and realised only bit later that I usually route SCMI clk driver
changes via clk tree.

Please repost with

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I am sharing below the commit message update I did when I applied.

Regards,
Sudeep

-->8

clk: scmi: Handle case where child clocks are initialized before their parents

The SCMI clock driver currently assumes that parent clocks are always
initialized before their children. However, this assumption can fail if
a child clock is encountered before its parent during probe.

This leads to an issue during initialization of the parent_data array:

    sclk->parent_data[i].hw = hws[sclk->info->parents[i]];

If the parent clock's hardware structure has not been initialized yet,
this assignment results in invalid data.

To resolve this, allocate all struct scmi_clk instances as a contiguous
array at the beginning of the probe and populate the hws[] array upfront.
This ensures that any parent referenced later is already initialized,
regardless of the order in which clocks are processed.

Note that we can no longer free individual scmi_clk instances if
scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
platform has proper per-agent clock discovery.
