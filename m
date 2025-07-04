Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7E8200112;
	Fri,  4 Jul 2025 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621562; cv=none; b=hTXgi0nl/nyD3pWrHfZyNqYGXu1xbRX2xP6kvAyC+Q3swNP20rK0dMKkg87fyDqwLBDKPFF6p2wD1HsFiUXJdHbK3g8aIsBUVyrmP3ZnyPFAKi6pNk60caMAopuJasMcb+qkyNMMxckM2iNHWUdTh/J/1wA7M11CuutW6nPT8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621562; c=relaxed/simple;
	bh=XIa4UkB9x2N5vIytIg3rRwC8NG/2RVLtZzy57PJlv9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWD3N3cG81I6cRudh1z6z6K5UFu1D5y8xIbIH+zj/ydERQA/KN6D7fORHOww4bK0CA/Lw3OucFwR/HJX4V+UWo7s+KC0hqioC4a61W/SeVr1tOZ6IEBbO/W2uHBlAljKmSfLPcf2rDFgQNC2MJxDxOyLf7PRJgtZu4V420x9+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29715152B;
	Fri,  4 Jul 2025 02:32:25 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EAEA3F6A8;
	Fri,  4 Jul 2025 02:32:37 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:32:34 +0100
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
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <aGefsqOfnzhlj5Jn@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
 <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
 <20250704102057.GD4525@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102057.GD4525@nxa18884-linux>

On Fri, Jul 04, 2025 at 06:20:57PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:11PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting the silicon information including revision
> >> number, part number and etc. Add the API for user to retrieve the
> >> information from SM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
> >>  include/linux/scmi_imx_protocol.h                  |  8 +++++
> >>  2 files changed, 42 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >> +	SCMI_IMX_MISC_SI_INFO = 0xB,
> >
> >Again, this seem to have slipped through in my initial review. How is this
> >different from SMCCC SOC_ID interface. I am OK to have it as part of your
> >vendor extensions and be here in the kernel documentation. But I won't
> >accept any users of this within the kernel. Please provide justification
> >as why you can't use the standard SMCCC SOC_ID.
> >
> >So, clear NACK for adding this support in the kernel for now.
> 
> What I do here is just wanna to let
> linux could print similar information as what SM shows in its console:
> 

Sure you can dump whatever you want on the console. The main concern is
another user interface for very similar information that can be obtained
by SOC_ID or soc_device in the kernel. Just kernel internal use should
be fine.

> >$ info
> SM Version    = Build 677, Commit 49a36aaf
> SM Config     = mx95evk, mSel=0
> Board         = i.MX95 EVK, attr=0x00000000
> Silicon       = i.MX95 B0
> Boot mode     = normal
> Boot device   = SD2
> Boot stage    = primary
> Boot set      = 1
> ECID          = 0x7BADEECC000001D40001300963E636F1
> PMIC 0 (0x08) = 0x20, 0x09, 0x20, 0x00, 0x01
> PMIC 1 (0x2A) = 0x54, 0x22, 0x00, 0x0B
> PMIC 2 (0x29) = 0x55, 0x22, 0x00, 0x0A
> Compiler      = gcc 14.2.1 20241119
> 
> With soc_device_register, dumping the silicon information needs use the
> other sysfs interface.

So what ?

> Here with this patchset, reading one sysfs file could dump all the information.
> 

That goes completely again the sysfs policy. Single file single value.
Convince Greg otherwise, I will consider elsewhere not for this SOC_ID
for sure.

> But anyway, ok to drop this patch.
>  

Thanks!

-- 
Regards,
Sudeep
