Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3056B2D12FF;
	Fri, 27 Jun 2025 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028538; cv=none; b=MkgYrasUl8XuRwICmzy7FsPc5mJWc2S4kPWexb7LNRDuYTEU6okxqvjVsTxEcj1XqC+NsVXs8nNVig3EsJKqyP2B8Z4tRAT+vKPLVsIsNKWMzOGLoryItvNPC7Rt1Z/JFbXTWecLT9YBuWx+h+vuenVxS+47Ngc7aP0h173Ieis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028538; c=relaxed/simple;
	bh=EFWZzpDdnafF5Ptd+x/Wkh8LMcHx8o6F4Xvns2BD2J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3K60YBtM3ti63VPTV4jzSVFimH8vX5AbZKsycs66WOP7F98uecFOKf3h6qtSELORdY3ET0M4eBOkx0M6UU91esGQQGsoGanMcNzevVENdQGFquNCJdXikbPv78pFkoR+7VTgLxTD/LUn1Q6wuoLrNmKTf7b3jLdb3TeOPBx0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 448F81A00;
	Fri, 27 Jun 2025 05:48:38 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0E03F58B;
	Fri, 27 Jun 2025 05:48:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:48:50 +0100
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
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <aF6TMpXmIiiCkxWD@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
> MISC protocol supports discovering the System Manager(SM) build
> information including build commit, build time and etc. Add the API
> for user to retrieve the information from SM.
> 

Hi,

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -25,6 +25,7 @@
>  enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -65,6 +66,13 @@ struct scmi_imx_misc_ctrl_get_out {
>  	__le32 val[];
>  };
>  
> +struct scmi_imx_misc_buildinfo_out {
> +	__le32 buildnum;
> +	__le32 buildcommit;
> +	u8 builddate[MISC_MAX_BUILDDATE];
> +	u8 buildtime[MISC_MAX_BUILDTIME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -272,10 +280,37 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
> +					struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_buildinfo_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_DISCOVER_BUILDINFO, 0,
> +				      sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->buildnum = le32_to_cpu(out->buildnum);
> +		info->buildcommit = le32_to_cpu(out->buildcommit);
> +		strscpy(info->date, out->builddate, MISC_MAX_BUILDDATE);
> +		strscpy(info->time, out->buildtime, MISC_MAX_BUILDTIME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
> +	.misc_discover_build_info = scmi_imx_discover_build_info,
>  };
>  
>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 27bd372cbfb142b6acb0b1cf4b82f061529d0d45..826402dfe6f4d3b9e6d2e93868d6699f989e9bcc 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -52,6 +52,16 @@ struct scmi_imx_misc_ctrl_notify_report {
>  	unsigned int		flags;
>  };
>  
> +#define MISC_MAX_BUILDDATE	16
> +#define MISC_MAX_BUILDTIME	16
> +
> +struct scmi_imx_misc_system_info {
> +	u32 buildnum;
> +	u32 buildcommit;
> +	u8 date[MISC_MAX_BUILDDATE];
> +	u8 time[MISC_MAX_BUILDTIME];
> +};
> +
>  struct scmi_imx_misc_proto_ops {
>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>  			     u32 num, u32 *val);
> @@ -59,6 +69,8 @@ struct scmi_imx_misc_proto_ops {
>  			     u32 *num, u32 *val);
>  	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
>  				    u32 ctrl_id, u32 evt_id, u32 flags);
> +	int (*misc_discover_build_info)(const struct scmi_protocol_handle *ph,
> +					struct scmi_imx_misc_system_info *info);
>  };

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
