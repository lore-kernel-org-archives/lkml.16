Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B782D8DC5;
	Fri, 27 Jun 2025 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029883; cv=none; b=V1pvm50S932wQalpB6vmG/pWLC1ZlUmCootBqMIizJo+kGe0pc9bqwXPkUHyN3JACz1x215vcZUyaHtIPhvegQZZAqyQtEoDN5xN9ooQ+ICLNBs3UcO3YnB1vLAnLzShpJy9CKwze866tuiM2mO4mrZ9w+SEIpT2+htR3cV4F+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029883; c=relaxed/simple;
	bh=4Vxv6m1FLYRrhTVG6vptpa8t9PYLpynpN3yl3kH7qE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbmcUWx7BynqPbRjkiVr8ZcI+f0rulYev94Y+zCbElRV4abzOL4EoMGiUK+/Yoc/T/TTMNfhNlWtS7aD/dBonM2ZNgqdagwCwyItww1eWy/2r3RLQPiC3YSRwp4QOKQng1RjbQ68pL5Wqw6DIoNbivTcHRZrL57gtRAl3zuj/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 717AF1A00;
	Fri, 27 Jun 2025 06:11:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E3F3F66E;
	Fri, 27 Jun 2025 06:11:19 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:11:16 +0100
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
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <aF6YdPc6z21XNhWQ@pluto>
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
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
> @@ -79,6 +80,13 @@ struct scmi_imx_misc_cfg_info_out {
>  	u8 cfgname[MISC_MAX_CFGNAME];
>  };
>  
> +struct scmi_imx_misc_si_info_out {
> +	__le32 deviceid;
> +	__le32 sirev;
> +	__le32 partnum;
> +	u8 siname[MISC_MAX_SINAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -335,12 +343,38 @@ static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
> +				      struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_si_info_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_SI_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->deviceid = le32_to_cpu(out->deviceid);
> +		info->sirev = le32_to_cpu(out->sirev);
> +		info->partnum = le32_to_cpu(out->partnum);
> +		strscpy(info->siname, out->siname, MISC_MAX_SINAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
>  	.misc_discover_build_info = scmi_imx_discover_build_info,
> +	.misc_silicon_info = scmi_imx_misc_silicon_info,
>  };
>  
>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index bb0c35b5d6705acddd6c83c31474482a2667b418..0e639dfb5d16e281e2ccf006a63694b316c431f4 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -55,6 +55,7 @@ struct scmi_imx_misc_ctrl_notify_report {
>  #define MISC_MAX_BUILDDATE	16
>  #define MISC_MAX_BUILDTIME	16
>  #define MISC_MAX_CFGNAME	16
> +#define MISC_MAX_SINAME		16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
> @@ -63,6 +64,11 @@ struct scmi_imx_misc_system_info {
>  	u8 time[MISC_MAX_BUILDTIME];
>  	u32 msel;
>  	u8 cfgname[MISC_MAX_CFGNAME];
> +	/* silicon */
> +	u32 deviceid;
> +	u32 sirev;
> +	u32 partnum;
> +	u8 siname[MISC_MAX_SINAME];
>  };

Same observation here...maybe embed a struct dedicated to this....BUT in
this case the silicon_info are NOT meant to change during a boot (and
even across a reboot really) so why a distinct command from build_info
since both infos has the same lifetime ? (I understand the quality of
the info returned is drastically different HW vs SW)

>  
>  struct scmi_imx_misc_proto_ops {
> @@ -76,6 +82,8 @@ struct scmi_imx_misc_proto_ops {
>  				    u32 ctrl_id, u32 evt_id, u32 flags);
>  	int (*misc_discover_build_info)(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_system_info *info);
> +	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
> +				 struct scmi_imx_misc_system_info *info);
>  };
>  
>  /* See LMM_ATTRIBUTES in imx95.rst */


Other than this, no strong opinion anyway.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
