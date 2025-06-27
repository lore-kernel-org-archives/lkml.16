Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD212D3EFC;
	Fri, 27 Jun 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029604; cv=none; b=NhObIkEqdOn/74swix0/kIbKpxDc91p6L86UIDqVh1XvGtKwxQGfNRZGq/3+atqi9TpjMW0Pji9RDkMqN+BoEjySCRWWr9cH+PTqwKeR4KLBrK0PdnVTIABfNeNsLMigu/NRCIGQVH+0zOLI9NnX47coResb/76gE2bfDQoVCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029604; c=relaxed/simple;
	bh=BbmtNLL95Ypu1/ePsU9VVYFrEH6wcj//XAmsr+5aadE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3b3FIzH3RKRmHZchO/hSW83H9khbxFCQUOhhYV3wKBiP1Yf36idUavf7imwcuEcOGm+MY06Honf29GqTfuFdn7zo5WyAj855W1Jy0VhahH93UQ8w20T1g6jznxgNnQmajq1xnn6UZozyY3zpBsW5rI3a+Rxg/rfPqJVjGm2x5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1442E1A00;
	Fri, 27 Jun 2025 06:06:24 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B1823F66E;
	Fri, 27 Jun 2025 06:06:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:06:36 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <aF6XXBuBSvVfvgsP@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> MISC protocol supports getting the System Manager(SM) mode selection
> and configuration name. Add the API for user to retrieve the information
> from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_cfg_info_out {
> +	__le32 msel;
> +	u8 cfgname[MISC_MAX_CFGNAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -306,7 +312,31 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
> +				  struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_cfg_info_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CFG_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->msel = le32_to_cpu(out->msel);
> +		strscpy(info->cfgname, out->cfgname, MISC_MAX_CFGNAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
> +	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 826402dfe6f4d3b9e6d2e93868d6699f989e9bcc..bb0c35b5d6705acddd6c83c31474482a2667b418 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -54,15 +54,20 @@ struct scmi_imx_misc_ctrl_notify_report {
>  
>  #define MISC_MAX_BUILDDATE	16
>  #define MISC_MAX_BUILDTIME	16
> +#define MISC_MAX_CFGNAME	16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
>  	u32 buildcommit;
>  	u8 date[MISC_MAX_BUILDDATE];
>  	u8 time[MISC_MAX_BUILDTIME];
> +	u32 msel;
> +	u8 cfgname[MISC_MAX_CFGNAME];
>  };
>

Bit odd that you use the same struct partially as output of one ops
and partially as outout of this ops....but indeed the 2 sets of data
have different lifetimes, with one set not changing at all after the
first call durring the same boot.... so I suppose it will be up to the
caller not to mess up stuff.  

maybe you could embed 2 different structures colelcting those different
data and then pass the pointers to such internal structs to the
caller...

>  struct scmi_imx_misc_proto_ops {
> +	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
> +			     struct scmi_imx_misc_system_info *info);
>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>  			     u32 num, u32 *val);
>  	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,
> 

Anyway, LGTM.

Reviewd-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
