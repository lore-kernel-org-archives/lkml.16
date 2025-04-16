Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEC21552E3;
	Wed, 16 Apr 2025 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821441; cv=none; b=LWMxuxLxNN7jmn8Qq5cwlMQkeFGVynyP60rFrgfQoekldPdkAAuDe9f5Ru2KypO8Y6Xs6np3wx/pGAomi/G3F23ZK5HJqgfPOrwUWwTapNa97dE8nZTU/xrswNPon0//zQ4b44KCEjHTevEbnK05PB71QA5lzU1eOKRdkiVxQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821441; c=relaxed/simple;
	bh=dmumJvcAe8xZxu0Kwdb+Yv7Y0M9OsVE29nIkU0vF/zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtkxCyCf93dv5rMcowLbokTLNyANrGH27kPIPqnbonW03gMBor4up9s0WcMmylv/fruzE+3t8KIOJUm2fGJCMU3lMg48CgJSyYxiVclnKahUmPwKOc3JRwEer6SJrbie4RKMYjT11eLZzFYm1Kv9dTGL/hXrhs/1AFSUYqI6OAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F38339;
	Wed, 16 Apr 2025 09:37:15 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADF403F59E;
	Wed, 16 Apr 2025 09:37:15 -0700 (PDT)
Date: Wed, 16 Apr 2025 17:37:13 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <Z__cuT5IW0Sbjqpg@pluto>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__UJUKaMRoFLYLc@hovoldconsulting.com>

On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > Add a common framework to describe SCMI quirks and associate them with a
> > specific platform or a specific set of SCMI firmware versions.
> > 

Hi Johan,

thanks for having a look..

> > All the matching SCMI quirks will be enabled when the SCMI core stack
> > probes and after all the needed SCMI firmware versioning information was
> > retrieved using Base protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > RFC->V1
> > - added handling of impl_ver ranges in quirk definition
> > - make Quirks Framework default-y
> > - match on all NULL/0 too..these are quirks that apply always anywhere !
> > - depends on COMPILE_TEST too
> > - move quirk enable calling logic out of Base protocol init (triggers a
> >   LOCKDEP issues around cpu locks (cpufreq, static_branch_enable interactions..)
> 
> > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > +{
> > +	struct scmi_revision_info *rev = &info->version;
> > +	const char *compatible = NULL;
> > +	struct device_node *root;
> > +
> > +	root = of_find_node_by_path("/");
> > +	if (root) {
> > +		of_property_read_string(root, "compatible", &compatible);
> 
> Looks like you still only allow matching on the most specific compatible
> string.
> 
> As we discussed in the RFC thread, this will result in one quirk entry
> for each machine in a SoC family in case the issue is not machine
> specific.
> 

Well, yes but the solution would be to add multiple compatible on the
same quirk line, which is definitely less cumbersome than adding
multiple quirk defs for the same quirk but does NOT scale anyway....

...anyway I will add that possibility..or I am missing something more ?

> > +		of_node_put(root);
> > +	}
> > +
> > +	/* Enable applicable quirks */
> > +	scmi_quirks_enable(info->dev, compatible,
> > +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > +}
> 
> > +static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
> > +{
> > +	const char *last, *first = quirk->impl_ver_range;
> > +	size_t len;
> > +	char *sep;
> > +	int ret;
> > +
> > +	quirk->start_range = 0;
> > +	quirk->end_range = 0xFFFFFFFF;
> > +	len = quirk->impl_ver_range ? strlen(quirk->impl_ver_range) : 0;
> > +	if (!len)
> > +		return 0;
> > +
> > +	last = first + len - 1;
> > +	sep = strchr(quirk->impl_ver_range, '-');
> > +	if (sep)
> > +		*sep = '\0';
> > +
> > +	if (sep == first) // -X
> > +		ret = kstrtouint(first + 1, 0, &quirk->end_range);
> > +	else // X OR X- OR X-y
> > +		ret = kstrtouint(first, 0, &quirk->start_range);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!sep)
> > +		quirk->end_range = quirk->start_range;
> > +	else if (sep != last) //x-Y
> 
> nit: space after // (if you insist on using c99 comments)
> 

..leftover...I'll remove C99

> > +		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
> > +
> > +	if (quirk->start_range > quirk->end_range)
> > +		return -EINVAL;
> > +
> > +	return ret;
> > +}
> 
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * System Control and Management Interface (SCMI) Message Protocol Quirks
> > + *
> > + * Copyright (C) 2025 ARM Ltd.
> > + */
> > +#ifndef _SCMI_QUIRKS_H
> > +#define _SCMI_QUIRKS_H
> > +
> > +#include <linux/static_key.h>
> > +#include <linux/types.h>
> > +
> > +#ifdef CONFIG_ARM_SCMI_QUIRKS
> > +
> > +#define DECLARE_SCMI_QUIRK(_qn)						\
> > +	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> > +
> > +#define SCMI_QUIRK(_qn, _blk)						\
> > +	do {								\
> > +		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> > +			(_blk);						\
> > +	} while (0)
> > +
> > +void scmi_quirks_initialize(void);
> > +void scmi_quirks_enable(struct device *dev, const char *compat,
> > +			const char *vend, const char *subv, const u32 impl);
> > +
> > +#else
> > +
> > +#define DECLARE_SCMI_QUIRK(_qn)
> > +#define SCMI_QUIRK(_qn, _blk)
> 
> As I mentioned earlier, wouldn't it be useful to always compile the
> quirk code in order to make sure changes to surrounding code does not
> break builds where the quirks are enabled?
> 
> For example, by adding something like
> 
> #define SCMI_QUIRK(_qn, _blk)						\
> 	do {								\
> 		if (0)							\
> 			(_blk);						\
> 	} while (0)
> 
> here?
> 

Yes I will do.

> I didn't really review this in detail, but it seems to work as intended
> when matching on vendor and version:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks,
Cristian
