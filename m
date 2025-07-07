Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD07275AFB;
	Mon,  7 Jul 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887544; cv=none; b=DNTmEqJj/GMmkJepwiZdouGMxMiJgerN4WFQC2yLONNb8ULzfR1E2imMNcxiSAo3JrEK9cdPfUI3D4T07KdawMTYY4VulX0s35Pbm5FZLujUby1YKdwla+sRSiFQeG6daOr2WGIDVN8Qzjy8gmKRcjrIHFvimTjeN7Fmca+WAsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887544; c=relaxed/simple;
	bh=HN51foY5liusxliF0hJZrngr1VsTpw+cyg5mdKTbwGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN5HoALIqGkpPJKfbNq9po1Vke+4glm+bOiZrLAgb5IgnX87QiIcog6sgtBg4EWJCE7X0boN379ETvBjWeNcdc7pcp2KAlnNfwfj2T8kBMNTu3f3uCcNm8z2VtuTr7OejOV77VgfZ5GTeYFULMl+fXquBqV9sueISQBvwCrXNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89BBD168F;
	Mon,  7 Jul 2025 04:25:29 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1823F694;
	Mon,  7 Jul 2025 04:25:40 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:25:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: bus: Add pm ops
Message-ID: <20250707-rich-helpful-guppy-c5ea68@sudeepholla>
References: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
 <20250704-scmi-pm-v2-1-9316cec2f9cc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-scmi-pm-v2-1-9316cec2f9cc@nxp.com>

On Fri, Jul 04, 2025 at 11:09:35AM +0800, Peng Fan wrote:
> Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then the scmi devices under scmi bus could have their own hooks for
> suspend, resume function.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..b6ade837ecea34f147fc1b734c55eafecca5ae0c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -323,6 +323,38 @@ static struct attribute *scmi_device_attributes_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(scmi_device_attributes);
>  
> +#ifdef CONFIG_SUSPEND
> +static int scmi_pm_suspend(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +
> +	if (drv && drv->pm && drv->pm->suspend)
> +		return drv->pm->suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int scmi_pm_resume(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +
> +	if (drv && drv->pm && drv->pm->resume)
> +		return drv->pm->resume(dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops scmi_dev_pm_ops = {
> +	.suspend = scmi_pm_suspend,

I have use pm_sleep_ptr() and removed the below NULL based struct.
Have a look at for-next/scmi/updates and let me know if you are happy
with that.

-- 
Regards,
Sudeep
