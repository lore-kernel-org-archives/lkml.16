Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467B428A1CA;
	Wed,  2 Jul 2025 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469773; cv=none; b=Y0KouvC9PxWnzPpvuBzQ4C1wdF5Xk9KIeddc2mVLiNeraP4pKqExRfwW2PrhiwJFODrdt6YPuWmd9wSbE1hurUEKU2rz5AG1X4NImVwRVr5uvSRAQXOXbAC1rl2MOVPRH6fMoy9WhsC0XcaXaHBtJPdM/M6XjQiR/77a1pbeYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469773; c=relaxed/simple;
	bh=PQ+hdBJx/CkzLHdGqBVQQ/tW1D4I/JfEPGFPP/Z/xks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jT+4izExFH2HghE5xpTOLKpkSIZ8ltat8vKaQdwEFL3hrZdUxEI0X3smb7ooa1+LrqcMiI+joPVdhPZvqdUMpT8btaii7npmNouJ4yaj4wyTL2zs2iJOlgkOvZlaSlwPUzTKGHgp71l0R0Gg78zDAYxdQeZHlHPNVS1MsPtizMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFB511424;
	Wed,  2 Jul 2025 08:22:36 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E58C13F6A8;
	Wed,  2 Jul 2025 08:22:49 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:47 +0100
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
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:50PM +0800, Peng Fan wrote:
> Add sysfs interface to read System Manager syslog and system info
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 97 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> index fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c615102a377f41025a6911d746770 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -44,6 +44,100 @@ static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
>  	return 0;
>  }
>  
> +static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	struct scmi_imx_misc_sys_sleep_rec *rec;
> +	struct scmi_imx_misc_syslog *syslog;
> +	int ret;
> +	size_t len = 0;
> +
> +	if (!ph)
> +		return 0;
> +
> +	syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
> +	if (!syslog)
> +		return -ENOMEM;
> +
> +	ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
> +	if (ret) {
> +		kfree(syslog);
> +		return ret;
> +	}
> +
> +	rec = &syslog->syssleeprecord;
> +
> +	len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
> +	len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
> +	len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
> +	len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
> +	len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
> +	len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
> +	len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
> +	len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
> +	len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
> +

Why can't this be individual files and values ?

-- 
Regards,
Sudeep
