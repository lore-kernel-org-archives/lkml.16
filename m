Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8A32F6FA3;
	Fri,  4 Jul 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619565; cv=none; b=tta4en+r3vn7VWSqPyQ+5DdNDF53no6SOjGbC3I1xU5YFpRq7HHQKmKfVmNcAgNO1QWxt90cc92IrdufWTGGSLT/xuaxHnVI45bI7sXrvFLsYWtVR10AdNTY3iR5KI4hkD0pK1Ss6aDb7QtUPRu35SwmtJrFZ07eQdHoYCAlONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619565; c=relaxed/simple;
	bh=Bbkzj8UT56S4ENmIsLScSyACdmBFtYnZcBu316QUoTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONLKfMtU0wg1RNDYnGk+k9lWnYK/YgV0z4/jkMOz7sDibVI6d32gcPYzw/FI5qyFfHMUlfDZ7U52Fyfh3oZT1SNFcbBxl54pu/B3w6HZrvk/zbXlKcTzsh8K76jn6cgR2pNRmrzEzNwUCFyFiDXt43VFtU5LXlRqeddUGtuCOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD5D152B;
	Fri,  4 Jul 2025 01:59:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3D663F6A8;
	Fri,  4 Jul 2025 01:59:19 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:59:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Chuck Cannon <chuck.cannon@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <souvik.chakravarty@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <aGeX5NQycd5WFxZ8@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
 <aGVOhMr7vg9Sl7Z2@bogus>
 <20250704051204.GB4525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704051204.GB4525@nxa18884-linux>

On Fri, Jul 04, 2025 at 01:12:04PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Wed, Jul 02, 2025 at 04:21:40PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
> >> MISC protocol supports discovering the System Manager(SM) build
> >> information including build commit, build time and etc. Add the API
> >> for user to retrieve the information from SM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
> >>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
> >>  2 files changed, 47 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> @@ -25,6 +25,7 @@
> >>  enum scmi_imx_misc_protocol_cmd {
> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >
> >I clearly missed to raise this point when the documentation for this command
> >was added. Anyways I assume, you had explored all the options before adding
> >this as generic tools may not be able to pick this up. Instead, I would have
> >just stuck with vendor version in the standard protocol with build number
> >embedded into it. The date and other info must be implicit from the build.
> >
> >I try to be more cautious and ask questions in the future as I don't want
> >vendor extensions to be dumping ground for really random things like this.
> 
> +Souvik
> 
> And Loop our firmware owner to help comment. I just add what the firmware
> supports here and allow linux to see the information when the firmware
> does not have uart output in some builds.
> 
> From SCMI spec, it does not restrict what vendor extensions should be like
> as I know. So I am not sure what we should do when we define vendor
> extensions and what I should do next for this patch.
> 

Just to be clear, I am not against vendor extensions. I am just saying
this interface is not strictly needed. The vendor version could encode
this nicely and you could have a map. The only and main concern is having
such extensions will not help generic tools as these are very vendor specific.

It is good to have firmware version and other related details in a standard
format that anyone can understand without the need to dig deeper into vendor
specific extensions.

Again I am not saying to drop these interfaces, but you will get questioned
for its use in the kernel if that doesn't seem like the right approach.

-- 
Regards,
Sudeep
