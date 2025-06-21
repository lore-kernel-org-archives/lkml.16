Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B0211F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750536867; cv=none; b=U2ToUbDfkRH1fVMaVt1A73E+GrPpi7OEcCH0r7nINNg51flCmZjqEbhMfR1uzuzVOHqNihXNYMH1tX2qirTbBxHUlozKcIDJLWxoSAjtW3TtIeEqVf1aKvHKYSFQ76Evw4q1SeHBlesTfKCqnkBovzWRaeGFllMyFQxXcGzUIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750536867; c=relaxed/simple;
	bh=aXZatwBWg4VrSKsG+b7QdLSNOEdBfsPeKOIbZpL8g2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLtUIEHbzroEsL4uIl/2PBAzHwaxm1YNq+9XENxaWzd2XM0BEr9JsGN2Cjs4h4YvbvPvBujiH1aC7RWlU6mO6cyZCt//33OsWRLBGCsgKAYy/vIY+TnzO/GY0/+Y7tB574YAKMXiiKXSEJ5NoigcQ5EJCwCl5Lga/XvdECjXvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ICW6FPcG; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ICW6FPcG"
Message-ID: <83c30e4a-d674-47a7-bda9-4b2fc0d590e3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750536856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yr7kJPrXImzAmkkN0G7HCuKUXzxD8S/N2IK0NzuRMNA=;
	b=ICW6FPcGxNJ0hfSwo1ETR+CDn4pBXvGeTjrcHD6zwFMArkSbD0PT/ELxhWJtsJTaMOElrn
	Y4xD8b5I0MG3+TkqV6TEryttqfkB4E11lrtzeAVNdpD94y24G6V5hKSD2QUm7ZxBk8MyJm
	6re9/PF8wb9MlQQaSAnnIyaFFfU+ux8=
Date: Sat, 21 Jun 2025 21:14:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 07/13] ptp: Split out PTP_SYS_OFFSET ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.156514985@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131944.156514985@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_SYS_OFFSET ioctl
> code into a helper function.
> 
> Convert it to __free() to avoid gotos.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |   78 +++++++++++++++++++++++-----------------------
>   1 file changed, 40 insertions(+), 38 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -357,18 +357,54 @@ static long ptp_sys_offset_extended(stru
>   	return copy_to_user(arg, extoff, sizeof(*extoff)) ? -EFAULT : 0;
>   }
>   
> +static long ptp_sys_offset(struct ptp_clock *ptp, void __user *arg)
> +{
> +	struct ptp_sys_offset *sysoff __free(kfree) = NULL;
> +	struct ptp_clock_time *pct;
> +	struct timespec64 ts;
> +
> +	sysoff = memdup_user(arg, sizeof(*sysoff));
> +	if (IS_ERR(sysoff))
> +		return PTR_ERR(sysoff);
> +
> +	if (sysoff->n_samples > PTP_MAX_SAMPLES)
> +		return -EINVAL;
> +
> +	pct = &sysoff->ts[0];
> +	for (unsigned int i = 0; i < sysoff->n_samples; i++) {
> +		struct ptp_clock_info *ops = ptp->info;

Looks like *ops initialization can be moved outside of the loop.

> +		int err;
> +
> +		ktime_get_real_ts64(&ts);
> +		pct->sec = ts.tv_sec;
> +		pct->nsec = ts.tv_nsec;
> +		pct++;
> +		if (ops->gettimex64)
> +			err = ops->gettimex64(ops, &ts, NULL);
> +		else
> +			err = ops->gettime64(ops, &ts);
> +		if (err)
> +			return err;
> +		pct->sec = ts.tv_sec;
> +		pct->nsec = ts.tv_nsec;
> +		pct++;
> +	}
> +	ktime_get_real_ts64(&ts);
> +	pct->sec = ts.tv_sec;
> +	pct->nsec = ts.tv_nsec;
> +
> +	return copy_to_user(arg, sysoff, sizeof(*sysoff)) ? -EFAULT : 0;
> +}
> +

[...]
