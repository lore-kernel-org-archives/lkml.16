Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5147E191;
	Wed, 16 Apr 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819242; cv=none; b=ZeReim0IdLw4hisf16MLRtnQagsKSPWkrW0ByJaiuZpKCF7zwl5iamjyqmjMuOA7hvtwaciGasI3CxnS/0DpYJIzV9Lx1dXu4OyVQqCoJWGGhNLBjbYlhH0y3TergZUKHctmAVSUgj2c0flCIi5F3EpdRkYcdKLFT8IJXjhvZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819242; c=relaxed/simple;
	bh=Vz6bk6YGvtsRN2ZEQVaZ0sI/BeiXUIfOnij8CvC8Fuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evOTF6Qw420RWZRWJAngDJvuCLT8sEV6D8QZYwil03YsPm7VRf9MO5++6jyxx16KSQb1j5qXQ2MjgLN3yyiTvaV5GoQHt3RLdcrLGSYwWJ9d+5PT6Q4qEGaL/ZIPD+iV5pCCjU8F4Of1KywkIjoTzewCVX1LLgAG8nWahCp1FtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CImHhWh7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CImHhWh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B43C4CEE2;
	Wed, 16 Apr 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744819239;
	bh=Vz6bk6YGvtsRN2ZEQVaZ0sI/BeiXUIfOnij8CvC8Fuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CImHhWh71IJT8+4R26J6xICoE//1H58e6w3PjnHDwH2nMhUIdie79qzCkxzQ4nzDA
	 rXzhVycoO+M1KZfnWUCNPYw8wSV7Bi8sA4vpi3izzWzIit6zbmqV60IE7zSScr/pLE
	 e5eRoOM9KhD6tZjYZkqe06bDizHxkMRmkH+nPbLj5IKGTKRVDOwwHXL0IkXc2zAXQF
	 vOCp2SD7Iy0mM51VxfrTJ7B5H4n+XFdVklxldigYiSEny8qOz1hv9OOJRiSH47A2W4
	 sLXLz3NYzlJ5/R+CzQQPRnb8/5jwYGQUYKai2SIjiflg29VI6zrr/MZFZwTB7dkvZt
	 U8fLtBQ2KXZqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u55Bl-000000007DM-3BB9;
	Wed, 16 Apr 2025 18:00:38 +0200
Date: Wed, 16 Apr 2025 18:00:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415142933.1746249-3-cristian.marussi@arm.com>

On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC->V1
> - added handling of impl_ver ranges in quirk definition
> - make Quirks Framework default-y
> - match on all NULL/0 too..these are quirks that apply always anywhere !
> - depends on COMPILE_TEST too
> - move quirk enable calling logic out of Base protocol init (triggers a
>   LOCKDEP issues around cpu locks (cpufreq, static_branch_enable interactions..)

> +static void scmi_enable_matching_quirks(struct scmi_info *info)
> +{
> +	struct scmi_revision_info *rev = &info->version;
> +	const char *compatible = NULL;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		of_property_read_string(root, "compatible", &compatible);

Looks like you still only allow matching on the most specific compatible
string.

As we discussed in the RFC thread, this will result in one quirk entry
for each machine in a SoC family in case the issue is not machine
specific.

> +		of_node_put(root);
> +	}
> +
> +	/* Enable applicable quirks */
> +	scmi_quirks_enable(info->dev, compatible,
> +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> +}

> +static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
> +{
> +	const char *last, *first = quirk->impl_ver_range;
> +	size_t len;
> +	char *sep;
> +	int ret;
> +
> +	quirk->start_range = 0;
> +	quirk->end_range = 0xFFFFFFFF;
> +	len = quirk->impl_ver_range ? strlen(quirk->impl_ver_range) : 0;
> +	if (!len)
> +		return 0;
> +
> +	last = first + len - 1;
> +	sep = strchr(quirk->impl_ver_range, '-');
> +	if (sep)
> +		*sep = '\0';
> +
> +	if (sep == first) // -X
> +		ret = kstrtouint(first + 1, 0, &quirk->end_range);
> +	else // X OR X- OR X-y
> +		ret = kstrtouint(first, 0, &quirk->start_range);
> +	if (ret)
> +		return ret;
> +
> +	if (!sep)
> +		quirk->end_range = quirk->start_range;
> +	else if (sep != last) //x-Y

nit: space after // (if you insist on using c99 comments)

> +		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
> +
> +	if (quirk->start_range > quirk->end_range)
> +		return -EINVAL;
> +
> +	return ret;
> +}

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol Quirks
> + *
> + * Copyright (C) 2025 ARM Ltd.
> + */
> +#ifndef _SCMI_QUIRKS_H
> +#define _SCMI_QUIRKS_H
> +
> +#include <linux/static_key.h>
> +#include <linux/types.h>
> +
> +#ifdef CONFIG_ARM_SCMI_QUIRKS
> +
> +#define DECLARE_SCMI_QUIRK(_qn)						\
> +	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> +
> +#define SCMI_QUIRK(_qn, _blk)						\
> +	do {								\
> +		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> +			(_blk);						\
> +	} while (0)
> +
> +void scmi_quirks_initialize(void);
> +void scmi_quirks_enable(struct device *dev, const char *compat,
> +			const char *vend, const char *subv, const u32 impl);
> +
> +#else
> +
> +#define DECLARE_SCMI_QUIRK(_qn)
> +#define SCMI_QUIRK(_qn, _blk)

As I mentioned earlier, wouldn't it be useful to always compile the
quirk code in order to make sure changes to surrounding code does not
break builds where the quirks are enabled?

For example, by adding something like

#define SCMI_QUIRK(_qn, _blk)						\
	do {								\
		if (0)							\
			(_blk);						\
	} while (0)

here?

I didn't really review this in detail, but it seems to work as intended
when matching on vendor and version:

Tested-by: Johan Hovold <johan+linaro@kernel.org>
