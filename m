Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF554C8E;
	Fri, 27 Jun 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033470; cv=none; b=YecxJC4ISKm4VqVQgmIjIiy0c+i9J8IVZSXAKdKDp7DYNaKMNZ9T0/6CZGcKBOBQkv2oRIOctiGo7ZfYGpsXCsMk2Fl45nGLJBLiBrQ3p4kIIloUpHgwU4aJUcz6HbsHLr9kh4hrC+yqLNnzCPsE5uEf5RM78uE0JnFZUlnkESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033470; c=relaxed/simple;
	bh=uboYNezb36JpMkieHdIf/S5jZXhofYW9pF0BqpdRV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbaToBWwgveowofi/M+RmS+MXpzW521evEpBVtpK3EqXHeZjGkcW7m9N7eJl0yOTP2PTnOf6rdXqJXiWwHJqOvrEUSLoWYhJC0rAOIcQqPlmKGnXVIK/fYVZQzJn81DsEYP4jHnUWig9XqPz0uZn71eF28hnVPWzfJkr6nprDz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5BCE1A00;
	Fri, 27 Jun 2025 07:10:50 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 111523F58B;
	Fri, 27 Jun 2025 07:11:05 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:11:03 +0100
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
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <aF6md8uMuD8EpXvd@pluto>
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

...ah...so you basically cast to void a structure of u32 words and then
expect that the firmware perfectly aligned with how the struct is
defined here....size checks assures no out-of-bounds BUT the meaning of
he blob itself is entirely up to FW and kernel being aligned, since no
type checking is done of any kind and fields are NOT reference by
name...so may I ask why ? ..also because the scmi_imx_misc_syslog seems
pretty tiny to need iterators to parse back the reply...do you have so
tiny transpotr message size ?

..anyway I would suggest at least to add some sort of version-field to
the struct so that at least you can detect if the FW spits out something
that is not what your driver expect or is ready to handle...especially
if you plan to extend or modify the layout of the structs in the future.


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

... how wonder how much is still frowned upon to serve such big multiline
structured information payloads from sysfs ... (asking for a friend :P)


> +	kfree(syslog);
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RO(syslog);
> +
> +static ssize_t system_info_show(struct device *device, struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct scmi_imx_misc_system_info *info;
> +	int len = 0;
> +	int ret;
> +
> +	if (!ph)
> +		return 0;
> +
> +	info = kmalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = imx_misc_ctrl_ops->misc_discover_build_info(ph, info);
> +	if (ret)
> +		goto err;
> +
> +	ret = imx_misc_ctrl_ops->misc_cfg_info(ph, info);
> +	if (ret)
> +		goto err;
> +
> +	ret = imx_misc_ctrl_ops->misc_silicon_info(ph, info);
> +	if (ret)
> +		goto err;
> +
> +	ret = imx_misc_ctrl_ops->misc_board_info(ph, info);
> +	if (ret)
> +		goto err;
> +
> +	len += sysfs_emit_at(buf, len, "SM Version    = Build %u, Commit 08%x\n",
> +			     info->buildnum, info->buildcommit);
> +	len += sysfs_emit_at(buf, len, "SM Config     = %s, mSel=%u\n",
> +			     info->cfgname, info->msel);
> +	len += sysfs_emit_at(buf, len, "Silicon       = %s\n", info->siname);
> +	len += sysfs_emit_at(buf, len, "Board         = %s, attr=0x%08x\n",
> +			     info->brdname, info->brd_attributes);

...so some of this stuff Build/Silicon/BoaRD info has pretty much
'forever' lifetime...are you sure you want to query them out of the FW
each time you issue a sysfs show ?

Cannot you simply dump this stuff once for all at probve time and
instead query misc_cfg_info() upon each show to refresh only the data
that will change ?

(this also corroborates my idea that you should somehow partition this
data into distinct structs by their lifetime...

Thanks,
Cristian
