Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4042025F96A;
	Mon, 14 Apr 2025 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625726; cv=none; b=LgNq3VznTflIL1N1CCPW64prtgciF5ks+DynhxmVFdSyqMomYdbB6vYsXFLZwmmspDRdJX8wOC1J4Xu4RPO2+TMDIbpjR1ivaAyTKdKGOVcl+wIsDOcN9P0j+JF2djZChCexchtTU5lVm98IgKVxpvFD/crhjlUGfGubkffIyfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625726; c=relaxed/simple;
	bh=8pjSY5TGS66p72VQ8UWjz+9rF2ckIGkBQ9YNQuNRxHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy3eAI/EHfnopbtk8TcErlpc+bT2ArLlbGnC8M6rOeQJZGOZLkf2C0Ss21ssG2Klb1qxWEM/r9QRVwW3W9mXlfRqnYbsws8jRx1WVDEqetQQ/zh8JoumxgyYds1xnne538dXVD5m+NOYP0OR1BYr9MKPTfhDFVneNjY44Xx0zrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DBB1007;
	Mon, 14 Apr 2025 03:15:22 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E12813F694;
	Mon, 14 Apr 2025 03:15:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:15:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "Rob Herring" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Apr 14, 2025 at 09:57:43AM +0000, Peng Fan wrote:
> Hi Sudeep,
> 
> > Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> > driver
> > 
> > On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The i.MX95 System manager exports SCMI LMM protocol for linux to
> > > manage Logical Machines. The driver is to use the LMM Protocol
> > > interface to boot, shutdown a LM.
> > >
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
> > >  drivers/firmware/imx/Kconfig                  | 11 ++++
> > >  drivers/firmware/imx/Makefile                 |  1 +
> > >  drivers/firmware/imx/sm-lmm.c                 | 91
> > +++++++++++++++++++++++++++
> > >  include/linux/firmware/imx/sm.h               | 14 +++++
> > >  5 files changed, 119 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > index
> > >
> > b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f83081
> > 0f8ba376ece9
> > > db93c8cded6d 100644
> > > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT  config
> > IMX_SCMI_LMM_EXT
> > >  	tristate "i.MX SCMI LMM EXTENSION"
> > >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > > -	default y if ARCH_MXC
> > > +	depends on IMX_SCMI_LMM_DRV
> > > +	default y if ARCH_MXC && ARM64
> > 
> > I can't understand the ARM64 dependency on this and next patch.
> 
> ARCH_MXC both supports ARM32 and ARM64.
> 
> To i.MX ARM32 platform, there is no plan to enable SCMI, so only
> set y for ARCH_MXC ARM64 platforms.
> 

OK but why is it different for IMX_SCMI_MISC_DRV. I really don't see
any dependency. If it is not supported today fine, but do you need any
issue to use it or compile it for arm32 ?

-- 
Regards,
Sudeep
