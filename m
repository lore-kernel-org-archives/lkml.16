Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1552BEC52;
	Fri,  4 Jul 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619753; cv=none; b=NBSuudTAAgYCKB9l9DV+tNmDuawwsjyRAPURzEXzQBxs9fjMGQGZz93CKJyiCD3j8LqegEK5u0mxQxksYjTLmhlJbIPRQvyEwocM1pcXMBLN3uzvesej4EVk1T3gulqYiELX23ejnqcibgkzCCKNDXIvrj6Cg43AA4kT+sPCAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619753; c=relaxed/simple;
	bh=BiFxTALDsVYtdJS4DgI0gEh6xBfZ9V22oHX0f+p2Sss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuM1cFmEbTWBz8wMLVFWRp+qpSetbRANsXztGWxh1u7RiX6r3YIxw2I/KKfVT9QeNZpsGYR8NmulnHhAd6hECD2KDbA9EHK4JboKoxbPIt3tIMJoENXhQkK7cvEzrHhLdTgWQb3wCna024FUn+dUPBhvlWWG6YrmJXQFjyhvoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DAC1152B;
	Fri,  4 Jul 2025 02:02:17 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8903F6A8;
	Fri,  4 Jul 2025 02:02:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:02:26 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <aGeYomz9DmmAOSEw@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
 <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
 <20250704100741.GC4525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704100741.GC4525@nxa18884-linux>

On Fri, Jul 04, 2025 at 06:07:41PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:21:58PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting the System Manager(SM) mode selection
> >> and configuration name. Add the API for user to retrieve the information
> >> from SM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
> >>  include/linux/scmi_imx_protocol.h                  |  5 ++++
> >>  2 files changed, 35 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
> >>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
> >>  };
> >>  
> >> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
> >>  	u8 buildtime[MISC_MAX_BUILDTIME];
> >>  };
> >>  
> >> +struct scmi_imx_misc_cfg_info_out {
> >> +	__le32 msel;
> >
> >Now, I realise, this mode select is not properly defined in the document.
> >Just 32-bit word. What are those values ? Any fixed list of values with
> >well defined modes or configurations ? If so, please add to the document.
> 
> The current used value are 0,1,2. It is used to decide the logic machine
> boot order, such as 0 means booting LM0, LM1, LM2, LM3...
> Regarding 0,1,2 using which LM order, it could be defined by user in
> i.MX9 System Manger cfg file. That means 1 could mean LM0, LM2, LM3, LM1
> or LM0, LM3, LM1, LM2.
> 

This sounds like this is not well defined and could change on a different
platform ? If so, how will you manage this extension across i.MX platforms ?

Or the above order is actually fixed and will remain same across the
platforms ?

-- 
Regards,
Sudeep
