Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F80202C4F;
	Mon,  3 Feb 2025 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581775; cv=none; b=kkh+sUrD8iwPrJJZMdbhnGudttoJGyNp/xte3daxmR70cM97FY5bGtWtOkVN+qJc22Qsxpk17pmYUANhYSEjwHuPkh2PKD0P5o5/suqNwRQdhqVYYzgoaIL7MHlrB0d12TqsfC4+iCXp9ZX6nOZ9uiuGNHzrbmJ7PsfeziVMr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581775; c=relaxed/simple;
	bh=bP+k/yEALRPqznw0w8sMfyGGysSbuqLUknmkBK9Hmhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdEoLvVT315uBmDn1P8E0WoxPXbwoGiO1Rj+JmXg/HXQDp8e4dA9zr2wMt1RlwCOYuhEO6SX0FsLLcQ4O1H8kQKTN87EnwTsln3WIWJb3a1ZOChC3i+bkZXhxFty6w13WXLTd8TWoPvcOQelf/sI86sdJdy/plm1CIctlH1shNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0823F11FB;
	Mon,  3 Feb 2025 03:23:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321D83F58B;
	Mon,  3 Feb 2025 03:22:49 -0800 (PST)
Date: Mon, 3 Feb 2025 11:22:39 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <Z6Cm_4XTRHdDluhh@pluto>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
 <20250202104256.GA13402@localhost.localdomain>
 <Z6CPy89TVxV1jaDn@pluto>
 <20250203114722.GA20298@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203114722.GA20298@localhost.localdomain>

On Mon, Feb 03, 2025 at 07:47:22PM +0800, Peng Fan wrote:
> On Mon, Feb 03, 2025 at 09:43:39AM +0000, Cristian Marussi wrote:
> >On Sun, Feb 02, 2025 at 06:42:56PM +0800, Peng Fan wrote:
> >> On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
> >> >Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> >> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> >> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> >> >> --- a/drivers/clk/clk.c
> >> >> +++ b/drivers/clk/clk.c

Hi Peng,

> >> >> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
> >> >>  }
> >> >>  EXPORT_SYMBOL_GPL(clk_set_max_rate);

[snip]

> >> >
> >> >> + *
> >> >> + * Configure the spread spectrum parameters for a clock.
> >> >> + *
> >> >> + * Returns success (0) or negative errno.
> >> >> + */
> >> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> >> >
> >> >Does this need to be a consumer API at all? Usually SSC is figured out
> >> >when making a board and you have to pass some certification testing
> >> >because some harmonics are interfering. Is the DT property sufficient
> >> >for now and then we can do it when the driver probes in the framework?
> >> 
> >> I suppose 'DT property' you are refering the stm32 and i.MX8M SSC patchsets.
> >> I am proposing a generic interface for drivers to enable SSC.
> >> Otherwise we need to introduce vendor properties for each vendor.
> >> And looking at clk-scmi.c, we need a generic way to enable SSC, I think SCMI
> >> maintainers not agree to add vendor properties for it.
> >> 
> >
> >To clarify, from the SCMI point of view, I expressed the idea that it
> >would make sense to have a common SSC interface on the SCMI backend too
> >instead of a custom NXP since you are adding a common CLK framework feature,
> >BUT only if it turns out, from this discussion, that a common general way of
> >configuring SSC can be found...and I dont know that, so I am waiting to see
> >what this discussion with CLK framework and iMX maintainers goes before
> >excluding the SCMI CLK vendor OEM types scenario...it would be ideal and
> >easier NOT to use SCMI vendor extensions BUT ONLY if this NXP SSC/config generic
> >solution is deemed to be really generic and usable by any other vendor.
> 
> You may misunderstand. Using DT properties for clk-scmi.c to configure SSC
> of a single clock means to add properties under clk scmi node, such
> as:
> "arm,modfreq = <x>, <y>, <z>;
>  arm,moddepth = <a>, <b>, <c>;
>  arm,modmethod = <j>, <l>, <m>;"
> 
> And during probe in clk-scmi.c, the properties needs to be parsed and when
> clk is configured, the ssc settings need to be passed to scmi platform.
> 
> But per the i.MX8M SSC patchset that DT maintainers raised, 
> the properties(fsl,modfreq and etc) needs to in consumer side,
> not provider side.
> 
> So it is not feasible to add properties here.
> 

Thanks for the clarification.

> "assigned-clock-sscs" could be put under consumer node and clocks
> could be configured with SSC when needed. This is a generic property.
> 

Yes I understood this, the property that describes SSC that you are
adding is generic BUT are also the related params needed to describe
effectively the SSC

IOW, if we add, as desirable, a generic new SSC type in extended configs
instead of using a vendor oem, will these info down below passed to the SCMI:

+       /*
+        * extConfigValue[7:0]   - spread percentage (%)
+        * extConfigValue[23:8]  - Modulation Frequency (KHz)
+        * extConfigValue[24]    - Enable/Disable
+        * extConfigValue[31:25] - Reserved
+        */


... be enough to describe the required SSC config to any generic SCMI server
from any vendor using any HW ?

... or is it plausible and maybe frequent/usual that other vendors could
need additional specific params to be fed to the server, so that we
will end up using the new standard SSC only for NXP ?

IOW the property is generic, agreed, but are the described params above
generic enough too ? ... that was my concern from an UN-educated point
of view...of course, I am talking about the most common scenarios, if
some other vendor ends up needing some arcane/magic specific param that
cannot fit the above, they will be relegated to the OEM custom spaces
even if this common SSC is available.

> Back to NXP SCMI vendor extension, if SCMI spec could include SSC, NXP
> SCMI could move to align with spec and not use vendor extension.
> 

Agreed, conditional to the above doubts.

Apologies if I have asked dumb/obvious questions, but I am not familiar
with the subject matter enough...

Thanks,
Cristian
