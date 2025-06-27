Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0F9E571;
	Fri, 27 Jun 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031954; cv=none; b=AYGMRjqHkMtP3tZEAmD4bTvhqlJBHX9cBnmRW/D4GIN7ydCxuhl+7zKpBIkti4DRBIKbVZJQ7HVdr4/0dvlx/R7mPs73umsoOZgJ8bZ2eOqxDooEbUl5MmrGMGndgXR4J06nCLeaG6ftsZNGYV9omiFBUK+tOUeIE80EfLDBILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031954; c=relaxed/simple;
	bh=nfWIKAMKZDjFY1lYLyAS8bDX8HPAqN5K9zZR6z3zGB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ro3CvVC3tf3rIQmE0W0bbJGX3O2x4R/3DN4wz17/uCG29dVeKaPMhG7QP34p6/qBT50TOMa+2QA3uw/62/WkUDDmZeZ18Ly7BW6cRnYtMmIVsr9D+1Vz37nTai4HHeYVP/JyCnJZgQ2UBIiUEpp35R91blFU0mP62qRmQjwy2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206801A00;
	Fri, 27 Jun 2025 06:45:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6353A3F66E;
	Fri, 27 Jun 2025 06:45:50 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:45:47 +0100
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
Subject: Re: [PATCH 6/7] firmware: arm_scmi: imx: Support getting board info
 of MISC protocol
Message-ID: <aF6gi9ejloRphvgI@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:49PM +0800, Peng Fan wrote:
> MISC protocol supports getting board information. Add the API for user
> to retrieve the information from SM
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 1a6d75357b76ce6bb7d06461999b368c27f1fa43..35c63e7cb189475807ed1e6723dbcb61ab66800a 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -29,6 +29,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_SI_INFO = 0xB,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_SYSLOG = 0xD,
> +	SCMI_IMX_MISC_BOARD_INFO = 0xE,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -76,6 +77,11 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_board_info_out {
> +	__le32 attributes;
> +	u8 brdname[MISC_MAX_BRDNAME];
> +};
> +
>  struct scmi_imx_misc_cfg_info_out {
>  	__le32 msel;
>  	u8 cfgname[MISC_MAX_CFGNAME];
> @@ -334,6 +340,29 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_board_info(const struct scmi_protocol_handle *ph,
> +				    struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_board_info_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_BOARD_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->brd_attributes = le32_to_cpu(out->attributes);
> +		strscpy(info->brdname, out->brdname, MISC_MAX_BRDNAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
>  				  struct scmi_imx_misc_system_info *info)
>  {
> @@ -446,6 +475,7 @@ static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
>  }
>  
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
> +	.misc_board_info = scmi_imx_misc_board_info,
>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index ff34d974046aa982fa9f5d46fc673412e01a532d..4950cd6f50aa7b3038bd519a7287e805f70e1cf5 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -56,6 +56,7 @@ struct scmi_imx_misc_ctrl_notify_report {
>  #define MISC_MAX_BUILDTIME	16
>  #define MISC_MAX_CFGNAME	16
>  #define MISC_MAX_SINAME		16
> +#define MISC_MAX_BRDNAME	16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
> @@ -69,6 +70,8 @@ struct scmi_imx_misc_system_info {
>  	u32 sirev;
>  	u32 partnum;
>  	u8 siname[MISC_MAX_SINAME];
> +	u32 brd_attributes;
> +	u8 brdname[MISC_MAX_BRDNAME];
>  };

Same comment here as before...

>  
>  struct scmi_imx_misc_sys_sleep_rec {
> @@ -89,6 +92,8 @@ struct scmi_imx_misc_syslog {
>  };
>  
>  struct scmi_imx_misc_proto_ops {
> +	int (*misc_board_info)(const struct scmi_protocol_handle *ph,
> +			       struct scmi_imx_misc_system_info *info);
>  	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
>  			     struct scmi_imx_misc_system_info *info);
>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>

Anyway, LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
 
Thanks,
Cristian
