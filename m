Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8735027F749;
	Tue, 15 Apr 2025 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728505; cv=none; b=DVKuPnPfV6e16PhOns0wLdA2QpQPY9xAVhkHF2HxsBbcf5mticJLTdeLzIrGD6AygsCGKdmatsYPxu2dTR8qX5PE/0YaacVcTu5+SJ8bBzstrki7vAxl/SKvcrlPso3gZWjUJiJ1Ubi9LJjKPby52y/l6YWwMvRgje329302YIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728505; c=relaxed/simple;
	bh=dL3GBIFDMlroIuYc/uiPg97dQ44gPEpRL5p9zMC4w/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTTTPm7bW5gy0yXG7TZVLeva8TMrKVen7ERsCCRCXcwwZxuBpgGHJsdAYtYeKAWgaF5BDz60K3/nfMG/XPh8HKZhLqPuvZb0qJ6GKZhLp5JGabnQyU4IxRRDBkYgJvhP7k1aSaD57vnf6icZKjiBfTTgGRzsfMQDbWdf8RojaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB9C15A1;
	Tue, 15 Apr 2025 07:48:21 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F45B3F694;
	Tue, 15 Apr 2025 07:48:19 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:48:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250415-exotic-scarlet-seriema-c0e223@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-ebony-slug-of-felicity-421b0f@sudeepholla>
 <20250415091016.GB10243@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415091016.GB10243@nxa18884-linux>

On Tue, Apr 15, 2025 at 05:10:16PM +0800, Peng Fan wrote:
> On Mon, Apr 14, 2025 at 12:17:34PM +0100, Sudeep Holla wrote:
> >On Mon, Apr 14, 2025 at 11:00:20AM +0000, Peng Fan wrote:
> >> 
> >> Oops, I just checked wrong Kconfig under drivers/firmware/arm_scmi/
> >> vendors/imx
> >> 
> >> Build this for ARM32 i.MX is ok, I just think no need. So add
> >> a ARM64 dependency.
> >> 
> >
> >OK, I will drop the ARM64 dependency when applying. I also don't understand
> 
> Thanks for helping on this.
> 
> >the dependency on i.MX firmware LMM and CPU drivers in the scmi vendor
> >protocol as the dependency should be other way around. But I see Arnd had
> >fixed it so I will keep it as you have posted to keep them all aligned.
> Not dig into much on this.
> I just followed what Arnd did when I prepared the patchset to avoid
> potential build issue as reported before.
> 

Yes, I am keeping it based on those changes. I need to spend sometime to
understand why it was done so and see if anything can be improved. It is
not straightforward to understand that dependency, for me looks like it
is in reverse direction.

Anyway I have pushed it tentatively, will let you know once it is finalised.

-- 
Regards,
Sudeep
