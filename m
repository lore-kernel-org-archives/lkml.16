Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2AB2D46A6;
	Wed,  2 Jul 2025 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469738; cv=none; b=Lizk1I+RsjIQ8lWQawJSQza3aS/dnuSSfPI+7pT63FQdOyabRcXCOvR0yrANF+8wbGAR5OZm18ucoBKd7aQfnagd4hitIj7diNR/i7YWnzLHc3bJ8InP6fGFX2mXwNh/riCiBCQIgENKFfgt9urQQOYu7+/vm4Q4yxZMr2KIDR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469738; c=relaxed/simple;
	bh=drd+5qqBc/k/Wit6iuNlx/Bylp0DUXg/zPVELDG79Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfnvtnD5OyR0AWcDx7ubIjOZ1u1YCFm5bTXut4IH/mEBFgOXtGvU9Oac+vir8zI1irNQjKp81oGeHq6NCeuyrXrf2zeH5xDPZmBDbTRwjb3S3TAe5L9hiKYwGcJ1/ukXIqLhtcPsefn2lwMAS/cB1WLiD+yL5pqWuoHR+dm4I5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A93E1424;
	Wed,  2 Jul 2025 08:22:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5004C3F6A8;
	Wed,  2 Jul 2025 08:22:14 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
> MISC protocol supports getting the silicon information including revision
> number, part number and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  8 +++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_SI_INFO = 0xB,

Again, this seem to have slipped through in my initial review. How is this
different from SMCCC SOC_ID interface. I am OK to have it as part of your
vendor extensions and be here in the kernel documentation. But I won't
accept any users of this within the kernel. Please provide justification
as why you can't use the standard SMCCC SOC_ID.

So, clear NACK for adding this support in the kernel for now.

It is pretty useless to push this to userspace with custom interface.
Use the existing interface with SOC_ID. Also the way I would think this
interface may be used is from SMCCC interface implementation which could
retrieve info via this interface but that would be just platform specific
code in the firmware.

-- 
Regards,
Sudeep
