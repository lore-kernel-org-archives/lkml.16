Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D271E1A33;
	Fri,  7 Feb 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934095; cv=none; b=XzQtAyGTotTVvDlI9jyNM0L/0Dook+pI9C70mxOyVHdwhi7Idt/i45hCvYvQmwGnLOYNTzIudPjw2r5mh1hrvgc/9Kgyzrn8KAq1lVdkm4yFwne2mj+H2kp5wjzNLut2BKC8R0QYwn7qlVPxoSMoegT6CXF1HiDNztPyjxBs/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934095; c=relaxed/simple;
	bh=OW7OP/NQ49fQv/lKJd6pSJwjF7WpKW61USJQD2CXCbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU0rzIEQMzjKA/liA8WBmureVKtkXo7cGXnK2nFcB/oY+H4BlWPeLZ7xdbonGSlmfLujWQyeCFYMvksfY4g2XkKv/l9air5I0b0s14w3I/Huj5i+kX8q51XB0/ZlrUhsIHKu575OyUSwj6kKyoD4mjYoELDY46exyiMckWJzrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F50113E;
	Fri,  7 Feb 2025 05:15:15 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE453F63F;
	Fri,  7 Feb 2025 05:14:49 -0800 (PST)
Date: Fri, 7 Feb 2025 13:14:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <Z6YHRlxJG4V56wrZ@bogus>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
 <Z6TgesTZklGvmI56@bogus>
 <20250207112622.GB14860@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207112622.GB14860@localhost.localdomain>

On Fri, Feb 07, 2025 at 07:26:22PM +0800, Peng Fan wrote:
> Hi Sudeep,
>
> V2 is actually 2 weeks after V1. So after addressing the comments
> from Stephen and Dan, also updated clk-scmi.c to use a non-vendor
> changes, I posted out V2.
>

Sure, but as I said you posted on the very first day of the merge window.
So 2 weeks just cover the end of merge window.

> 2 days, this is just after got Cristian's comments. Then I posted V2.
> I try to follow your working style on handling scmi patches, but seems you are
> not active, so I mainly count on Cristian's comments and update patches.
>

Yes, his comments were for more discussions internally and externally.
Not to churn up another patch set.

> The i.MX pll patches in V2 is orthogonal to clk scmi, I did not expect
> complains. But ...
>

Sorry if I overlooked, but with not all the platform specific
knowledge it is just too much info to consume at once. Again it is
fine if you don't make it hard but churning newer versions. So please
give time.

> In my view, maintainers have patchwork to maintain patches. patches send
> out in merge window will not be reviewed in short time or surely not
> picked up, I understand this. patches could just be marked new in patchwork.
> If new version is out, old version just marked as not apply.

Though I don't use patchwork(probably I should not your problem).
However, sometimes I see all versions to understand the changes and
evolution sometimes. And it just gets hard if there are too many
versions in short duration.

> And I use b4 to manage patchset, and each revision has changelog.
>

Good.

> Indeed I not track merge window since I am not maintainer role. I was
> not aware this would introduce complain (: I will track the cycle
> in following days.
>

I don't say it is a must. But good if you manage to.

I will look at all the pending patches from you soon, give me until
middle of next week.

--
Regards,
Sudeep
