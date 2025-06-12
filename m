Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D473218593;
	Thu, 12 Jun 2025 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716962; cv=none; b=tdjHs6rHfK7/qDfUO+reboNQ9VeY7GaaAJUW5QG2V4lXerG5D9rcccYdO5JB8CQbD6HpEEImU7GDvO8O70mM2dqJTK3wbvwqbmZyj3GK4tWyqLcYbnKHiYynJCvoRDIePLP0ESr7PfVdIF8pE6d43kW2Ji+/FrT1JGqFNhacTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716962; c=relaxed/simple;
	bh=JL2xUuHpTmeqNBrwBPMGm1FaCGQfT5g9XcmIUWRwsRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYSQu1QGA1hCN+c04aOIYkBeI4rVq7e8GjU0mAV/NbbDkxYR2GvqYOfKXFAvXKQjuz74oF1wXjb8zK1JleS1L95XbJkgVJ7bmo0H4LWV2dRM8IauL6k9Wgnhhkm768TTP63ceUFfKlWl516Ef8W45hfVfIcjnz3ZOtfhjYMmmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5782339;
	Thu, 12 Jun 2025 01:29:00 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104273F59E;
	Thu, 12 Jun 2025 01:29:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:29:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: Fix children encountered before parents
 case
Message-ID: <20250612-eccentric-fresh-bee-e52db4@sudeepholla>
References: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de>

On Thu, Jun 12, 2025 at 09:36:58AM +0200, Sascha Hauer wrote:
> When it comes to clocks with parents the SCMI clk driver assumes that
> parents are always initialized before their children which might not
> always be the case.
> 
> During initialization of the parent_data array we have:
> 
> 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> hws[sclk->info->parents[i]] will not yet be initialized when children
> are encountered before their possible parents. Solve this by allocating
> all struct scmi_clk as an array first and populating all hws[] upfront.
> 

LGTM. I would like to add a note that we don't free individual scmi_clk
if for some reason it fails to setup. I can do that when I apply, just
checking if anyone has any objections. Please shout out if you have.

-- 
Regards,
Sudeep
