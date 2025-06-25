Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97423074B2;
	Wed, 25 Jun 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860718; cv=none; b=C5RmDyao49dkkdlc/WEEas/O1ZMkAOZIOhuivvL0s8qFvq3SSTvq/bqKL3iLJrwsoSEAre8FO9av7iC+TfnVAa7O0w9FTWMmS2kcqjNjq/evB8aW72CqTCoa58mldKcrllJ2kS83LqgD/6ldnI/boPI45J8bBObSgbYe/+jmXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860718; c=relaxed/simple;
	bh=7IZbGNWinPEzWqIw4I3KtW3IGvy7Y1a+ymkBmDHcN2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNq0ILoht9gb51vt3cG3eguO1W7MYjN4DRaJnBQyIqCv8uvui1FTClq1RULT6teJ4jvP5PP3AFoEGsIHdDJJSUYHEhrH735+uzkzYQX/6JmN5BTYzAooKASJW1+8GwxLwnrEgUxf9dWrkLN29h75YOkgO8jGn0MCrV3pPh9ZeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C47A1106F;
	Wed, 25 Jun 2025 07:11:37 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358D23F66E;
	Wed, 25 Jun 2025 07:11:53 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:11:50 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <aFwDprdWI0mtglwe@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-5-cristian.marussi@arm.com>
 <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>

On Sat, Jun 21, 2025 at 12:27:03AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:10PM +0100, Cristian Marussi wrote:
> > +//TODO Review available interval show
> > +#define BUF_SZ	1024
> > +static inline ssize_t
> > +__available_update_show(char *buf,
> > +			const struct scmi_telemetry_update_interval *intervals)
> > +{
> > +	int len = 0, num_intervals = intervals->num;
> > +	char available[BUF_SZ];
> > +
> > +	for (int i = 0; i < num_intervals; i++) {
> > +		len += scnprintf(available + len, BUF_SZ - len, "%u ",
> > +				 intervals->update_intervals[i]);
> > +	}
> > +
> > +	available[len - 1] = '\0';
> 
> No need.  scnprintf() will already have put a NUL terminator there.
> Unless num_intervals <= 0 in which case this will corrupt memory.
> 

Yes, all of this routine has to be really reworked to avoid on the stack
allocation too...

> > +
> > +	return sysfs_emit(buf, "%s\n", available);
> > +}
> 
> [ snip ]
> 
> > +static int scmi_telemetry_groups_initialize(struct device *dev,
> > +					    struct scmi_tlm_instance *ti)
> > +{
> > +	int ret;
> > +
> > +	if (ti->info->num_groups == 0)
> > +		return 0;
> > +
> > +	ret = scmi_telemetry_dev_register(&ti->groups_dev, &ti->dev, "groups");
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i = 0; i < ti->info->num_groups; i++) {
> > +		const struct scmi_telemetry_group *grp = &ti->info->des_groups[i];
> > +		struct scmi_tlm_grp_dev *gdev;
> > +		char name[16];
> > +
> > +		gdev = devm_kzalloc(dev, sizeof(*gdev), GFP_KERNEL);
> > +		if (!gdev) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> > +
> > +		gdev->tsp = ti->tsp;
> > +		gdev->grp = grp;
> > +		gdev->dev.groups = scmi_grp_groups;
> > +
> > +		snprintf(name, 8, "%d", grp->id);
> 
> s/8/sizeof(name)/?

indeed...

> 
> > +		ret = scmi_telemetry_dev_register(&gdev->dev,
> > +						  &ti->groups_dev, name);
> > +		if (ret)
> > +			goto err;
> > +
> > +		if (ti->info->per_group_config_support) {
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_current_update.attr,
> > +						NULL);
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_intervals_discrete.attr,
> > +						NULL);
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_available_intervals.attr,
> > +						NULL);
> > +		}
> > +	}
> > +
> > +	dev_info(dev, "Found %d Telemetry GROUPS resources.\n",
> > +		 ti->info->num_groups);
> > +
> > +	return 0;
> > +
> > +err:
> > +	scmi_telemetry_dev_unregister(&ti->groups_dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int scmi_telemetry_des_initialize(struct device *dev,
> > +					 struct scmi_tlm_instance *ti)
> > +{
> > +	int ret;
> > +
> > +	ret = scmi_telemetry_dev_register(&ti->des_dev, &ti->dev, "des");
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i = 0; i < ti->info->num_de; i++) {
> > +		const struct scmi_telemetry_de *de = ti->info->des[i];
> > +		struct scmi_tlm_de_dev *tdev;
> > +		char name[16];
> > +
> > +		tdev = devm_kzalloc(dev, sizeof(*tdev), GFP_KERNEL);
> > +		if (!tdev) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> > +
> > +		tdev->tsp = ti->tsp;
> > +		tdev->de = de;
> > +		tdev->dev.groups = scmi_des_groups;
> > +
> > +		/*XXX What about of ID/name digits-length used ? */
> > +		snprintf(name, 8, "0x%04X", de->id);
> 
> s/8/sizeof(name)/?
> 

yes.

> regards,
> dan carpenter
>

Thanks,
Cristian
